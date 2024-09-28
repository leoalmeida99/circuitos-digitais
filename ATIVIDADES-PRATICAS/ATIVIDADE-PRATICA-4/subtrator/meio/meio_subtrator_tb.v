`timescale 1ns/1ns
`include "meio_subtrator.v"

module meio_subtrator_tb;

    reg A, B;
    wire S, C;

    meio_subtrator uut(A, B, S, C);

    initial begin
        $dumpfile("meio_subtrator.vcd");
        $dumpvars(0, meio_subtrator_tb);

        A = 0;
        B = 0;#20;

        A = 0;
        B = 1;#20;

        A = 1;
        B = 0;#20;

        A = 1;
        B = 1;#20;

        $display("Teste completo");
    end

endmodule