`timescale 1ns/1ns
`include "alarme_residencial.v"

module alarme_residencial_tb;

    reg PORTA, JANELA, MOVIMENTO, SISTEMA;
    wire ALARME;
    alarme_residencial uut(PORTA, JANELA, MOVIMENTO, SISTEMA, ALARME);

    initial begin
        $dumpfile("alarme_residencial.vcd");
        $dumpvars(0, alarme_residencial_tb);

        PORTA = 0;
        JANELA = 0; 
        MOVIMENTO = 0;
        SISTEMA = 0;#20;

        PORTA = 0;
        JANELA = 0; 
        MOVIMENTO = 0;
        SISTEMA = 1;#20;

        PORTA = 0;
        JANELA = 0; 
        MOVIMENTO = 1;
        SISTEMA = 0;#20;

        PORTA = 0;
        JANELA = 0; 
        MOVIMENTO = 1;
        SISTEMA = 1;#20;

        PORTA = 0;
        JANELA = 1; 
        MOVIMENTO = 0;
        SISTEMA = 0;#20;

        PORTA = 0;
        JANELA = 1; 
        MOVIMENTO = 0;
        SISTEMA = 1;#20;

        PORTA = 0;
        JANELA = 1; 
        MOVIMENTO = 1;
        SISTEMA = 0;#20;

        PORTA = 0;
        JANELA = 1; 
        MOVIMENTO = 1;
        SISTEMA = 1;#20;

        PORTA = 1;
        JANELA = 0; 
        MOVIMENTO = 0;
        SISTEMA = 0;#20;

        PORTA = 1;
        JANELA = 0; 
        MOVIMENTO = 0;
        SISTEMA = 1;#20;

        PORTA = 1;
        JANELA = 0; 
        MOVIMENTO = 1;
        SISTEMA = 0;#20;

        PORTA = 1;
        JANELA = 0; 
        MOVIMENTO = 1;
        SISTEMA = 1;#20;

        PORTA = 1;
        JANELA = 1; 
        MOVIMENTO = 0;
        SISTEMA = 0;#20;

        PORTA = 1;
        JANELA = 1; 
        MOVIMENTO = 0;
        SISTEMA = 1;#20;

        PORTA = 1;
        JANELA = 1; 
        MOVIMENTO = 1;
        SISTEMA = 0;#20;

        PORTA = 1;
        JANELA = 1; 
        MOVIMENTO = 1;
        SISTEMA = 1;#20;

        $display("Teste completo");
    end

endmodule