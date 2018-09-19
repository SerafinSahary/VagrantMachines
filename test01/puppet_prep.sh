wget --quiet https://apt.puppetlabs.com/puppet5-release-bionic.deb
sudo dpkg -i puppet5-release-bionic.deb
sudo apt-get --quiet update
sudo apt-get --quiet install puppet-agent

