module mux_fluxo_de_dados(D0, D1, D2, D3, S0, S1, Y);

    input D0, D1, D2, D3, S0, S1;
    output Y;
    
    assign Y = D0 & ~S0 & ~S1 | D1 & ~S0 & S1 | D2 & S0 & ~S1 | D3 & S0 & S1;

endmodule