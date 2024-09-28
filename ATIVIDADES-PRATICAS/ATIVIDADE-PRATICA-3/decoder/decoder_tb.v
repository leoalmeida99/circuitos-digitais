`timescale 1ns/1ns
`include "decoder.v"

module decoder_tb;

    reg [2:0] A;
    reg E;

    wire [7:0] D;

    decoder uut(A, E, D);

    initial begin
        $dumpfile("decoder_tb.vcd");
        $dumpvars(0, decoder_tb);

        E = 1'b1;
        A = 3'b000; #10;
        A = 3'b001; #10;
        A = 3'b010; #10;
        A = 3'b011; #10;
        A = 3'b100; #10;
        A = 3'b101; #10;
        A = 3'b110; #10;
        A = 3'b111; #10;
        
        E = 1'b0; #10;

        $display("Teste completo");
    end

endmodule