module origen_106122 (
    input wire sd_clk,
    input wire sd_rst,
    output reg [3:0] sd_cmd,
    output reg [12:0] sd_a,
    output reg [1:0] sd_dqm,
    output reg sd_cke,
    output reg sd_rdy
);

    // SDRAM commands
    localparam [3:0] CMD_NOP      = 4'b0111;
    localparam [3:0] CMD_ACTIVE   = 4'b0011;
    localparam [3:0] CMD_READ     = 4'b0101;
    localparam [3:0] CMD_WRITE    = 4'b0100;
    localparam [3:0] CMD_TERM     = 4'b0110;
    localparam [3:0] CMD_PRECHARGE= 4'b0010;
    localparam [3:0] CMD_REFRESH  = 4'b0001;
    localparam [3:0] CMD_LOAD_MODE= 4'b0000;

    // SDRAM configuration
    localparam [12:0] MODE_REG    = 13'b000000110_0_000;
    localparam [9:0] START_DELAY  = 10'd1000;

    reg [4:0] reset;
    reg [3:0] t;
    reg [9:0] start_delay;

    always @(posedge sd_clk or posedge sd_rst) begin
        if (sd_rst) begin
            sd_cmd <= CMD_NOP;
            sd_a <= 13'b0;
            sd_dqm <= 2'b11;
            sd_cke <= 1'b0;
            sd_rdy <= 1'b0;
            reset <= 5'd31;
            t <= 4'd0;
            start_delay <= START_DELAY;
        end else begin
            if (start_delay > 0) begin
                start_delay <= start_delay - 1'b1;
                sd_cke <= 1'b0;
            end else begin
                sd_cke <= 1'b1;
                t <= t + 1'b1;

                case (reset)
                    5'd31: begin
                        if (t == 4'd15) begin
                            reset <= reset - 1'b1;
                            t <= 4'd0;
                        end
                        sd_cmd <= CMD_NOP;
                    end
                    5'd30: begin
                        sd_cmd <= CMD_PRECHARGE;
                        sd_a[10] <= 1'b1;
                        if (t == 4'd1) begin
                            reset <= reset - 1'b1;
                            t <= 4'd0;
                        end
                    end
                    5'd29, 5'd28, 5'd27, 5'd26: begin
                        sd_cmd <= CMD_NOP;
                        if (t == 4'd15) begin
                            reset <= reset - 1'b1;
                            t <= 4'd0;
                        end
                    end
                    5'd25: begin
                        sd_cmd <= CMD_LOAD_MODE;
                        sd_a <= MODE_REG;
                        if (t == 4'd1) begin
                            reset <= reset - 1'b1;
                            t <= 4'd0;
                        end
                    end
                    5'd24, 5'd23, 5'd22: begin
                        sd_cmd <= CMD_NOP;
                        if (t == 4'd15) begin
                            reset <= reset - 1'b1;
                            t <= 4'd0;
                        end
                    end
                    5'd21: begin
                        sd_cmd <= CMD_REFRESH;
                        if (t == 4'd15) begin
                            reset <= reset - 1'b1;
                            t <= 4'd0;
                        end
                    end
                    5'd20, 5'd19, 5'd18, 5'd17, 5'd16, 5'd15, 5'd14, 5'd13: begin
                        sd_cmd <= CMD_NOP;
                        if (t == 4'd15) begin
                            reset <= reset - 1'b1;
                            t <= 4'd0;
                        end
                    end
                    5'd12: begin
                        sd_cmd <= CMD_REFRESH;
                        if (t == 4'd15) begin
                            reset <= reset - 1'b1;
                            t <= 4'd0;
                        end
                    end
                    5'd11, 5'd10, 5'd9, 5'd8, 5'd7, 5'd6, 5'd5, 5'd4, 5'd3, 5'd2, 5'd1: begin
                        sd_cmd <= CMD_NOP;
                        if (t == 4'd15) begin
                            reset <= reset - 1'b1;
                            t <= 4'd0;
                        end
                    end
                    5'd0: begin
                        sd_cmd <= CMD_NOP;
                        sd_rdy <= 1'b1;
                    end
                endcase
            end
        end
    end

endmodule