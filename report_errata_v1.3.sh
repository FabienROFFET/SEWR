###############################################################
# Name : Generate a web report web
# Description : Create Installable Report for Satellite 6.5/6.6
# Usage : ./reports_errata.sh
# Geeks : Fabien ROFFET & Yann ILAS
# Last Modification : 24/03/2020
# Version : 1.0 : Creation of this Script
# Version : 1.3 : New Features
###############################################################

#DEFINE VARIABLE :
##################
VARORGA="ORG_UFLEX3_BDP"
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
echo "<meta name="Simple Patching Report" content=\"width=device-width, initial-scale=1\">" >>  $VARDESTREP/$VARWEBPAGE
echo "   <title>SIMPLE PATCHING REPORT</title>" >>  $VARDESTREP/$VARWEBPAGE
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
echo "  <li><a href="#" onclick=\"exportTableToCSV('simple_errata_report.csv')\">Export to CSV</a></li>" >>  $VARDESTREP/$VARWEBPAGE
echo "  <li style="float:right"><a class="active" href="#about" TITLE="F.ROFFET">v1.3</a></li>" >>  $VARDESTREP/$VARWEBPAGE
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
echo "        <th style="cursor:pointer" onclick=\"SortTable(0,'T')\" style=\"width:10%;\" > HOSTNAME </th>"   >>  $VARDESTREP/$VARWEBPAGE
echo "        <th style="cursor:pointer" onclick=\"SortTable(1,'T')\" style=\"width:10%;\" > @IP </th>"        >>  $VARDESTREP/$VARWEBPAGE
echo "        <th style="cursor:pointer" onclick=\"SortTable(2,'T')\" style=\"width:10%;\" > OS NAME </th>"    >>  $VARDESTREP/$VARWEBPAGE
echo "        <th style="cursor:pointer" onclick=\"SortTable(3,'T')\" style=\"width:10%;\" > OS RELEASE </th>" >>  $VARDESTREP/$VARWEBPAGE
echo "        <th style="cursor:pointer" onclick=\"SortTable(4,'T')\" style=\"width:10%;\" > PLATFORM  </th>"  >>  $VARDESTREP/$VARWEBPAGE
echo "        <th style="cursor:pointer" onclick=\"SortTable(5,'N')\" style=\"width:6%;\" > Appl. RHSA  </th>" >>  $VARDESTREP/$VARWEBPAGE
echo "        <th style="cursor:pointer" onclick=\"SortTable(6,'N')\" style=\"width:6%;\" > Appl. RHBA  </th>" >>  $VARDESTREP/$VARWEBPAGE
echo "        <th style="cursor:pointer" onclick=\"SortTable(7,'N')\" style=\"width:6%;\" > Appl. RHEA  </th>" >>  $VARDESTREP/$VARWEBPAGE
echo "        <th style="cursor:pointer" onclick=\"SortTable(8,'N')\" style=\"width:6%;\" > Inst. RHSA  </th>" >>  $VARDESTREP/$VARWEBPAGE
echo "        <th style="cursor:pointer" onclick=\"SortTable(9,'N')\" style=\"width:6%;\" > Inst. RHBA  </th>" >>  $VARDESTREP/$VARWEBPAGE
echo "        <th style="cursor:pointer" onclick=\"SortTable(10,'N')\" style=\"width:6%;\" > Inst. RHEA  </th>" >>  $VARDESTREP/$VARWEBPAGE
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

        APPL_ZOOM="<a href="./datas/appl_details_$HOST_NAME.html">Show</a>"
        INST_ZOOM="<a href="./datas/inst_details_$HOST_NAME.html">Show</a>"

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



