# Use the latest Ubuntu image
FROM ubuntu:latest

# Install Python3 and cron
#RUN apt-get update && \
#    apt-get install -y python3 python3-pip cron

# Copy your files
#COPY .venv /app/.venv
COPY README.md /app/README.md
#COPY allhosts.txt /app/allhosts.txt
#COPY cert_days_left.sh /app/cert_days_left.sh
#COPY crontab.cron /app/crontab.cron
#COPY do_all_the_things.sh /app/do_all_the_things.sh
#COPY find_time_left.py /app/find_time_left.py
#COPY getallcertsndumpexpirydatestofile.sh /app/getallcertsndumpexpirydatestofile.sh
#COPY list_of_certs_expiring.txt /app/list_of_certs_expiring.txt
#COPY sendtheemail.py /app/sendtheemail.py
#COPY sendtheemail2.py /app/sendtheemail2.py
#COPY soonest_expiries.sh /app/soonest_expiries.sh
#COPY ssl_check_expire_days.py /app/ssl_check_expire_days.py
#COPY ssl_check_expire_days.yaml /app/ssl_check_expire_days.yaml
#COPY ssl_expiry_dates.txt /app/ssl_expiry_dates.txt
COPY variables.sh /app/variables.sh
#COPY start.sh /app/start.sh
#COPY list_of_domains.txt /app/list_of_domains.txt

# Set the working directory to /app
WORKDIR /app
#RUN export APPDIR="/app"
# Add your cron job
# This assumes you have a cron job setup in crontab.cron file
RUN chmod +x /app/cert_days_left.sh
RUN chmod +x /app/do_all_the_things.sh
RUN chmod +x /app/getallcertsndumpexpirydatestofile.sh
RUN chmod +x /app/soonest_expiries.sh
RUN chmod +x /app/variables.sh
RUN chmod +x /app/start.sh
RUN crontab /app/crontab.cron
#RUN service cron start
RUN touch /var/log/cron.log
CMD ["/app/start.sh"]
#CMD cron && tail -f /var/log/cron.log
# Run the cron daemon

