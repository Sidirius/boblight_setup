#!/bin/bash
#write out current crontab
crontab -l > /tmp/boblight.cron
#echo new cron into cron file
echo "@reboot /usr/local/bin/boblightd -f &" >> /tmp/boblight.cron
#install new cron file
crontab /tmp/boblight.cron
rm /tmp/boblight.cron