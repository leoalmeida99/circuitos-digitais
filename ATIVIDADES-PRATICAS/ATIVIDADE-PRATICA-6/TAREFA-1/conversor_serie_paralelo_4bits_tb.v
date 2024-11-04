`timescale 1ns/1ns
`include "conversor_serie_paralelo_4bits.v"

module conversor_serie_paralelo_4bits_tb;

    reg clk, d, preset, clear;
    wire [3:0]q;

    conversor_serie_paralelo_4bits uut(clk, d, preset, clear, q);

    initial begin
        $dumpfile("conversor_serie_paralelo_4bits.vcd");
        $dumpvars(0, conversor_serie_paralelo_4bits_tb);

        {preset,clear,d} = 3'b101; #20;
        {preset,clear,d} = 3'b111; #20;
        {preset,clear,d} = 3'b110; #20;
        {preset,clear,d} = 3'b111; #20;
        {preset,clear,d} = 3'b110; #20;

        $display("Teste completo");
        $finish;
    end

    initial begin
        clk = 0;
        forever #10 clk = ~clk ;
    end

endmodule