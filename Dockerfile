FROM python:3.6
RUN apt-get update && apt-get -y install enchant python3-pip && apt-get clean && \
  pip3 install sphinx sphinx-autobuild recommonmark sphinx_rtd_theme doc8 sphinxcontrib-spelling sphinxcontrib-images
COPY docker-entrypoint.sh /docker-entrypoint.sh
CMD mkdir -p /repo
WORKDIR /repo/docs
EXPOSE 8000
ENTRYPOINT ["/docker-entrypoint.sh"]
