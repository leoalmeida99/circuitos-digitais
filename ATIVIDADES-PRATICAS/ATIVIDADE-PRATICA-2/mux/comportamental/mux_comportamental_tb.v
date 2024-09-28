`timescale 1ns/1ns
`include "mux_comportamental.v"

module mux_comportamental_tb;

    reg D0, D1, D2, D3, S0, S1;
    wire Y;
    mux_comportamental uut(D0, D1, D2, D3, S0, S1, Y);

    initial begin
        $dumpfile("mux_comportamental_tb.vcd");
        $dumpvars(0, mux_comportamental_tb);

        D0 = 1; 
        S0 = 0;
        S1 = 0;#20;

        D1 = 1;
        S0 = 0;
        S1 = 1;#20;

        D2 = 1;
        S0 = 1;
        S1 = 0;#20;

        D3 = 1;
        S0 = 1;
        S1 = 1;#20;

        $display("Teste completo");
    end

endmodule