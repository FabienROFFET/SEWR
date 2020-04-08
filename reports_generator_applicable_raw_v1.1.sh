###################################################
# Description : Create Applicable Report for Satellite 6.5
# Auteur: Fabien ROFFET
# Mise à jour le: 07.04.2020
####################################################

#DEFINE VARIABLE :
##################

VARORGA="Your ORG"
VARDESTREP="/var/www/html/pub/reporting/datas"
VARHOSTLIST="report_host_applicable_list.lst"
VARPREFIXFILE="appl_details_"

#CREATE A COLLECT FOLDER :
##########################
mkdir -p $VARDESTREP

# CREATE HOST LIST BY ORG :
###########################
rm -f $VARDESTREP/$VARHOSTLIST
rm -f $VARDESTREP/$VARPREFIXFILE*

hammer host list --organization $VARORGA | awk '{print $3}' | sed '/^$/d' | grep -v "NAME" >> $VARDESTREP/$VARHOSTLIST
echo "Servers Found :" ; cat $VARDESTREP/$VARHOSTLIST | wc -l

# CREATE REPORT  :
##################
for host in `cat $VARDESTREP/$VARHOSTLIST`
    do
        hammer erratum list --host $host --errata-restrict-applicable=true --errata-restrict-installable=false | grep RHSA | while read searchcve; do
        iderratum=$(echo $searchcve|awk '{print $1}')
        CVECRITICAL=$(hammer erratum info --id $iderratum | grep -Eo 'CVE-[0-9]{4}-[0-9]{1,9}' | paste -s -d ',')
        printf "%s|%s\n" "$searchcve" "$CVECRITICAL" >>  $VARDESTREP/$VARPREFIXFILE$host".raw"
    done
done

# Clean useless file :
######################
rm -f $VARDESTREP/$VARHOSTLIST
