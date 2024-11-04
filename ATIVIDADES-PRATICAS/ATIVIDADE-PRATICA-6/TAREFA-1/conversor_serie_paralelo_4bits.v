`include "ff_d.v"

module conversor_serie_paralelo_4bits (clk, d, preset, clear, q);

    output [3:0] q;
    input clk, d, preset, clear;

    ff_d ffd1 (clk, d, preset, clear, q[3]);
    ff_d ffd2 (clk, q[3], preset, clear, q[2]);
    ff_d ffd3 (clk, q[2], preset, clear, q[1]);
    ff_d ffd4 (clk, q[1], preset, clear, q[0]);

endmodule