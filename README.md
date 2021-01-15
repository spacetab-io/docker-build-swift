<p align="center">
    <img src="https://raw.githubusercontent.com/docker-library/docs/c350af05d3fac7b5c3f6327ac82fe4d990d8729c/docker/logo.png" alt="Docker">
</p>

<p align="center">
Docker image configured for <a href="https://swift.org/">Swift</a> in production use.
</p>

## Docker images

* `spacetabio/docker-base-swift:5.3-1.0.0` – A base image for all images below. <br>
![Docker Image Size (tag)](https://img.shields.io/docker/image-size/spacetabio/docker-base-swift/5.3-1.0.0?style=flat-square)
![Docker Image Version (tag latest semver)](https://img.shields.io/docker/v/spacetabio/docker-base-swift/5.3-1.0.0?style=flat-square)
* `spacetabio/docker-build-swift:5.3-1.0.0` – Image to build sources. <br>
![Docker Image Size (tag)](https://img.shields.io/docker/image-size/spacetabio/docker-build-swift/5.3-1.0.0?style=flat-square)
![Docker Image Version (tag latest semver)](https://img.shields.io/docker/v/spacetabio/docker-build-swift/5.3-1.0.1?style=flat-square)
* `spacetabio/docker-lint-swift:5.3-1.0.1` – Image to lint sources. Uses [swiftlint](https://github.com/realm/SwiftLint). <br>
![Docker Image Size (tag)](https://img.shields.io/docker/image-size/spacetabio/docker-lint-swift/5.3-1.0.1?style=flat-square)
![Docker Image Version (tag latest semver)](https://img.shields.io/docker/v/spacetabio/docker-lint-swift/5.3-1.0.0?style=flat-square)
* `spacetabio/docker-test-swift:5.3-1.0.0` – Image to test sources. <br>
![Docker Image Size (tag)](https://img.shields.io/docker/image-size/spacetabio/docker-test-swift/5.3-1.0.0?style=flat-square)
![Docker Image Version (tag latest semver)](https://img.shields.io/docker/v/spacetabio/docker-test-swift/5.3-1.0.0?style=flat-square)

## Basic usage

```Dockerfile
FROM spacetabio/docker-base-swift:5.3-1.0.0

COPY . /app
 
CMD ["something_binary_to_run"]

## or build image

FROM spacetabio/docker-build-swift:5.3-1.0.0

COPY . /app
 
CMD ["something_binary_to_run"]

## or lint image

FROM spacetabio/docker-lint-swift:5.3-1.0.0

COPY . /app
 
CMD ["something_binary_to_run"]

## or test image

FROM spacetabio/docker-test-swift:5.3-1.0.0

COPY . /app
 
CMD ["something_binary_to_run"]
```

## Version format

* `{swiftVersion}-{imageType}-{semverImageVersion}`

## Changelog

* [Base image](base/CHANGELOG.md)
* [Build image](base/CHANGELOG.md)
* [Lint image](base/CHANGELOG.md)
* [Test image](base/CHANGELOG.md)

## License

The MIT License

Copyright © 2021 spacetab.io, Inc. https://spacetab.io

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
