module rtlpp_00070 (
  alloc_size_ap_vld,
  alloc_size_ap_ack,
  alloc_addr_ap_vld,
  alloc_addr_ap_ack,
  alloc_free_target_ap_vld,
  alloc_free_target_ap_ack,
  alloc_cmd_ap_vld,
  alloc_cmd_ap_ack,
  ap_clk,
  ap_rst,
  ap_start,
  ap_done,
  ap_idle,
  ap_ready,
  alloc_size,
  alloc_addr,
  alloc_free_target,
  alloc_cmd
);

input wire alloc_size_ap_vld;
output reg alloc_size_ap_ack;
output reg alloc_addr_ap_vld;
input wire alloc_addr_ap_ack;
input wire alloc_free_target_ap_vld;
output reg alloc_free_target_ap_ack;
input wire alloc_cmd_ap_vld;
output reg alloc_cmd_ap_ack;
input wire ap_clk;
input wire ap_rst;
input wire ap_start;
output reg ap_done;
output reg ap_idle;
output reg ap_ready;
input wire [31 : 0] alloc_size;
output reg [31 : 0] alloc_addr;
input wire [31 : 0] alloc_free_target;
input wire [7 : 0] alloc_cmd;

always @(posedge ap_clk or posedge ap_rst) begin
  if (ap_rst) begin
    alloc_size_ap_ack <= 0;
    alloc_addr_ap_vld <= 0;
    alloc_free_target_ap_ack <= 0;
    alloc_cmd_ap_ack <= 0;
    ap_done <= 0;
    ap_idle <= 1;
    ap_ready <= 0;
    alloc_addr <= 0;
  end else begin
    if (ap_start) begin
      ap_idle <= 0;
      if (alloc_size_ap_vld) begin
        alloc_size_ap_ack <= 1;
      end else begin
        alloc_size_ap_ack <= 0;
      end

      if (!alloc_addr_ap_ack) begin
        alloc_addr_ap_vld <= 1;
      end else begin
        alloc_addr_ap_vld <= 0;
      end

      if (alloc_free_target_ap_vld) begin
        alloc_free_target_ap_ack <= 1;
      end else begin
        alloc_free_target_ap_ack <= 0;
      end

      if (alloc_cmd_ap_vld) begin
        alloc_cmd_ap_ack <= 1;
      end else begin
        alloc_cmd_ap_ack <= 0;
      end

      ap_ready <= 1;
      ap_done <= 1;
    end else begin
      ap_idle <= 1;
      ap_ready <= 0;
      ap_done <= 0;
    end
  end
end

endmodule