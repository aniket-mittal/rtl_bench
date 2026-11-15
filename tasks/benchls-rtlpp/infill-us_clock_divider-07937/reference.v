module rtlpp_07937(
   us_clk,
   clk, reset
   );

   parameter SYS_CLK = 26'd50000000;
   parameter US_CLK_RATE = 26'd1000000;
   parameter US_CLK_DIV = SYS_CLK / US_CLK_RATE;

   input clk;
   input reset;

   output reg [31:0] us_clk;

   reg [7:0] us_counter;
   wire [25:0] us_clk_div;

   assign us_clk_div = US_CLK_DIV;

   always @(posedge clk or posedge reset)
     if (reset) begin
        us_clk <= 32'h0;
        us_counter <= 8'h0;
     end else if (us_counter == us_clk_div[7:0]) begin
        us_counter <= 0;
        us_clk <= us_clk + 1;
     end else begin
        us_counter <= us_counter + 8'd1;
     end

endmodule