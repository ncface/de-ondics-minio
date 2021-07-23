#
# Idee von https://github.com/PierreZ/goStatic
#
FROM pierrezemb/gostatic
	
WORKDIR /srv/http

#RUN "mkdir -p /srv/http/content"

COPY ./content /srv/http
COPY "notfound.html" /srv/http

EXPOSE 8080

ENTRYPOINT [ "/goStatic", \
    #"-context", "content", \
    #"-name", "platformSidecar", \
    "-fallback", "/notfound.html", \
    "-path", "/srv/http", \
    "-port", "8080" \
]