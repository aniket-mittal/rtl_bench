module origen_089051 (
    input wire ui_clk,
    input wire rst,
    input wire rd_start,
    output reg rd_req,
    input wire rd_ack,
    output reg rd_done,
    output reg rd_busy,
    output reg [2:0] app_cmd,
    output reg app_en,
    output reg [28:0] app_addr,
    input wire app_rdy,
    input wire app_rd_data_vld,
    input wire [127:0] app_rd_data,
    output reg rd_ddr_data_vld,
    output reg [127:0] rd_ddr_data
);

    localparam TOTAL_PIXEL = 1024*768 - 8;
    localparam BURST_LEN = 63;

    localparam IDLE = 2'd0;
    localparam RD_REQ = 2'd1;
    localparam READ = 2'd2;

    reg [1:0] state, next_state;
    reg [6:0] cnt_data;
    reg [19:0] cnt_cmd;
    reg [28:0] app_addr_r;

    always @(posedge ui_clk or posedge rst) begin
        if (rst)
            state <= IDLE;
        else
            state <= next_state;
    end

    always @(*) begin
        next_state = state;
        case (state)
            IDLE: if (rd_start) next_state = RD_REQ;
            RD_REQ: if (app_rdy && app_en) next_state = READ;
            READ: if (cnt_data == BURST_LEN && app_rd_data_vld) begin
                if (cnt_cmd == TOTAL_PIXEL[19:0])
                    next_state = IDLE;
                else
                    next_state = RD_REQ;
            end
        endcase
    end

    always @(posedge ui_clk or posedge rst) begin
        if (rst) begin
            rd_req <= 1'b0;
            rd_done <= 1'b0;
            rd_busy <= 1'b0;
            app_cmd <= 3'b0;
            app_en <= 1'b0;
            app_addr <= 29'b0;
            cnt_data <= 7'b0;
            cnt_cmd <= 20'b0;
            app_addr_r <= 29'b0;
        end else begin
            case (state)
                IDLE: begin
                    rd_req <= 1'b0;
                    rd_done <= 1'b0;
                    rd_busy <= 1'b0;
                    app_cmd <= 3'b0;
                    app_en <= 1'b0;
                    cnt_data <= 7'b0;
                    cnt_cmd <= 20'b0;
                    app_addr_r <= 29'b0;
                end
                RD_REQ: begin
                    rd_req <= 1'b1;
                    rd_busy <= 1'b1;
                    app_cmd <= 3'b001;
                    app_en <= 1'b1;
                    app_addr <= app_addr_r;
                    if (app_rdy && app_en) begin
                        app_addr_r <= app_addr_r + 29'd8;
                        cnt_cmd <= cnt_cmd + 20'd1;
                    end
                end
                READ: begin
                    app_en <= 1'b0;
                    if (app_rd_data_vld) begin
                        cnt_data <= cnt_data + 7'd1;
                        if (cnt_data == BURST_LEN) begin
                            cnt_data <= 7'b0;
                            if (cnt_cmd == TOTAL_PIXEL[19:0]) begin
                                rd_done <= 1'b1;
                                rd_busy <= 1'b0;
                            end
                        end
                    end
                end
            endcase
        end
    end

    always @(posedge ui_clk) begin
        rd_ddr_data_vld <= app_rd_data_vld;
        rd_ddr_data <= app_rd_data;
    end

endmodule