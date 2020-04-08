###############################################################
# Name : Generate a web report web
# Description : Create Installable Report for Satellite 6.5/6.6
# Usage : ./reports_errata.sh
# Geeks : Fabien ROFFET
# Last Modification : 24/03/2020
# Version : 1.0 : Creation of this Script
# Version : 1.1 : Change Menu, Add Modual Pop-Up for details on errata
#######################################################################

#DEFINE VARIABLE :
##################
VARORGA="YOUR_ORG"
VARDESTREP="/var/www/html/pub/reporting"
VARDESTREPDATAS="/var/www/html/pub/reporting/datas"
VARHOSTLIST="report_host_list.lst"
VARWEBPAGE="index_"$VARORGA".html"

# CLEAN LAST REPORT :
#####################
rm -f $VARDESTREP/$VARWEBPAGE
rm -f $VARDESTREP/$VARHOSTLIST
#rm -f $VARDESTREPDATAS/*.html
rm -f $VARDESTREP/appl_errata_*
rm -f $VARDESTREP/inst_errata_*
rm -f $VARDESTREP/facts_*

# CREATE A COLLECT FOLDER :
###########################
mkdir -p $VARDESTREP

# CREATE AN HOST LIST :
#######################
hammer host list --organization $VARORGA | awk '{print $1}' |grep '[0-9]' >> $VARDESTREP/$VARHOSTLIST

# DISPLAY NUMBER OF SERVERS FOUND :
###################################
echo "Servers Found :" ; cat $VARDESTREP/$VARHOSTLIST | wc -l

