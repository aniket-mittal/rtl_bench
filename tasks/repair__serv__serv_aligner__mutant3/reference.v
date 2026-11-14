module dut
(
  input wire clk,
  input wire rst,
  input wire [31:0] i_ibus_adr,
  input wire i_ibus_cyc,
  output wire [31:0] o_ibus_rdt,
  output wire o_ibus_ack,
  output wire [31:0] o_wb_ibus_adr,
  output wire o_wb_ibus_cyc,
  input wire [31:0] i_wb_ibus_rdt,
  input wire i_wb_ibus_ack
);

  wire [31:0] ibus_rdt_concat;
  wire ack_en;
  reg [15:0] lower_hw;
  reg ctrl_misal;
  assign o_wb_ibus_adr = (ctrl_misal)? i_ibus_adr + 32'b100 : i_ibus_adr;
  assign o_wb_ibus_cyc = i_ibus_cyc;
  assign o_ibus_ack = i_wb_ibus_ack & ack_en;
  assign o_ibus_rdt = (ctrl_misal)? ibus_rdt_concat : i_wb_ibus_rdt;

  always @(posedge clk) begin
    if(i_wb_ibus_ack) begin
      lower_hw <= i_wb_ibus_rdt[31:16];
    end 
  end

  assign ibus_rdt_concat = { i_wb_ibus_rdt[15:0], lower_hw };
  assign ack_en = i_ibus_adr[1] & !ctrl_misal;

  always @(posedge clk) begin
    if(rst) ctrl_misal <= 0; 
    else if(i_wb_ibus_ack & i_ibus_adr[1]) ctrl_misal <= !ctrl_misal; 
  end


endmodule
