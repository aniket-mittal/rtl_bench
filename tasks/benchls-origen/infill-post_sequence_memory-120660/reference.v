module origen_120660 (
    input wire Clock,
    input wire [7:0] Current,
    output reg [31:0][7:0] PostSequence,
    output reg [4:0] LastPostEntry,
    output reg Overflow
);

    reg [7:0] LastValue;

    always @(posedge Clock) begin
        if (Current != LastValue && !Overflow) begin
            PostSequence[LastPostEntry] <= Current;
            LastValue <= Current;
            
            if (LastPostEntry == 5'd31) begin
                Overflow <= 1'b1;
            end else begin
                LastPostEntry <= LastPostEntry + 1'b1;
            end
        end
    end

    initial begin
        LastPostEntry = 5'd0;
        Overflow = 1'b0;
        LastValue = 8'd0;
    end

endmodule

module Dummy (
    input wire Clock,
    input wire [7:0] Current,
    output reg [7:0] DummyOut
);

    wire [31:0][7:0] TempMem;
    wire [4:0] TempMemLen;
    wire TempOverflow;
    reg [4:0] DummyFirstIndex;

    PostSequenceMemory psm (
        .Clock(Clock),
        .Current(Current),
        .PostSequence(TempMem),
        .LastPostEntry(TempMemLen),
        .Overflow(TempOverflow)
    );

    always @(posedge Clock) begin
        DummyOut <= TempMem[DummyFirstIndex];
        DummyFirstIndex <= (DummyFirstIndex == 5'd31) ? 5'd0 : DummyFirstIndex + 1'b1;
    end

    initial begin
        DummyFirstIndex = 5'd0;
    end

endmodule