# WEB PAGE  START:
##################
echo "<!DOCTYPE html>" >>  $VARDESTREP/$VARWEBPAGE
echo "<html>" >>  $VARDESTREP/$VARWEBPAGE
echo "<head>" >>  $VARDESTREP/$VARWEBPAGE
echo "<meta name="Simple Patching Report" content="width=device-width, initial-scale=1">" >>  $VARDESTREP/$VARWEBPAGE
echo "   <title>SIMPLE PATCHING REPORT - INSTALLABLE</title>" >>  $VARDESTREP/$VARWEBPAGE
echo "     <style>" >>  $VARDESTREP/$VARWEBPAGE
echo "        table {" >>  $VARDESTREP/$VARWEBPAGE
echo "            border-collapse:collapse;" >>  $VARDESTREP/$VARWEBPAGE
echo "            border: 1px solid black;" >>  $VARDESTREP/$VARWEBPAGE
echo "            border-bottom: 1px solid #000000;" >>  $VARDESTREP/$VARWEBPAGE
echo "            font-size: 18px;" >>  $VARDESTREP/$VARWEBPAGE
echo "            text-align: left;" >>  $VARDESTREP/$VARWEBPAGE
echo "            padding: 12px;" >>  $VARDESTREP/$VARWEBPAGE
echo "        }" >>  $VARDESTREP/$VARWEBPAGE
echo "        " >>  $VARDESTREP/$VARWEBPAGE
echo "        th {" >>  $VARDESTREP/$VARWEBPAGE
echo "            background-color: #47a0c4;" >>  $VARDESTREP/$VARWEBPAGE
echo "            color: white;" >>  $VARDESTREP/$VARWEBPAGE
echo "            border-collapse:collapse;" >>  $VARDESTREP/$VARWEBPAGE
echo "            border: 1px solid black;" >>  $VARDESTREP/$VARWEBPAGE
echo "            border-bottom: 1px solid #000000;" >>  $VARDESTREP/$VARWEBPAGE
echo "            font-size: 18px;" >>  $VARDESTREP/$VARWEBPAGE
echo "            text-align: left;" >>  $VARDESTREP/$VARWEBPAGE
echo "            padding: 12px;" >>  $VARDESTREP/$VARWEBPAGE
echo "        }" >>  $VARDESTREP/$VARWEBPAGE
echo "        " >>  $VARDESTREP/$VARWEBPAGE
echo "        td {" >>  $VARDESTREP/$VARWEBPAGE
echo "            border-collapse:collapse;" >>  $VARDESTREP/$VARWEBPAGE
echo "            border: 1px solid black;" >>  $VARDESTREP/$VARWEBPAGE
echo "            border-bottom: 1px solid #000000;" >>  $VARDESTREP/$VARWEBPAGE
echo "            font-size: 18px;" >>  $VARDESTREP/$VARWEBPAGE
echo "            text-align: left;" >>  $VARDESTREP/$VARWEBPAGE
echo "            padding: 12px;" >>  $VARDESTREP/$VARWEBPAGE
echo "        }" >>  $VARDESTREP/$VARWEBPAGE
echo "        " >>  $VARDESTREP/$VARWEBPAGE
echo "        table tr.header, table tr:hover {" >>  $VARDESTREP/$VARWEBPAGE
echo "            background-color:#cde4ee;" >>  $VARDESTREP/$VARWEBPAGE
echo "        }" >>  $VARDESTREP/$VARWEBPAGE
echo "        " >>  $VARDESTREP/$VARWEBPAGE
echo "        input {" >>  $VARDESTREP/$VARWEBPAGE
echo "            background-position: 10px 10px;" >>  $VARDESTREP/$VARWEBPAGE
echo "            background-repeat: no-repeat;" >>  $VARDESTREP/$VARWEBPAGE
echo "            width: 25%;" >>  $VARDESTREP/$VARWEBPAGE
echo "            font-size: 16px;" >>  $VARDESTREP/$VARWEBPAGE
echo "            padding: 12px 20px 12px 40px;" >>  $VARDESTREP/$VARWEBPAGE
echo "            border: 5px solid #ddd;" >>  $VARDESTREP/$VARWEBPAGE
echo "            margin-bottom: 12px;" >>  $VARDESTREP/$VARWEBPAGE
echo "        }" >>  $VARDESTREP/$VARWEBPAGE
echo "        " >>  $VARDESTREP/$VARWEBPAGE
echo "        h1 {" >>  $VARDESTREP/$VARWEBPAGE
echo "          color: #000000;" >>  $VARDESTREP/$VARWEBPAGE
echo "            font-family: 'Helvetica Neue', sans-serif;" >>  $VARDESTREP/$VARWEBPAGE
echo "            font-size: 25px;" >>  $VARDESTREP/$VARWEBPAGE
echo "            font-weight: bold;" >>  $VARDESTREP/$VARWEBPAGE
echo "            letter-spacing: -1px;" >>  $VARDESTREP/$VARWEBPAGE
echo "            line-height: 1;" >>  $VARDESTREP/$VARWEBPAGE
echo "            text-align: center;" >>  $VARDESTREP/$VARWEBPAGE
echo "          }" >>  $VARDESTREP/$VARWEBPAGE
echo "          " >>  $VARDESTREP/$VARWEBPAGE
echo "      h2 {" >>  $VARDESTREP/$VARWEBPAGE
echo "          color: #000000;" >>  $VARDESTREP/$VARWEBPAGE
echo "          font-family: 'Helvetica Neue', sans-serif;" >>  $VARDESTREP/$VARWEBPAGE
echo "          font-size: 25px;" >>  $VARDESTREP/$VARWEBPAGE
echo "          font-weight: 300;" >>  $VARDESTREP/$VARWEBPAGE
echo "          line-height: 32px;" >>  $VARDESTREP/$VARWEBPAGE
echo "          margin: 0 0 42px;" >>  $VARDESTREP/$VARWEBPAGE
echo "          text-align: Left;" >>  $VARDESTREP/$VARWEBPAGE
echo "            text-decoration: underline;" >>  $VARDESTREP/$VARWEBPAGE
echo "        }" >>  $VARDESTREP/$VARWEBPAGE
echo "        " >>  $VARDESTREP/$VARWEBPAGE
echo "      p {" >>  $VARDESTREP/$VARWEBPAGE
echo "          color: #000000;" >>  $VARDESTREP/$VARWEBPAGE
echo "          font-family: 'Helvetica Neue', sans-serif;" >>  $VARDESTREP/$VARWEBPAGE
echo "          font-size: 14px;" >>  $VARDESTREP/$VARWEBPAGE
echo "          line-height: 32px;" >>  $VARDESTREP/$VARWEBPAGE
echo "          margin: 0 0 10px;" >>  $VARDESTREP/$VARWEBPAGE
echo "          text-align: justify;" >>  $VARDESTREP/$VARWEBPAGE
echo "          text-justify: inter-word;" >>  $VARDESTREP/$VARWEBPAGE
echo "        }" >>  $VARDESTREP/$VARWEBPAGE
echo "        " >>  $VARDESTREP/$VARWEBPAGE
echo "        ul {" >>  $VARDESTREP/$VARWEBPAGE
echo "            list-style-type: none;" >>  $VARDESTREP/$VARWEBPAGE
echo "            margin: 0;" >>  $VARDESTREP/$VARWEBPAGE
echo "            padding: 0;" >>  $VARDESTREP/$VARWEBPAGE
echo "            overflow: hidden;" >>  $VARDESTREP/$VARWEBPAGE
echo "            background-color: #333;" >>  $VARDESTREP/$VARWEBPAGE
echo "        }" >>  $VARDESTREP/$VARWEBPAGE
echo " " >>  $VARDESTREP/$VARWEBPAGE
echo "        li {" >>  $VARDESTREP/$VARWEBPAGE
echo "            float: left;" >>  $VARDESTREP/$VARWEBPAGE
echo "        }" >>  $VARDESTREP/$VARWEBPAGE
echo " " >>  $VARDESTREP/$VARWEBPAGE
echo "        li a {" >>  $VARDESTREP/$VARWEBPAGE
echo "            display: block;" >>  $VARDESTREP/$VARWEBPAGE
echo "            color: white;" >>  $VARDESTREP/$VARWEBPAGE
echo "            text-align: center;" >>  $VARDESTREP/$VARWEBPAGE
echo "            padding: 14px 16px;" >>  $VARDESTREP/$VARWEBPAGE
echo "            text-decoration: none;" >>  $VARDESTREP/$VARWEBPAGE
echo "        }" >>  $VARDESTREP/$VARWEBPAGE
echo " " >>  $VARDESTREP/$VARWEBPAGE
echo "        li a:hover:not(.active) {" >>  $VARDESTREP/$VARWEBPAGE
echo "            background-color: #111;" >>  $VARDESTREP/$VARWEBPAGE
echo "        }" >>  $VARDESTREP/$VARWEBPAGE
echo " " >>  $VARDESTREP/$VARWEBPAGE
echo "        .active {" >>  $VARDESTREP/$VARWEBPAGE
echo "            background-color: #4CAF50;" >>  $VARDESTREP/$VARWEBPAGE
echo "        }" >>  $VARDESTREP/$VARWEBPAGE

