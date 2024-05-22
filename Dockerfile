FROM georgegebbett/recipe-buddy:latest

# Build arguments
ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_REF
ARG BUILD_VERSION

#Add nginx and create the run folder for nginx.
RUN \
    apk --no-cache add \
        nginx \
    \
    && mkdir -p /run/nginx

#Copy our conf into the nginx http.d folder.
COPY ingress.conf /etc/nginx/http.d/

# Labels
LABEL \
    io.hass.name="Recipe Buddy for Grocy" \
    io.hass.description="Recipe import system for Grocy" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} 

