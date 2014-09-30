<html>
<head>

<script type="text/javascript">
function AjaxFunction()
{
var httpxml;

  // Firefox, Opera 8.0+, Safari
httpxml=new XMLHttpRequest();
  
function stateck() 
    {
    if(httpxml.readyState==4)
      {
         //alert(httpxml.responseText);
         var myarray = JSON.parse(httpxml.responseText);
         var myarray=myarray.split(",");
         for(j=document.testform.province.options.length;j>0;j--)
          {
              document.testform.province.remove(j-1);
          }


         for (i=0;i<myarray.length;i++)
         {
             var optn = document.createElement("OPTION");
             optn.text = myarray[i];
             optn.value = myarray[i];
             document.testform.province.options.add(optn);

         } 
      }
    }
   var url="dd.php";
	
   var country_id=document.getElementById('s1').value;
   url=url+"?country_id="+country_id;
   url=url+"&sid="+Math.random();
   httpxml.onreadystatechange=stateck;
   //alert(url);
   httpxml.open("GET",url,true);
   httpxml.send(null);
}
</script>

</head>
<body>
<form name="testform" method='POST'>
<table>
    <th>Countries:</th>
    <td>
        <select name=country id='s1' onchange=AjaxFunction();>
        <option value=''>Select One</option>
        <?Php
          require "config.php";// connection to database 
          $sql="select * from country ";
          foreach ($dbo->query($sql) as $row) {
               echo "<option value=$row[country_id]>$row[country_name]</option>";
          }
         ?>
         </select>
    </td>
</table>
<br><br>
<table>
     <th>Provinces:</th>
     <td><select name=province id='s2'>
     </select></td>
</table>
</form>

</body>
</html>