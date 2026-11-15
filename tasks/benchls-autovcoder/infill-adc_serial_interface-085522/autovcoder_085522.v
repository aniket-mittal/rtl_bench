module autovcoder_085522 (
    clk,
    reset,
    sdin0,
    sdin1,
    cs,
    sclk,
    dout0,
    dout1,
    w_dout_valid
);

  input clk;
  input reset;
  input sdin0;
  input sdin1;
  output cs;
  output sclk;
  output reg [15:0] dout0 = 0;
  output reg [15:0] dout1 = 0;

  output w_dout_valid;

  localparam state0 = 0;  // Reset & Time Delay
  localparam state1 = 1;  // Filling Data[15:0]
  localparam state2 = 2;  // Data Transfer

  reg [1:0] state;
  reg [16:0] cnt0;
  reg [16:0] cnt1;
  reg r_cs;
  reg r_sclk;
  reg [15:0] r_dout0;
  reg [15:0] r_dout1;
  reg dout_valid;

  assign cs = r_cs;
  assign sclk = r_sclk;
  assign w_dout_valid = dout_valid;

  always @(posedge r_sclk) begin
    if (!r_cs) begin
      r_dout0 <= {r_dout0[14:0], sdin0};  // Filling Data
      r_dout1 <= {r_dout1[14:0], sdin1};  // Filling Data
    end else begin
      r_dout0 <= r_dout0;
      r_dout1 <= r_dout1;
    end
  end

  [MASKED]

endmodule

