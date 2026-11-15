module origen_023271(
    input start, empty, endCRC, block, hasNext, bytes, clk, resetAll,
    input [7:0] response,
    output reg count, byteEnable, reset, loadCmd, shiftCmd, nextAddr, dataSelect, tokenSelect, oe, startCountData
);

    reg [3:0] ps, ns;

    // State definitions
    localparam IDLE = 4'd0, RESET = 4'd1, CHECK = 4'd2, LOAD_CMD = 4'd3, SHIFT_CMD = 4'd4,
               TOKEN = 4'd5, DATA_1 = 4'd6, DATA_2 = 4'd7, DATA_3 = 4'd8, NEXT_ADDR = 4'd9, WAIT_RESP = 4'd10;

    // State register
    always @(posedge clk or posedge resetAll) begin
        if (resetAll)
            ps <= IDLE;
        else
            ps <= ns;
    end

    // Next state logic
    [MASKED]

    // Output logic
    always @(*) begin
        reset = (ps == RESET);
        loadCmd = (ps == LOAD_CMD);
        shiftCmd = (ps == SHIFT_CMD);
        tokenSelect = (ps == TOKEN);
        startCountData = (ps == TOKEN);
        count = (ps == DATA_1) || (ps == DATA_2) || (ps == DATA_3);
        dataSelect = (ps == DATA_1) || (ps == DATA_2) || (ps == DATA_3);
        byteEnable = (ps == DATA_1) || (ps == DATA_2);
        nextAddr = (ps == NEXT_ADDR);
        oe = (ps >= LOAD_CMD) && (ps <= DATA_3);
    end

endmodule