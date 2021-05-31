#
# Stable 5.4
#
debian-base-54: NAME = spacetabio/docker-base-swift:5.4
debian-base-54:
	docker build -f "base/5.4/debian.dockerfile" -t $(NAME)-$(VERSION) .
	@if [ "${PUSH}" == 'true' ]; then \
	    docker push $(NAME)-$(VERSION) ; \
	fi

debian-build-54: NAME = spacetabio/docker-build-swift:5.4
debian-build-54:
	docker build -f "build/5.4/debian.dockerfile" -t $(NAME)-$(VERSION) .
	@if [ "${PUSH}" == 'true' ]; then \
	    docker push $(NAME)-$(VERSION) ; \
	fi

debian-lint-54: NAME = spacetabio/docker-lint-swift:5.4
debian-lint-54:
	docker build -f "lint/5.4/debian.dockerfile" -t $(NAME)-$(VERSION) .
	@if [ "${PUSH}" == 'true' ]; then \
	    docker push $(NAME)-$(VERSION) ; \
	fi

debian-test-54: NAME = spacetabio/docker-test-swift:5.4
debian-test-54:
	docker build -f "test/5.4/debian.dockerfile" -t $(NAME)-$(VERSION) .
	@if [ "${PUSH}" == 'true' ]; then \
	    docker push $(NAME)-$(VERSION) ; \
	fi


for-base-54: debian-base-54
for-build-54: for-base-54 debian-build-54
for-lint-54: debian-lint-54
for-test-54: for-base-54 debian-test-54

all-54: for-base-54 for-build-54 for-lint-54 for-test-54
