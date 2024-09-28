`timescale 1ns/1ns
`include "demux.v"

module demux_tb;

    reg [1:0] S;
    
    wire [3:0] Y;
    
    demux uut(S, Y);

    initial begin
        $dumpfile("demux_tb.vcd");
        $dumpvars(0, demux_tb);

        S = 2'b00; #10;
        S = 2'b01; #10;
        S = 2'b10; #10;
        S = 2'b11; #10;

        $display("Teste completo");
    end

endmodule