module origen_077388(
    input clk,
    input reset,
    output reg done,
    output reg sti_rd,
    output reg [6:0] sti_addr,
    input [15:0] sti_di,
    output reg res_wr,
    output reg res_rd,
    output reg [13:0] res_addr,
    output reg [7:0] res_do,
    input [7:0] res_di
);

    reg [3:0] state;
    reg [3:0] bit_count;
    reg [7:0] min_value;
    reg [15:0] input_buffer;
    reg [6:0] row, col;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= 4'd0;
            done <= 1'b0;
            sti_rd <= 1'b0;
            sti_addr <= 7'd0;
            res_wr <= 1'b0;
            res_rd <= 1'b0;
            res_addr <= 14'd0;
            res_do <= 8'd0;
            bit_count <= 4'd0;
            min_value <= 8'd255;
            input_buffer <= 16'd0;
            row <= 7'd0;
            col <= 7'd0;
        end else begin
            case (state)
                4'd0: begin // Read input or write 0
                    if (bit_count == 4'd0) begin
                        sti_rd <= 1'b1;
                        state <= 4'd1;
                    end else begin
                        res_wr <= input_buffer[15];
                        res_do <= input_buffer[15] ? 8'd0 : 8'd255;
                        state <= 4'd2;
                    end
                end
                4'd1: begin // Store input data
                    input_buffer <= sti_di;
                    sti_rd <= 1'b0;
                    bit_count <= 4'd15;
                    state <= 4'd0;
                end
                4'd2: begin // Update address
                    res_wr <= 1'b0;
                    if (col == 7'd127) begin
                        col <= 7'd0;
                        row <= row + 7'd1;
                    end else begin
                        col <= col + 7'd1;
                    end
                    res_addr <= {row, col};
                    input_buffer <= {input_buffer[14:0], 1'b0};
                    bit_count <= bit_count - 4'd1;
                    state <= 4'd3;
                end
                4'd3: begin // Check for end of first pass
                    if (row == 7'd127 && col == 7'd127 && bit_count == 4'd0) begin
                        state <= 4'd6;
                        row <= 7'd127;
                        col <= 7'd127;
                        res_addr <= 14'h3FFF;
                    end else begin
                        state <= 4'd0;
                    end
                end
                4'd6: begin // Start second pass
                    res_rd <= 1'b1;
                    state <= 4'd7;
                end
                4'd7: begin // Read current value
                    min_value <= res_di;
                    res_rd <= 1'b0;
                    state <= 4'd8;
                end
                4'd8: begin // Check right neighbor
                    if (col < 7'd127) begin
                        res_rd <= 1'b1;
                        res_addr <= res_addr + 14'd1;
                        state <= 4'd9;
                    end else begin
                        state <= 4'd10;
                    end
                end
                4'd9: begin // Update min value
                    if (res_di < min_value) min_value <= res_di + 8'd1;
                    res_rd <= 1'b0;
                    res_addr <= res_addr - 14'd1;
                    state <= 4'd10;
                end
                4'd10: begin // Check bottom neighbor
                    if (row < 7'd127) begin
                        res_rd <= 1'b1;
                        res_addr <= res_addr + 14'd128;
                        state <= 4'd11;
                    end else begin
                        state <= 4'd12;
                    end
                end
                4'd11: begin // Update min value
                    if (res_di < min_value) min_value <= res_di + 8'd1;
                    res_rd <= 1'b0;
                    res_addr <= res_addr - 14'd128;
                    state <= 4'd12;
                end
                4'd12: begin // Write result
                    res_wr <= 1'b1;
                    res_do <= min_value;
                    state <= 4'd13;
                end
                4'd13: begin // Update address for next iteration
                    res_wr <= 1'b0;
                    if (col == 7'd0) begin
                        if (row == 7'd0) begin
                            state <= 4'd14;
                        end else begin
                            row <= row - 7'd1;
                            col <= 7'd127;
                            res_addr <= res_addr - 14'd1;
                        end
                    end else begin
                        col <= col - 7'd1;
                        res_addr <= res_addr - 14'd1;
                    end
                    state <= 4'd6;
                end
                4'd14: begin // Set done signal
                    done <= 1'b1;
                    state <= 4'd14;
                end
            endcase
        end
    end
endmodule