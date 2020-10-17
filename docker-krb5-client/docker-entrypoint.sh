#!/bin/sh

if [ -z ${KRB5_REALM} ]; then
    echo "No KRB5_REALM provided. Exiting ..."
    exit 1
fi

if [ -z ${KRB5_KDC} ]; then
    echo "No KRB5_KDC provided. Exiting ..."
    exit 1
fi

if [ -z ${KRB5_ADMINSERVER} ]; then
    echo "No KRB5_ADMINSERVER provided; Using ${KRB5_KDC} instead."
    KRB5_ADMINSERVER=${KRB5_KDC}
fi

echo "Creating Krb5 Client Configuration"

cat <<EOT > /etc/krb5.conf
[libdefaults]
  dns_lookup_realm = false
  ticket_lifetime = 24h
  renew_lifetime = 7d
  forwardable = true
  rdns = false
  default_realm = ${KRB5_REALM}
 
[realms]
  ${KRB5_REALM} = {
     kdc = ${KRB5_KDC}
     admin_server = ${KRB5_ADMINSERVER}
  }
EOT
