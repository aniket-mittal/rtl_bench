module origen_213085 #(
    parameter H_RES = 160,
    parameter TOTAL_COL = (H_RES * 2),
    parameter TOTAL_ROW = 120,
    parameter BUFF_BITS = 16
)
(
    input  clk,
    input  HS,
    input  VS,
    input  pclk,
    input  start_capture,
    output reg [BUFF_BITS-1:0] addr,
    output reg write_to_buff,
    output reg frame_captured
);

reg [BUFF_BITS-1:0] pixel_count;
reg state;
localparam IDLE = 1'b0, CAPTURE_DATA = 1'b1;

always @(posedge clk) begin
    if (!start_capture) begin
        addr <= 0;
        pixel_count <= 0;
        frame_captured <= 0;
        state <= IDLE;
    end else begin
        case (state)
            IDLE: begin
                if (start_capture) begin
                    state <= CAPTURE_DATA;
                end
            end
            CAPTURE_DATA: begin
                if (pixel_count < (TOTAL_COL * TOTAL_ROW)) begin
                    if (HS) begin
                        write_to_buff <= 1;
                        addr <= addr + 1;
                        pixel_count <= pixel_count + 1;
                    end else begin
                        write_to_buff <= 0;
                    end
                end else begin
                    frame_captured <= 1;
                    state <= IDLE;
                end
            end
        endcase
    end
end

endmodule