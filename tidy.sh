
echo "==> Disk usage before minimization"
df -h

sudo apt-get -y purge -y thunderbird ppp pppconfig pppoeconf
sudo apt-get -y purge popularity-contest installation-report landscape-common wireless-tools wpasupplicant ubuntu-serverguide

# Clean up the apt cache
sudo apt-get -y autoremove --purge
sudo apt-get -y autoclean
sudo apt-get -y clean

# Clean up orphaned packages with deborphan
sudo apt-get -y install deborphan
while [ -n "$(deborphan --guess-all --libdevel)" ]; do
    deborphan --guess-all --libdevel | xargs apt-get -y purge
done
sudo apt-get -y purge deborphan dialog

echo "==> Disk usage after cleanup"
df -h

sudo dd if=/dev/zero of=/EMPTY bs=1M
sudo rm -f /EMPTY

echo "==> Note the error from EMPTY is expected"

