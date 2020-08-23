#!/bin/bash

RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
BLUE=$(tput setaf 4)
RESET=$(tput sgr0)

AMASS_VERSION=3.8.2


echo "${RED} ######################################################### ${RESET}"
echo "${RED} #                 tools FOR BUG BOUNTY                  # ${RESET}"
echo "${RED} ######################################################### ${RESET}"
logo(){
echo "${BLUE}
                ___ ___ _  _ _____     ___
               | _ ) _ ) || |_   _|_ _|_  )
               | _ \ _ \ __ | | | \ V // /
               |___/___/_||_| |_|  \_//___| ${RESET}"
}
logo
echo ""
echo "${GREEN} tools created by the best people in the InfoSec Community ${RESET}"
echo "${GREEN}                   Thanks to everyone!                     ${RESET}"
echo ""


echo "${GREEN} [+] Updating and installing dependencies ${RESET}"
echo ""

sudo apt-get -y update
sudo apt-get -y upgrade

sudo add-apt-repository -y ppa:apt-fast/stable < /dev/null
sudo echo debconf apt-fast/maxdownloads string 16 | debconf-set-selections
sudo echo debconf apt-fast/dlflag boolean true | debconf-set-selections
sudo echo debconf apt-fast/aptmanager string apt-get | debconf-set-selections
sudo apt install -y apt-fast

sudo apt-fast install -y apt-transport-https
sudo apt-fast install -y libcurl4-openssl-dev
sudo apt-fast install -y libssl-dev
sudo apt-fast install -y jq
sudo apt-fast install -y ruby-full
sudo apt-fast install -y libcurl4-openssl-dev libxml2 libxml2-dev libxslt1-dev ruby-dev build-essential libgmp-dev zlib1g-dev
sudo apt-fast install -y build-essential libssl-dev libffi-dev python-dev
sudo apt-fast install -y python-setuptools
sudo apt-fast install -y libldns-dev
sudo apt-fast install -y python3-pip
sudo apt-fast install -y python-dnspython
sudo apt-fast install -y git
sudo apt-fast install -y npm
sudo apt-fast install -y nmap phantomjs 
sudo apt-fast install -y gem
sudo apt-fast install -y perl 
sudo apt-fast install -y parallel
pip3 install jsbeautifier
echo ""
echo ""
sar 1 1 >/dev/null

#Setting shell functions/aliases
echo "${GREEN} [+] Setting bash_profile aliases ${RESET}"
curl https://raw.githubusercontent.com/unethicalnoob/aliases/master/bashprofile > ~/.bash_profile
echo "${BLUE} If it doesn't work, set it manually ${RESET}"
echo ""
echo ""
sar 1 1 >/dev/null 

echo "${GREEN} [+] Installing Golang ${RESET}"
if [ ! -f /usr/bin/go ];then
    cd ~
    wget -q -O - https://raw.githubusercontent.com/canha/golang-tools-install-script/master/goinstall.sh | bash
	export GOROOT=$HOME/.go
	export PATH=$GOROOT/bin:$PATH
	export GOPATH=$HOME/go
    echo 'export GOROOT=$HOME/.go' >> ~/.bash_profile
	
	echo 'export GOPATH=$HOME/go'	>> ~/.bash_profile			
	echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> ~/.bash_profile
    source ~/.bash_profile 
else 
    echo "${BLUE} Golang is already installed${RESET}"
fi
    break
echo""
echo "${BLUE} Done Install Golang ${RESET}"
echo ""
echo ""
sar 1 1 >/dev/null

#Installing tools

echo "${RED} #################### ${RESET}"
echo "${RED} # Installing tools # ${RESET}"
echo "${RED} #################### ${RESET}"


echo "${GREEN} #### Basic tools #### ${RESET}"

#install altdns
echo "${BLUE} installing altdns ${RESET}"
sudo pip3 install py-altdns
echo "${BLUE} done${RESET}"
echo ""

#install nmap
echo "${BLUE} installing nmap${RESET}"
sudo apt-fast install -y nmap
echo "${BLUE} done${RESET}"
echo ""


echo "${BLUE} downloading virtual host discovery${RESET}"
git clone https://github.com/jobertabma/virtual-host-discovery.git ~/tools/vhd
echo "${BLUE} done${RESET}"
echo ""

