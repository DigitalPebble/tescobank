# example of domain configuration for CloudSearch

DOMAIN="$1"

if [ "$DOMAIN" = "" ]; then
    echo "Need to specify a domain name as argument"
    exit -1;
fi

aws cloudsearch create-domain --domain-name $DOMAIN

aws cloudsearch define-index-field --domain-name $DOMAIN --name content --type text --sort-enabled false
aws cloudsearch define-index-field --domain-name $DOMAIN --name description --type text --sort-enabled false
aws cloudsearch define-index-field --domain-name $DOMAIN --name keywords --type text-array --sort-enabled false
aws cloudsearch define-index-field --domain-name $DOMAIN --name title --type text --sort-enabled false
aws cloudsearch define-index-field --domain-name $DOMAIN --name url --type literal --sort-enabled false --facet-enabled false --search-enabled false

