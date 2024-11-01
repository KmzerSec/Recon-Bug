Recon-Bug automates the entire process of reconnaissance for you. It outperforms the work of subdomain enumeration along with various vulnerability checks and obtaining maximum information about your target.

Recon-Bug uses a lot of techniques (passive, bruteforce, permutations, certificate transparency, source code scraping, analytics, DNS records...) for subdomain enumeration which helps you to get the maximum and the most interesting subdomains so that you be ahead of the competition.

  

USAGE: ./hunter.sh [DOMAIN...] [OPTIONS...]
	-h , --help    Help menu 
	-hb , --httprobe Get live domains
	-u, --urls get all urls
	-p , --parameters Get parameters
	-w , --waybackurls Get wayback data
	--whois      Get whoisdata
	-ps , --portscan
 
Installation

git clone https://github.com/hash3liZer/evilginx2.git
cd evilginx2
make
