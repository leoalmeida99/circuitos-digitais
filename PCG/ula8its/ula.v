
module ula (entradaA8Bits, entradaB8Bits, opCode, clock, saida9Bits);
    input [7:0] entradaA8Bits, entradaB8Bits;
    input [3:0] opCode;
    input clock;

    integer i;

    output reg [8:0] saida9Bits;

    always @(posedge clock) begin
        case (opCode)
            4'b0: // SOMA
                saida9Bits = entradaA8Bits + entradaB8Bits;
            4'b1: // SUBTRAÇÃO
                saida9Bits = entradaA8Bits - entradaB8Bits;
            4'b10: // MAIOR QUE >
                saida9Bits = entradaA8Bits > entradaB8Bits;
            4'b11: // MENOR QUE <
                saida9Bits = entradaA8Bits < entradaB8Bits;
            4'b100: // MAIOR OU IGUAL >= 
                saida9Bits = entradaA8Bits >= entradaB8Bits;
            4'b101: // MENOR OU IGUAL <=
                saida9Bits = entradaA8Bits <= entradaB8Bits;
            4'b110: // IGUAL
                saida9Bits = entradaA8Bits == entradaB8Bits;
            4'b111: // NOT ! 
                begin
                    for (i = 0; i < 8; i = i + 1) begin
                        if (entradaA8Bits[i] == entradaA8Bits[i])
                            if (entradaA8Bits[i]) 
                                saida9Bits[i] = 0;
                            else
                                saida9Bits[i] = 1;
                        else
                            saida9Bits[i] = ~entradaA8Bits[i];
                    end
                    saida9Bits[8] = 0;
                end
            4'b1000: // AND
                begin
                    for (i = 0; i < 8; i = i + 1) begin
                        saida9Bits[i] = entradaA8Bits[i] & entradaB8Bits[i];
                    end
                    saida9Bits[8] = 0;
                end
            4'b1001: // OR
                begin
                    for (i = 0; i < 8; i = i + 1) begin
                        saida9Bits[i] = entradaA8Bits[i] | entradaB8Bits[i];
                    end
                    saida9Bits[8] = 0;
                end
            4'b1010: // XOR
                begin
                    for (i = 0; i < 8; i = i + 1) begin
                        saida9Bits[i] = entradaA8Bits[i] ^ entradaB8Bits[i];
                    end
                    saida9Bits[8] = 0;
                end
            4'b1011: // XNOR
                begin
                    for (i = 0; i < 8; i = i + 1) begin
                        saida9Bits[i] = entradaA8Bits[i] ~^ entradaB8Bits[i];
                    end
                    saida9Bits[8] = 0;
                end

            default:  saida9Bits = 9'bx;
        endcase
    end

endmodule