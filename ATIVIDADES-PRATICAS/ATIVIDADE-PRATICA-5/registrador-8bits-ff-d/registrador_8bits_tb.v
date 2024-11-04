`timescale 1ns/1ns
`include "registrador_8bits.v"

module registrador_8bits_tb;

    reg [7:0] d;
    wire [7:0] q, qneg;

    reg clk, preset, clear;

    registrador_8bits uut(clk, d, preset, clear, q, qneg);

    initial begin
        $dumpfile("registrador_8bits.vcd");
        $dumpvars(0, registrador_8bits_tb);

        // Teste: Clear e Preset desativados
        preset = 0; clear = 0; d = 8'b00000000; #20;
        d = 8'b11111111; #20;
        d = 8'b10101010; #20;

        // Teste: Preset ativo, Clear inativo
        preset = 1; clear = 0; d = 8'b00000000; #20;
        d = 8'b11111111; #20;
        d = 8'b01010101; #20;

        // Teste: Clear ativo, Preset inativo
        preset = 0; clear = 1; d = 8'b00000000; #20;
        d = 8'b11111111; #20;
        d = 8'b00110011; #20;

        // Teste: Clear e Preset ambos ativos
        preset = 1; clear = 1; d = 8'b00000000; #20;
        d = 8'b11111111; #20;

        $display("Teste completo");
        $finish;
    end

    initial begin
        clk = 0;
        forever #10 clk = ~clk ;
    end

endmodule
