FROM python:alpine
RUN apk add --no-cache ffmpeg
RUN python --version
ENTRYPOINT ["ls"]