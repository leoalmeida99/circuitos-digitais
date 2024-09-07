module alarme_residencial(PORTA, JANELA, MOVIMENTO, SISTEMA, ALARME);

    input PORTA, JANELA, MOVIMENTO, SISTEMA;
    output ALARME;

    assign ALARME = MOVIMENTO | SISTEMA & (PORTA | JANELA);

endmodule