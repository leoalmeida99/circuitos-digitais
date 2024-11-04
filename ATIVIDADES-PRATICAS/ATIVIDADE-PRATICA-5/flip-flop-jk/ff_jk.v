module ff_jk (clk, j, k, preset, clear, q, qNot);

    input wire clk, j, k, preset, clear;
    output reg q;
    output wire qNot;

    assign qNot = ~q;

    always @(posedge clk) begin
        
        if (preset && clear)
            case ({j, k})
                2'b00:
                    q = q;
                2'b01:
                    q = 0;
                2'b10:
                    q = 1;
                2'b11:
                    q = ~q;
            endcase
        else
            case ({preset, clear})
                2'b10: 
                    q = 0; 
                2'b01: 
                    q = 1; 
                2'b00: 
                    q = 1'bX; 
            endcase
    end

endmodule