echo "</style>" >>  $VARDESTREP/$VARWEBPAGE
echo "</head>" >>  $VARDESTREP/$VARWEBPAGE
echo "<body>" >>  $VARDESTREP/$VARWEBPAGE

# TITLE AND MENU :
##################
echo "<h1 align="center">SIMPLE ERRATA REPORT</h1>" >>  $VARDESTREP/$VARWEBPAGE
echo "<ul>" >>  $VARDESTREP/$VARWEBPAGE
echo "  <li><a href="#life.html">Life-Cycle Info</a></li>" >>  $VARDESTREP/$VARWEBPAGE
echo "  <li style="float:right"><a class="active" href="#about" TITLE="F.ROFFET">v1.1</a></li>" >>  $VARDESTREP/$VARWEBPAGE
echo "</ul>" >>  $VARDESTREP/$VARWEBPAGE

# Modale About :
################


# A LITTLE BIT OF TEXT :
########################
echo "<h2> </h2>" >>  $VARDESTREP/$VARWEBPAGE
echo "<h2>Host Filter :</h2>" >>  $VARDESTREP/$VARWEBPAGE
echo "<input type=\"text\" id=\"myInput\" onkeyup=\"myFunction()\" placeholder=\"Search host ...\"> " >>  $VARDESTREP/$VARWEBPAGE
echo "<h2> </h2>" >>  $VARDESTREP/$VARWEBPAGE

