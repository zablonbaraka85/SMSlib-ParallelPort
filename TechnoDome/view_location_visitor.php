<?php
// required variables
require("config.php");
?> 



<html>
<head>

<script language = javascript>



function select_record(buttonname)
{
 //eval("document.view_record."+buttonname+".value")= newvalue
	document.view_record.button_check.value = Number(buttonname.substr(1,3));
	document.view_record.filling.value = "viewcheck";
	document.view_record.gotocheck.value = Number(document.view_record.button_check.value)+1;
}


function set_main()
{       
	document.view_record.filling.value = "viewcheck";
	//document.view_record.gotocheck.value = document.view_record.button_check.value;
<?php	
	print("opener.location=\"http://riverine.org/Location_Entry_add_insert.php?filling=gotobutton&gotocheck=$gotocheck\"; ");
 ?>
	window.close();
	//window.open ("riverine.htm","account_add_insert_experiment.php","_main");
//);
}






</script>

</head>

<body> <form name = "view_record" action = "view_location.php" method = "post">


<?php

// connects to database

$conn=pg_connect("host=$host  dbname=$database  user=$user"  );

$query_string = "select * from locationfrom order by from_id";

 $result = pg_exec($query_string);

 $column_count = pg_numfields($result);
 
print ("<div align=\"center\"><TABLE  border=1>\n");


if (TRUE)

{
  print ("<TR><th BGCOLOR=\"#aabf5c\">RECORD</th>");
  for ($column_num =0; $column_num<=$column_count; $column_num++)
    { 
      $field_name= array('ID','Location Name');

print ("<TH BGCOLOR=\"#aabf5c\"> $field_name[$column_num]</TH>");
     }
  print ("</TR>");
}

//Print Body of the Table




$numrows=pg_numrows($result);


for($count=0,$button=1;$count<$numrows,$button<=$numrows;$button++,$count++) {

	$row = pg_fetch_row($result,$count);

	$color = ($button_check==$count ? "5fF9F0" : "E9E9E9");

 echo ("<TR align = left valign = top BGCOLOR=\"#$color\"><TD>

	<input type=\"submit\" value=\"$button\" name=\"b$count\" style=\" width: 40; height: 15\" onclick = \"select_record(document.view_record.b$count.name)\" >
	</TD>");


for ($column_num =0; $column_num<=$column_count;$column_num++)
	{
		print("<TD> $row[$column_num]</TD>\n");
	}
	print ("</TR>\n");

       }
	print ("</Table></div>");


	
	
?>

<INPUT TYPE="hidden" name="button_check" value="<?php echo $button_check  ?>">
<INPUT TYPE="hidden" name="filling" value="eggplant">
<INPUT TYPE="hidden" name="gotocheck" value="<?php echo $gotocheck  ?>" >
<table align="center">
<tr>
<td width="16%" height="32" valign="baseline" align="center"> 
<input type="button" value="Exit" name="exitbutton" style=" width: 84; height: 25" onclick= "set_main()"> 
</td>
    </tr>
  </table>
</form>

</body>
</html>
