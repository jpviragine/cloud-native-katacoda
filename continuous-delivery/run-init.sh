ssh root@host01 "echo '[[HOST_IP]] master' >> /etc/hosts; sed -i s/10\.0\.2\.15/[[HOST_IP]]/g /etc/dnsmasq.d/origin-dns.conf; sed -i s/10\.0\.2\.15/[[HOST_IP]]/g /etc/etcd/etcd.conf; systemctl restart dnsmasq.service etcd.service;"
ssh root@host01 "sed -i 's/masterPublicURL.*/masterPublicURL: https:\/\/[[HOST_SUBDOMAIN]]-8443-[[KATACODA_HOST]].environments.katacoda.com:443/g'  /etc/origin/master/master-config.yaml && sed -i 's/assetPublicURL.*/assetPublicURL: https:\\/\\/[[HOST_SUBDOMAIN]]-8443-[[KATACODA_HOST]].environments.katacoda.com:443\\/console\\//g'  /etc/origin/master/master-config.yaml && sed -i 's/publicURL.*/publicURL: https:\\/\\/[[HOST_SUBDOMAIN]]-8443-[[KATACODA_HOST]].environments.katacoda.com:443\\/console\\//g'  /etc/origin/master/master-config.yaml && sed -i 's/DenyAllPasswordIdentityProvider/AllowAllPasswordIdentityProvider/g'  /etc/origin/master/master-config.yaml  && sed -i 's/deny_all/allow_all/g'  /etc/origin/master/master-config.yaml && systemctl restart atomic-openshift-master.service"

# ssh root@host01 "oc new-project gogs"
# ssh root@host01 "oc process -f http://bit.ly/openshift-gogs-persistent-template --param=HOSTNAME=gogs-gogs.$(minishift ip).nip.io --param=GOGS_VERSION=0.9.113 --param=SKIP_TLS_VERIFY=true | oc create -f -"