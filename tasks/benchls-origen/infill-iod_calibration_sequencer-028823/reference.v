module origen_028823 #(
    parameter WIDTH = 8
) (
    input wire clk_div,
    input wire rst,
    input wire [WIDTH-1:0] iod_busy,
    output reg ready,
    output reg iod_rst,
    output reg iod_mask,
    output reg iod_cal,
    output reg iod_cal_master
);

    reg [WIDTH-1:0] iod_busy_reg;
    wire iod_any_busy, iod_all_busy;
    reg [11:0] iod_cnt;
    reg [2:0] iod_state;

    assign iod_any_busy = |iod_busy_reg;
    assign iod_all_busy = &iod_busy_reg;

    always @(posedge clk_div or posedge rst) begin
        if (rst) begin
            iod_state <= 3'd0;
            iod_cnt <= 12'd0;
            iod_rst <= 1'b1;
            iod_mask <= 1'b1;
            iod_cal <= 1'b0;
            iod_cal_master <= 1'b0;
            ready <= 1'b0;
            iod_busy_reg <= {WIDTH{1'b0}};
        end else begin
            iod_busy_reg <= iod_busy;
            
            case (iod_state)
                3'd0: begin // Initial delay and mask
                    iod_rst <= 1'b0;
                    if (iod_cnt == 12'd2047) begin
                        iod_state <= 3'd1;
                        iod_cnt <= 12'd0;
                    end else begin
                        iod_cnt <= iod_cnt + 1'b1;
                    end
                end
                
                3'd1: begin // Start calibration
                    iod_mask <= 1'b0;
                    iod_cal <= 1'b1;
                    iod_cal_master <= 1'b1;
                    iod_state <= 3'd2;
                end
                
                3'd2: begin // Wait for calibration completion
                    if (!iod_any_busy) begin
                        iod_cal <= 1'b0;
                        iod_cal_master <= 1'b0;
                        iod_state <= 3'd3;
                    end
                end
                
                3'd3: begin // Reset and delay
                    iod_rst <= 1'b1;
                    if (iod_cnt == 12'd15) begin
                        iod_rst <= 1'b0;
                        iod_state <= 3'd4;
                        iod_cnt <= 12'd0;
                    end else begin
                        iod_cnt <= iod_cnt + 1'b1;
                    end
                end
                
                3'd4: begin // Additional delay
                    if (iod_cnt == 12'd2047) begin
                        iod_state <= 3'd5;
                        iod_cnt <= 12'd0;
                    end else begin
                        iod_cnt <= iod_cnt + 1'b1;
                    end
                end
                
                3'd5: begin // Secondary calibration
                    iod_cal <= 1'b1;
                    iod_state <= 3'd6;
                end
                
                3'd6: begin // Wait for secondary calibration completion
                    if (!iod_all_busy) begin
                        iod_cal <= 1'b0;
                        iod_state <= 3'd7;
                    end
                end
                
                3'd7: begin // Final delay and ready
                    if (iod_cnt == 12'd2047) begin
                        ready <= 1'b1;
                    end else begin
                        iod_cnt <= iod_cnt + 1'b1;
                    end
                end
            endcase
        end
    end

endmodule