module origen_022756 (
    input wire sys_rstn,
    input wire clk_ref,
    input wire ads_sdo0,
    input wire ads_sdo1,
    input wire ads_rvs,
    output reg ads_csn,
    output reg ads_rstn,
    output reg ads_sclk,
    output reg ads_sdi,
    output reg dvalid,
    output reg [15:0] dout
);

    // Parameters
    localparam IDLE = 2'b00;
    localparam DELAY = 2'b01;
    localparam WRITE = 2'b10;

    // Configuration registers
    reg [31:0] cfg_reg0c_w = 32'h0C00_0000;
    reg [31:0] cfg_reg10_w = 32'h1000_0000;
    reg [31:0] cfg_reg14_w = 32'h1400_0000;
    reg [31:0] cfg_reg10_r = 32'h9000_0000;

    // Internal registers
    reg [1:0] state;
    reg [7:0] cfg_cnt;
    reg [7:0] clk_cnt;
    reg [31:0] shift_reg;
    reg [31:0] cfg_word;

    // State machine
    always @(posedge clk_ref or negedge sys_rstn) begin
        if (!sys_rstn) begin
            state <= IDLE;
            cfg_cnt <= 8'd0;
            clk_cnt <= 8'd0;
            ads_csn <= 1'b1;
            ads_rstn <= 1'b0;
            ads_sclk <= 1'b0;
            ads_sdi <= 1'b0;
            dvalid <= 1'b0;
            dout <= 16'd0;
        end else begin
            case (state)
                IDLE: begin
                    ads_rstn <= 1'b1;
                    if (clk_cnt == 8'd255) begin
                        state <= DELAY;
                        clk_cnt <= 8'd0;
                    end else begin
                        clk_cnt <= clk_cnt + 1'b1;
                    end
                end

                DELAY: begin
                    if (clk_cnt == 8'd255) begin
                        state <= WRITE;
                        clk_cnt <= 8'd0;
                        ads_csn <= 1'b0;
                        cfg_word <= cfg_reg0c_w;
                    end else begin
                        clk_cnt <= clk_cnt + 1'b1;
                    end
                end

                WRITE: begin
                    if (clk_cnt < 8'd32) begin
                        if (clk_cnt[0] == 1'b0) begin
                            ads_sclk <= 1'b1;
                            ads_sdi <= cfg_word[31];
                            cfg_word <= {cfg_word[30:0], 1'b0};
                        end else begin
                            ads_sclk <= 1'b0;
                            shift_reg <= {shift_reg[30:0], ads_sdo0};
                        end
                        clk_cnt <= clk_cnt + 1'b1;
                    end else begin
                        ads_csn <= 1'b1;
                        if (clk_cnt == 8'd255) begin
                            clk_cnt <= 8'd0;
                            if (cfg_cnt < 8'd3) begin
                                cfg_cnt <= cfg_cnt + 1'b1;
                                ads_csn <= 1'b0;
                                case (cfg_cnt)
                                    8'd0: cfg_word <= cfg_reg10_w;
                                    8'd1: cfg_word <= cfg_reg14_w;
                                    8'd2: cfg_word <= cfg_reg10_r;
                                endcase
                            end else begin
                                dout <= shift_reg[31:16];
                                dvalid <= 1'b1;
                            end
                        end else begin
                            clk_cnt <= clk_cnt + 1'b1;
                        end
                    end
                end

                default: state <= IDLE;
            endcase
        end
    end

endmodule