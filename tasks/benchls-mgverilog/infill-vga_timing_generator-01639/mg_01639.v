module mg_01639(input clk, output h_sync, output v_sync, output blank,input gfx_clk, output[9:0] x, output[9:0] y, input rst);
reg[9:0] hcount, vcount; 
 assign h_sync = hcount < 96 ? 1'b0 : 1'b1; 
 assign v_sync = vcount < 2 ? 1'b0 : 1'b1; 
 assign blank = h_sync & v_sync; 
 assign x = hcount - 10'd144; 
 assign y = vcount - 10'd34; 
 [MASKED] 
 endmodule