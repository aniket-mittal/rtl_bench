module origen_027482 (
    input wire ui_clk,
    input wire rst_n,
    input wire c3_p2_cmd_empty,
    input wire c3_p3_cmd_empty,
    input wire c3_p4_cmd_empty,
    input wire a7_wr_end,
    input wire a7_rd1_end,
    input wire a7_rd2_end,
    output reg a7_wr_start,
    output reg a7_rd1_start,
    output reg a7_rd2_start,
    output reg [4:0] state
);

    // State encoding
    localparam IDLE  = 5'b00001;
    localparam ARBIT = 5'b00010;
    localparam WR    = 5'b00100;
    localparam RD1   = 5'b01000;
    localparam RD2   = 5'b10000;

    reg [1:0] cnt;
    reg wr_flag, rd1_flag, rd2_flag;
    reg [4:0] next_state;

    // Counter logic
    always @(posedge ui_clk or negedge rst_n) begin
        if (!rst_n)
            cnt <= 2'b00;
        else if (cnt == 2'b10)
            cnt <= 2'b00;
        else
            cnt <= cnt + 1'b1;
    end

    // State transition logic
    always @(posedge ui_clk or negedge rst_n) begin
        if (!rst_n)
            state <= IDLE;
        else
            state <= next_state;
    end

    // Next state logic
    always @(*) begin
        case (state)
            IDLE:  next_state = ARBIT;
            ARBIT: begin
                if (cnt == 2'b00 && !c3_p2_cmd_empty)
                    next_state = WR;
                else if (cnt == 2'b01 && !c3_p3_cmd_empty)
                    next_state = RD1;
                else if (cnt == 2'b10 && !c3_p4_cmd_empty)
                    next_state = RD2;
                else
                    next_state = ARBIT;
            end
            WR:    next_state = a7_wr_end ? ARBIT : WR;
            RD1:   next_state = a7_rd1_end ? ARBIT : RD1;
            RD2:   next_state = a7_rd2_end ? ARBIT : RD2;
            default: next_state = IDLE;
        endcase
    end

    // Flag logic
    always @(posedge ui_clk or negedge rst_n) begin
        if (!rst_n) begin
            wr_flag <= 1'b0;
            rd1_flag <= 1'b0;
            rd2_flag <= 1'b0;
        end else begin
            if (state == WR)
                wr_flag <= 1'b1;
            else if (a7_wr_end)
                wr_flag <= 1'b0;

            if (state == RD1)
                rd1_flag <= 1'b1;
            else if (a7_rd1_end)
                rd1_flag <= 1'b0;

            if (state == RD2)
                rd2_flag <= 1'b1;
            else if (a7_rd2_end)
                rd2_flag <= 1'b0;
        end
    end

    // Start signal generation
    always @(posedge ui_clk or negedge rst_n) begin
        if (!rst_n) begin
            a7_wr_start <= 1'b0;
            a7_rd1_start <= 1'b0;
            a7_rd2_start <= 1'b0;
        end else begin
            a7_wr_start <= (next_state == WR) && !wr_flag;
            a7_rd1_start <= (next_state == RD1) && !rd1_flag;
            a7_rd2_start <= (next_state == RD2) && !rd2_flag;
        end
    end

endmodule