echo "var TableIDvalue = \"myTable\";                                                                           " >>  $VARDESTREP/$VARWEBPAGE
echo "var TableLastSortedColumn = -1;                                                                       " >>  $VARDESTREP/$VARWEBPAGE
echo "function SortTable() {                                                                                " >>  $VARDESTREP/$VARWEBPAGE
echo "var sortColumn = parseInt(arguments[0]);                                                              " >>  $VARDESTREP/$VARWEBPAGE
echo "var type = arguments.length > 1 ? arguments[1] : 'T';                                                 " >>  $VARDESTREP/$VARWEBPAGE
echo "var dateformat = arguments.length > 2 ? arguments[2] : '';                                            " >>  $VARDESTREP/$VARWEBPAGE
echo "var table = document.getElementById(TableIDvalue);                                                    " >>  $VARDESTREP/$VARWEBPAGE
echo "var tbody = table.getElementsByTagName(\"tbody\")[0];                                                   " >>  $VARDESTREP/$VARWEBPAGE
echo "var rows = tbody.getElementsByTagName(\"tr\");                                                          " >>  $VARDESTREP/$VARWEBPAGE
echo "var arrayOfRows = new Array();                                                                        " >>  $VARDESTREP/$VARWEBPAGE
echo "type = type.toUpperCase();                                                                            " >>  $VARDESTREP/$VARWEBPAGE
echo "dateformat = dateformat.toLowerCase();                                                                " >>  $VARDESTREP/$VARWEBPAGE
echo "for(var i=0, len=rows.length; i<len; i++) {                                                           " >>  $VARDESTREP/$VARWEBPAGE
echo "  arrayOfRows[i] = new Object;                                                                        " >>  $VARDESTREP/$VARWEBPAGE
echo "  arrayOfRows[i].oldIndex = i;                                                                        " >>  $VARDESTREP/$VARWEBPAGE
echo "  var celltext = rows[i].getElementsByTagName(\"td\")[sortColumn].innerHTML.replace(/<[^>]*>/g,\"\");     " >>  $VARDESTREP/$VARWEBPAGE
echo "  if( type=='D' ) { arrayOfRows[i].value = GetDateSortingKey(dateformat,celltext); }                  " >>  $VARDESTREP/$VARWEBPAGE
echo "  else {                                                                                              " >>  $VARDESTREP/$VARWEBPAGE
echo "      var re = type==\"N\" ? /[^\.\-\+\d]/g : /[^a-zA-Z0-9]/g;                                          " >>  $VARDESTREP/$VARWEBPAGE
echo "      arrayOfRows[i].value = celltext.replace(re,\"\").substr(0,25).toLowerCase();                      " >>  $VARDESTREP/$VARWEBPAGE
echo "      }                                                                                               " >>  $VARDESTREP/$VARWEBPAGE
echo "  }                                                                                                   " >>  $VARDESTREP/$VARWEBPAGE
echo "if (sortColumn == TableLastSortedColumn) { arrayOfRows.reverse(); }                                   " >>  $VARDESTREP/$VARWEBPAGE
echo "else {                                                                                                " >>  $VARDESTREP/$VARWEBPAGE
echo "  TableLastSortedColumn = sortColumn;                                                                 " >>  $VARDESTREP/$VARWEBPAGE
echo "  switch(type) {                                                                                      " >>  $VARDESTREP/$VARWEBPAGE
echo "      case \"N\" : arrayOfRows.sort(CompareRowOfNumbers); break;                                        " >>  $VARDESTREP/$VARWEBPAGE
echo "      case \"D\" : arrayOfRows.sort(CompareRowOfNumbers); break;                                        " >>  $VARDESTREP/$VARWEBPAGE
echo "      default  : arrayOfRows.sort(CompareRowOfText);                                                  " >>  $VARDESTREP/$VARWEBPAGE
echo "      }                                                                                               " >>  $VARDESTREP/$VARWEBPAGE
echo "  }                                                                                                   " >>  $VARDESTREP/$VARWEBPAGE
echo "var newTableBody = document.createElement(\"tbody\");                                                   " >>  $VARDESTREP/$VARWEBPAGE
echo "for(var i=0, len=arrayOfRows.length; i<len; i++) {                                                    " >>  $VARDESTREP/$VARWEBPAGE
echo "  newTableBody.appendChild(rows[arrayOfRows[i].oldIndex].cloneNode(true));                            " >>  $VARDESTREP/$VARWEBPAGE
echo "  }                                                                                                   " >>  $VARDESTREP/$VARWEBPAGE
echo "table.replaceChild(newTableBody,tbody);                                                               " >>  $VARDESTREP/$VARWEBPAGE
echo "} // function SortTable()                                                                             " >>  $VARDESTREP/$VARWEBPAGE
echo "                                                                                                      " >>  $VARDESTREP/$VARWEBPAGE
echo "function CompareRowOfText(a,b) {                                                                      " >>  $VARDESTREP/$VARWEBPAGE
echo "var aval = a.value;                                                                                   " >>  $VARDESTREP/$VARWEBPAGE
echo "var bval = b.value;                                                                                   " >>  $VARDESTREP/$VARWEBPAGE
echo "return( aval == bval ? 0 : (aval > bval ? 1 : -1) );                                                  " >>  $VARDESTREP/$VARWEBPAGE
echo "} // function CompareRowOfText()                                                                      " >>  $VARDESTREP/$VARWEBPAGE
echo "                                                                                                      " >>  $VARDESTREP/$VARWEBPAGE
echo "function CompareRowOfNumbers(a,b) {                                                                   " >>  $VARDESTREP/$VARWEBPAGE
echo "var aval = /\d/.test(a.value) ? parseFloat(a.value) : 0;                                              " >>  $VARDESTREP/$VARWEBPAGE
echo "var bval = /\d/.test(b.value) ? parseFloat(b.value) : 0;                                              " >>  $VARDESTREP/$VARWEBPAGE
echo "return( aval == bval ? 0 : (aval > bval ? 1 : -1) );                                                  " >>  $VARDESTREP/$VARWEBPAGE
echo "} // function CompareRowOfNumbers()                                                                   " >>  $VARDESTREP/$VARWEBPAGE
echo "                                                                                                      " >>  $VARDESTREP/$VARWEBPAGE
echo "function GetDateSortingKey(format,text) {                                                             " >>  $VARDESTREP/$VARWEBPAGE
echo "if( format.length < 1 ) { return \"\"; }                                                                " >>  $VARDESTREP/$VARWEBPAGE
echo "format = format.toLowerCase();                                                                        " >>  $VARDESTREP/$VARWEBPAGE
echo "text = text.toLowerCase();                                                                            " >>  $VARDESTREP/$VARWEBPAGE
echo "text = text.replace(/^[^a-z0-9]*/,\"\");                                                                " >>  $VARDESTREP/$VARWEBPAGE
echo "text = text.replace(/[^a-z0-9]*$/,\"\");                                                                " >>  $VARDESTREP/$VARWEBPAGE
echo "if( text.length < 1 ) { return \"\"; }                                                                  " >>  $VARDESTREP/$VARWEBPAGE
echo "text = text.replace(/[^a-z0-9]+/g,\",\");                                                               " >>  $VARDESTREP/$VARWEBPAGE
echo "var date = text.split(\",\");                                                                           " >>  $VARDESTREP/$VARWEBPAGE
echo "if( date.length < 3 ) { return \"\"; }                                                                  " >>  $VARDESTREP/$VARWEBPAGE
echo "var d=0, m=0, y=0;                                                                                    " >>  $VARDESTREP/$VARWEBPAGE
echo "for( var i=0; i<3; i++ ) {                                                                            " >>  $VARDESTREP/$VARWEBPAGE
echo "  var ts = format.substr(i,1);                                                                        " >>  $VARDESTREP/$VARWEBPAGE
echo "  if( ts == \"d\" ) { d = date[i]; }                                                                    " >>  $VARDESTREP/$VARWEBPAGE
echo "  else if( ts == \"m\" ) { m = date[i]; }                                                               " >>  $VARDESTREP/$VARWEBPAGE
echo "  else if( ts == \"y\" ) { y = date[i]; }                                                               " >>  $VARDESTREP/$VARWEBPAGE
echo "  }                                                                                                   " >>  $VARDESTREP/$VARWEBPAGE
echo "d = d.replace(/^0/,\"\");                                                                               " >>  $VARDESTREP/$VARWEBPAGE
echo "if( d < 10 ) { d = \"0\" + d; }                                                                         " >>  $VARDESTREP/$VARWEBPAGE
echo "if( /[a-z]/.test(m) ) {                                                                               " >>  $VARDESTREP/$VARWEBPAGE
echo "  m = m.substr(0,3);                                                                                  " >>  $VARDESTREP/$VARWEBPAGE
echo "  switch(m) {                                                                                         " >>  $VARDESTREP/$VARWEBPAGE
echo "      case \"jan\" : m = String(1); break;                                                              " >>  $VARDESTREP/$VARWEBPAGE
echo "      case \"feb\" : m = String(2); break;                                                              " >>  $VARDESTREP/$VARWEBPAGE
echo "      case \"mar\" : m = String(3); break;                                                              " >>  $VARDESTREP/$VARWEBPAGE
echo "      case \"apr\" : m = String(4); break;                                                              " >>  $VARDESTREP/$VARWEBPAGE
echo "      case \"may\" : m = String(5); break;                                                              " >>  $VARDESTREP/$VARWEBPAGE
echo "      case \"jun\" : m = String(6); break;                                                              " >>  $VARDESTREP/$VARWEBPAGE
echo "      case \"jul\" : m = String(7); break;                                                              " >>  $VARDESTREP/$VARWEBPAGE
echo "      case \"aug\" : m = String(8); break;                                                              " >>  $VARDESTREP/$VARWEBPAGE
echo "      case \"sep\" : m = String(9); break;                                                              " >>  $VARDESTREP/$VARWEBPAGE
echo "      case \"oct\" : m = String(10); break;                                                             " >>  $VARDESTREP/$VARWEBPAGE
echo "      case \"nov\" : m = String(11); break;                                                             " >>  $VARDESTREP/$VARWEBPAGE
echo "      case \"dec\" : m = String(12); break;                                                             " >>  $VARDESTREP/$VARWEBPAGE
echo "      default    : m = String(0);                                                                     " >>  $VARDESTREP/$VARWEBPAGE
echo "      }                                                                                               " >>  $VARDESTREP/$VARWEBPAGE
echo "  }                                                                                                   " >>  $VARDESTREP/$VARWEBPAGE
echo "m = m.replace(/^0/,\"\");                                                                               " >>  $VARDESTREP/$VARWEBPAGE
echo "if( m < 10 ) { m = \"0\" + m; }                                                                         " >>  $VARDESTREP/$VARWEBPAGE
echo "y = parseInt(y);                                                                                      " >>  $VARDESTREP/$VARWEBPAGE
echo "if( y < 100 ) { y = parseInt(y) + 2000; }                                                             " >>  $VARDESTREP/$VARWEBPAGE
echo "return \"\" + String(y) + \"\" + String(m) + \"\" + String(d) + \"\";                                         " >>  $VARDESTREP/$VARWEBPAGE
echo "}                                                                                                     " >>  $VARDESTREP/$VARWEBPAGE
echo "                                                                                                      " >>  $VARDESTREP/$VARWEBPAGE
echo "function downloadCSV(csv, filename) {                                                                 " >>  $VARDESTREP/$VARWEBPAGE
echo "    var csvFile;                                                                                      " >>  $VARDESTREP/$VARWEBPAGE
echo "    var downloadLink;                                                                                 " >>  $VARDESTREP/$VARWEBPAGE
echo "    // CSV file                                                                                       " >>  $VARDESTREP/$VARWEBPAGE
echo "    csvFile = new Blob([csv], {type: \"text/csv\"});                                                    " >>  $VARDESTREP/$VARWEBPAGE
echo "    // Download link                                                                                  " >>  $VARDESTREP/$VARWEBPAGE
echo "    downloadLink = document.createElement(\"a\");                                                       " >>  $VARDESTREP/$VARWEBPAGE
echo "    // File name                                                                                      " >>  $VARDESTREP/$VARWEBPAGE
echo "    downloadLink.download = filename;                                                                 " >>  $VARDESTREP/$VARWEBPAGE
echo "    // Create a link to the file                                                                      " >>  $VARDESTREP/$VARWEBPAGE
echo "    downloadLink.href = window.URL.createObjectURL(csvFile);                                          " >>  $VARDESTREP/$VARWEBPAGE
echo "    // Hide download link                                                                             " >>  $VARDESTREP/$VARWEBPAGE
echo "    downloadLink.style.display = \"none\";                                                              " >>  $VARDESTREP/$VARWEBPAGE
echo "    // Add the link to DOM                                                                            " >>  $VARDESTREP/$VARWEBPAGE
echo "    document.body.appendChild(downloadLink);                                                          " >>  $VARDESTREP/$VARWEBPAGE
echo "    // Click download link                                                                            " >>  $VARDESTREP/$VARWEBPAGE
echo "    downloadLink.click();                                                                             " >>  $VARDESTREP/$VARWEBPAGE
echo "}                                                                                                     " >>  $VARDESTREP/$VARWEBPAGE
echo "                                                                                                      " >>  $VARDESTREP/$VARWEBPAGE
echo "function exportTableToCSV(filename) {                                                                 " >>  $VARDESTREP/$VARWEBPAGE
echo "    var csv = [];                                                                                     " >>  $VARDESTREP/$VARWEBPAGE
echo "    var rows = document.querySelectorAll(\"table tr\");                                                 " >>  $VARDESTREP/$VARWEBPAGE
echo "    for (var i = 0; i < rows.length; i++) {                                                           " >>  $VARDESTREP/$VARWEBPAGE
echo "        var row = [], cols = rows[i].querySelectorAll(\"td, th\");                                      " >>  $VARDESTREP/$VARWEBPAGE
echo "                                                                                                      " >>  $VARDESTREP/$VARWEBPAGE
echo "        for (var j = 0; j < cols.length; j++)                                                         " >>  $VARDESTREP/$VARWEBPAGE
echo "            row.push(cols[j].innerText);                                                              " >>  $VARDESTREP/$VARWEBPAGE
echo "                                                                                                      " >>  $VARDESTREP/$VARWEBPAGE
echo "        csv.push(row.join(\",\"));                                                                      " >>  $VARDESTREP/$VARWEBPAGE
echo "    }                                                                                                 " >>  $VARDESTREP/$VARWEBPAGE
echo "    // Download CSV file                                                                              " >>  $VARDESTREP/$VARWEBPAGE
echo "    downloadCSV(csv.join(\"\n\"), filename);                                                            " >>  $VARDESTREP/$VARWEBPAGE
echo "}                                                                                                     " >>  $VARDESTREP/$VARWEBPAGE
echo "                                                                                                      " >>  $VARDESTREP/$VARWEBPAGE










echo "</script>                                                                                             " >>  $VARDESTREP/$VARWEBPAGE

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