echo "<h2> </h2>" >>  $VARDESTREP/$VARWEBPAGE
echo "<h2>Applicable or Installable :</h2>" >>  $VARDESTREP/$VARWEBPAGE
echo "<p><strong>Applicable :</strong> Errata available on The Red Hat Portal</p>" >>  $VARDESTREP/$VARWEBPAGE
echo "<p><strong>Installable :</strong> Errata available on Red Hat Satellite Content View : One fixed date per patch campaign. All servers should have 0 RHSA Errata at the end on the patch campagaign.</p>" >>  $VARDESTREP/$VARWEBPAGE
echo "<p><strong>Are display here the numbers of Errata ( Instalable or Applicable ), not the numbers of packages.</strong></p>" >>  $VARDESTREP/$VARWEBPAGE
echo "<h2> </h2>" >>  $VARDESTREP/$VARWEBPAGE
echo "<h3>Click column title to sort :</h3>" >>  $VARDESTREP/$VARWEBPAGE

# TABLE START HERE :
####################

echo "<table id="myTable">" >>  $VARDESTREP/$VARWEBPAGE
echo "    <thead>" >>  $VARDESTREP/$VARWEBPAGE
echo "    <tr class="header"> " >>  $VARDESTREP/$VARWEBPAGE
echo "        <th style="cursor:pointer" onclick=\"sortTable(0)\" style=\"width:10%;\" > HOSTNAME </th>"   >>  $VARDESTREP/$VARWEBPAGE
echo "        <th style="cursor:pointer" onclick=\"sortTable(1)\" style=\"width:10%;\" > @IP </th>"        >>  $VARDESTREP/$VARWEBPAGE
echo "        <th style="cursor:pointer" onclick=\"sortTable(2)\" style=\"width:10%;\" > OS NAME </th>"    >>  $VARDESTREP/$VARWEBPAGE
echo "        <th style="cursor:pointer" onclick=\"sortTable(3)\" style=\"width:10%;\" > OS RELEASE </th>" >>  $VARDESTREP/$VARWEBPAGE
echo "        <th style="cursor:pointer" onclick=\"sortTable(4)\" style=\"width:10%;\" > PLATFORM  </th>"  >>  $VARDESTREP/$VARWEBPAGE
echo "        <th style="cursor:pointer" onclick=\"sortTable(5)\" style=\"width:6%;\" > Appl. RHSA  </th>" >>  $VARDESTREP/$VARWEBPAGE
echo "        <th style="cursor:pointer" onclick=\"sortTable(6)\" style=\"width:6%;\" > Appl. RHBA  </th>" >>  $VARDESTREP/$VARWEBPAGE
echo "        <th style="cursor:pointer" onclick=\"sortTable(7)\" style=\"width:6%;\" > Appl. RHEA  </th>" >>  $VARDESTREP/$VARWEBPAGE
echo "        <th style="cursor:pointer" onclick=\"sortTable(8)\" style=\"width:6%;\" > Inst. RHSA  </th>" >>  $VARDESTREP/$VARWEBPAGE
echo "        <th style="cursor:pointer" onclick=\"sortTable(9)\" style=\"width:6%;\" > Inst. RHBA  </th>" >>  $VARDESTREP/$VARWEBPAGE
echo "        <th style="cursor:pointer" onclick=\"sortTable(10)\" style=\"width:6%;\" > Inst. RHEA  </th>" >>  $VARDESTREP/$VARWEBPAGE
echo "        <th style="cursor:pointer" style=\"width:5%;\" > Appl. Details </th>" >>  $VARDESTREP/$VARWEBPAGE
echo "        <th style="cursor:pointer" style=\"width:5%;\" > Inst. Details </th>" >>  $VARDESTREP/$VARWEBPAGE
echo "    </tr>" >>  $VARDESTREP/$VARWEBPAGE
echo "    </thead>" >>  $VARDESTREP/$VARWEBPAGE

