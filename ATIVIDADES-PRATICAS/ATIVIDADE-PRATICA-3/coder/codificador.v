module codificador (BCD, DISPLAY);
    input [3:0] BCD;
    output reg [6:0] DISPLAY;

    always @(BCD) begin
        case (BCD)
            4'b0000: DISPLAY = 7'b1111110;
            4'b0001: DISPLAY = 7'b0110000;
            4'b0010: DISPLAY = 7'b1101101;
            4'b0011: DISPLAY = 7'b1111001;
            4'b0100: DISPLAY = 7'b0110011;
            4'b0101: DISPLAY = 7'b1011011;
            4'b0110: DISPLAY = 7'b1011111;
            4'b0111: DISPLAY = 7'b1110000;
            4'b1000: DISPLAY = 7'b1111111;
            4'b1001: DISPLAY = 7'b1110011;
            4'b1010: DISPLAY = 7'b1110111;
            4'b1011: DISPLAY = 7'b0011111;
            4'b1100: DISPLAY = 7'b1001110;
            4'b1101: DISPLAY = 7'b0111101;
            4'b1110: DISPLAY = 7'b1001111;
            4'b1111: DISPLAY = 7'b1000111;

            default:  DISPLAY = 7'b0000000;
        endcase
    end
endmodule