#install sqlmap
echo "${BLUE} installing sqlmap${RESET}"
sudo apt-fast install sqlmap
echo "${BLUE} done${RESET}"
echo ""


echo "${BLUE} downloading knockpy${RESET}"
git clone https://github.com/guelfoweb/knock.git ~/tools/knockpy
cd ~/tools/knockpy
sudo python setup.py install
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} installing knock2${RESET}"
go get -u github.com/harleo/knockknock
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} downloading asnlookup${RESET}"
git clone https://github.com/yassineaboukir/asnlookup.git ~/tools/asnlookup
cd ~/tools/asnlookup
sudo pip3 install -r requirements.txt
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} installing metabigor${RESET}"
go get -u github.com/j3ssie/metabigor
echo "${BLUE} done${RESET}"

sar 1 1 >/dev/null
echo ""

echo "${GREEN}#### Installing fuzzing tools ####${RESET}"
#install gobuster
echo "${BLUE} installing gobuster${RESET}"
sudo go get -u github.com/OJ/gobuster
echo "${BLUE} done${RESET}"
echo ""

#install ffuf
echo "${BLUE} installing ffuf${RESET}"
go get -u github.com/ffuf/ffuf
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} installing dirsearch${RESET}"
git clone https://github.com/maurosoria/dirsearch.git ~/tools/dirsearch
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} installing wfuzz${RESET}"
sudo apt-fast install wfuzz
echo "${BLUE} done${RESET}"
echo ""
sar 1 1 >/dev/null

echo "${GREEN}#### Installing Domain Enum tools ####${RESET}"

#install aquatone
echo "${BLUE} Installing Aquatone ${RESET}"
go get -u github.com/michenriksen/aquatone 
echo "${BLUE} done ${RESET}"
echo ""

#install subDomainizer
echo "${BLUE} subdomainizer ${RESET}"
git clone https://github.com/nsonaniya2010/SubDomainizer.git ~/tools/SubDomainizer
cd ~/tools/SubDomainizer && chmod +x SubDomainizer.py
sudo pip3 install -r requirements.txt 
echo "${BLUE} done ${RESET}"
echo ""

#install domain_analyzer
echo "${BLUE} domain_analyzer ${RESET}"
git clone https://github.com/eldraco/domain_analyzer.git ~/tools/domain_analyzer
echo "${BLUE} done ${RESET}"
echo ""

#install massdns
echo "${BLUE} Installing massdns ${RESET}"
git clone https://github.com/blechschmidt/massdns.git ~/tools/massdns
cd ~/tools/massdns
make
echo "${BLUE} done ${RESET}"
echo ""

#install sub.sh
echo "${BLUE} sub.sh ${RESET}"
git clone https://github.com/cihanmehmet/sub.sh.git ~/tools/subsh
cd ~/tools/subsh && chmod +x sub.sh
echo "${BLUE} done ${RESET}"
echo ""

#install subjack
echo "${BLUE} installing subjack ${RESET}"
go get -u github.com/haccer/subjack
echo "${BLUE} done ${RESET}"
echo ""

echo "${BLUE} installing Sublister ${RESET}"
git clone https://github.com/aboul3la/Sublist3r.git ~/tools/Sublist3r
cd ~/tools/Sublist3r
sudo pip3 install -r requirements.txt
echo "${BLUE} done ${RESET}"
echo ""

echo "${BLUE} installing Subover ${RESET}"
go get -u github.com/Ice3man543/SubOver
echo "${BLUE} done ${RESET}"
echo ""

echo "${BLUE} installing spyse ${RESET}"
sudo pip3 install spyse.py
echo "${BLUE} done ${RESET}"
echo ""
sar 1 1 >/dev/null


echo "${GREEN} #### Installing CORS tools #### ${RESET}"

echo "${BLUE} installing corsy ${RESET}"
git clone https://github.com/s0md3v/Corsy.git ~/tools/corsy
sudo pip3 install -r requirements.txt
echo "${BLUE} done ${RESET}"
echo ""

echo "${BLUE} installing cors-scanner ${RESET}"
git clone https://github.com/chenjj/CORScanner.git ~/tools/corscanner
sudo pip3 install -r requirements.txt
echo "${BLUE} done ${RESET}"
echo ""

