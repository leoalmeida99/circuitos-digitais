`include "somador8bits.v"
`include "subtrator8bits.v"
`include "comparador8bits.v"

module ula (entradaA8Bits, entradaB8Bits, opCode, clock, saida9Bits);
    input [7:0] entradaA8Bits, entradaB8Bits;
    input [3:0] opCode;
    input clock;

    output reg [8:0] saida9Bits;

    wire [8:0] resultado_soma;
    wire [8:0] resultado_subtracao;
    wire [8:0] resultado_comparacao;

    somador8bits somador_inst(
        .A(entradaA8Bits),
        .B(entradaB8Bits),
        .S(resultado_soma)
    );

    subtrator8bits subtrator_inst(
        .A(entradaA8Bits),
        .B(entradaB8Bits),
        .S(resultado_subtracao)
    );

    comparador8bits comparador8bits_inst(
        .entradaA(entradaA8Bits),
        .entradaB(entradaB8Bits),
        .codigoComparacao(opCode),
        .saida9Bits(resultado_comparacao)
    );

    always @(posedge clock) begin
        case (opCode)
            4'b0: // SOMA
                saida9Bits = resultado_soma;
            4'b1: // SUBTRAÇÃO
                saida9Bits = resultado_subtracao;
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
                saida9Bits = resultado_comparacao;
            4'b1000: // AND
                saida9Bits = resultado_comparacao;
            4'b1001: // OR
                saida9Bits = resultado_comparacao;
            4'b1010: // XOR
                saida9Bits = resultado_comparacao;
            4'b1011: // XNOR
                saida9Bits = resultado_comparacao;
            default:  saida9Bits = 9'bx;
        endcase
    end

endmodule