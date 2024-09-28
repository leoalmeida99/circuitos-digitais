`timescale 1ns/1ns
`include "subtrator8bits.v"

module subtrator8bits_tb;

    reg [7:0] A, B;
    
    wire [8:0] S;
    
    subtrator8bits uut(A, B, S);

    initial begin
        $dumpfile("subtrator8bits_tb.vcd");
        $dumpvars(0, subtrator8bits_tb);

        // Teste 1: A = 0, B = 0
        A = 8'b00000000;
        B = 8'b00000000; #10;
        
        // Teste 2: A = 1, B = 1 (subtração básica)
        A = 8'b00000001;
        B = 8'b00000001; #10;
        
        // Teste 3: A = 85, B = 42 (valores intermediários)
        A = 8'b01010101;
        B = 8'b00101010; #10;

        // Teste 4: A = 0, B = 1 (underflow, resultado negativo)
        A = 8'b00000000;
        B = 8'b00000001; #10;

        // Teste 5: A = 255, B = 128 (verifica o limite superior)
        A = 8'b11111111;
        B = 8'b10000000; #10;

        // Teste 6: A = 128, B = 255 (underflow com valores altos)
        A = 8'b10000000;
        B = 8'b11111111; #10;

        $display("Teste completo");
    end

endmodule