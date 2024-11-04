`include "ff_d.v"

module registrador_8bits (clk, d, preset, clear, q, qneg);

    input [7:0] d;
    output [7:0] q, qneg;

    input clk, preset, clear;

    ff_d ff1 (clk, d[0], preset, clear, q[0], qneg[0]);
    ff_d ff2 (clk, d[1], preset, clear, q[1], qneg[1]);
    ff_d ff3 (clk, d[2], preset, clear, q[2], qneg[2]);
    ff_d ff4 (clk, d[3], preset, clear, q[3], qneg[3]);
    ff_d ff5 (clk, d[4], preset, clear, q[4], qneg[4]);
    ff_d ff6 (clk, d[5], preset, clear, q[5], qneg[5]);
    ff_d ff7 (clk, d[6], preset, clear, q[6], qneg[6]);
    ff_d ff8 (clk, d[7], preset, clear, q[7], qneg[7]);

endmodule