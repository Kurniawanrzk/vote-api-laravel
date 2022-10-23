<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tb_votes', function (Blueprint $table) {
            $table->id();
            $table->foreignId("choice_id")
            ->references("id")
            ->on("tb_choices")
            ->onDelete("cascade");
            $table->foreignId("user_id")
            ->references("id")
            ->on("tb_users")
            ->onDelete("cascade");
            $table->foreignId("poll_id")
            ->references("id")
            ->on("tb_polls")
            ->onDelete("cascade");
            $table->timestamps();
            $table->foreignId("divisions_id")
            ->references("id")
            ->on("tb_divisions")
            ->onDelete("cascade");
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('tb_votes');
    }
};
