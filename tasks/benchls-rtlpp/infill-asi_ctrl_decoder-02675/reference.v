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

   always @(ucb_packet_addr) begin
      case (ucb_packet_addr[39:28])
        12'b010000000000:begin
           asi_ctrl = {30'b0100000,ucb_packet_addr[24:23]};
        end
        12'b010000000001:begin
           asi_ctrl = {30'b0010000,ucb_packet_addr[24:23]};
        end
        12'b010000000010:begin
           asi_ctrl = {30'b0001000,ucb_packet_addr[24:23]};
        end
        12'b010000000011:begin
           asi_ctrl = {30'b0000100,ucb_packet_addr[24:23]};
        end
        12'b010000000100:begin
           asi_ctrl = {30'b0000010,ucb_packet_addr[24:23]};
        end
        12'b010000000101:begin
           asi_ctrl = {30'b0000001,ucb_packet_addr[24:23]};
        end
        default:begin
           asi_ctrl = 32'b0;
        end
      endcase
   end 
   
   assign asi_addr = {9'b0,ucb_packet_addr[22:0]};

endmodule