<?php
echo "PHP START\n";

$dir    = '.\vendor';
$files1 = scandir($dir);

print_r($files1);

$dirs = array_filter(glob('*'));
print_r($dirs);

echo "PHP FINISH\n";
?>
