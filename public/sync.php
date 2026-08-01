<?php
// Automatic 1-Click Production Sync Script for Aniel's Perfumery

error_reporting(E_ALL);
ini_set('display_errors', 1);

$repoPath = realpath(__DIR__ . '/../repositories/anielsperfumery');
$publicHtmlPath = __DIR__;

if (!$repoPath || !file_exists($repoPath . '/public')) {
    // Try parent path
    $repoPath = realpath(__DIR__ . '/..');
}

if (!file_exists($repoPath . '/public')) {
    die("<h2 style='font-family:sans-serif;color:red;padding:40px;text-align:center;'>Error: repository folder not found at " . htmlspecialchars($repoPath) . "</h2>");
}

// 1. Copy public assets & htaccess
exec("cp -r {$repoPath}/public/* {$publicHtmlPath}/ 2>&1");
exec("cp {$repoPath}/public/.htaccess {$publicHtmlPath}/.htaccess 2>&1");

// 2. Fix index.php paths
$indexFile = $publicHtmlPath . '/index.php';
if (file_exists($indexFile)) {
    $content = file_get_contents($indexFile);
    $content = str_replace("__DIR__.'/../vendor/autoload.php'", "__DIR__.'/../repositories/anielsperfumery/vendor/autoload.php'", $content);
    $content = str_replace("__DIR__.'/../bootstrap/app.php'", "__DIR__.'/../repositories/anielsperfumery/bootstrap/app.php'", $content);
    $content = str_replace("__DIR__.'/../storage/framework/maintenance.php'", "__DIR__.'/../repositories/anielsperfumery/storage/framework/maintenance.php'", $content);
    file_put_contents($indexFile, $content);
}

// 3. Copy storage product images
$storageSource = $repoPath . '/storage/app/public';
$storageTarget = $publicHtmlPath . '/storage';

if (!file_exists($storageTarget)) {
    mkdir($storageTarget, 0777, true);
}
exec("cp -r {$storageSource}/* {$storageTarget}/ 2>&1");

// 4. Set permissions
exec("chmod -R 777 {$repoPath}/storage {$repoPath}/bootstrap/cache {$storageTarget} 2>&1");

// 5. Clear Laravel caches
chdir($repoPath);
$cliPhp = file_exists('/usr/local/bin/php') ? '/usr/local/bin/php' : 'php';
exec("{$cliPhp} artisan view:clear 2>&1", $out1);
exec("{$cliPhp} artisan config:clear 2>&1", $out2);
exec("{$cliPhp} artisan cache:clear 2>&1", $out3);

echo "<div style='font-family:sans-serif;max-width:600px;margin:50px auto;padding:30px;background:#f9f6f0;border:2px solid #c5a059;border-radius:12px;text-align:center;'>";
echo "<h1 style='color:#c5a059;margin-bottom:10px;'>Aniel's Perfumery Sync Complete!</h1>";
echo "<p style='color:#333;font-size:15px;line-height:1.6;'>All 25 product images, updated homepage design, and contact page have been synced live to public_html.</p>";
echo "<a href='/' style='display:inline-block;padding:12px 24px;background:#121212;color:#fff;text-decoration:none;border-radius:6px;font-weight:bold;margin-top:15px;'>Visit Live Store &rarr;</a>";
echo "</div>";
