<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('products', function (Blueprint $table) {
            $table->id();
            $table->string('title');
            $table->string('author');
            $table->text('description'); // Use text for long descriptions
            $table->string('genre');
            $table->string('language');
            $table->decimal('price', 10, 2)->default(0); // Fix price storage
            $table->integer('in_stock')->default(0); // Use integer for stock count
            $table->integer('total_purchased')->default(0); // Use integer for tracking purchases
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('products');
    }
};
