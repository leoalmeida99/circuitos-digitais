`timescale 1ns/1ns
`include "codificador.v"

module codificador_tb;

    reg [3:0] BCD;
    
    wire [6:0] DISPLAY;
    
    codificador uut(BCD,DISPLAY);

    initial begin
        $dumpfile("codificador_tb.vcd");
        $dumpvars(0, codificador_tb);

        BCD = 4'b0000; #10;
        BCD = 4'b0001; #10;
        BCD = 4'b0010; #10;
        BCD = 4'b0011; #10;
        BCD = 4'b0100; #10;
        BCD = 4'b0101; #10;
        BCD = 4'b0110; #10;
        BCD = 4'b0111; #10;
        BCD = 4'b1000; #10;
        BCD = 4'b1001; #10;
        BCD = 4'b1010; #10;
        BCD = 4'b1011; #10;
        BCD = 4'b1100; #10;
        BCD = 4'b1101; #10;
        BCD = 4'b1110; #10;
        BCD = 4'b1111; #10;

        $display("Teste completo");
    end

endmodule