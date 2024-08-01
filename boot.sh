# Author : Eduardo Esteves - copilotlabxgmail.com
# Perú-2024
print("""
        ################################
        #********Copilot Labx *********# 
        ################################""")

# Colors
white="\e[97m"
red="\e[31m"
green="\e[32m"
blue="\e[34m"
bold="\e[1m"
purple="\e[35m"

# Function to run commands with a timeout
run_with_timeout() {
    timeout 300s "$@"
    if [ $? -eq 124 ]; then
        echo -e "${red}Command '$@' timed out after 300 seconds"
    fi
}

# Reading entered domain
echo -e "${green}${bold}Enter domain to enumerate subdomains:- ${white}"
read domain

# BOOT WEESLEYLUNA
echo -e "${red}${bold}[+]BOOT OF ${purple}WEESLEYLUNA"

# Creating directories
if [ ! -d "$domain" ]; then
    mkdir $domain
fi

# Enumerate all domains
echo -e "${red}[+]Enumerate all domains..."
run_with_timeout assetfinder --subs-only ${domain} > $domain/assetfinder.txt
run_with_timeout subfinder -d ${domain} -o $domain/subfinder.txt
run_with_timeout amass enum --passive -d $domain -o $domain/amass.txt

# Enumerate Cert.sh
echo -e "${red}[+]Enumerate CERT.SH..."
run_with_timeout curl -s "https://crt.sh/?q=%25.$domain&output=json" | jq -r '.[].name_value' | sed 's/\*\.//g' | anew $domain/cert.txt

# Combining results
echo "domains saved at $domain/domains.txt..."
cat $domain/assetfinder.txt $domain/subfinder.txt $domain/amass.txt $domain/cert.txt 2>/dev/null | anew $domain/domains.txt

# Enumerate DNS
echo -e "${red}[+]Enumerating DNS..."
run_with_timeout dnsx -silent -a -resp-only -l ${domain}/domains.txt -o $domain/dnsx.txt

# Enumerate CIDR
echo -e "${red}[+]Enumerating CIDR..."
run_with_timeout mapcidr -l $domain/dnsx.txt -aggregate -silent -o $domain/mapcidr.txt

# Enumerate Naabu
echo -e "${blue}[+]Enumerating NAABU..."
run_with_timeout naabu -l $domain/mapcidr.txt -top-ports 100 -silent | httpx -silent -timeout 60 -threads 100 | anew $domain/naabuIP.txt




