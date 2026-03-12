FROM ubuntu:22.04
WORKDIR /app
RUN apt-get update && apt-get install -y bash && mkdir /data
COPY script.sh /app/script.sh
RUN chmod +x /app/script.sh
VOLUME ["/data"]
CMD ["/app/script.sh"]
