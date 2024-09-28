`timescale 1ns/1ns
`include "somador8bits.v"

module somador8bits_tb;

    reg [7:0] A, B;
    
    wire [8:0] S;
    
    somador8bits uut(A, B, S);

    initial begin
        $dumpfile("somador8bits_tb.vcd");
        $dumpvars(0, somador8bits_tb);

        // Teste 1: A = 0, B = 0
        A = 8'b00000000;
        B = 8'b00000000; #5;
        
        // Teste 2: A = 1, B = 1
        A = 8'b00000001;
        B = 8'b00000001; #5;
        
        // Teste 3: A = 85, B = 42 (valores intermediários)
        A = 8'b01010101;
        B = 8'b00101010; #5;

        // Teste 4: A = 255, B = 1 (overflow)
        A = 8'b11111111;
        B = 8'b00000001; #5;

        // Teste 5: A = 255, B = 255 (overflow)
        A = 8'b11111111;
        B = 8'b11111111; #5;

        $display("Teste completo");
    end

endmodule