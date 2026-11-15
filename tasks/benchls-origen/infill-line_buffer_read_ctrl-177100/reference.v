module origen_177100(
    input       video_clk,
    input       video_rst,
    input       ras_ready,
    output reg  lb_read
);

reg [1:0] rd_state;
localparam EMPTY0 = 2'b00;
localparam READ0 = 2'b01;
localparam EMPTY1 = 2'b10;
localparam READ1 = 2'b11;

always @(posedge video_clk or posedge video_rst) begin
    if (video_rst) begin
        rd_state <= EMPTY0;
        lb_read <= 1'b0;
    end
    else begin
        case (rd_state)
            EMPTY0: begin
                lb_read <= 1'b0;
                if (ras_ready) begin
                    rd_state <= READ0;
                    lb_read <= 1'b1;
                end
            end
            READ0: begin
                lb_read <= 1'b1;
                if (~ras_ready) begin
                    rd_state <= EMPTY1;
                    lb_read <= 1'b0;
                end
            end
            EMPTY1: begin
                lb_read <= 1'b0;
                if (ras_ready) begin
                    rd_state <= READ1;
                    lb_read <= 1'b1;
                end
            end
            READ1: begin
                lb_read <= 1'b1;
                if (~ras_ready) begin
                    rd_state <= EMPTY0;
                    lb_read <= 1'b0;
                end
            end
        endcase
    end
end

endmodule