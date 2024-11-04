module ff_jk (clk, T, clear, q);

    input wire clk, T, clear;
    output reg q;

    always @(negedge clk) begin
        if (clear)
            q = 0;
        else 
            if (T)
                q = q;
    end

endmodule