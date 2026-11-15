module rtlpp_04026
  (
   input      clk, 
   input      RSYNC,
   input      RRPLY,
   input      RDMR,
   input      RSACK,
   input      RINIT,
   input      RDMGI,
   output reg TSYNC,
   output reg TDIN,
   output reg TDOUT,
   output reg TDMR,
   output reg TSACK, 
   output reg TDMGO,
   input      dma_read,
   input      dma_write,
   output reg assert_addr,
   output reg assert_data,
   output reg latch_read_data,
   output reg nxm
   );

`ifdef SIM
   integer state_index;
`endif
   reg [0:12] state;
   localparam
     IDLE = 0,			
     REQ = 1,			
     ACQ = 2,			
     BEGIN = 3,			
     READ = 4,			
     READ_DATA = 5,		
     READ_DONE = 6,		
     RPLY_CLEAR = 7,		
     WRITE = 10,		
     RELEASE = 12;		
   
   task set_state;
      input integer s;
      begin
`ifdef SIM
	 state_index <= s;
`endif
	 state[s] <= 1'b1;
      end
   endtask
   
   reg [7:0] timeout_count;
   wire timeout = timeout_count == 0;

   always @(posedge clk or posedge RINIT) begin
     if (RINIT)
       TDMGO <= 0;
     else if (RDMGI && state[IDLE])
       TDMGO <= 1;
     else
       TDMGO <= 0;
   end

   reg [0:1] RSYNCsr, RRPLYsr, TDMGOsr;
   reg [0:2] RDMGIsr;

   always @(posedge clk or posedge RINIT) begin
     if (RINIT) begin
       RSYNCsr <= 0;
       RRPLYsr <= 0; 
       RDMGIsr <= 0; 
       TDMGOsr <= 0;
     end else begin
       RSYNCsr <= { RSYNCsr[1], RSYNC };
       RRPLYsr <= { RRPLYsr[1], RRPLY };
       TDMGOsr <= { TDMGOsr[1], TDMGO };
       RDMGIsr <= { RDMGIsr[1:2], RDMGI };
     end
   end

   wire sRSYNC = RSYNCsr[0],
        sRRPLY = RRPLYsr[0],
        sTDMGO = TDMGOsr[0],
        sRDMGI = RDMGIsr[0];

   always @(posedge clk or posedge RINIT) begin
     if (RINIT) begin
       state <= 0;
       set_state(IDLE);
       TDMR <= 0;
       TSACK <= 0;
       TSYNC <= 0;
       TDIN <= 0;
       TDOUT <= 0;
       assert_addr <= 0;
       assert_data <= 0;
       latch_read_data <= 0;
       nxm <= 0;
     end else begin
       timeout_count <= timeout_count - 1;
       state <= 0;
       case (1'b1)
         state[IDLE]:
           begin
             nxm <= 0;
             if (dma_read || dma_write) begin
               TDMR <= 1;
               set_state(REQ);
             end else
               set_state(IDLE);
           end

         state[REQ]:
           if (sRDMGI && !sTDMGO && !sRSYNC && !sRRPLY) begin
             TDMR <= 0;
             TSACK <= 1;
             assert_addr <= 1;
             timeout_count <= 2;
             set_state(ACQ);
           end else
             set_state(REQ);

         state[ACQ]:
           if (timeout) begin
             TSYNC <= 1;
             timeout_count <= 1;
             set_state(BEGIN);
           end else
             set_state(ACQ);

         state[BEGIN]:
           if (timeout) begin
             assert_addr <= 0;
             if (dma_write) begin
               assert_data <= 1;
               set_state(WRITE);
             end else begin
               TDIN <= 1;
               timeout_count <= 200;
               set_state(READ);
             end
           end else 
             set_state(BEGIN);

         state[READ]:
           if (sRRPLY) begin  
             set_state(READ_DATA);
           end else if (timeout) begin 
             TDIN <= 0;
             nxm <= 1;
             set_state(RELEASE);
           end else
             set_state(READ);

         state[READ_DATA]:
           begin
             latch_read_data <= 1;
             set_state(READ_DONE);
           end

         state[READ_DONE]:
           begin
             TDIN <= 0;
             latch_read_data <= 0;
             set_state(RPLY_CLEAR);
           end

         state[RPLY_CLEAR]:
           if (!sRRPLY) begin
             TSYNC <= 0;
             TSACK <= 0;
             set_state(IDLE);
           end else
             set_state(RPLY_CLEAR);
       endcase
     end
   end

endmodule