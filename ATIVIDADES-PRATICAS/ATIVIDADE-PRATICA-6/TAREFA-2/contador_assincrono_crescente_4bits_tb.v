`timescale 1ns/1ns
`include "contador_assincrono_crescente_4bits.v"

module contador_assincrono_crescente_4bits_tb;

    reg clk, T, clear;
    wire q0, q1, q2, q3;

    contador_assincrono_crescente_4bits uut(clk, T, clear, q0, q1, q2, q3);

    initial begin
        $dumpfile("contador_assincrono_crescente_4bits.vcd");
        $dumpvars(0, contador_assincrono_crescente_4bits_tb);

        {clear,T} = 2'b11; #20; // 1000 8 
        {clear,T} = 2'b11; #20; // 1000 8 
        {clear,T} = 2'b11; #20; // 1000 8 
        

        {clear,T} = 2'b01; #20; // 1100 12
        {clear,T} = 2'b01; #20; // 1110 14
        {clear,T} = 2'b01; #20; // 1111 15
        {clear,T} = 2'b01; #20; // 0000 0

        $display("Teste completo");
        $finish;
    end

    initial begin
        clk = 0;
        forever #10 clk = ~clk ;
    end

endmodule