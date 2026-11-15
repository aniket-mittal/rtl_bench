module origen_208111 #(
    parameter BASE_ADDR = 32'h4000_0000
) (
    input Clock,
    input ResetN,
    input [31:0] ReadAddress,
    input ReadEN,
    output reg [31:0] ReadData,
    input [31:0] WriteAddress,
    input [31:0] WriteData,
    input WriteEN,
    input CurrentFB
);

    reg Activate;
    reg [31:0] FB1Addr;
    reg [31:0] FB2Addr;
    reg [31:0] FBSize;
    reg FBselect;

    always @(posedge Clock) begin
        if (!ResetN) begin
            Activate <= 1'b0;
            FB1Addr <= 32'h0000_0000;
            FB2Addr <= 32'h0000_0000;
            FBSize <= 32'h0000_0000;
            FBselect <= 1'b0;
        end else begin
            if (WriteEN) begin
                case (WriteAddress - BASE_ADDR)
                    32'h0000_0000: Activate <= WriteData[0];
                    32'h0000_0004: FB1Addr <= WriteData;
                    32'h0000_0008: FB2Addr <= WriteData;
                    32'h0000_000C: FBSize <= WriteData;
                    32'h0000_0010: FBselect <= WriteData[0];
                endcase
            end

            if (ReadEN) begin
                case (ReadAddress - BASE_ADDR)
                    32'h0000_0000: ReadData <= {31'b0, Activate};
                    32'h0000_0004: ReadData <= FB1Addr;
                    32'h0000_0008: ReadData <= FB2Addr;
                    32'h0000_000C: ReadData <= FBSize;
                    32'h0000_0010: ReadData <= {31'b0, FBselect};
                    32'h0000_0014: ReadData <= {31'b0, CurrentFB};
                    default: ReadData <= 32'h0000_0000;
                endcase
            end
        end
    end

endmodule