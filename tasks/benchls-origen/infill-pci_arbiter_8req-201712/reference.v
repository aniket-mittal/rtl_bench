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

always @(posedge clk) begin
    if (FRAME == 1'b0 && IRDY == 1'b1 && TRDY == 1'b1) begin
        RDY_GNT <= 1'b1;
    end else begin
        RDY_GNT <= 1'b0;
    end

    if (FIFOcounter < 8 && |REQ) begin
        for (int i = 0; i < 8; i = i + 1) begin
            if (REQ[i]) begin
                FIFO[FIFOcounter] = i;
                FIFOcounter = FIFOcounter + 1;
            end
        end
    end

    if (RDY_GNT && NEED_GNT) begin
        GNT = 8'b00000000;
        GNT[FIFO[0]] = 1'b1;
        for (int i = 0; i < 7; i = i + 1) begin
            FIFO[i] = FIFO[i + 1];
        end
        FIFO[7] = FIFO[0];
        FIFOcounter = FIFOcounter - 1;
        NEED_GNT = 1'b0;
    end else begin
        NEED_GNT = 1'b1;
    end
end

endmodule