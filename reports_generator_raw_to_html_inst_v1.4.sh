#######################################################################
# Description : Create HTML Report for Satellite 6.5/6.6
# Autor : Fabien ROFFET
# Last Modification : 08/04/2020
# Version : 1.3 : Creation of this Script and more ...
#######################################################################

#DEFINE VARIABLE :
##################
VARDESTREP="/var/www/html/pub/reporting/datas"
VARWEBPAGE="inst_details_"
VARPREFIXFILE="inst_details_"

#REMOVE PREVIOUS :
##################
rm -f $VARDESTREP/$VARPREFIXFILE*.html

# CREATE HTML REPORT  :
#######################

for RAWREPORT in `find $VARDESTREP -type f  -name $VARPREFIXFILE*`
    do
        OUTPUT_HTML=$(basename $RAWREPORT  | cut -d "." -f 1)
        echo "RAW to HTML for :" $OUTPUT_HTML
        
        
# WEB PAGE  START:
##################
echo "<!DOCTYPE html>                                                                                   " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "<html>                                                                                            " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "<head>                                                                                            " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "<meta name="Simple Patching Report" content="width=device-width, initial-scale=1">                " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "   <title>SIMPLE PATCHING REPORT - INSTALLABLE</title>                                            " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "     <style>                                                                                      " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "        table {                                                                                   " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "            border-collapse:collapse;                                                             " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "            border: 1px solid black;                                                              " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "            border-bottom: 1px solid #000000;                                                     " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "            font-size: 18px;                                                                      " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "            text-align: left;                                                                     " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "            padding: 12px;                                                                        " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "        }                                                                                         " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "                                                                                                  " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "        th {                                                                                      " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "            background-color: #47a0c4;                                                            " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "            color: white;                                                                         " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "            border-collapse:collapse;                                                             " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "            border: 1px solid black;                                                              " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "            border-bottom: 1px solid #000000;                                                     " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "            font-size: 18px;                                                                      " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "            text-align: left;                                                                     " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "            padding: 12px;                                                                        " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "        }                                                                                         " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "                                                                                                  " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "        td {                                                                                      " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "            border-collapse:collapse;                                                             " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "            border: 1px solid black;                                                              " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "            border-bottom: 1px solid #000000;                                                     " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "            font-size: 18px;                                                                      " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "            text-align: left;                                                                     " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "            padding: 12px;                                                                        " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "        }                                                                                         " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "                                                                                                  " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "        table tr.header, table tr:hover {                                                         " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "            background-color:#cde4ee;                                                             " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "        }                                                                                         " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "                                                                                                  " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "        input {                                                                                   " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "            background-position: 10px 10px;                                                       " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "            background-repeat: no-repeat;                                                         " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "            width: 25%;                                                                           " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "            font-size: 16px;                                                                      " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "            padding: 12px 20px 12px 40px;                                                         " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "            border: 5px solid #ddd;                                                               " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "            margin-bottom: 12px;                                                                  " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "        }                                                                                         " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "                                                                                                  " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "        h1 {                                                                                      " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "          color: #000000;                                                                         " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "            font-family: 'Helvetica Neue', sans-serif;                                            " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "            font-size: 25px;                                                                      " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "            font-weight: bold;                                                                    " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "            letter-spacing: -1px;                                                                 " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "            line-height: 1;                                                                       " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "            text-align: center;                                                                   " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "          }                                                                                       " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "                                                                                                  " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "      h2 {                                                                                        " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "          color: #000000;                                                                         " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "          font-family: 'Helvetica Neue', sans-serif;                                              " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "          font-size: 25px;                                                                        " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "          font-weight: 300;                                                                       " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "          line-height: 32px;                                                                      " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "          margin: 0 0 42px;                                                                       " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "          text-align: Left;                                                                       " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "            text-decoration: underline;                                                           " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "        }                                                                                         " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "                                                                                                  " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "      p {                                                                                         " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "          color: #000000;                                                                         " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "          font-family: 'Helvetica Neue', sans-serif;                                              " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "          font-size: 14px;                                                                        " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "          line-height: 32px;                                                                      " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "          margin: 0 0 10px;                                                                       " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "          text-align: justify;                                                                    " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "          text-justify: inter-word;                                                               " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "        }                                                                                         " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "                                                                                                  " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "        ul {                                                                                      " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "            list-style-type: none;                                                                " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "            margin: 0;                                                                            " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "            padding: 0;                                                                           " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "            overflow: hidden;                                                                     " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "            background-color: #333;                                                               " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "        }                                                                                         " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "                                                                                                  " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "        li {                                                                                      " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "            float: left;                                                                          " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "        }                                                                                         " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "                                                                                                  " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "        li a {                                                                                    " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "            display: block;                                                                       " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "            color: white;                                                                         " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "            text-align: center;                                                                   " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "            padding: 14px 16px;                                                                   " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "            text-decoration: none;                                                                " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "        }                                                                                         " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "                                                                                                  " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "        li a:hover:not(.active) {                                                                 " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "            background-color: #111;                                                               " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "        }                                                                                         " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "                                                                                                  " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "        .active {                                                                                 " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "            background-color: #4CAF50;                                                            " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "        }                                                                                         " >>  $VARDESTREP/$OUTPUT_HTML".html"

