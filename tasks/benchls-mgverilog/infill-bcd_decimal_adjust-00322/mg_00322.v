module mg_00322 (input [7:0]flags,input [7:0]val,output wire [7:0]adjust,output reg cdaa,output reg hdaa);
wire h08 = val[7:4] < 9; 
  wire h09 = val[7:4] < 10; 
  wire l05 = val[3:0] < 6; 
  wire l09 = val[3:0] < 10; 
  reg [1:0]aa; 
  assign adjust = ({1'b0, aa[1], aa[1], 2'b0, aa[0], aa[0], 1'b0} ^ {8{flags[1]}}) + flags[1]; 
  [MASKED] 
 endmodule