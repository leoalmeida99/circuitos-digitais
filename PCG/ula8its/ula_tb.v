`timescale 1ns/1ns
`include "ula.v"

module ula_tb;

    reg [7:0] entradaA8Bits, entradaB8Bits;
    reg [3:0] opCode;
    reg clock;

    wire [8:0] saida9Bits;
    
    ula uut(entradaA8Bits, entradaB8Bits, opCode, clock, saida9Bits);

    initial begin
        $dumpfile("ula_tb.vcd");
        $dumpvars(0, ula_tb);

        // TESTE SOMA, 9 + 20 = 29
        opCode = 4'b0; #10;
        entradaA8Bits = 8'b1001;
        entradaB8Bits = 8'b10100; #10;

        // TESTE SOMA, 255 + 255 = 510
        entradaA8Bits = 8'b11111111;
        entradaB8Bits = 8'b11111111; #10;

        // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ //

        // TESTE SUBTRACAO, 25 - 5 = 20
        opCode = 4'b1; #10;
        entradaA8Bits = 8'b11001;
        entradaB8Bits = 8'b101; #10;

        // TESTE SUBTRACAO, 255 - 255 = 0
        entradaA8Bits = 8'b11111111;
        entradaB8Bits = 8'b11111111; #10;

        // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ //

        // TESTE MAIOR QUE, 80 > 70 = TRUE
        opCode = 4'b10;
        entradaA8Bits = 8'b1010000;
        entradaB8Bits = 8'b1000110; #10;

        // TESTE MAIOR QUE, 100 > 120 = FALSE
        entradaA8Bits = 8'b1100100;
        entradaB8Bits = 8'b1111000; #10;

        // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ //

        // TESTE MENOR QUE, 150 < 220 = TRUE
        opCode = 4'b11;
        entradaA8Bits = 8'b10010110;
        entradaB8Bits = 8'b11011100; #10;

        // TESTE MENOR QUE, 189 < 110 = FALSE
        entradaA8Bits = 8'b10111101;
        entradaB8Bits = 8'b1101110; #10;

        // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ //

        // TESTE MAIOR OU IGUAL, 2 >= 2 = TRUE
        opCode = 4'b100;
        entradaA8Bits = 8'b10;
        entradaB8Bits = 8'b10; #10;

        // TESTE MAIOR OU IGUAL, 45 >= 30 = TRUE
        opCode = 4'b100;
        entradaA8Bits = 8'b101101;
        entradaB8Bits = 8'b11110; #10;

        // TESTE MAIOR OU IGUAL, 90 >= 150 = FALSE
        opCode = 4'b100;
        entradaA8Bits = 8'b1011010;
        entradaB8Bits = 8'b10010110; #10;

        // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ //

        // TESTE MENOR OU IGUAL, 30 <= 30 = TRUE
        opCode = 4'b101;
        entradaA8Bits = 8'b11110;
        entradaB8Bits = 8'b11110; #10;

        // TESTE MENOR OU IGUAL, 60 <= 120 = TRUE (primeiro número menor que o segundo)
        entradaA8Bits = 8'b111100;
        entradaB8Bits = 8'b1111000; #10;

        // TESTE MENOR OU IGUAL, 200 <= 100 = FALSE (primeiro número maior que o segundo)
        entradaA8Bits = 8'b11001000;
        entradaB8Bits = 8'b1100100; #10;

        // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ //

        // TESTE IGUAL, 50 == 50 = TRUE
        opCode = 4'b110;
        entradaA8Bits = 8'b110010;
        entradaB8Bits = 8'b110010; #10;

        // TESTE IGUAL, 100 == 24 = FALSE
        entradaA8Bits = 8'b1100100;
        entradaB8Bits = 8'b11000;  #10;

        // TESTE IGUAL, 30 == 21 = FALSE
        entradaA8Bits = 8'b11110;
        entradaB8Bits = 8'b10101; #10;

        // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ //

        // TESTE NOT, 1111 1111 COM 1111 1111 = 0000 0000
        opCode = 4'b111;
        entradaA8Bits = 8'b11111111;
        entradaB8Bits = 8'b11111111; #10;

        // TESTE NOT, 0000 0000 COM 0000 0000 = 1111 1111
        entradaA8Bits = 8'b0;
        entradaB8Bits = 8'b0; #10;

        // TESTE NOT, 0101 0101 COM 0101 0101 = 10101010
        entradaA8Bits = 8'b01010101;
        entradaB8Bits = 8'b01010101; #10;

        // TESTE NOT, 1010 1010 COM 1010 1010 = 01010101
        entradaA8Bits = 8'b10101010;
        entradaB8Bits = 8'b10101010; #10;

        // TESTE NOT, 1100 0011 COM 1100 0011 = 00111100
        entradaA8Bits = 8'b11000011;
        entradaB8Bits = 8'b11000011; #10;

        // TESTE NOT, 0011 1100 COM 0011 1100 = 11000011
        entradaA8Bits = 8'b111100;
        entradaB8Bits = 8'b111100; #10;

        // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ //

        // TESTE AND, 1111 1111 COM 1111 1111 = 11111111
        opCode = 4'b1000;
        entradaA8Bits = 8'b11111111;
        entradaB8Bits = 8'b11111111; #10;        

        // TESTE AND, 0000 0000 COM 0000 0000 = 00000000
        entradaA8Bits = 8'b0;
        entradaB8Bits = 8'b0; #10;

        // TESTE AND, 1010 1010 COM 1010 1010 = 10101010
        entradaA8Bits = 8'b10101010;
        entradaB8Bits = 8'b10101010; #10;

        // TESTE AND, 1010 1010 COM 0101 0101 = 00000000
        entradaA8Bits = 8'b10101010;
        entradaB8Bits = 8'b01010101; #10;

        // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ //

        // TESTE OR, 1111 1111 COM 1111 1111 = 11111111
        opCode = 4'b1001;
        entradaA8Bits = 8'b11111111;
        entradaB8Bits = 8'b11111111; #10;

        // TESTE OR, 1010 1010 COM 0101 0101 = 11111111
        entradaA8Bits = 8'b10101010;
        entradaB8Bits = 8'b01010101; #10;

        // TESTE OR, 0000 0000 COM 0000 0000 = 00000000
        entradaA8Bits = 8'b0;
        entradaB8Bits = 8'b0; #10;

        // TESTE OR, 1010 1010 COM 1010 1010 = 10101010
        entradaA8Bits = 8'b10101010;
        entradaB8Bits = 8'b10101010; #10;

        // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ //

        // TESTE XOR, 1111 1111 COM 1111 1111 = 00000000
        opCode = 4'b1010;
        entradaA8Bits = 8'b11111111;
        entradaB8Bits = 8'b11111111; #10;

        // TESTE XOR, 0000 0000 COM 0000 0000 = 00000000
        entradaA8Bits = 8'b0;
        entradaB8Bits = 8'b0; #10;

        // TESTE XOR, 1010 1010 COM 0101 0101 = 11111111
        entradaA8Bits = 8'b10101010;
        entradaB8Bits = 8'b01010101; #10;

        // TESTE XOR, 1010 1010 COM 1010 1010 = 00000000
        entradaA8Bits = 8'b10101010;
        entradaB8Bits = 8'b10101010; #10;

        // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ //

        // TESTE XNOR, 1111 1111 COM 1111 1111 = 11111111
        opCode = 4'b1011;
        entradaA8Bits = 8'b11111111;
        entradaB8Bits = 8'b11111111; #10;

        // TESTE XNOR, 0000 0000 COM 0000 0000 = 11111111
        entradaA8Bits = 8'b0;
        entradaB8Bits = 8'b0; #10;

        // TESTE XNOR, 1010 1010 COM 0101 0101 = 00000000
        entradaA8Bits = 8'b10101010;
        entradaB8Bits = 8'b01010101; #10;

        // TESTE XNOR, 1010 1010 COM 1010 1010 = 11111111
        entradaA8Bits = 8'b10101010;
        entradaB8Bits = 8'b10101010; #10;

        $display("Teste completo");
        $finish;
    end

    initial begin
        clock = 0;
        forever #5 clock = ~clock ;
    end

endmodule