# COLLECTING DATAS :
####################

for id_host in `cat $VARDESTREP/$VARHOSTLIST`
    do
        echo "Now Checking Host ID:" $id_host

        hammer host facts --id $id_host >> $VARDESTREP/facts_"$id_host"
        HOST_NAME=$(cat $VARDESTREP/"facts_"$id_host | grep -m1 "network::hostname" | cut -d"|" -f 2 | sed 's/ //g')
        HOST_IPV4=$(cat $VARDESTREP/"facts_"$id_host | grep "network::ipv4_address" | uniq | cut -d"|" -f 2 | sed 's/ //g')
        HOST_OSNA=$(cat $VARDESTREP/"facts_"$id_host | grep -m1 "distribution::name" | cut -d"|" -f 2 | sed 's/ //g')
        HOST_OSVE=$(cat $VARDESTREP/"facts_"$id_host | grep -m1 "distribution::version" | cut -d"|" -f 2 | sed 's/ //g')
        HOST_VIRT=$(cat $VARDESTREP/"facts_"$id_host | grep "virt::host_type" | cut -d"|" -f 2 | sed 's/ //g')

        hammer erratum list --host-id $id_host --errata-restrict-applicable=true --errata-restrict-installable=false >> $VARDESTREP/"appl_errata_"$HOST_NAME
        APPL_RHSA=$(cat $VARDESTREP/"appl_errata_"$HOST_NAME | grep RHSA | wc -l)
        APPL_RHBA=$(cat $VARDESTREP/"appl_errata_"$HOST_NAME | grep RHBA | wc -l)
        APPL_RHEA=$(cat $VARDESTREP/"appl_errata_"$HOST_NAME | grep RHEA | wc -l)

        hammer erratum list --host-id $id_host --errata-restrict-applicable=false --errata-restrict-installable=true >> $VARDESTREP/"inst_errata_"$HOST_NAME
        INST_RHSA=$(cat $VARDESTREP/"inst_errata_"$HOST_NAME | grep RHSA | wc -l)
        INST_RHBA=$(cat $VARDESTREP/"inst_errata_"$HOST_NAME | grep RHBA | wc -l)
        INST_RHEA=$(cat $VARDESTREP/"inst_errata_"$HOST_NAME | grep RHEA | wc -l)

        APPL_ZOOM="<a href="./datas/appl_details_$HOST_NAME.html">Show</a></li>"
        INST_ZOOM="<a href="./datas/inst_details_$HOST_NAME.html">Show</a></li>"

        # Write entry in main web page
        ##############################

printf "<tr>    <td>%s</td> <td>%s</td> <td>%s</td> <td>%s</td> <td>%s</td> <td>%s</td> <td>%s</td> <td>%s</td> <td>%s</td> <td>%s</td> <td>%s</td> <td>%s</td> <td>%s</td> </tr>\n"    "$HOST_NAME"    "$HOST_IPV4"    "$HOST_OSNA"    "$HOST_OSVE"    "$HOST_VIRT" "$APPL_RHSA"    "$APPL_RHBA"    "$APPL_RHEA"    "$INST_RHSA"    "$INST_RHBA"    "$INST_RHEA" "$APPL_ZOOM" "$INST_ZOOM" >>  $VARDESTREP/$VARWEBPAGE

done

# TABLE FINISH HERE :
#####################
echo "</table>" >>  $VARDESTREP/$VARWEBPAGE

# SEARCH FITLER :
#################§

echo "<script>                                                  " >>  $VARDESTREP/$VARWEBPAGE