echo "</style>                                                                                          " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "</head>                                                                                           " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "<body>                                                                                            " >>  $VARDESTREP/$OUTPUT_HTML".html"

# TITLE AND MENU :
##################
echo "<h1 align="center">SIMPLE ERRATA REPORT</h1>                                                      " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "<ul>                                                                                              " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "  <li><a style="cursor:pointer" href="javascript:history.back\(\)">Back</a></li>                                               " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "  <li style="float:right"><a class="active" href="#about" TITLE="F.ROFFET">v1.4</a></li>          " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "</ul>                                                                                             " >>  $VARDESTREP/$OUTPUT_HTML".html"

# A LITTLE BIT OF TEXT :
########################
echo "<h2> </h2>                                                                                        " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "<h2>CVE Filter :</h2>                                                                             " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "<input type=\"text\" id=\"myInput\" onkeyup=\"myFunction()\" placeholder=\"Search for CVE...\">   " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "<h2> </h2>                                                                                        " >>  $VARDESTREP/$OUTPUT_HTML".html"

# TABLE START HERE :
####################

echo "<table id="myTable">                                                                              " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "    <thead>                                                                                       " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "    <tr class="header">                                                                           " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "        <th style=\"width:5%;\" > ID </th>       " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "        <th style=\"width:10%;\" > ERRATA_ID </th>" >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "        <th style=\"width:5%;\" > TYPE </th>     " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "        <th style=\"width:15%;\" > TITLE </th>    " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "        <th style=\"width:65%;\" > CVE  </th>     " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "    </tr>                                                                                         " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "    </thead>                                                                                      " >>  $VARDESTREP/$OUTPUT_HTML".html"       
        


while read INPUT ; do echo "<tr><td>${INPUT//|/</td><td>}</td></tr>" ; done < $RAWREPORT >> $VARDESTREP/$OUTPUT_HTML".html"

echo $VARDESTREP/$OUTPUT_HTML".html"

# TABLE FINISH HERE :
#####################
echo "</table>                                                                                          " >>  $VARDESTREP/$OUTPUT_HTML".html"

# SEARCH FITLER :
#################§

echo "<script>                                                                                          " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "function myFunction() {                                                                           " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "  var input, filter, table, tr, td, i, txtValue;                                                  " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "  input = document.getElementById(\"myInput\");                                                   " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "  filter = input.value.toUpperCase();                                                             " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "  table = document.getElementById(\"myTable\");                                                   " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "  tr = table.getElementsByTagName(\"tr\");                                                        " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "  for (i = 0; i < tr.length; i++) {                                                               " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "    td = tr[i].getElementsByTagName(\"td\")[4];                                                   " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "    if (td) {                                                                                     " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "      txtValue = td.textContent || td.innerText;                                                  " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "      if (txtValue.toUpperCase().indexOf(filter) > -1) {                                          " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "        tr[i].style.display = \"\";                                                               " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "      } else {                                                                                    " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "        tr[i].style.display = \"none\";                                                           " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "      }                                                                                           " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "    }                                                                                             " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "  }                                                                                               " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "}                                                                                                 " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "</script>                                                                                         " >>  $VARDESTREP/$OUTPUT_HTML".html"

# WEB PAGE  FINISH HERE  :
##########################
echo "</body>                                                                                           " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "</html>                                                                                           " >>  $VARDESTREP/$OUTPUT_HTML".html"
echo "                                                                                                  " >>  $VARDESTREP/$OUTPUT_HTML".html"

done

