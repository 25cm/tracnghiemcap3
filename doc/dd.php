<?Php
@$country_id=$_GET['country_id'];

require "config.php";
$str='';
$sql="select * from province where country_id='$country_id'";
foreach ($dbo->query($sql) as $row) {
    $str=$str . "$row[province_name]".",";
}

$str=substr($str,0,(strLen($str)-1)); // Removing the last char , from the string


echo json_encode($str); 

?>