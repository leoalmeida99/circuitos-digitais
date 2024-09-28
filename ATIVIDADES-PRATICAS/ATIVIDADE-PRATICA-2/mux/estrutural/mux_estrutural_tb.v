`timescale 1ns/1ns
`include "mux_estrutural.v"

module mux_estrutural_tb;

    reg D0, D1, D2, D3, S0, S1;
    wire Y;
    mux_estrutural uut(D0, D1, D2, D3, S0, S1, Y);

    initial begin
        $dumpfile("mux_estrutural_tb.vcd");
        $dumpvars(0, mux_estrutural_tb);

        D0 = 1; D1 = 1; D2 = 1; D3 = 1;
        S0 = 0;
        S1 = 0;#20;
        
        S0 = 0;
        S1 = 1;#20;
        
        S0 = 1;
        S1 = 0;#20;
        
        S0 = 1;
        S1 = 1;#20;

        $display("Teste completo");
    end

endmodule