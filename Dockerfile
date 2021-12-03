# Pull base image.
FROM jlesage/baseimage-gui:ubuntu-18.04	

# Install xterm.
RUN add-pkg xterm

# Define working directory.
WORKDIR /tmp

RUN apt-get update \
    && apt-get install -y curl openjdk-11-jre openjfx iputils-ping

RUN curl -# -L -o /config/nsloader.jar https://github.com/developersu/ns-usbloader/releases/download/v5.2/ns-usbloader-5.2.jar

# Copy the start script.
COPY startapp.sh /startapp.sh

VOLUME ["/NSP"]

# Set the name of the application.
ENV APP_NAME="NS-USBloader" \
    USER_ID=0 \
    GROUP_ID=0 

# Maximize only the main/initial window.
# RUN \
    # sed-patch 's/<application type="normal">/<application type="normal" title="NS-USBloader v5.2">/' \
    # sed-patch 's/<application type="normal">/<application type="normal" title="xterm">/' \
        # /etc/xdg/openbox/rc.xml