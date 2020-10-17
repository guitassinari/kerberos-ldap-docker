FROM ubuntu:latest

RUN apt-get -qq update && \
    apt-get -yqq install krb5-user libpam-krb5 && \
    apt-get -yqq install tini && \
    apt-get -yqq clean

ADD docker-entrypoint.sh /
ENTRYPOINT ["tini", "--"]
CMD ["/docker-entrypoint.sh"]
CMD ["bash"]