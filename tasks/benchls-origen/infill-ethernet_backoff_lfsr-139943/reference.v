module origen_139943 (
    input wire MTxClk,
    input wire Reset,
    input wire StateJam,
    input wire StateJam_q,
    input wire [3:0] RetryCnt,
    input wire [15:0] NibCnt,
    input wire [9:0] ByteCnt,
    output reg RandomEq0,
    output reg RandomEqByteCnt
);

    reg [9:0] lfsr;
    reg [9:0] random_number;
    wire feedback;

    assign feedback = lfsr[9] ^ lfsr[2];

    always @(posedge MTxClk or posedge Reset) begin
        if (Reset) begin
            lfsr <= 10'b0;
            random_number <= 10'b0;
        end else begin
            lfsr <= {lfsr[8:0], feedback};

            if (StateJam && !StateJam_q) begin
                random_number <= generate_random_number(lfsr, RetryCnt);
            end
        end
    end

    function [9:0] generate_random_number;
        input [9:0] lfsr_in;
        input [3:0] retry_cnt;
        reg [9:0] result;
        integer i;
        begin
            result = lfsr_in;
            for (i = 0; i < 4; i = i + 1) begin
                if (retry_cnt <= i && retry_cnt[i]) begin
                    result[i] = 1'b0;
                end
            end
            generate_random_number = result;
        end
    endfunction

    wire [3:0] nib_and = NibCnt[15:12] & NibCnt[11:8] & NibCnt[7:4] & NibCnt[3:0];
    wire [9:0] compare_value = ByteCnt & {6'b0, nib_and};

    always @(posedge MTxClk) begin
        RandomEq0 <= (random_number == 10'b0);
        RandomEqByteCnt <= (random_number == compare_value);
    end

endmodule