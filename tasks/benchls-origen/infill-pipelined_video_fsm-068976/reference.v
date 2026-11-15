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
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= IDLE;
            init_cnt <= 0;
            wx <= 0;
            wy <= 0;
            vtdata <= 0;
            vtvalid <= 0;
            vtlast <= 0;
            cnt_en <= 0;
            cnt_rstn <= 1;
        end else begin
            case (state)
                IDLE: begin
                    if (start) begin
                        state <= INIT;
                        init_cnt <= 0;
                    end
                end
                INIT: begin
                    if (init_cnt == pipeLatency - 1) begin
                        state <= WORK;
                        cnt_en <= 1;
                        cnt_rstn <= 0;
                    end else begin
                        init_cnt <= init_cnt + 1;
                    end
                end
                WORK: begin
                    if (vtready) begin
                        vtvalid <= 1;
                        vtdata <= {wy[3:0], wx[3:0]};
                        state <= WORK_1;
                    end
                end
                WORK_1: state <= WORK_2;
                WORK_2: state <= WORK_3;
                WORK_3: begin
                    if (wx == 15 && wy == 9) begin
                        vtlast <= 1;
                        state <= IDLE;
                        cnt_en <= 0;
                        cnt_rstn <= 1;
                    end else begin
                        state <= WORK;
                    end
                    vtvalid <= 0;
                end
            endcase
        end
    end

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