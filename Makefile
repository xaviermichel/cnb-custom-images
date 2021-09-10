TARGET_IMAGE=xaviermichel/cnb-run-with-extra
#TARGET_TAG=v0.1.0
TARGET_TAG=latest

build-custom-run-image:
	docker build \
		-f custom-run-image/Dockerfile.extend \
		--build-arg "stack_id=io.buildpacks.stacks.bionic" \
		-t $(TARGET_IMAGE):$(TARGET_TAG) \
		custom-run-image/

publish-custom-run-image:
	docker push \
    $(TARGET_IMAGE):$(TARGET_TAG)

all: build-custom-run-image publish-custom-run-image

