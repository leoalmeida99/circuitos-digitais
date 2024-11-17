`include "ff_t.v"

module contador_assincrono_crescente_4bits (clk, T, clear, q);

    output [3:0] q;
    input clk, T, clear;

    ff_t ff_t_1 (clk, T, clear, q[0]);
    ff_t ff_t_2 (q[0], T, clear, q[1]);
    ff_t ff_t_3 (q[1], T, clear, q[2]);
    ff_t ff_t_4 (q[2], T, clear, q[3]);

endmodule