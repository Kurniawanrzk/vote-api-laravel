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
        Schema::create('tb_polls', function (Blueprint $table) {
            $table->id();
            $table->string("title", 191);
            $table->text("description");
            $table->dateTime("deadline");
            $table->foreignId("created_by")
            ->references("id")
            ->on("tb_users")
            ->onDelete("cascade");
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('tb_polls');
    }
};
