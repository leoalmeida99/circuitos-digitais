module somador_completo (A, B, CIN, S, COUT);

    input A, B, CIN;
    output S, COUT;

    assign S = A ^ B ^ CIN; 
    assign COUT = B & CIN | A & CIN | A & B;

endmodule