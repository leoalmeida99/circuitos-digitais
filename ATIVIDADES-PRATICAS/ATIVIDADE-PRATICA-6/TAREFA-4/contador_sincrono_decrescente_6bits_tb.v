`timescale 1ns/1ns
`include "contador_sincrono_decrescente_6bits.v"

module contador_sincrono_decrescente_6bits_tb;

    reg clk, RESET;
    wire [5:0] q;

    contador_sincrono_decrescente_6bits uut(clk, q, RESET);

    initial begin
        $dumpfile("contador_sincrono_decrescente_6bits.vcd");
        $dumpvars(0, contador_sincrono_decrescente_6bits_tb);

        RESET = 1'b1; #20;
        RESET = 1'b0; #20;

        RESET = 1'b0; #20;
        RESET = 1'b0; #20;
        RESET = 1'b0; #20;
        RESET = 1'b0; #20;
        RESET = 1'b0; #20;

        RESET = 1'b0; #20;
        RESET = 1'b0; #20;
        RESET = 1'b0; #20;
        RESET = 1'b0; #20;
        RESET = 1'b0; #20;

        RESET = 1'b0; #20;
        RESET = 1'b0; #20;
        RESET = 1'b0; #20;
        RESET = 1'b0; #20;
        RESET = 1'b0; #20;

        RESET = 1'b0; #20;
        RESET = 1'b0; #20;
        RESET = 1'b0; #20;
        RESET = 1'b0; #20;
        RESET = 1'b0; #20;

        RESET = 1'b0; #20;
        RESET = 1'b0; #20;
        RESET = 1'b0; #20;        
        RESET = 1'b0; #20;

        
        $display("Teste completo");
        $finish;
    end

    initial begin
        clk = 0;
        forever #10 clk = ~clk ;
    end

endmodule