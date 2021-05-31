#
# Stable 5.3
#
debian-base-53: NAME = spacetabio/docker-base-swift:5.3
debian-base-53:
	docker build -f "base/5.3/debian.dockerfile" -t $(NAME)-$(VERSION) .
	@if [ "${PUSH}" == 'true' ]; then \
	    docker push $(NAME)-$(VERSION) ; \
	fi

debian-build-53: NAME = spacetabio/docker-build-swift:5.3
debian-build-53:
	docker build -f "build/5.3/debian.dockerfile" -t $(NAME)-$(VERSION) .
	@if [ "${PUSH}" == 'true' ]; then \
	    docker push $(NAME)-$(VERSION) ; \
	fi

debian-lint-53: NAME = spacetabio/docker-lint-swift:5.3
debian-lint-53:
	docker build -f "lint/5.3/debian.dockerfile" -t $(NAME)-$(VERSION) .
	@if [ "${PUSH}" == 'true' ]; then \
	    docker push $(NAME)-$(VERSION) ; \
	fi

debian-test-53: NAME = spacetabio/docker-test-swift:5.3
debian-test-53:
	docker build -f "test/5.3/debian.dockerfile" -t $(NAME)-$(VERSION) .
	@if [ "${PUSH}" == 'true' ]; then \
	    docker push $(NAME)-$(VERSION) ; \
	fi


for-base-53: debian-base-53
for-build-53: for-base-53 debian-build-53
for-lint-53: debian-lint-53
for-test-53: for-base-53 debian-test-53

all-53: for-base-53 for-build-53 for-lint-53 for-test-53