echo "${BLUE} installing another cors scanner${RESET}"
go get -u github.com/Tanmay-N/CORS-Scanner
echo "${BLUE} done${RESET}"
echo ""
sar 1 1 >/dev/null



echo "${GREEN} #### Installing XSS tools#### ${RESET}"

echo "${BLUE} installing dalfox${RESET}"
git clone https://github.com/hahwul/dalfox ~/tools/dalfox
cd ~/tools/dalfox/ && go build dalfox.go
sudo cp dalfox /usr/bin/
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} installing XSStrike${RESET}"
git clone https://github.com/s0md3v/XSStrike.git ~/tools/XSStrike 
cd ~/tools/XSStrike
sudo pip3 install -r requirements.txt
echo "${BLUE} done${RESET}"
echo ""

#Xspear for XSS
echo "${BLUE} installing XSpear${RESET}"
sudo gem install XSpear
sudo gem install colorize
sudo gem install selenium-webdriver
sudo gem install terminal-table
sudo gem install progress_bar
echo "${BLUE} done${RESET}"
echo ""

#traxss
echo "${BLUE} downloading traxss${RESET}"
git clone https://github.com/M4cs/traxss.git ~/tools/traxss
cd ~/tools/traxss
sudo pip3 install -r requirements.txt
echo "${BLUE} done${RESET}"
echo ""
sar 1 1 >/dev/null



echo "${GREEN} #### Installing Cloud workflow tools #### ${RESET}"

echo "${BLUE} Instaliing awscli${RESET}"
sudo pip3 install awscli --upgrade --user
echo "${BLUE} Don't forget to set up AWS credentials!${RESET}"
echo "${BLUE} done${RESET}"
echo ""


#install s3-buckets-finder
echo "${BLUE} s3-buckets-finder${RESET}"
git clone https://github.com/gwen001/s3-buckets-finder.git ~/tools/s3-buckets-finder
echo "${BLUE} done${RESET}"
echo ""


#install lazys3
echo "${BLUE} lazys3${RESET}"
git clone https://github.com/nahamsec/lazys3.git ~/tools/lazys3
echo "${BLUE} done${RESET}"
echo ""

#install DumpsterDiver
echo "${BLUE} DumpsterDiver${RESET}"
git clone https://github.com/securing/DumpsterDiver.git ~/tools/DumpsterDiver
cd ~/tools/DumpsterDiver && chmod +x DumpsterDiver.py
sudo pip3 install -r requirements.txt
echo "${BLUE} done${RESET}"
echo ""

#install S3Scanner
echo "${BLUE} installing S3Scanner${RESET}"
git clone https://github.com/sa7mon/S3Scanner.git ~/tools/S3Scanner 
cd ~/tools/S3Scanner
sudo pip3 install -r requirements.txt
echo "${BLUE} done${RESET}"
echo ""


echo "${BLUE} installing Cloudflair${RESET}"
git clone https://github.com/christophetd/CloudFlair.git ~/tools/CloudFlair
cd ~/tools/CloudFlair && chmod +x cloudflair.py
sudo pip3 install -r requirements.txt
echo "${BLUE} done${RESET}"
echo ""


echo "${BLUE} installing Cloudunflare${RESET}"
git clone https://github.com/greycatz/CloudUnflare.git ~/tools/CloudUnflare
echo "${BLUE} done${RESET}"
echo ""


echo "${BLUE} installing flumberboozle${RESET}"
git clone https://github.com/fellchase/flumberboozle ~/tools/flumberboozle
echo "${BLUE} done${RESET}"
echo ""



#install GCPBucketBrute
echo "${BLUE} installing GCPBucketBrute${RESET}"
git clone https://github.com/RhinoSecurityLabs/GCPBucketBrute.git ~/tools/GCPBucketBrute
cd ~/tools/GCPBucketBrute
sudo python3 -m pip install -r requirements.txt
echo "${BLUE} done${RESET}"
echo ""
sar 1 1 >/dev/null


