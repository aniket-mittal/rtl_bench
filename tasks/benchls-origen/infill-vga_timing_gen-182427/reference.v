module origen_182427(
    input clk,
    input clrn,
    input [11:0] d_in,
    output [18:0] rd_a,
    output [7:0] x,
    output [8:0] y,
    output [3:0] r,
    output [3:0] g,
    output [3:0] b,
    output hs,
    output vs
);

    reg vga_clk;
    reg [11:0] data_reg;
    wire video_out;
    wire rdn;
    reg [9:0] h_count;
    reg [9:0] v_count;

    always @(posedge clk or negedge clrn) begin
        if (!clrn) begin
            vga_clk <= 1'b0;
        end else begin
            vga_clk <= ~vga_clk;
        end
    end

    always @(posedge vga_clk or negedge clrn) begin
        if (!clrn) begin
            h_count <= 10'd0;
            v_count <= 10'd0;
            data_reg <= 12'd0;
        end else begin
            h_count <= (h_count == 10'd799) ? 10'd0 : h_count + 1'b1;
            if (h_count == 10'd799) begin
                v_count <= (v_count == 10'd524) ? 10'd0 : v_count + 1'b1;
            end
            data_reg <= d_in;
        end
    end

    assign video_out = ~rdn;
    assign rdn = (h_count < 10'd640 && v_count < 10'd480);
    assign rd_a = {v_count[8:0], h_count[9:0]};
    assign hs = (h_count >= 10'd656 && h_count < 10'd752);
    assign vs = (v_count >= 10'd490 && v_count < 10'd492);
    assign x = h_count[9:2];
    assign y = v_count[9:1];
    assign r = video_out ? data_reg[11:8] : 4'b0000;
    assign g = video_out ? data_reg[7:4] : 4'b0000;
    assign b = video_out ? data_reg[3:0] : 4'b0000;

endmodule