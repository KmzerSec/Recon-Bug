Recon-Bug uses a lot of techniques (passive, bruteforce, permutations, certificate transparency, source code scraping, analytics, DNS records...) for subdomain enumeration which helps you to get the maximum and the most interesting subdomains so that you be ahead of the competition.

USAGE:
./hunter.sh [DOMAIN...] [OPTIONS...]
-h , --help Help menu
-hb , --httprobe Get live domains
-u, --urls get all urls
-p , --parameters Get parameters
-w , --waybackurls Get wayback data
--whois Get whoisdata
-ps , --portscan

Installation

git clone https://github.com/KmzerSec/Recon-Bug.git
cd Recon-Bug
./hunter.sh domain.com