echo "${GREEN} #### Installing CMS tools #### ${RESET}" 
#install CMSmap
echo "${BLUE} installing CMSmap${RESET}"
git clone https://github.com/Dionach/CMSmap.git ~/tools/CMS/CMSmap
cd ~/tools/CMS/CMSmap
sudo pip3 install .
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} installing wig${RESET}"
git clone https://github.com/jekyc/wig.git ~/tools/CMS/wig
cd ~/tools/wig
sudo python3 setup.py install
echo "${BLUE} done${RESET}"
echo "" 

#install CMSeek
echo "${BLUE} installing CMSeek${RESET}"
git clone https://github.com/Tuhinshubhra/CMSeeK.git ~/tools/CMS/CMSeek
cd ~/tools/CMS/CMSeek
sudo python3 -m pip install -r requirements.txt
echo "${BLUE} done${RESET}"
echo ""

#install Joomscan
echo "${BLUE} installing Joomscan${RESET}"
git clone https://github.com/rezasp/joomscan.git ~/tools/CMS/Joomscan
echo "${BLUE} done${RESET}"
echo ""

#install wpscan
echo "${BLUE} installing wpscan${RESET}"
sudo gem install wpscan
echo "${BLUE} done${RESET}"
echo ""

#install droopescan
echo "${BLUE} installing droopescan${RESET}"
sudo pip3 install droopescan
echo "${BLUE} done${RESET}"
echo ""

#install drupwn
echo "${BLUE} installing drupwn${RESET}"
git clone https://github.com/immunIT/drupwn.git ~/tools/CMS/drupwn
cd ~/tools/CMS/drupwn
sudo python3 setup.py install
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} Adobe scanner${RESET}"
git clone https://github.com/0ang3el/aem-hacker.git ~/tools/CMS/aem-hacker
echo "${BLUE} done${RESET}"
echo ""
sar 1 1 >/dev/null


echo "${GREEN}#### Downloading Git tools ####${RESET}"

echo "${BLUE} git-scanner${RESET}"
git clone https://github.com/HightechSec/git-scanner ~/tools/GIT/git-scanner
cd ~/tools/GIT/git-scanner && chmod +x gitscanner.sh
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} gitgraber${RESET}"
git clone https://github.com/hisxo/gitGraber.git ~/tools/GIT/gitGraber
cd ~/tools/GIT/gitGraber && chmod +x gitGraber.py
sudo pip3 install -r requirements.txt
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE}  GitHound${RESET}"
git clone https://github.com/tillson/git-hound.git ~/tools/GIT/git-hound
cd ~/tools/GIT/git-hound
sudo go build main.go && mv main githound
echo "${BLUE} Create a ./config.yml or ~/.githound/config.yml${RESET}"
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} gitsearch${RESET}"
git clone https://github.com/gwen001/github-search.git ~/tools/GIT/github-search
cd ~/tools/GIT/github-search 
sudo pip3 install -r  requirements3.txt
echo "${BLUE} done${RESET}"
echo ""
sar 1 1 >/dev/null





#install Osmedeus
echo "${BLUE} Osmedeus${RESET}"
git clone https://github.com/j3ssie/Osmedeus.git ~/tools/Frameworks/osmedeus
echo "${BLUE} done${RESET}"
echo ""

#install Cobra
echo "${BLUE} Cobra${RESET}"
git clone https://github.com/WhaleShark-Team/cobra.git ~/tools/Frameworks/Cobra
echo "${BLUE} done${RESET}"
echo ""

#install TIDoS-Framework
echo "${BLUE} TIDoS-Framework${RESET}"
git clone https://github.com/0xinfection/tidos-framework.git ~/tools/Frameworks/TIDoS-Framework
cd ~/tools/Frameworks/TIDoS-Framework
chmod +x install
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} WAScan${RESET}"
git clone https://github.com/m4ll0k/WAScan.git ~/tools/Frameworks/WAScan
echo "${BLUE} done${RESET}"
echo ""

