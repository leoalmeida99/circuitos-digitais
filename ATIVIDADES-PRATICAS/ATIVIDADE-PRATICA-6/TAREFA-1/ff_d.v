module ff_d (clk, d, preset, clear, q);

    input clk, d, preset, clear;
    output reg q; // Sempre usar reg quando o pino tiver dentro de um always

    // Utilizarei o negedge para ficar igual ao desenho do pdf da pratica 6
    // Utilizarei nível lógico baixo

    always @(negedge clk) begin
        case ({preset, clear})
            2'b10: q = 0;
            2'b01: q = 1;
            2'b11: begin
                if (d) q = 1;
                if (~d) q = 0;
            end
            default: q = 1'bX;// Preset = 1 Clear = 1 -> Clear ativo Preset ativo -> Q = X -> CASO INDEFINIDO
        endcase

    end

endmodule