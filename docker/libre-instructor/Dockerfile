FROM startx/sxapi:0.3.3
MAINTAINER STARTX "dev@startx.fr"

ENV LIBRE_VERSION=0.6.19 \
    SX_ID="startx/libre" \
    SX_SERVICE="libre" \
    SX_NAME="Startx LIBRE (alpine)" \
    SX_SUMMARY="Web-application used to serve course materials and tools for training delivery" \
    DESCRIPTION="LIBRE $LIBRE_VERSION" \
    NODE_ENV=development

LABEL name="startx/libre-$LIBRE_VERSION" \
      summary="$SX_SUMMARY" \
      description="$DESCRIPTION." \
      version="$LIBRE_VERSION" \
      release="1" \
      maintainer="Startx <dev@startx.fr>" \
      help="For more information visit https://github.com/startxfr/libre" \
      io.k8s.description="$DESCRIPTION" \
      io.k8s.display-name="$SX_NAME" \
      io.openshift.tags="startx,nodejs,libre,libre-$LIBRE_VERSION" \
      io.openshift.non-scalable="false" \
      io.openshift.min-memory="100Mi" \
      io.openshift.min-cpu="1000m" \
      io.openshift.expose-services="8080:http" \
      fr.startx.component="$SX_ID:$LIBRE_VERSION"

COPY ./sxapi.yml $CONF_PATH/sxapi.yml
COPY ./static $APP_PATH/static

