`timescale 1ns/1ns
`include "subtrator_completo.v"

module subtrator_completo_tb;

    reg A, B, CIN;
    wire S, COUT;

    subtrator_completo uut(A, B, CIN, S, COUT);

    initial begin
        $dumpfile("subtrator_completo.vcd");
        $dumpvars(0, subtrator_completo_tb);

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