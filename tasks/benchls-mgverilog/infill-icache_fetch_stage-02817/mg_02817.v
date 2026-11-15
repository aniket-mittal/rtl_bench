module mg_02817(input wire [31:0] di_PC,output reg [31:0] do_IR,output reg [31:0] do_NextPC,output wire [31:0] icache_address,input wire icache_hit,input wire icache_should_stall,input wire [31:0] icache_data);
assign icache_address = di_PC; 
 [MASKED] 
 endmodule