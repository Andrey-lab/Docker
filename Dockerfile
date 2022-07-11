FROM ubuntu:20.04

RUN apt update && apt install -y cron \
	&& rm -rf /var/lib/apt/lists/*

RUN crontab -l 2>/dev/null | { cat; echo "0 */1 * * * echo '1' >> /var/log/test.log "; } | crontab -

CMD [ "cron", "-f" ]
