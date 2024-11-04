`include "ff_jk.v"

module contador_assincrono_crescente_4bits (clk, T, clear, q0, q1, q2, q3);

    output q0, q1, q2, q3;
    input clk, T, clear;

    ff_jk ff_jk_1 (clk, T, clear, q0);
    ff_jk ff_jk_2 (q0, T, clear, q1);
    ff_jk ff_jk_3 (q1, T, clear, q2);
    ff_jk ff_jk_4 (q2, T, clear, q3);

endmodule