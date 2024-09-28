`timescale 1ns/1ns
`include "semafaro.v"

module semafaro_tb;

    reg A;
    wire VerdeA, VerdeAB;
    semafaro uut(A, VerdeA, VerdeB);

    initial begin
        $dumpfile("semaforo_tb.vcd");
        $dumpvars(0, semaforo_tb);

        A = 0;#20;
        A = 1;#20;

        $display("Teste completo");
    end

endmodule