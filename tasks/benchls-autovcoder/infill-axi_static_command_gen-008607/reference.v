module autovcoder_008607 #(
    parameter C_ATG_STATIC_ADDRESS = 32'h12A0_0000,
    parameter C_M_AXI_DATA_WIDTH   = 32,
    parameter C_ATG_MIF_ADDR_BITS  = 4,              // 4(16),5(32),6(64),7(128),8(256)
    parameter C_ATG_STATIC_LENGTH  = 3,
    parameter C_ATG_SYSTEM_INIT    = 0,
    parameter C_ATG_SYSTEM_TEST    = 0
) (
    input Clk,
    input rst_l,

    input                           static_ctl_en,
    input  [                   7:0] static_len,
    input  [                   9:0] rom_addr_ptr_ff,
    input  [                  31:0] rom_addr,
    input  [                  31:0] rom_data,
    output [                 127:0] cmd_out_mw,
    output [C_M_AXI_DATA_WIDTH-1:0] cmd_data,
    output [                 127:0] cmd_out_mr

);

  wire [2:0] size;
  generate
    if (C_M_AXI_DATA_WIDTH == 32) begin : M_SISE32
      assign size = 3'b010;
    end
  endgenerate
  generate
    if (C_M_AXI_DATA_WIDTH == 64) begin : M_SISE64
      assign size = 3'b011;
    end
  endgenerate
  generate
    if (C_M_AXI_DATA_WIDTH == 128) begin : M_SISE128
      assign size = 3'b100;
    end
  endgenerate
  generate
    if (C_M_AXI_DATA_WIDTH == 256) begin : M_SISE256
      assign size = 3'b101;
    end
  endgenerate
  generate
    if (C_M_AXI_DATA_WIDTH == 512) begin : M_SISE512
      assign size = 3'b110;
    end
  endgenerate

  wire [5:0] id = 6'h0;
  wire [1:0] burst = 2'b01;
  reg  [7:0] len = 8'h0;
  always @(posedge Clk) begin
    len[7:0] <= (rst_l) ? static_len[7:0] : C_ATG_STATIC_LENGTH;
  end
  //
  //Static-mode
  //
  generate
    if (C_ATG_SYSTEM_INIT == 0 && C_ATG_SYSTEM_TEST == 0) begin : STATIC_MODE_ON
      assign cmd_out_mw = {
        32'h0, 32'h0, static_ctl_en, 7'h0, 3'b010, id, size, burst, 2'b00, len, C_ATG_STATIC_ADDRESS
      };
      assign cmd_out_mr = {
        32'h0, 32'h0, static_ctl_en, 7'h0, 3'b010, id, size, burst, 2'b00, len, C_ATG_STATIC_ADDRESS
      };
      assign cmd_data[C_M_AXI_DATA_WIDTH-1:0] = {
        64'hCAFE5AFE_C001CAFE, 64'hCAFE1AFE_C001DAFE, 64'hCAFE2AFE_C001EAFE, 64'hCAFE3AFE_C001FAFE
      };
    end
  endgenerate
  wire system_init_en;
  wire system_init_cnt_en;
  wire system_init_cmd_en;
  // disable when no.of commands count reached Maximum limit(16)
  assign system_init_cnt_en = (rom_addr_ptr_ff[C_ATG_MIF_ADDR_BITS] != 1'b1);

  // disable when command has cmd-valid bit set to 0
  assign system_init_cmd_en = ~(&rom_addr);  // All 1's is NOP OPCODE.
  assign system_init_en = system_init_cnt_en && system_init_cmd_en;
  generate
    if (C_ATG_SYSTEM_INIT == 1 || C_ATG_SYSTEM_TEST == 1) begin : SYSTEM_INIT_TEST_MODE_ON
      assign cmd_out_mw = {
        32'h0, 32'h0, system_init_en, 7'h0, 3'b010, id, size, burst, 2'b00, 8'h0, rom_addr[31:0]
      };
      assign cmd_data[C_M_AXI_DATA_WIDTH-1:0] = rom_data[31:0];
    end
  endgenerate
endmodule

