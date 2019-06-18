FROM alpine

# Thanks to https://nbsoftsolutions.com/blog/routing-select-docker-containers-through-wireguard-vpn
RUN sed -i -e 's/v[[:digit:]]\.[[:digit:]]/edge/g' /etc/apk/repositories && \ 
    apk update && \
    apk add iptables curl iproute2 ifupdown iputils wireguard-tools coreutils
    # echo resolvconf resolvconf/linkify-resolvconf boolean false | debconf-set-selections && \
    # echo "REPORT_ABSENT_SYMLINK=no" >> /etc/default/resolvconf && \
    # apk add resolvconf && \
    # apk add wireguard-tools

COPY scripts /scripts

ENTRYPOINT ["/scripts/run.sh"]
CMD []
