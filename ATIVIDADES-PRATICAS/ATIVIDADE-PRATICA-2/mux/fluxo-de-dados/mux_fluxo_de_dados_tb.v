`timescale 1ns/1ns
`include "mux_fluxo_de_dados.v"

module mux_fluxo_de_dados_tb;

    reg D0, D1, D2, D3, S0, S1;
    wire Y;
    mux_fluxo_de_dados uut(D0, D1, D2, D3, S0, S1, Y);

    initial begin
        $dumpfile("mux_fluxo_de_dados_tb.vcd");
        $dumpvars(0, mux_fluxo_de_dados_tb);

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