`include "ff_t.v"

module contador_sincrono_crescente_4bits (clk, T, clear, q);
    output [3:0] q;
    input clk, T, clear;

    wire variavel1, variavel2;

    ff_t ff_t_1 (clk, T, clear, q[0]);
    ff_t ff_t_2 (clk, q[0], clear, q[1]);
    
    assign variavel1 = q[0] & q[1];
    ff_t ff_t_3 (clk, variavel1, clear, q[2]);
    
    assign variavel2 = variavel1 & q[2];
    ff_t ff_t_4 (clk, variavel2, clear, q[3]);

endmodule
