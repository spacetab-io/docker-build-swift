FROM norionomura/swiftlint:0.43.1_swift-5.4

RUN swiftlint version

WORKDIR /app

CMD ["/bin/bash"]
