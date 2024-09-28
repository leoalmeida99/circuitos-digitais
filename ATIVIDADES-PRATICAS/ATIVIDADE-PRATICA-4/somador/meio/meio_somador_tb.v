`timescale 1ns/1ns
`include "meio_somador.v"

module meio_somador_tb;

    reg A, B;
    wire S, C;

    meio_somador uut(A, B, S, C);

    initial begin
        $dumpfile("meio_somador.vcd");
        $dumpvars(0, meio_somador_tb);

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