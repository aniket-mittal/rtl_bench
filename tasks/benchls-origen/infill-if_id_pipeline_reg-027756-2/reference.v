module origen_027756 (
    input wire clk,
    input wire stall,
    input wire [5:0] OPin,
    input wire [5:0] FUNCTin,
    input wire [4:0] A1in,
    input wire [4:0] A2in,
    input wire [4:0] RDin,
    input wire [15:0] IMMin,
    input wire [25:0] ADin,
    input wire [31:0] PCADD4in,
    input wire [31:0] PCin,
    output reg [5:0] OPout,
    output reg [5:0] FUNCTout,
    output reg [4:0] A1out,
    output reg [4:0] A2out,
    output reg [4:0] RDout,
    output reg [15:0] IMMout,
    output reg [25:0] ADout,
    output reg [31:0] PCADD4out,
    output reg [31:0] PCout
);

    always @(posedge clk) begin
        if (!stall) begin
            OPout <= OPin;
            FUNCTout <= FUNCTin;
            A1out <= A1in;
            A2out <= A2in;
            RDout <= RDin;
            IMMout <= IMMin;
            ADout <= ADin;
            PCADD4out <= PCADD4in;
            PCout <= PCin;
        end
    end

    initial begin
        OPout = 6'b0;
        FUNCTout = 6'b0;
        A1out = 5'b0;
        A2out = 5'b0;
        RDout = 5'b0;
        IMMout = 16'b0;
        ADout = 26'b0;
        PCADD4out = 32'b0;
        PCout = 32'b0;
    end

endmodule