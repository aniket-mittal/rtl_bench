module origen_091965 (
    input wire clk,
    input wire rst,
    input wire [23:0] orig_data,
    input wire orig_ready,
    output reg request,
    output reg [13:0] orig_addr,
    output reg imgproc_ready,
    output reg [13:0] imgproc_addr,
    output reg [7:0] imgproc_data,
    output reg finish
);

    reg [14:0] addr;
    wire [7:0] r, g, b;
    wire [7:0] min_rgb;

    assign r = orig_data[23:16];
    assign g = orig_data[15:8];
    assign b = orig_data[7:0];
    assign min_rgb = (r < g) ? ((r < b) ? r : b) : ((g < b) ? g : b);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            addr <= 15'b0;
            request <= 1'b1;
            orig_addr <= 14'b0;
            imgproc_ready <= 1'b0;
            imgproc_addr <= 14'b0;
            imgproc_data <= 8'b0;
            finish <= 1'b0;
        end else begin
            if (!addr[14]) begin
                if (orig_ready) begin
                    imgproc_data <= min_rgb;
                    imgproc_addr <= addr[13:0];
                    imgproc_ready <= 1'b1;
                    orig_addr <= addr[13:0] + 1;
                    addr <= addr + 1;
                    request <= 1'b1;
                end else begin
                    imgproc_ready <= 1'b0;
                    request <= 1'b0;
                end
            end else begin
                finish <= 1'b1;
                request <= 1'b0;
                imgproc_ready <= 1'b0;
            end
        end
    end

endmodule