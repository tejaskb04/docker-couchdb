import configparser
import os
import yaml

if __name__ == '__main__':
    local = configparser.ConfigParser()
    local.read('/docker-couchdb-temp/local.ini')

    with open('/docker-couchdb-secrets/secrets.yml') as f:
        secrets = yaml.load(f)

    user = secrets['admin']['user']
    password = secrets['admin']['password']

    local['admins'] = {}
    local['admins'][user] = password

    os.makedirs('/usr/local/etc/couchdb', exist_ok=True)
    with open('/usr/local/etc/couchdb/local.ini', 'w') as f:
        local.write(f)
