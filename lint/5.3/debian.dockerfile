# Explicitly specify `bionic` because `swift:latest` does not use `ubuntu:latest`.
ARG BUILDER_IMAGE="swift:5.3-focal"
ARG RUNTIME_IMAGE="ubuntu:focal"

# builder image
FROM ${BUILDER_IMAGE} AS builder

ENV SWIFT_LINT_VERSION="0.42.0"

RUN export DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true \
    && apt-get update \
    && apt-get install -y libcurl4-openssl-dev libxml2-dev git \
    && apt-get clean -y \
    && rm -r /var/lib/apt/lists/*

WORKDIR /build

RUN git clone --depth 1 --branch ${SWIFT_LINT_VERSION} --single-branch https://github.com/realm/SwiftLint.git /build

ARG SWIFT_FLAGS="-c release -Xswiftc -static-stdlib"
RUN swift build $SWIFT_FLAGS \
    && mkdir -p /executables

RUN for executable in $(swift package completion-tool list-executables); do \
        install -v `swift build $SWIFT_FLAGS --show-bin-path`/$executable /executables; \
    done \
    && rm -rf /build/*

# runtime image
FROM ${RUNTIME_IMAGE}
LABEL org.opencontainers.image.source=https://github.com/realm/SwiftLint

RUN export DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true \
  && apt-get update && apt-get install -y libcurl4 libxml2 git jq curl ca-certificates \
  && apt-get clean -y \
  && rm -r /var/lib/apt/lists/*

COPY --from=builder /usr/lib/libsourcekitdInProc.so /usr/lib
COPY --from=builder /usr/lib/swift/linux/libBlocksRuntime.so /usr/lib
COPY --from=builder /usr/lib/swift/linux/libdispatch.so /usr/lib
COPY --from=builder /executables/* /usr/bin

RUN swiftlint version

WORKDIR /app

CMD ["/bin/bash"]
