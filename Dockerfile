FROM alpine
RUN apk update \
    && apk add python3 py3-pip\
    && pip install -U mkdocs mkdocs-mermaid2-plugin
ADD . .
EXPOSE 8000
CMD [ "/bin/sh","-c","mkdocs serve -a 0.0.0.0:8000" ]
