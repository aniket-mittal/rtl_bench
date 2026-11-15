module rtlpp_09078 (
   input clk_i,  
   input rstn_i,  
   
   output reg [7:0] dac_a_o,  
   output reg [7:0] dac_b_o,  
   output reg [7:0] dac_c_o,  
   output reg [7:0] dac_d_o,  
   
   input [31:0] sys_addr,  
   input [31:0] sys_wdata,  
   input sys_wen,  
   input sys_ren,  
   output reg [31:0] sys_rdata,  
   output reg sys_err,  
   output reg sys_ack
);

always @(posedge clk_i) begin
   if (!rstn_i) begin
      dac_a_o <= 8'h0F;
      dac_b_o <= 8'h4E;
      dac_c_o <= 8'h75;
      dac_d_o <= 8'h9C;
   end else begin
      if (sys_wen) begin
         if (sys_addr[19:0] == 20'h20) dac_a_o <= sys_wdata[23:16];
         if (sys_addr[19:0] == 20'h24) dac_b_o <= sys_wdata[23:16];
         if (sys_addr[19:0] == 20'h28) dac_c_o <= sys_wdata[23:16];
         if (sys_addr[19:0] == 20'h2C) dac_d_o <= sys_wdata[23:16];
      end
   end
end

wire sys_en;
assign sys_en = sys_wen | sys_ren;

always @(posedge clk_i) begin
   if (!rstn_i) begin
      sys_err <= 1'b0;
      sys_ack <= 1'b0;
   end else begin
      sys_err <= 1'b0;
      casez (sys_addr[19:0])
         20'h00020: begin 
            sys_ack <= sys_en; 
            sys_rdata <= { {31-8{1'b0}}, dac_a_o, {31-16{1'b0}} }; 
         end
         20'h00024: begin 
            sys_ack <= sys_en; 
            sys_rdata <= { {31-8{1'b0}}, dac_b_o, {31-16{1'b0}} }; 
         end
         20'h00028: begin 
            sys_ack <= sys_en; 
            sys_rdata <= { {31-8{1'b0}}, dac_c_o, {31-16{1'b0}} }; 
         end
         20'h0002C: begin 
            sys_ack <= sys_en; 
            sys_rdata <= { {31-8{1'b0}}, dac_d_o, {31-16{1'b0}} }; 
         end
         default: begin 
            sys_ack <= sys_en; 
            sys_rdata <= 32'h0; 
         end
      endcase
   end
end

endmodule