`timescale 1ns/1ns
`include "ff_jk.v"

module ff_jk_tb;

    reg clk, j, k, preset, clear;
    wire q, qNot;
    ff_jk uut(clk, j, k, preset, clear, q, qNot);

    initial begin
        $dumpfile("ff_jk.vcd");
        $dumpvars(0, ff_jk_tb);

        {j, k, preset, clear} = 4'b0000; #20;
        {j, k, preset, clear} = 4'b0001; #20;
        {j, k, preset, clear} = 4'b0010; #20;
        {j, k, preset, clear} = 4'b0011; #20;
        {j, k, preset, clear} = 4'b0100; #20;
        {j, k, preset, clear} = 4'b0101; #20;
        {j, k, preset, clear} = 4'b0110; #20;
        {j, k, preset, clear} = 4'b0111; #20;
        {j, k, preset, clear} = 4'b1000; #20;
        {j, k, preset, clear} = 4'b1001; #20;
        {j, k, preset, clear} = 4'b1010; #20;
        {j, k, preset, clear} = 4'b1011; #20;
        {j, k, preset, clear} = 4'b1100; #20;
        {j, k, preset, clear} = 4'b1101; #20;
        {j, k, preset, clear} = 4'b1110; #20;
        {j, k, preset, clear} = 4'b1111; #20;

        $display("Teste completo");
        $finish;
    end

    initial begin
        clk = 0;
        forever #10 clk = ~clk ;
    end

endmodule