<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class AdminAccountsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $now = now();

        // Super Admin Account
        DB::table('admins')->updateOrInsert(
            ['email' => 'superadmin@aniels.com'],
            [
                'name' => 'Super Admin',
                'password' => Hash::make('Aniels@$!'),
                'status' => 1,
                'role_id' => 1, // Super Admin Role
                'created_at' => $now,
                'updated_at' => $now,
            ]
        );

        // Developer Admin Account
        DB::table('admins')->updateOrInsert(
            ['email' => 'devadmin@aniels.com'],
            [
                'name' => 'Dev Admin',
                'password' => Hash::make('Exelseries19901926@!@!'),
                'status' => 1,
                'role_id' => 1, // Super Admin / Developer Role
                'created_at' => $now,
                'updated_at' => $now,
            ]
        );
    }
}
