module origen_058286 #(
    parameter HCNT_WIDTH = 10,
    parameter COLOR_DEPTH = 4
) (
    input wire clk_sys,
    input wire enable,
    input wire hs_in,
    input wire vs_in,
    input wire hbl_in,
    input wire vbl_in,
    input wire [COLOR_DEPTH-1:0] r_in,
    input wire [COLOR_DEPTH-1:0] g_in,
    input wire [COLOR_DEPTH-1:0] b_in,
    output reg hs_out,
    output reg vs_out,
    output reg hbl_out,
    output reg vbl_out,
    output reg [COLOR_DEPTH-1:0] r_out,
    output reg [COLOR_DEPTH-1:0] g_out,
    output reg [COLOR_DEPTH-1:0] b_out
);

reg [HCNT_WIDTH-1:0] h_cnt;
reg [HCNT_WIDTH-1:0] hs_max;
reg hs_rise;
reg vs_in_d;
reg line_toggle;
reg [1:0] output_phase;

wire [COLOR_DEPTH-1:0] buf_r, buf_g, buf_b;
wire buf_hbl, buf_vbl;

// Line buffer instance
reg [COLOR_DEPTH*3+2-1:0] line_buffer [0:(2**HCNT_WIDTH)-1];
reg [HCNT_WIDTH-1:0] write_addr, read_addr;

always @(posedge clk_sys) begin
    if (~line_toggle) begin
        line_buffer[h_cnt] <= {r_in, g_in, b_in, hbl_in, vbl_in};
    end
    write_addr <= h_cnt;
    read_addr <= h_cnt >> 1;
end

assign {buf_r, buf_g, buf_b, buf_hbl, buf_vbl} = line_buffer[read_addr];

// Horizontal counter and timing detection
always @(posedge clk_sys) begin
    if (hs_in) begin
        h_cnt <= 0;
        hs_rise <= 1;
    end else begin
        h_cnt <= h_cnt + 1'b1;
        hs_rise <= 0;
    end

    if (hs_rise) begin
        hs_max <= h_cnt - 1'b1;
    end
end

// Vertical sync and line toggle
always @(posedge clk_sys) begin
    vs_in_d <= vs_in;
    if (hs_rise) begin
        if (vs_in & ~vs_in_d) begin
            line_toggle <= 0;
        end else begin
            line_toggle <= ~line_toggle;
        end
    end
end

// Output generation
always @(posedge clk_sys) begin
    if (enable) begin
        output_phase <= output_phase + 1'b1;

        if (output_phase == 2'b00) begin
            hs_out <= (h_cnt[HCNT_WIDTH-1:1] == 0);
            vs_out <= vs_in;
            hbl_out <= buf_hbl;
            vbl_out <= buf_vbl;
            r_out <= buf_r;
            g_out <= buf_g;
            b_out <= buf_b;
        end
    end else begin
        hs_out <= hs_in;
        vs_out <= vs_in;
        hbl_out <= hbl_in;
        vbl_out <= vbl_in;
        r_out <= r_in;
        g_out <= g_in;
        b_out <= b_in;
    end
end

endmodule