#install Blackwidow#
echo "${BLUE} blackwidow${RESET}"
git clone https://github.com/1N3/BlackWidow.git ~/tools/Frameworks/BlackWidow
cd ~/tools/Frameworks/BlackWidow
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} installing Sudomy${RESET}"
git clone --recursive https://github.com/screetsec/Sudomy.git ~/tools/Frameworks/Sudomy
cd ~/tools/Frameworks/Sudomy
sudo pip3 install -r requirements.txt
sudo npm i -g wappalyzer
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} installing findomain${RESET}"
cd ~/tools/Frameworks
wget https://github.com/Edu4rdSHL/findomain/releases/latest/download/findomain-linux
sudo chmod +x findomain-linux
sudo cp findomain-linux /usr/bin/findomain
echo "${BLUE} Add your keys in the config file"
echo "${BLUE} done${RESET}"
echo ""
sar 1 1 >/dev/null

echo "${GREEN}#### Other tools ####${RESET}"

echo "${BLUE} installing SSRFMap ${RESET}"
git clone https://github.com/swisskyrepo/SSRFmap ~/tools/SSRFMap
cd ~/tools/SSRFMap/
sudo pip3 install -r requirements.txt
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} installing XSRFProbe${RESET}"
sudo pip3 install xsrfprobe
echo "${BLUE} done${RESET}"
echo ""


#install JSParser
echo "${BLUE} installing JSParser${RESET}"
git clone https://github.com/nahamsec/JSParser.git ~/tools/JSParser
cd ~/tools/JSParser
sudo python3 setup.py install
echo "${BLUE} done${RESET}"
echo ""

#install subjs
echo "${BLUE} installing subjs${RESET}"
go get -u github.com/lc/subjs
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} installing broken-link-checker${RESET}"
sudo npm install broken-link-checker -g
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} installing pwncat${RESET}"
sudo pip3 install pwncat
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} installing Photon${RESET}"
git clone https://github.com/s0md3v/Photon.git ~/tools/Photon
cd ~/tools/Photon
sudo pip3 install -r requirements.txt
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} installing hakrawler${RESET}"
git clone https://github.com/hakluke/hakrawler.git ~/tools/hakrawler
cd ~/tools/hakrawler
go build main.go && cp main /root/go/bin/hakrawler
sudo cp hakrawler /usr/bin/
echo "${BLUE} done${RESET}"
echo ""

#echo "${BLUE} installing waff00f${RESET}"
#git clone https://github.com/EnableSecurity/wafw00f.git ~/tools/waff00f
#cd ~/tools/wafw00f
#sudo python3 setup.py install
#echo "${BLUE} done${RESET}"
#echo ""


echo "${BLUE} Paramspider${RESET}"
git clone https://github.com/devanshbatham/ParamSpider ~/tools/ParamSpider
cd ~/tools/ParamSpider
sudo pip3 install -r requirements.txt
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} jexboss${RESET}"
git clone https://github.com/joaomatosf/jexboss.git ~/tools/jexboss
cd ~/tools/jexboss
sudo pip3 install -r requires.txt
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} goohak${RESET}"
git clone https://github.com/1N3/Goohak.git ~/tools/Goohak
cd ~/tools/Goohak && chmod +x goohak
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} installing webtech${RESET}"
sudo pip3 install webtech
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} installing gau${RESET}"
go get -u github.com/lc/gau
echo "${BLUE} done${RESET}"
echo ""



echo "${BLUE} LinkFinder${RESET}"
git clone https://github.com/GerbenJavado/LinkFinder.git ~/tools/LinkFinder
cd ~/tools/LinkFinder
sudo pip3 install -r requirements.txt
sudo python3 setup.py install
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} SecretFinder${RESET}"
git clone https://github.com/m4ll0k/SecretFinder.git ~/tools/SecretFinder
cd ~/tools/SecretFinder && chmod +x secretfinder
sudo pip3 install -r requirements.txt
echo "${BLUE} done${RESET}"
echo ""
sar 1 1 >/dev/null


echo "${GREEN}#### ProjectDiscovery Pinned tools ####${RESET}"

echo "${BLUE} installing naabu${RESET}"
go get -u github.com/projectdiscovery/naabu/cmd/naabu
echo "${BLUE} done${RESET}"
echo ""


echo "${BLUE} installing dnsprobe${RESET}"
go get -u github.com/projectdiscovery/dnsprobe
echo  "${BLUE} done${RESET}"
echo ""

