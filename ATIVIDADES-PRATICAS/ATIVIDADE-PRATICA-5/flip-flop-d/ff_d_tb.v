`timescale 1ns/1ns
`include "ff_d.v"

module ff_d_tb;

    reg clk, d, preset, clear;
    wire q, qNot;
    ff_d uut(clk, d, preset, clear, q, qNot);

    initial begin
        $dumpfile("ff_d.vcd");
        $dumpvars(0, ff_d_tb);

        {preset,clear,d} = 3'b000; #20;
        {preset,clear,d} = 3'b001; #20;
        {preset,clear,d} = 3'b010; #20;
        {preset,clear,d} = 3'b011; #20;
        {preset,clear,d} = 3'b100; #20;
        {preset,clear,d} = 3'b101; #20;
        {preset,clear,d} = 3'b110; #20;
        {preset,clear,d} = 3'b111; #20;

        $display("Teste completo");
        $finish;
    end

    initial begin
        clk = 0;
        forever #10 clk = ~clk ;
    end

endmodule