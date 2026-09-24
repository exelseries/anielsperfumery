<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Storage Asset Fallback Route for cPanel Hosting (Bypasses Symlinks)
|--------------------------------------------------------------------------
*/
Route::get('/storage/{path}', function ($path) {
    $filePath = storage_path('app/public/' . $path);

    if (file_exists($filePath)) {
        return response()->file($filePath);
    }

    // Case-insensitive fallback for Linux case sensitivity (.JPG vs .jpg)
    $dir = dirname($filePath);
    $baseName = basename($filePath);

    if (is_dir($dir)) {
        $files = glob($dir . '/*', GLOB_NOSORT);
        if ($files) {
            foreach ($files as $file) {
                if (strcasecmp(basename($file), $baseName) === 0) {
                    return response()->file($file);
                }
            }
        }
    }

    abort(404);
})->where('path', '.*');
