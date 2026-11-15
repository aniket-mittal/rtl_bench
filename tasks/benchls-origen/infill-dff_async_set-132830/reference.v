`timescale 1ns / 1ps

module origen_132830 (
    input CLK,
    input D,
    input SET_B,
    input VPWR,
    input VGND,
    input VPB,
    input VNB,
    output reg Q
);

    always @(posedge CLK or posedge SET_B) begin
        if (SET_B)
            Q <= 1'b1;
        else
            Q <= D;
    end

endmodule

