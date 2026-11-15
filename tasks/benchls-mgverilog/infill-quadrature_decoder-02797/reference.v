module mg_02797 (clk,en_in,process,pre_first,cycle_div,deglitch_cur,deglitch_new,encoder,encoder_used,encoder_new,pre_incdec,inc,dec,inc_dec);
parameter IGNORE_EN=1; 
  input clk; 
  input en_in; 
  input process; 
  input pre_first; 
  input [3:0] cycle_div; 
  input [4:0] deglitch_cur; 
  output [4:0] deglitch_new; 
  input [1:0] encoder; 
  input [1:0] encoder_used; 
  output [1:0] encoder_new; 
  output pre_incdec; 
  output inc; 
  output dec; 
  output inc_dec; 
  wire en=(IGNORE_EN)?1'b1:en_in; 
  wire [4:0] deglitch_new; 
  wire [1:0] encoder_new; 
  reg inc; 
  reg dec; 
  reg inc_dec; 
  reg [3:0] cycle_cntr; 
  reg deglitch_next; 
  wire pre_incdec; 
  assign deglitch_new=(!en || (encoder[1:0]==encoder_used[1:0]))?0:((deglitch_cur==5'h1f)?5'h1f:(deglitch_cur+deglitch_next)); 
  assign encoder_new= (!en || (deglitch_cur==5'h1f))?encoder:encoder_used; 
  assign pre_incdec=en && (encoder_new[1:0]!=encoder_used[1:0]); 
  always @ (posedge clk) if (pre_first) begin 
  cycle_cntr= (!en || (cycle_cntr==0))?cycle_div:(cycle_cntr-1); 
  deglitch_next= en && (cycle_cntr==0); 
  end 
  always @ (posedge clk) if (process) begin 
  inc_dec <= pre_incdec; 
 dec<=en && ((encoder_new==2'b00) && (encoder_used==2'b01) ||(encoder_new==2'b01) && (encoder_used==2'b11) ||(encoder_new==2'b11) && (encoder_used==2'b10) ||(encoder_new==2'b10) && (encoder_used==2'b00)); 
 inc<=en && ((encoder_new==2'b00) && (encoder_used==2'b10) ||(encoder_new==2'b10) && (encoder_used==2'b11) ||(encoder_new==2'b11) && (encoder_used==2'b01) ||(encoder_new==2'b01) && (encoder_used==2'b00)); 
  end 
 endmodule