`timescale 10ns/1ns
`include "morse.v"

module morse_tb;


    reg in, reset, clk;
    wire [7:0] out;
    morse uut(in, out, reset, clk);

    initial begin
        $dumpfile("morse.vcd");
        $dumpvars(0, morse_tb);

        in = 1;
        // TESTE DE TODAS AS LETRAS EM SEQUENCIA

        // LETRA A
        reset = 1; #10
        reset = 0; #10
        in = 1; #10     // .
        in = 0; #10 #10 // -

        // LETRA B
        reset = 1; #10 #10
        reset = 0; #10 #10
        in = 0; #10// -
        in = 1; #10 #10 // .
        #10 #10 // .
        #10 #10 // .

        // LETRA C
        in = 0; // -
        reset = 1; #10 #10
        reset = 0; #10 #10
        in = 1; #10 // .
        in = 0; #10 #10// -
        in = 1; #10 #10 // .

        #10
        $finish;
    end

    initial begin
        clk = 1;
        forever #10 clk = ~clk;
    end
    

endmodule