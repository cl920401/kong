FROM centos:7

RUN yum install -y yum-utils  epel-release \
&& yum-config-manager --add-repo https://openresty.org/package/centos/openresty.repo \
&& yum install -y openresty-1.13.6.2 openresty-resty-1.13.6.2 luarocks make git gcc lua-devel openssl-devel m4 \
&& yum install -y libyaml \
&& yum install -y libyaml-devel \
&& yum clean all


ENV KONG_VERSION 1.2.1

COPY ./kong  /kong
COPY ./kong.conf.default /kong.conf
COPY ./docker-entrypoint.sh /docker-entrypoint.sh

RUN useradd --uid 1337 kong && pushd /kong && make install && popd && chmod +x /kong.sh && ln -s  /kong.sh /usr/bin/kong

ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 8000 8443 8001 8444

STOPSIGNAL SIGTERM

CMD ["kong", "docker-start"]