echo "function myFunction() {                                   " >>  $VARDESTREP/$VARWEBPAGE
echo "  var input, filter, table, tr, td, i, txtValue;          " >>  $VARDESTREP/$VARWEBPAGE
echo "  input = document.getElementById(\"myInput\");           " >>  $VARDESTREP/$VARWEBPAGE
echo "  filter = input.value.toUpperCase();                     " >>  $VARDESTREP/$VARWEBPAGE
echo "  table = document.getElementById(\"myTable\");           " >>  $VARDESTREP/$VARWEBPAGE
echo "  tr = table.getElementsByTagName(\"tr\");                " >>  $VARDESTREP/$VARWEBPAGE
echo "  for (i = 0; i < tr.length; i++) {                       " >>  $VARDESTREP/$VARWEBPAGE
echo "    td = tr[i].getElementsByTagName(\"td\")[0];           " >>  $VARDESTREP/$VARWEBPAGE
echo "    if (td) {                                             " >>  $VARDESTREP/$VARWEBPAGE
echo "      txtValue = td.textContent || td.innerText;          " >>  $VARDESTREP/$VARWEBPAGE
echo "      if (txtValue.toUpperCase().indexOf(filter) > -1) {  " >>  $VARDESTREP/$VARWEBPAGE
echo "        tr[i].style.display = \"\";                       " >>  $VARDESTREP/$VARWEBPAGE
echo "      } else {                                            " >>  $VARDESTREP/$VARWEBPAGE
echo "        tr[i].style.display = \"none\";                   " >>  $VARDESTREP/$VARWEBPAGE
echo "      }                                                   " >>  $VARDESTREP/$VARWEBPAGE
echo "    }                                                     " >>  $VARDESTREP/$VARWEBPAGE
echo "  }                                                       " >>  $VARDESTREP/$VARWEBPAGE
echo "}                                                         " >>  $VARDESTREP/$VARWEBPAGE

