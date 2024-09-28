module subtrator_completo (A, B, CIN, S, COUT);

    input A, B, CIN;
    output S, COUT;

    assign S = A ^ B ^ CIN; 
    assign COUT = ~A & B | ~A & CIN | B & CIN;

endmodule