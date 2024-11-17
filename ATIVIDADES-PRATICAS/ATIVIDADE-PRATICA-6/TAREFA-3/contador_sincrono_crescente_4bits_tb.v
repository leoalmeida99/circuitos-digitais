`timescale 1ns/1ns
`include "contador_sincrono_crescente_4bits.v"

module contador_sincrono_crescente_4bits_tb;

    reg clk, T, clear;
    wire [3:0] q;

    contador_sincrono_crescente_4bits uut(clk, T, clear, q);

    initial begin
        $dumpfile("contador_sincrono_crescente_4bits.vcd");
        $dumpvars(0, contador_sincrono_crescente_4bits_tb);


        {clear,T} = 2'b11; #20; 

        {clear,T} = 2'b01; #20; 
        {clear,T} = 2'b01; #20; 
        {clear,T} = 2'b01; #20;         
        {clear,T} = 2'b01; #20; 
        
        {clear,T} = 2'b01; #20; 
        {clear,T} = 2'b01; #20; 
        {clear,T} = 2'b01; #20;         
        {clear,T} = 2'b01; #20; 
        
        {clear,T} = 2'b01; #20; 
        {clear,T} = 2'b01; #20; 
        {clear,T} = 2'b01; #20;         
        {clear,T} = 2'b01; #20; 
        
        {clear,T} = 2'b01; #20; 
        {clear,T} = 2'b01; #20; 
        {clear,T} = 2'b01; #20;         
        {clear,T} = 2'b01; #20; 
        
        $display("Teste completo");
        $finish;
    end

    initial begin
        clk = 0;
        forever #10 clk = ~clk ;
    end

endmodule