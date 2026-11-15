module rtlpp_02675 (
   asi_ctrl, asi_addr, 
   ucb_packet
   );

   input [127:0]  ucb_packet;
   output [31:0]  asi_ctrl;
   output [31:0]  asi_addr;

   reg [31:0]     asi_ctrl;
   wire [39:0]    ucb_packet_addr;

   assign ucb_packet_addr = ucb_packet[103:64];

   [MASKED] 
   
   assign asi_addr = {9'b0,ucb_packet_addr[22:0]};

endmodule