from requests.utils import requote_uri
import sys

url="https://github.com/search?q="
filename='dorks.txt'
try:
    company=sys.argv[1]
except:
    print("usage python3 github_dorks.py TARGET")
    sys.exit()



common_dorks=["aws_keys",".bashrc","jira_creds","aws_keys","*.swp",".bashrc","ssh_keys","password","secret","credentials","token","config","key","pass","login","ftp","pwd","security_credentials","connectionstring","JDBC","ssh2_auth_password","send_keys","send,keys"]
for cd in common_dorks:
    print(requote_uri(url+"\"" +company+"\""+"  "+cd))




filename='dorks.txt'
with open(filename) as f:
    content = f.readlines()
    content = [x.strip() for x in content]
    

    for dorks in content:
        print(requote_uri(url+company+"  "+dorks))
