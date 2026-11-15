module origen_201712 (
    input clk,
    input [7:0] REQ,
    output reg [7:0] GNT,
    input FRAME,
    input IRDY,
    input TRDY,
    output reg NEED_GNT,
    output reg RDY_GNT
);

reg [2:0] FIFO [7:0];
reg [2:0] FIFOcounter;

initial begin
    GNT = 8'b11111111;
    FIFOcounter = 8;
    NEED_GNT = 1'b0;
    RDY_GNT = 1'b1;
    for (int i = 0; i < 8; i = i + 1) begin
        FIFO[i] = i;
    end
end

[MASKED]

endmodule