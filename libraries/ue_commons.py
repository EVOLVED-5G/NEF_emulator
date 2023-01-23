import random
import string
import json


def generate_random_string(length):
    letters = string.ascii_lowercase
    return ''.join(random.choice(letters) for i in range(int(length)))

def generate_random_ipv4():
    return '.'.join(
        str(random.randint(0, 255)) for _ in range(4)
    )

def generate_random_ipv6():
    M = 16**4
    return ":".join(("%x" % random.randint(0, M) for i in range(8)))

def generate_random_mac():
    myhexdigits = []
    for x in range(6):
        a = random.randint(0,255)
        hex = '%02x' % a
        myhexdigits.append(hex)
    return "-".join(myhexdigits)

def get_ue(cell_id, gnb_id):
    template = {"description": "string", "dnn": "province1.mnc01.mcc202.gprs", "mcc": 202, "mnc": 1, "speed": "LOW"}
    template['name'] = generate_random_string(10)
    template['external_identifier'] = template['name'] + '@domain.com'
    template['ip_address_v4'] = str(generate_random_ipv4())
    template['ip_address_v6'] = str(generate_random_ipv6())
    template['mac_address'] = str(generate_random_mac())
    template['Cell_id'] = cell_id
    template['gNB_id'] = gnb_id
    template['supi'] = str(199810000000000 + random.randint(3, 10000))
    return template