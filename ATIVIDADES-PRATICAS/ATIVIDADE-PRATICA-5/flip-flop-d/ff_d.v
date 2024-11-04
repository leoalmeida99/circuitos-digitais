module ff_d (clk, d, preset, clear, q, qNot);

    input clk, d, preset, clear;
    output reg q, qNot; // Sempre usar reg quando o pino tiver dentro de um always

    /*
    2.) Desenvolva em Verilog um m´odulo que implemente um FF d com borda de descida e com PR
        e CLR ativos em nivel l´ogico alto (1). Anexe o c´odigo do m´odulo, o testbench e forma de onda
        no GTKWave.

        clear força para 0
        preset força para 1
    */

    always @(negedge clk) begin
        case ({preset, clear})
            2'b01: q = 0; // Preset = 0 Clear = 1 -> Clear ativo -> Q = 0
            2'b10: q = 1; // Preset = 1 Clear = 0 -> Preset ativo -> Q = 1
            2'b00: begin  // Preset = 0 Clear = 0 -> Funcionamento Normal do FFs
                if (d) q = 1;
                if (~d) q = 0;
            end
            default: q = 1'bX;// Preset = 1 Clear = 1 -> Clear ativo Preset ativo -> Q = X -> CASO INDEFINIDO
        endcase
        qNot = ~q;
    end

endmodule