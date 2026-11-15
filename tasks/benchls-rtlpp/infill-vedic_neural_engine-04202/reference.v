module rtlpp_04202(
    input wire [7:0] Dn,
    input wire [7:0] Xn,
    input wire [7:0] Wn,
    input wire clock,
    output wire [7:0] z,
    output wire done_read_Dn,
    output wire done_read_Xn,
    output wire done_yn,
    output wire done_en,
    output wire done_write_wn,
    output wire done_wn1,
    input wire memory_Dn_active,
    input wire memory_Xn_active,
    input wire memory_bobot_active,
    input wire y_active,
    input wire e_active,
    input wire w_active,
    input wire sys_reset_active
);

reg reset;
reg [7:0] keluaran;
reg [7:0] keluaran_error;

wire [7:0] keluaran_Dn;
wire [7:0] keluaran_memory;
wire [7:0] keluaran_Xn;
wire [15:0] keluaran_vedic;
wire [7:0] keluaran_en;
wire [7:0] keluaran_pembaruan_bobot;
wire done_wn;
wire check;
wire [7:0] untukmemory_z;
wire [7:0] untukmemory_w;
wire [7:0] keluaran_Wn;

assign keluaran_Dn = Dn;
assign keluaran_Xn = Xn;
assign keluaran_Wn = Wn;

reg [7:0] memory_bobot_q;
reg done_write_wn_reg;
always @(posedge clock or posedge sys_reset_active) begin
    if (sys_reset_active) begin
        memory_bobot_q <= 8'd0;
        done_write_wn_reg <= 1'b0;
    end else if (memory_bobot_active) begin
        memory_bobot_q <= Wn;
        done_write_wn_reg <= 1'b1;
    end
end
assign keluaran_memory = memory_bobot_q;
assign done_write_wn = done_write_wn_reg;

reg [7:0] memory_Xn_q;
reg done_read_Xn_reg;
always @(posedge clock or posedge sys_reset_active) begin
    if (sys_reset_active) begin
        memory_Xn_q <= 8'd0;
        done_read_Xn_reg <= 1'b0;
    end else if (memory_Xn_active) begin
        memory_Xn_q <= Wn;
        done_read_Xn_reg <= 1'b1;
    end
end
assign keluaran_Xn = memory_Xn_q;
assign done_read_Xn = done_read_Xn_reg;

reg [7:0] memory_Dn_q;
reg done_read_Dn_reg;
always @(posedge clock or posedge sys_reset_active) begin
    if (sys_reset_active) begin
        memory_Dn_q <= 8'd0;
        done_read_Dn_reg <= 1'b0;
    end else if (memory_Dn_active) begin
        memory_Dn_q <= Wn;
        done_read_Dn_reg <= 1'b1;
    end
end
assign keluaran_Dn = memory_Dn_q;
assign done_read_Dn = done_read_Dn_reg;

reg [15:0] delapan_bit_gabung_coba_q;
reg done_yn_reg;
always @(posedge clock or posedge sys_reset_active) begin
    if (sys_reset_active) begin
        delapan_bit_gabung_coba_q <= 16'd0;
        done_yn_reg <= 1'b0;
    end else if (y_active) begin
        delapan_bit_gabung_coba_q <= keluaran_memory * keluaran_Xn;
        done_yn_reg <= 1'b1;
    end
end
assign keluaran_vedic = delapan_bit_gabung_coba_q;
assign done_yn = done_yn_reg;

reg [7:0] error_check_q;
reg done_en_reg;
always @(posedge clock or posedge sys_reset_active) begin
    if (sys_reset_active) begin
        error_check_q <= 8'd0;
        done_en_reg <= 1'b0;
    end else if (e_active) begin
        error_check_q <= keluaran_Dn - keluaran_vedic[7:0];
        done_en_reg <= 1'b1;
    end
end
assign z = error_check_q;
assign keluaran_en = error_check_q;
assign done_en = done_en_reg;

reg [7:0] pembaruan_bobot_q;
reg done_wn1_reg;
always @(posedge clock or posedge sys_reset_active) begin
    if (sys_reset_active) begin
        pembaruan_bobot_q <= 8'd0;
        done_wn1_reg <= 1'b0;
    end else if (w_active) begin
        pembaruan_bobot_q <= keluaran_memory + keluaran_Xn * keluaran_en;
        done_wn1_reg <= 1'b1;
    end
end
assign keluaran_pembaruan_bobot = pembaruan_bobot_q;
assign done_wn1 = done_wn1_reg;

endmodule