echo "${BLUE} installing nuclei${RESET}"
go get -u github.com/projectdiscovery/nuclei/v2/cmd/nuclei
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} installing subfinder${RESET}"
go get -u github.com/projectdiscovery/subfinder/cmd/subfinder
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} installing httpx${RESET}"
go get -u github.com/projectdiscovery/httpx/cmd/httpx
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} installing shuffledns${RESET}"
go get -u github.com/projectdiscovery/shuffledns/cmd/shuffledns
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} installing chaos-client${RESET}"
go get -u github.com/projectdiscovery/chaos-client/cmd/chaos
echo "${BLUE} done${RESET}"
echo ""
sar 1 1 >/dev/null


echo "${GREEN} #### Downloading wordlists #### ${RESET}"
git clone https://github.com/assetnote/commonspeak2-wordlists ~/tools/Wordlists/commonspeak2-wordlists
git clone https://github.com/fuzzdb-project/fuzzdb ~/tools/Wordlists/fuzzdb
git clone https://github.com/1N3/IntruderPayloads ~/tools/Wordlists/IntruderPayloads
git clone https://github.com/swisskyrepo/PayloadsAllTheThings ~/tools/Wordlists/PayloadsAllTheThings
git clone https://github.com/danielmiessler/SecLists ~/tools/Wordlists/SecLists
cd ~/tools/Wordlists/SecLists/Discovery/DNS/
##THIS FILE BREAKS MASSDNS AND NEEDS TO BE CLEANED
cat dns-Jhaddix.txt | head -n -14 > clean-jhaddix-dns.txt
printf "${BLUE} Wordlists downloaded ${RESET}"

sar 1 1 >/dev/null



echo "${GREEN} #### Installing tomnomnom tools #### ${RESET}"
echo "${GREEN}   check out his other tools as well  ${RESET}"

echo "${BLUE} installing meg${RESET}"
go get -u github.com/tomnomnom/meg
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} installing assetfinder${RESET}"
go get -u github.com/tomnomnom/assetfinder
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} installing waybackurls${RESET}"
go get -u github.com/tomnomnom/waybackurls
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} installing gf${RESET}"
go get -u github.com/tomnomnom/gf
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} installing httprobe${RESET}"
go get -u github.com/tomnomnom/httprobe
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} installing concurl${RESET}"
go get -u github.com/tomnomnom/hacks/concurl
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} installing unfurl${RESET}"
go get -u github.com/tomnomnom/unfurl
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} installing anti-burl${RESET}"
go get -u github.com/tomnomnom/hacks/anti-burl
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} installing filter-resolved${RESET}"
go get github.com/tomnomnom/hacks/filter-resolved
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} installing fff${RESET}"
go get -u github.com/tomnomnom/fff
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} installing qsreplace${RESET}"
go get -u github.com/tomnomnom/qsreplace
echo "${BLUE} done${RESET}"
echo ""
sar 1 1 >/dev/null

echo "${GREEN} #### Other other tools #### ${RESET}"

echo "${BLUE} installing arjun${RESET}"
git clone https://github.com/s0md3v/Arjun.git ~/tools/Arjun
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} installing cf-check${RESET}"
go get -u github.com/dwisiswant0/cf-check
echo "${BLUE} done${RESET}"
echo ""


echo "${BLUE} installing Urlprobe${RESET}"
go get -u github.com/1ndianl33t/urlprobe
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} installing amass${RESET}"
cd ~ && echo -e "Downloading amass version ${AMASS_VERSION} ..." && wget -q https://github.com/OWASP/Amass/releases/download/v${AMASS_VERSION}/amass_linux_amd64.zip && unzip amass_linux_amd64.zip && mv amass_linux_amd64/amass /usr/bin/

cd ~ && rm -rf amass_linux_amd64* amass_linux_amd64.zip*
echo "${BLUE} done${RESET}"
echo ""
unzip -q temp.zip && 


echo "${BLUE} installing impacket${RESET}"
git clone https://github.com/SecureAuthCorp/impacket.git ~/tools/impacket
cd ~/tools/impacket
sudo pip3 install -r requirements.txt
sudo pip3 install .
echo "${BLUE} done${RESET}"
echo ""
sar 1 1 >/dev/null




