Recon-Bug automates the entire process of reconnaissance for you. It outperforms the work of subdomain enumeration along with various vulnerability checks and obtaining maximum information about your target.

Recon-Bug uses a lot of techniques (passive, bruteforce, permutations, certificate transparency, source code scraping, analytics, DNS records...) for subdomain enumeration which helps you to get the maximum and the most interesting subdomains so that you be ahead of the competition.

 |__  _   _ _ __ | |_ ___ _ __ 
| '_ \| | | | '_ \| __/ _ \ '__|
| | | | |_| | | | | ||  __/ |   
|_| |_|\__,_|_| |_|\__\___|_|   
         Created by KmzerSec  

USAGE:./hunter.sh [DOMAIN...] [OPTIONS...]
	-h , --help    Help menu 
	-hb , --httprobe Get live domains
	-u, --urls get all urls
	-p , --parameters Get parameters
	-w , --waybackurls Get wayback data
	--whois      Get whoisdata
	-ps , --portscan
