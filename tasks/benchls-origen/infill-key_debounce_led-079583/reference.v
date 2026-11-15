module origen_079583 (
    input wire clk_i,
    input wire rst_n_i,
    input wire key_i,
    output reg [3:0] led_o,
    output wire [19:0] div_cnt_tb,
    output wire [2:0] key_state_tb
);

    parameter DELAY_Param = 20'd999_999;

    reg [19:0] div_cnt;
    reg delay_10ms;
    reg [2:0] key_state;
    reg [3:0] led_o_r;
    reg low_flag, high_flag;

    (* KEEP = "TRUE" *) reg [19:0] div_cnt_r;

    localparam DETECTER1 = 3'd0;
    localparam DETECTER2 = 3'd1;
    localparam DETECTER3 = 3'd2;
    localparam DETECTER4 = 3'd3;
    localparam LED_DIS = 3'd4;

    always @(posedge clk_i or negedge rst_n_i) begin
        if (!rst_n_i) begin
            div_cnt <= 20'd0;
            delay_10ms <= 1'b0;
        end else begin
            if (div_cnt == DELAY_Param) begin
                div_cnt <= 20'd0;
                delay_10ms <= 1'b1;
            end else begin
                div_cnt <= div_cnt + 1'b1;
                delay_10ms <= 1'b0;
            end
        end
    end

    always @(posedge clk_i or negedge rst_n_i) begin
        if (!rst_n_i) begin
            key_state <= DETECTER1;
            low_flag <= 1'b0;
            high_flag <= 1'b0;
            led_o_r <= 4'b1111;
        end else begin
            if (delay_10ms) begin
                case (key_state)
                    DETECTER1: begin
                        if (!key_i) key_state <= DETECTER2;
                    end
                    DETECTER2: begin
                        if (!key_i) begin
                            key_state <= DETECTER3;
                            low_flag <= 1'b1;
                        end else begin
                            key_state <= DETECTER1;
                        end
                    end
                    DETECTER3: begin
                        if (key_i) key_state <= DETECTER4;
                    end
                    DETECTER4: begin
                        if (key_i) begin
                            key_state <= LED_DIS;
                            high_flag <= 1'b1;
                        end else begin
                            key_state <= DETECTER3;
                        end
                    end
                    LED_DIS: begin
                        if (low_flag && high_flag) begin
                            led_o_r <= ~led_o_r;
                            low_flag <= 1'b0;
                            high_flag <= 1'b0;
                        end
                        key_state <= DETECTER1;
                    end
                    default: key_state <= DETECTER1;
                endcase
            end
        end
    end

    always @(posedge clk_i or negedge rst_n_i) begin
        if (!rst_n_i) begin
            div_cnt_r <= 20'd0;
        end else begin
            div_cnt_r <= div_cnt;
        end
    end

    assign led_o = led_o_r;
    assign div_cnt_tb = div_cnt_r;
    assign key_state_tb = key_state;

endmodule