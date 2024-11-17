module ff_t (clk, T, clear, q);

    input wire clk, T, clear;
    output reg q;

    always @(posedge clk) begin
        if (clear)
            q = 0;
        else 
            if (T)
                q = ~q;
            else
                q = q;
    end

endmodule