#systemctl enable ssh;
#systemctl start ssh;
#service ssh start;
#echo "deb http://http.kali.org/kali kali-rolling main contrib non-free" > /etc/apt/sources.list;
#gpg --keyserver hkp://keys.gnupg.net --recv-key 7D8D0BF6;
#gpg --fingerprint 7D8D0BF6;
#gpg -a --export 7D8D0BF6 | apt-key add -;
#apt-get -y --allow-unauthenticated install kali-archive-keyring;
#apt-get -y update;
#apt-get -y install kali-linux-everything;
apt-get update && apt-get upgrade;
sudo apt-get install golang;
sudo apt-get install python3;
sudo apt-get install python3-pip;
sudo apt-get install ruby;
sudo apt-get install screen;
sudo apt-get install git;
mkdir /root/tools;
mkdir /root/Recon;
mkdir /root/arsenal;
dir=/root/tools;
go get -u github.com/m4ll0k/Aron;
go get github.com/Ice3man543/SubOver;
git clone https://github.com/tomnomnom/hacks $dir/hacks;
git clone https://github.com/tomnomnom/gf $dir/gf;
git clone https://github.com/zdresearch/OWASP-Nettacker $dir/OWASP-Nettacker;
go get -u github.com/tomnomnom/assetfinder;
go get -u github.com/tomnomnom/fff;
go get github.com/tomnomnom/hacks/filter-resolved;
go get -u github.com/tomnomnom/hacks/gittrees;
go get github.com/tomnomnom/hacks/waybackurls;
go get -u github.com/tomnomnom/hacks/unisub;
go get -u -v github.com/lukasikic/subzy;
go install -v github.com/lukasikic/subzy;
go get -u github.com/tomnomnom/unfurl;
go get github.com/tomnomnom/burl;
go get -u github.com/tomnomnom/meg;
go get -u github.com/j3ssie/metabigor;
go get -u github.com/rverton/webanalyze;
pip install requests;
go get -u github.com/c-bata/go-prompt;
go get github.com/hahwul/websocket-connection-smuggler;
GO111MODULE=on go get -u -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei;
git clone https://github.com/projectdiscovery/nuclei-templates $dir/nuclei-templates;
go get github.com/haccer/subjack;
go get github.com/eth0izzle/shhgit;
GO111MODULE=on go get -v github.com/projectdiscovery/subfinder/cmd/subfinder;
go get github.com/tiagorlampert/CHAOS;
GO111MODULE=on go get -u github.com/projectdiscovery/chaos-client/cmd/chaos;
GO111MODULE=on go get -u -v github.com/hahwul/dalfox;
go get github.com/ffuf/ffuf;
GO111MODULE=on go get -u -v github.com/lc/gau;
go get -u github.com/tomnomnom/gf;
cp -r $GOPATH/src/github.com/tomnomnom/gf/examples ~/.gf;
go get github.com/003random/getJS;
go get github.com/subfinder/goaltdns;
go get github.com/OJ/gobuster;
go get -u github.com/sensepost/gowitness;
go get -u github.com/jaeles-project/gospider;
go get github.com/hakluke/hakcheckurl;
go get github.com/hakluke/hakrawler;
go get github.com/hakluke/hakrevdns;
go get -u github.com/tomnomnom/httprobe;
GO111MODULE=on go get -u -v github.com/projectdiscovery/httpx/cmd/httpx;
git clone https://github.com/udit-thakkur/AdvancedKeyHacks $dir/AdvancedKeyHacks;
git clone https://github.com/streaak/keyhacks $dir/keyhacks;
git clone https://github.com/s0md3v/Arjun $dir/Arjun;
git clone https://github.com/NullArray/AutoSploit $dir/AutoSploit;
git clone https://github.com/devanshbatham/FavFreak $dir/FavFreak;
git clone https://github.com/MichaelStott/CRLF-Injection-Scanner $dir/CRLF-Injection-Scanner;
git clone https://github.com/1N3/BruteX $dir/BruteX;
git clone https://github.com/AlexisAhmed/BugBountyTools $dir/BugBountyTools;
git clone https://github.com/gwen001/BBvuln $dir/BBvuln;
git clone https://github.com/D35m0nd142/LFISuite $dir/LFISuite;
git clone https://github.com/GerbenJavado/LinkFinder $dir/LinkFinder;
git clone https://github.com/pwn0sec/PwnXSS $dir/PwnXSS;
git clone https://github.com/hahwul/XSpear $dir/XSpear;
git clone https://github.com/jordanpotti/CloudScraper $dir/CloudScraper;
git clone https://github.com/swisskyrepo/SSRFmap $dir/SSRFmap;
git clone https://github.com/m4ll0k/SecretFinder $dir/SecretFinder;
git clone https://github.com/s0md3v/Striker $dir/Striker;
git clone https://github.com/devanshbatham/ParamSpider $dir/ParamSpider;
git clone https://github.com/j3ssie/Osmedeus $dir/Osmedeus;
git clone https://github.com/codingo/NoSQLMap $dir/NoSQLMap;
git clone https://github.com/nsonaniya2010/SubDomainizer $dir/SubDomainizer;
git clone https://github.com/s0md3v/XSStrike $dir/XSStrike;
GO111MODULE=on go get -u -v github.com/projectdiscovery/dnsprobe;
git clone https://github.com/maurosoria/dirsearch $dir/dirsearch;
git clone https://github.com/dwisiswant0/apkleaks $dir/apkleaks;
git clone https://github.com/ozguralp/gmapsapiscanner $dir/gmapsapiscanner;
git clone https://github.com/defparam/smuggler $dir/smuggler;
git clone https://github.com/epsylon/Smuggler $dir/epsylon_Smuggler;
git clone https://github.com/kowainik/smuggler $dir/kowa_smuggler;
GO111MODULE=on go get -u -v github.com/projectdiscovery/shuffledns/cmd/shuffledns;
git clone https://github.com/p4pentest/crtsh $dir/crtsh;
git clone https://github.com/XecLabs/Theif $dir/Theif;
git clone https://github.com/YashGoti/crtsh.py $dir/crtsh.py;
git clone https://github.com/epinna/tplmap $dir/tplmap;
git clone https://github.com/xmendez/wfuzz $dir/wfuzz;
git clone https://github.com/secdec/xssmap $dir/xssmap;
git clone https://github.com/hahwul/websocket-connection-smuggler $dir/websocket-connection-smuggler;
git clone https://github.com/rastating/wordpress-exploit-framework $dir/wordpress-exploit-framework;

