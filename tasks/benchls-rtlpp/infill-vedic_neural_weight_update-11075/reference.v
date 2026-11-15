module rtlpp_11075(
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

// Memory 8-bit Block
reg [7:0] memory_bobot_data;
reg [7:0] memory_Xn_data;
reg [7:0] memory_Dn_data;
reg memory_bobot_done;
reg memory_Xn_done;
reg memory_Dn_done;

always @(posedge clock or posedge sys_reset_active) begin
    if (sys_reset_active) begin
        memory_bobot_data <= 8'b0;
        memory_Xn_data <= 8'b0;
        memory_Dn_data <= 8'b0;
        memory_bobot_done <= 0;
        memory_Xn_done <= 0;
        memory_Dn_done <= 0;
    end else begin
        if (memory_bobot_active) begin
            memory_bobot_data <= keluaran_pembaruan_bobot;
            memory_bobot_done <= 1;
        end else begin
            memory_bobot_done <= 0;
        end

        if (memory_Xn_active) begin
            memory_Xn_data <= keluaran_Xn;
            memory_Xn_done <= 1;
        end else begin
            memory_Xn_done <= 0;
        end

        if (memory_Dn_active) begin
            memory_Dn_data <= keluaran_Dn;
            memory_Dn_done <= 1;
        end else begin
            memory_Dn_done <= 0;
        end
    end
end

assign keluaran_memory = memory_bobot_data;
assign done_write_wn = memory_bobot_done;
assign done_read_Xn = memory_Xn_done;
assign done_read_Dn = memory_Dn_done;

// Eight Bit Combine Block
reg [15:0] vedic_result;
reg vedic_done;

always @(posedge clock or posedge sys_reset_active) begin
    if (sys_reset_active) begin
        vedic_result <= 16'b0;
        vedic_done <= 0;
    end else if (y_active) begin
        vedic_result <= keluaran_memory * keluaran_Xn;
        vedic_done <= 1;
    end else begin
        vedic_done <= 0;
    end
end

assign keluaran_vedic = vedic_result;
assign done_yn = vedic_done;

// Error Check Block
reg [7:0] error_result;
reg error_done;

always @(posedge clock or posedge sys_reset_active) begin
    if (sys_reset_active) begin
        error_result <= 8'b0;
        error_done <= 0;
    end else if (e_active) begin
        error_result <= keluaran_Dn - keluaran_vedic[7:0];
        error_done <= 1;
    end else begin
        error_done <= 0;
    end
end

assign keluaran_en = error_result;
assign done_en = error_done;
assign z = keluaran_en;

// Weight Update Block
reg [7:0] updated_weight;
reg weight_update_done;

always @(posedge clock or posedge sys_reset_active) begin
    if (sys_reset_active) begin
        updated_weight <= 8'b0;
        weight_update_done <= 0;
    end else if (w_active) begin
        updated_weight <= keluaran_memory + keluaran_en;
        weight_update_done <= 1;
    end else begin
        weight_update_done <= 0;
    end
end

assign keluaran_pembaruan_bobot = updated_weight;
assign done_wn1 = weight_update_done;

endmodule