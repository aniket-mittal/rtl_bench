module rtlpp_09017 (
   
   input                 clk_i           ,  
   input                 rstn_i          ,  
   
   output reg [23:0]     dac_a_o         ,  
   output reg [23:0]     dac_b_o         ,  
   output reg [23:0]     dac_c_o         ,  
   output reg [23:0]     dac_d_o         ,  
   
   input      [31:0]     sys_addr        ,  
   input      [31:0]     sys_wdata       ,  
   input      [3:0]      sys_sel         ,  
   input                 sys_wen         ,  
   input                 sys_ren         ,  
   output reg [31:0]     sys_rdata       ,  
   output reg            sys_err         ,  
   output reg            sys_ack            
);

always @(posedge clk_i or negedge rstn_i) begin
   if (!rstn_i) begin
      dac_a_o <= 24'h0F0000;
      dac_b_o <= 24'h4E0000;
      dac_c_o <= 24'h750000;
      dac_d_o <= 24'h9C0000;
   end else if (sys_wen) begin
      if (sys_addr[19:0] == 16'h0020) dac_a_o <= sys_wdata[23:0];
      if (sys_addr[19:0] == 16'h0024) dac_b_o <= sys_wdata[23:0];
      if (sys_addr[19:0] == 16'h0028) dac_c_o <= sys_wdata[23:0];
      if (sys_addr[19:0] == 16'h002C) dac_d_o <= sys_wdata[23:0];
   end
end

wire sys_en;
assign sys_en = sys_wen | sys_ren;

[MASKED]

endmodule