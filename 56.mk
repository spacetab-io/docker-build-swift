#
# Stable 5.6
#
debian-base-56: NAME = spacetabio/docker-base-swift:5.6
debian-base-56:
	docker build -f "base/5.6/debian.dockerfile" -t $(NAME)-$(VERSION) .
	@if [ "${PUSH}" == 'true' ]; then \
	    docker push $(NAME)-$(VERSION) ; \
	fi

debian-build-56: NAME = spacetabio/docker-build-swift:5.6
debian-build-56:
	docker build -f "build/5.6/debian.dockerfile" -t $(NAME)-$(VERSION) .
	@if [ "${PUSH}" == 'true' ]; then \
	    docker push $(NAME)-$(VERSION) ; \
	fi

#debian-lint-56: NAME = spacetabio/docker-lint-swift:5.6
#debian-lint-56:
#	docker build -f "lint/5.6/debian.dockerfile" -t $(NAME)-$(VERSION) .
#	@if [ "${PUSH}" == 'true' ]; then \
#	    docker push $(NAME)-$(VERSION) ; \
#	fi

debian-test-56: NAME = spacetabio/docker-test-swift:5.6
debian-test-56:
	docker build -f "test/5.6/debian.dockerfile" -t $(NAME)-$(VERSION) .
	@if [ "${PUSH}" == 'true' ]; then \
	    docker push $(NAME)-$(VERSION) ; \
	fi


for-base-56: debian-base-56
for-build-56: for-base-56 debian-build-56
#for-lint-56: debian-lint-56
for-test-56: for-base-56 debian-test-56

#for-lint-56
all-56: for-base-56 for-build-56 for-test-56
