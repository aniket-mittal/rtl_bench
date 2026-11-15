module ad_edge_detect #(

  parameter   EDGE = 0
) (
  input                   clk,
  input                   rst,

  input                   signal_in,
  output  reg             signal_out
);

  localparam  POS_EDGE = 0;
  localparam  NEG_EDGE = 1;
  localparam  ANY_EDGE = 2;

  reg         ff_m1 = 0;
  reg         ff_m2 = 0;

  always @(posedge clk) begin
    if (rst == 1) begin
      ff_m1 <= 0;
      ff_m2 <= 0;
    end else begin
      ff_m1 <= signal_in;
      ff_m2 <= ff_m1;
    end
  end

  [MASKED]

endmodule