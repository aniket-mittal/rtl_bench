module rtlpp_05322
  (
   input wire [21:0] addr,
   input wire [31:0] datain,
   input wire       req,
   input wire       write,
   output reg [31:0] dataout,
   output wire      ack,
   output wire      decode,

   input wire [15:0] spyin,
   output reg [15:0] spyout,
   output wire [3:0] spyreg,
   output wire      spyrd,
   output wire      spywr,

   input wire       clk,
   input wire       reset
   );

   reg [2:0] ack_delayed = 0;
   reg [2:0] ack_state = 0;

   wire      spyrd_d;

   always @(posedge clk) begin
      ack_delayed <= {ack_delayed[1:0], decode};
      ack_state <= {ack_state[1:0], ~ack_delayed[0] && decode};
   end

   assign spyrd_d = ack_state[1] && ~write;

   always @(posedge clk) begin
      if (spyrd_d) begin
         dataout <= spyin;
      end

      if (req & decode) begin
         if (write) begin
            spyout <= datain[15:0];
         end 
         // Empty else kept for symmetry and future extensibility
      end
   end

   assign decode = req & ({addr[21:6], 6'b0} == 22'o17766000);
   assign ack = ack_delayed[2];

   assign spyreg = addr[3:0];
   assign spyrd = ack_state[0] && ~write;
   assign spywr = ack_state[0] && write;

endmodule