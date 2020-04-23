while [ 1 ]; do
echo -n "\nDamage caused by the execution of this script is not responsible. Do you agree?\n\n이스크립트(마냐디완 S PRO)를 실행하여 발생한 피해는 책입지지 않습니다. 동의 하십니까? (y/n) : "
read a
if [ x$a = "xy" ]
then
break
else
exit
fi
done

apt-get update;apt-get upgrade -y;apt-get install git -y;

# 업데이트 목록 갱신 및 업그레이드 가능한 모든 패키지 업그레이드, git을 설치합니다.

apt-get install zram-config -y;

# zram 설치 

apt-get install cron -y;

# cron 설치 

mkdir /etc/backup/;
cp /etc/sysctl.conf /etc/backup/;cp /etc/iptables/rules.v4 /etc/backup/;

# sysctl.conf (리눅스 커널 설정 파일), rules.v4 (iptables 설정 파일)을 /etc/backup 폴더에 백업합니다.
# 백업 폴더 위치 : /etc/backup/

git clone https://github.com/allequalit/ddos.git;
mv dp /etc/;

# 마냐디완s PRO 소스코드 다운로드

rm /etc/sysctl.conf;cp /etc/ddos/sysctl.conf /etc/;

# /etc/sysctl.conf/ (리눅스 커널 설정 파일)을 덮어씌웁니다. 백업파일은 /etc/backup  폴더에있습니다.
# 네트워크 최적화, ip스푸핑 방어, tcpbbr(https://cloud.google.com/blog/products/gcp/tcp-bbr-congestion-control-comes-to-gcp-your-internet-just-got-faster), 디도스완화가 적용되어있습니다.

apt-get install iptables-persistent -y;

cp /usr/share/netfilter-persistent/plugins.d/15-ip4tables /etc/init.d/iptables;
/etc/init.d/iptables start;
/etc/init.d/iptables flush;
update-rc.d -f iptables defaults;

# 우분투 iptables 서비스 활성화
# insserv: warning: script ‘K01iptables’ missing LSB tags and overrides
# insserv: warning: script ‘iptables’ missing LSB tags and overrides
# 위와 같은 애러가 표시될 경우 게시글(https://idchowto.com/?p=31482)을 참조하여 문제를 해결해주세요.

cat /etc/ddos/rules.v4 >> /etc/iptables/rules.v4;

# rules.v4 (iptables 설정 파일)에 내용을 추가합니다.
# 디도스공격 완화, 일부 C&C 서버 IP 차단, 중국 IP 아피피 차단, ICMP 차단을 적용합니다.

crontab /etc/ddos/crontab 

# O**, 알*** 클***, re*****es*** IP 주소에 블랙홀라우팅을 적용했습니다.

reboot;

# 서버 재부팅