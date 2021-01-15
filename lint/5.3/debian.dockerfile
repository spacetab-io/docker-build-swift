FROM norionomura/swiftlint:0.42.0_swift-5

RUN swiftlint version

WORKDIR /app

CMD ["/bin/bash"]
