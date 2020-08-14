import os, urllib, sys
from requests.utils import requote_uri


filename='gdorks.txt'
try:
    company=sys.argv[1]
except:
    print("usage python3 google_dorks.py TARGET")
    sys.exit()
with open(filename) as f:
    content = f.readlines()
    content = [x.strip() for x in content]
    for dorks in content:
        if "site:" in dorks:
            url = 'http://www.google.com/search?q=' + dorks+'  ' +company
            print(requote_uri(url))
        else:
            url = 'http://www.google.com/search?q=' + dorks+'  ' + "site:"+company
            print(requote_uri(url))

