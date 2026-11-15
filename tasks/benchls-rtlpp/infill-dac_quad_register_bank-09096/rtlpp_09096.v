module rtlpp_09096 (
   input                 clk_i, 
   input                 rstn_i, 
   output reg [23:0]     dac_a_o,
   output reg [23:0]     dac_b_o,
   output reg [23:0]     dac_c_o,
   output reg [23:0]     dac_d_o,
   input      [31:0]     sys_addr,
   input      [31:0]     sys_wdata,
   input      [3:0]      sys_sel,
   input                 sys_wen,
   input                 sys_ren,
   output reg [31:0]     sys_rdata,
   output reg            sys_err,
   output reg            sys_ack
);

[MASKED]

wire sys_en;
assign sys_en = sys_wen | sys_ren;

always @(posedge clk_i or negedge rstn_i) begin
   if (!rstn_i) begin
      sys_err <= 1'b0;
      sys_ack <= 1'b0;
   end else begin
      sys_err <= 1'b0;
      casez (sys_addr[19:0])
         20'h00020 : begin sys_ack <= sys_en; sys_rdata <= {{8{1'b0}}, dac_a_o}; end
         20'h00024 : begin sys_ack <= sys_en; sys_rdata <= {{8{1'b0}}, dac_b_o}; end
         20'h00028 : begin sys_ack <= sys_en; sys_rdata <= {{8{1'b0}}, dac_c_o}; end
         20'h0002C : begin sys_ack <= sys_en; sys_rdata <= {{8{1'b0}}, dac_d_o}; end
         default   : begin sys_ack <= sys_en; sys_rdata <= 32'h0; end
      endcase
   end
end

endmodule