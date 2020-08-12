from requests.utils import requote_uri
import sys

url="https://github.com/search?q="
filename='dorks.txt'
try:
    company=sys.argv[1]
except:
    print("usage python3 github_dorks.py TARGET")
    sys.exit()
filename='dorks.txt'
with open(filename) as f:
    content = f.readlines()
    content = [x.strip() for x in content]
    for dorks in content:
        print(requote_uri(url+company+"  "+dorks))
