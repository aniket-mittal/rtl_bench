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

always @(posedge clk_i or negedge rstn_i) begin
   if (!rstn_i) begin
      dac_a_o <= 24'h0F0000;
      dac_b_o <= 24'h4E0000;
      dac_c_o <= 24'h750000;
      dac_d_o <= 24'h9C0000;
   end else begin
      if (sys_wen) begin
         if (sys_addr[19:0] == 20'h00020) 
            dac_a_o <= sys_wdata[23:0];
         if (sys_addr[19:0] == 20'h00024) 
            dac_b_o <= sys_wdata[23:0];
         if (sys_addr[19:0] == 20'h00028) 
            dac_c_o <= sys_wdata[23:0];
         if (sys_addr[19:0] == 20'h0002C) 
            dac_d_o <= sys_wdata[23:0];
     end
   end
end

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