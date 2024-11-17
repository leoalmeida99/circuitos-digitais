module contador_sincrono_decrescente_6bits (clk, q, RESET);
    output reg [5:0] q;
    input clk, RESET;

    always @(negedge clk) begin
        if (RESET) 
            q <= 6'b100011;
        else 
            if (q <= 6'b001010)
                q <= 6'b100011;
            else
                q <= q - 1;
    end

endmodule