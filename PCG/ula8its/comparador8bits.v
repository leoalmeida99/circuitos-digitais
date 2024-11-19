module comparador8bits (entradaA, entradaB, codigoComparacao, saida9Bits);
    input [7:0] entradaA, entradaB;
    input [3:0] codigoComparacao;

    output reg [8:0] saida9Bits;

    integer i;

    always @(*) begin
        for (i = 0; i < 8; i = i + 1) begin
            case (codigoComparacao)
                4'b111: // NOT
                    if (entradaA[i] == entradaB[i])
                        if (entradaA[i]) 
                            saida9Bits[i] = 0;
                        else
                            saida9Bits[i] = 1;
                    else
                        saida9Bits[i] = ~entradaA[i];
                4'b1000: // AND
                    saida9Bits[i] = entradaA[i] & entradaB[i];
                4'b1001: // OR
                    saida9Bits[i] = entradaA[i] | entradaB[i];
                4'b1010: //XOR
                    saida9Bits[i] = entradaA[i] ^ entradaB[i];
                4'b1011: // XNOR
                    saida9Bits[i] = entradaA[i] ~^ entradaB[i];
                default: saida9Bits[i] = 0;
            endcase
        end
        saida9Bits[8] = 0; // Bit extra configurado para 0
    end
endmodule