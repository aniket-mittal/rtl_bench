module srl16x16e (
    input [15:0] d,
    input [3:0] a,
    output [15:0] y,
    input clk,
    input ce
);
    reg [15:0] srl [0:15];

    always @ (posedge clk) begin
        if (ce) srl[0] <= d;
        if (ce) srl[1] <= srl[0];
        if (ce) srl[2] <= srl[1];
        if (ce) srl[3] <= srl[2];
        if (ce) srl[4] <= srl[3];
        if (ce) srl[5] <= srl[4];
        if (ce) srl[6] <= srl[5];
        if (ce) srl[7] <= srl[6];
        if (ce) srl[8] <= srl[7];
        if (ce) srl[9] <= srl[8];
        if (ce) srl[10] <= srl[9];
        if (ce) srl[11] <= srl[10];
        if (ce) srl[12] <= srl[11];
        if (ce) srl[13] <= srl[12];
        if (ce) srl[14] <= srl[13];
        if (ce) srl[15] <= srl[14];
    end

    assign y = srl[a];

endmodule