module origen_086047 #(
    parameter DATA_WIDTH = 64,
    parameter KEEP_ENABLE = (DATA_WIDTH>8),
    parameter KEEP_WIDTH = (DATA_WIDTH/8),
    parameter LEN_WIDTH = 16
) (
    input wire clk,
    input wire rst,
    input wire [KEEP_WIDTH-1:0] monitor_axis_tkeep,
    input wire monitor_axis_tvalid,
    input wire monitor_axis_tready,
    input wire monitor_axis_tlast,
    output reg [LEN_WIDTH-1:0] frame_len,
    output reg frame_len_valid
);

reg [LEN_WIDTH-1:0] frame_len_reg, frame_len_next;
reg frame_len_valid_reg, frame_len_valid_next;

always @* begin
    frame_len_next = frame_len_reg;
    frame_len_valid_next = 1'b0;

    if (monitor_axis_tvalid && monitor_axis_tready) begin
        if (KEEP_ENABLE) begin
            frame_len_next = frame_len_reg + $countones(monitor_axis_tkeep);
        end else begin
            frame_len_next = frame_len_reg + KEEP_WIDTH;
        end

        if (monitor_axis_tlast) begin
            frame_len_valid_next = 1'b1;
        end
    end
end

always @(posedge clk) begin
    if (rst) begin
        frame_len_reg <= {LEN_WIDTH{1'b0}};
        frame_len_valid_reg <= 1'b0;
    end else begin
        if (frame_len_valid_reg) begin
            frame_len_reg <= {LEN_WIDTH{1'b0}};
        end else begin
            frame_len_reg <= frame_len_next;
        end
        frame_len_valid_reg <= frame_len_valid_next;
    end
end

always @* begin
    frame_len = frame_len_reg;
    frame_len_valid = frame_len_valid_reg;
end

endmodule