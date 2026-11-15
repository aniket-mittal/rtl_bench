module mg_00152(input wire clk,input wire trig_i,output reg trig_o);
wire [255:0] C = {32'h1111_1111, 
  32'h2222_2222, 
  32'h3333_3333, 
  32'h4444_4444, 
  32'h5555_5555, 
  32'h6666_6666, 
  32'h7777_7777, 
  32'h8888_8888}; 
  always @(posedge clk) begin 
  trig_o <= 1'd0; 
  if (trig_i) begin 
  ; 
  ; 
  ; 
  ; 
  ; 
  trig_o <= 1'd1; 
  end 
  end 
 endmodule