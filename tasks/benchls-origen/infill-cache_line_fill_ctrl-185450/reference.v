module origen_185450(
    input Clk,
    input Enable,
    input [31:0] Address,
    input RequestAttended,
    input [31:0] Data,
    output reg [31:0] BaseAddress,
    output reg LineReadCompleted,
    output reg [255:0] Line,
    output reg [31:0] CriticalWord,
    output reg FirstDataAcquired,
    output reg AXIStartRead
);

reg [31:0] Buff [7:0];
reg [2:0] Counter;
reg [1:0] WordAddress;

always @(posedge Clk) begin
    if (!Enable) begin
        // IDLE state
        Counter <= 0;
        WordAddress <= 0;
        LineReadCompleted <= 0;
        FirstDataAcquired <= 0;
        AXIStartRead <= 0;
    end else begin
        if (Counter == 0) begin
            // IDLE state
            BaseAddress <= Address;
            AXIStartRead <= 1;
        end else begin
            // RUNNING state
            if (RequestAttended) begin
                Buff[Counter - 1] <= Data;
                if (Counter == 3'd7) begin
                    LineReadCompleted <= 1;
                    Line <= {Buff[7], Buff[6], Buff[5], Buff[4], Buff[3], Buff[2], Buff[1], Buff[0]};
                    CriticalWord <= Buff[WordAddress];
                    FirstDataAcquired <= 1;
                    Counter <= 0;
                    AXIStartRead <= 0;
                end else begin
                    Counter <= Counter + 1;
                    WordAddress <= Counter[1:0];
                end
            end
        end
    end
end

endmodule