echo "function  sortTable(n) {                                                                  " >>  $VARDESTREP/$VARWEBPAGE
echo "  var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;                " >>  $VARDESTREP/$VARWEBPAGE
echo "  table = document.getElementById(\"myTable\");                                           " >>  $VARDESTREP/$VARWEBPAGE
echo "  switching = true;                                                                       " >>  $VARDESTREP/$VARWEBPAGE
echo "  //Set the sorting direction to ascending:                                               " >>  $VARDESTREP/$VARWEBPAGE
echo "  dir = \"asc\";                                                                          " >>  $VARDESTREP/$VARWEBPAGE
echo "  /*Make a loop that will continue until                                                  " >>  $VARDESTREP/$VARWEBPAGE
echo "  no switching has been done:*/                                                           " >>  $VARDESTREP/$VARWEBPAGE
echo "  while (switching) {                                                                     " >>  $VARDESTREP/$VARWEBPAGE
echo "    //start by saying: no switching is done:                                              " >>  $VARDESTREP/$VARWEBPAGE
echo "    switching = false;                                                                    " >>  $VARDESTREP/$VARWEBPAGE
echo "    rows = table.rows;                                                                    " >>  $VARDESTREP/$VARWEBPAGE
echo "    /*Loop through all table rows (except the                                             " >>  $VARDESTREP/$VARWEBPAGE
echo "    first, which contains table headers):*/                                               " >>  $VARDESTREP/$VARWEBPAGE
echo "    for (i = 1; i < (rows.length - 1); i++) {                                             " >>  $VARDESTREP/$VARWEBPAGE
echo "      //start by saying there should be no switching:                                     " >>  $VARDESTREP/$VARWEBPAGE
echo "      shouldSwitch = false;                                                               " >>  $VARDESTREP/$VARWEBPAGE
echo "      /*Get the two elements you want to compare,                                         " >>  $VARDESTREP/$VARWEBPAGE
echo "      one from current row and one from the next:*/                                       " >>  $VARDESTREP/$VARWEBPAGE
echo "      x = rows[i].getElementsByTagName(\"TD\")[n];                                        " >>  $VARDESTREP/$VARWEBPAGE
echo "      y = rows[i + 1].getElementsByTagName(\"TD\")[n];                                    " >>  $VARDESTREP/$VARWEBPAGE
echo "      /*check if the two rows should switch place,                                        " >>  $VARDESTREP/$VARWEBPAGE
echo "      based on the direction, asc or desc:*/                                              " >>  $VARDESTREP/$VARWEBPAGE
echo "      if (dir == \"asc\") {                                                               " >>  $VARDESTREP/$VARWEBPAGE
echo "        if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {                      " >>  $VARDESTREP/$VARWEBPAGE
echo "          //if so, mark as a switch and break the loop:                                   " >>  $VARDESTREP/$VARWEBPAGE
echo "          shouldSwitch= true;                                                             " >>  $VARDESTREP/$VARWEBPAGE
echo "          break;                                                                          " >>  $VARDESTREP/$VARWEBPAGE
echo "        }                                                                                 " >>  $VARDESTREP/$VARWEBPAGE
echo "      } else if (dir == \"desc\") {                                                       " >>  $VARDESTREP/$VARWEBPAGE
echo "        if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {                      " >>  $VARDESTREP/$VARWEBPAGE
echo "          //if so, mark as a switch and break the loop:                                   " >>  $VARDESTREP/$VARWEBPAGE
echo "          shouldSwitch = true;                                                            " >>  $VARDESTREP/$VARWEBPAGE
echo "          break;                                                                          " >>  $VARDESTREP/$VARWEBPAGE
echo "        }                                                                                 " >>  $VARDESTREP/$VARWEBPAGE
echo "      }                                                                                   " >>  $VARDESTREP/$VARWEBPAGE
echo "    }                                                                                     " >>  $VARDESTREP/$VARWEBPAGE
echo "    if (shouldSwitch) {                                                                   " >>  $VARDESTREP/$VARWEBPAGE
echo "      /*If a switch has been marked, make the switch                                      " >>  $VARDESTREP/$VARWEBPAGE
echo "      and mark that a switch has been done:*/                                             " >>  $VARDESTREP/$VARWEBPAGE
echo "      rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);                              " >>  $VARDESTREP/$VARWEBPAGE
echo "      switching = true;                                                                   " >>  $VARDESTREP/$VARWEBPAGE
echo "      //Each time a switch is done, increase this count by 1:                             " >>  $VARDESTREP/$VARWEBPAGE
echo "      switchcount ++;                                                                     " >>  $VARDESTREP/$VARWEBPAGE
echo "    } else {                                                                              " >>  $VARDESTREP/$VARWEBPAGE
echo "      /*If no switching has been done AND the direction is \"asc\",                       " >>  $VARDESTREP/$VARWEBPAGE
echo "      set the direction to \"desc\" and run the while loop again.*/                       " >>  $VARDESTREP/$VARWEBPAGE
echo "      if (switchcount == 0 && dir == \"asc\") {                                           " >>  $VARDESTREP/$VARWEBPAGE
echo "        dir = \"desc\";                                                                   " >>  $VARDESTREP/$VARWEBPAGE
echo "        switching = true;                                                                 " >>  $VARDESTREP/$VARWEBPAGE
echo "      }                                                                                   " >>  $VARDESTREP/$VARWEBPAGE
echo "    }                                                                                     " >>  $VARDESTREP/$VARWEBPAGE
echo "  }                                                                                       " >>  $VARDESTREP/$VARWEBPAGE
echo "}                                                                                         " >>  $VARDESTREP/$VARWEBPAGE

echo "</script>                                                                                 " >>  $VARDESTREP/$VARWEBPAGE

# WEB PAGE  FINISH HERE  :
##########################
echo "</body> " >>  $VARDESTREP/$VARWEBPAGE
echo "</html>" >>  $VARDESTREP/$VARWEBPAGE
echo " " >>  $VARDESTREP/$VARWEBPAGE

# THIS IS THE END, MY FRIEND :
##############################
ls -l $VARDESTREP/$VARWEBPAGE

# CLEAN AND BACKUP REPORT :
###########################
cp -p $VARDESTREP/$VARWEBPAGE $VARDESTREP/$VARWEBPAGE.`date +"%m_%d_%Y_%H%M%S"`

# CLEAN LAST REPORT :
#####################
rm -f $VARDESTREP/$VARHOSTLIST
rm -f $VARDESTREP/appl_errata_*
rm -f $VARDESTREP/inst_errata_*
rm -f $VARDESTREP/facts_*