echo "
alias osmedeus='python3 /root/tools/Osmedeus/osmedeus.py -m "subdomain,portscan,vuln,git,burp,ip" -t'
alias dirsearch='python3 /root/tools/dirsearch/dirsearch.py -e php,asp,js,aspx,jsp,py,txt,conf,config,bak,backup,swp,old,db,sql -t 300 -u'
alias ffuf=/root/go/bin/ffuf
alias antiburl=/root/go/bin/anti-burl
alias kxss=/root/tools/hacks/kxss/kxss
alias gittrees=/root/tools/hacks/gittrees/gittrees
alias hakrawler=/root/go/bin/hakrawler
alias hakrevdns=/root/go/bin/hakrevdns
alias hakcheckurl=/root/go/bin/hakcheckurl
alias githound=/root/tools/git-hound/git-hound
alias httpx=/root/go/bin/httpx
alias resolver=/root/arsenal/resolver.sh
alias subunique=/root/arsenal/unique_lister.sh
alias gau=/root/go/bin/gau
alias secretfinder='python3 /root/tools/SecretFinder/SecretFinder.py'
alias qsreplace=/root/go/bin/qsreplace
alias nuclei=/root/go/bin/nuclei
alias nuclear=/root/arsenal/nuclear.sh
alias givesecrets=/root/arsenal/givesecrets.sh
alias getsec=/root/arsenal/getsec.sh
alias rex=/root/arsenal/rex.sh
alias gmapi='python3 /root/tools/gmapsapiscanner/maps_api_scanner_python3.py'
alias Bheem=/root/arsenal/Bheem.sh
alias reverse=/root/arsenal/reverse.sh
alias corsy=/root/arsenal/corsy.sh
" >> /root/.bashrc;

for i in `find /root/tools -name requirements.txt`;do python3 -m pip install -r $i;done
for i in $(ls /root/go/bin);do echo $i && echo  "alias /root/go/bin/$i" >> .bashrc ;done
source ~/.bashrc;
export  PATH=$PATH:/root/go/bin;


