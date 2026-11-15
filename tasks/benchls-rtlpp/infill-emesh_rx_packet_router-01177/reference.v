module rtlpp_01177 (
   erx_access, erx_packet,
   clk, test_mode, rx_packet, rx_burst, rx_access
   );

   parameter AW   = 32;
   parameter DW   = 32;
   parameter PW   = 104;
   parameter ID   = 12'h999; 
   
   input            clk;
   input            test_mode;
   input  [PW-1:0]  rx_packet;
   input            rx_burst;
   input            rx_access;
   
   output           erx_access;
   output [PW-1:0]  erx_packet;
   
   reg              erx_access;
   reg    [PW-1:0]  erx_packet;
   reg    [31:0]    dstaddr_reg;
   wire   [31:0]    dstaddr_next;
   wire   [31:0]    dstaddr_mux;
   wire   [31:0]    rx_addr;
   
   assign rx_addr = rx_packet[39:8];
   
   always @ (posedge clk) begin
     if (rx_access)
       dstaddr_reg <= dstaddr_mux;
   end

   assign dstaddr_next = dstaddr_reg + 4'b1000;
   
   assign dstaddr_mux = rx_burst ? dstaddr_next : rx_addr;
   
   always @ (posedge clk) begin
     erx_access <= ~test_mode & rx_access;
     erx_packet <= {rx_packet[PW-1:40], dstaddr_mux, {1'b0, rx_packet[7:1]}};
   end

endmodule