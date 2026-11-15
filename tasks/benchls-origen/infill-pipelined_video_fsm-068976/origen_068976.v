module origen_068976 (
    input wire clk,
    input wire rst,
    input wire start,
    input wire vtready,
    output reg [7:0] vtdata,
    output reg vtvalid,
    output reg vtlast
);

    // Parameters
    localparam IDLE = 4'd0, INIT = 4'd1, WORK = 4'd2, WORK_1 = 4'd3, WORK_2 = 4'd4, WORK_3 = 4'd5;
    localparam pipeLatency = 5;

    // Internal registers
    reg [9:0] wx, wy;
    reg [3:0] state;
    reg [3:0] init_cnt;
    reg cnt_en, cnt_rstn;

    // FSM and counter logic
    [MASKED]

    // Coordinate update logic
    always @(posedge clk) begin
        if (cnt_rstn) begin
            wx <= 0;
            wy <= 0;
        end else if (cnt_en && vtready) begin
            if (wx == 15) begin
                wx <= 0;
                if (wy == 9) begin
                    wy <= 0;
                end else begin
                    wy <= wy + 1;
                end
            end else begin
                wx <= wx + 1;
            end
        end
    end

endmodule