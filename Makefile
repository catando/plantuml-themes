PWD ?= pwd_unknown
PROJECT_NAME = plantuml-themes

export PROJECT_NAME
#PLANTUML_FLAGS := -tpng

# all our targets are phony (no files to check).
.PHONY: buid login assets

build:
	echo "Building image..."
	docker build --tag image-$(PROJECT_NAME) --file assets/Dockerfile .

assets: 
	$(MAKE) build
	echo "Rendering assets..."
	docker run --rm \
	--volume $(PWD):/usr/src \
	--name project-$(PROJECT_NAME) \
	image-$(PROJECT_NAME)
	
login:
	docker run --rm -it \
	--volume $(PWD):/usr/src \
	--name project-$(PROJECT_NAME) \
	--entrypoint /bin/sh \
	image-$(PROJECT_NAME)

default:
	assets
