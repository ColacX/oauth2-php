<?php
echo "PHP START";

echo file_get_contents( "vendor/autoload.php" );

print_r(require("vendor/autoload.php"))



for ($x = 0; $x <= 10; $x++) {
    echo "The number is: $x <br>";
} 

echo "PHP FINISH";
?>
