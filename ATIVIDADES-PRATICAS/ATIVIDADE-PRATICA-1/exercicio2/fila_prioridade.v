module fila_prioridade(TV, PC, Alexa, s1, s2, s3);

    input TV, PC, Alexa;
    output s1, s2, s3;

    assign s1 = TV;
    assign s2 = ~TV & PC;
    assign s3 = ~TV & ~PC & Alexa;

endmodule