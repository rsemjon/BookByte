<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Faker\Factory as Faker;


class ProductSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $faker = Faker::create();

        foreach (range(1, 100) as $index) { // Generate 10 random products
            DB::table('products')->insert([
                'title' => $faker->sentence(3),  // Generates a random title
                'author' => $faker->randomElement(['Philip K. Dick', 'George Orwell', 'Jozef Karika', 'Dominik Dan']),  // Generates a random author name
                'description' => $faker->text(200),  // Generates a random description
                'genre' => $faker->randomElement(['Science Fiction', 'Classic', 'Horror', 'Detective']),  // Random genre
                'language' => $faker->randomElement(['slovak', 'russian', 'english', 'german']), // Random language
                'price' => $faker->randomFloat(2, 5, 100), // Random price between 5 and 100
                'in_stock' => $faker->numberBetween(0, 50), // Random stock quantity
                'total_purchased' => $faker->numberBetween(0, 500), // Random purchase count
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }
    }  
}
