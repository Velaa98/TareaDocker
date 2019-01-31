#!/bin/bash

apt-get -y update
apt-get -y install varnish

tee /etc/varnish/default.vcl <<EOF
vcl 4.0;

backend default {
    .host = nginx;
    .port = "8080";
}
EOF

touch /etc/varnish/secret
