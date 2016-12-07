<?php
echo "PHP START";

$dir    = '.';
$files1 = scandir($dir);
$files2 = scandir($dir, 1);

print_r($files1);

$dirs = array_filter(glob('*'), 'is_dir');
print_r($dirs);

echo "PHP FINISH";
?>
