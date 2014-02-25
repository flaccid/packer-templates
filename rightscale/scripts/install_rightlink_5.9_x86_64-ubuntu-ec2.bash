#!/bin/bash -e

# Bootstrap RightLink 5.9 (latest GA) for Ubuntu on EC2

# backwards compat
ln -svf /var/spool/cloud /var/spool/ec2

# Import RightScale public key
curl http://s3.amazonaws.com/rightscale_key_pub/rightscale_key.pub | apt-key add -

# Ubuntu 12.04 (precise)
cat > /etc/apt/sources.list.d/rightlink.sources.list <<EOF
deb [arch=amd64] http://mirror.rightscale.com/rightlink/apt precise main
deb-src [arch=amd64] http://mirror.rightscale.com/rightlink/apt precise main
EOF

apt-get -y update
apt-get -y install rightlink-cloud-ec2
