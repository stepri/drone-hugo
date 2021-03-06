FROM plugins/base:amd64

LABEL maintainer="Drone.IO Community <drone-dev@googlegroups.com>" \
  org.label-schema.name="Drone Hugo" \
  org.label-schema.vendor="Drone.IO Community" \
  org.label-schema.schema-version="1.0"

ENV HUGO_VERSION=0.46
ENV HUGO_FLAVOUR=hugo
ENV HUGO_ARCH=64bit
ENV PLUGIN_HUGO_ARCH=$HUGO_ARCH
ENV PLUGIN_HUGO_SHIPPED_VERSION=$HUGO_VERSION

RUN apk --no-cache add git && \
    wget -O- https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_FLAVOUR}_${HUGO_VERSION}_Linux-${HUGO_ARCH}.tar.gz | tar xz -C /bin

ADD release/linux/amd64/drone-hugo /bin/

ENTRYPOINT ["/bin/drone-hugo"]
