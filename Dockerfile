FROM python:3.6
RUN pip install sphinx sphinx-autobuild recommonmark sphinx_rtd_theme
COPY docker-entrypoint.sh /docker-entrypoint.sh
CMD mkdir -p /repo
WORKDIR /repo/docs
EXPOSE 8000
ENTRYPOINT ["/docker-entrypoint.sh"]

RUN apt-get update -q && apt-get install -qy \
    texlive-full \
    python-pygments gnuplot \
    make git \
    && rm -rf /var/lib/apt/lists/*

