FROM debian:11-slim

ARG DEBIAN_FRONTEND=noninteractive
RUN touch /usr/bin/systemctl && chmod +x /usr/bin/systemctl && \
    apt-get -y update && \
    apt-get -y install curl dbus nftables && \
    curl -L -o mullvad.deb https://mullvad.net/download/app/deb/latest && \
    apt-get -y install ./mullvad.deb systemd- && \
    rm -f mullvad.deb && \
    apt-get remove -y adwaita-icon-theme && \
    apt-get -y autoremove && \
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm /opt/Mullvad\ VPN/mullvad-gui && \
    rm /opt/Mullvad\ VPN/resources/app.asar

EXPOSE 1080
ENV MULLVAD_SETTINGS_DIR=/config
ENV MULLVAD_CACHE_DIR=/cache
ADD mullvad-start /usr/local/bin/mullvad-start
CMD ["/usr/local/bin/mullvad-start"]
