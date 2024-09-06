`timescale 1ns/1ns
`include "fila_prioridade.v"

module fila_prioridade_tb;

    reg TV, PC, Alexa;
    wire s1, s2, s3;
    fila_prioridade uut(TV, PC, Alexa, s1, s2, s3);

    initial begin
        $dumpfile("fila_prioridade.vcd");
        $dumpvars(0, fila_prioridade_tb);

        TV = 0;
        PC = 0; 
        Alexa = 0;#20;

        TV = 0;
        PC = 0; 
        Alexa = 1;#20;

        TV = 0;
        PC = 1; 
        Alexa = 0;#20;

        TV = 0;
        PC = 1; 
        Alexa = 1;#20;

        TV = 1;
        PC = 0; 
        Alexa = 0;#20;

        TV = 1;
        PC = 0; 
        Alexa = 1;#20;

        TV = 1;
        PC = 1; 
        Alexa = 0;#20;

        TV = 1;
        PC = 1; 
        Alexa = 1;#20;

        $display("Teste completo");
    end

endmodule