`timescale 1ns/1ns
`include "somador_completo.v"

module somador_completo_tb;

    reg A, B, CIN;
    wire S, COUT;

    somador_completo uut(A, B, CIN, S, COUT);

    initial begin
        $dumpfile("somador_completo.vcd");
        $dumpvars(0, somador_completo_tb);

        A = 0;
        B = 0;
        CIN = 0;#20;

        A = 0;
        B = 0;
        CIN = 1;#20;

        A = 0;
        B = 1;
        CIN = 0;#20;

        A = 0;
        B = 1;
        CIN = 1;#20;
        
        A = 1;
        B = 0;
        CIN = 0;#20;

        A = 1;
        B = 0;
        CIN = 1;#20;

        A = 1;
        B = 1;
        CIN = 0;#20;

        A = 1;
        B = 1;
        CIN = 1;#20;

        $display("Teste completo");
    end

endmodule