module autovcoder_079790 #(
    parameter TCQ          = 100,
    parameter TAPCNTRWIDTH = 7,
    parameter TAPSPERKCLK  = 112
) (  /*AUTOARG*/
    // Outputs
    fall_lead,
    fall_trail,
    rise_lead,
    rise_trail,
    // Inputs
    clk,
    run_polarity,
    run_end,
    select0,
    select1,
    tap,
    run
);

  input clk;

  input run_polarity;
  input run_end;
  input select0;
  input select1;
  input [TAPCNTRWIDTH-1:0] tap;
  input [TAPCNTRWIDTH-1:0] run;

  wire [TAPCNTRWIDTH:0] trailing_edge = run > tap ? tap + TAPSPERKCLK[TAPCNTRWIDTH-1:0] - run
                                                  : tap - run;

  wire run_end_this = run_end && select0 && select1;

  reg [TAPCNTRWIDTH-1:0] fall_lead_r, fall_trail_r, rise_lead_r, rise_trail_r;
  output [TAPCNTRWIDTH-1:0] fall_lead, fall_trail, rise_lead, rise_trail;
  assign fall_lead  = fall_lead_r;
  assign fall_trail = fall_trail_r;
  assign rise_lead  = rise_lead_r;
  assign rise_trail = rise_trail_r;

  wire [TAPCNTRWIDTH-1:0] fall_lead_ns = run_end_this & run_polarity ? tap : fall_lead_r;
  wire [TAPCNTRWIDTH-1:0] rise_trail_ns = run_end_this & run_polarity ? trailing_edge[TAPCNTRWIDTH-1:0]
                                                                      : rise_trail_r;
  wire [TAPCNTRWIDTH-1:0] rise_lead_ns = run_end_this & ~run_polarity ? tap : rise_lead_r;
  wire [TAPCNTRWIDTH-1:0] fall_trail_ns = run_end_this & ~run_polarity ? trailing_edge[TAPCNTRWIDTH-1:0]
                                                                       : fall_trail_r;

  always @(posedge clk) fall_lead_r <= #TCQ fall_lead_ns;
  always @(posedge clk) fall_trail_r <= #TCQ fall_trail_ns;
  always @(posedge clk) rise_lead_r <= #TCQ rise_lead_ns;
  always @(posedge clk) rise_trail_r <= #TCQ rise_trail_ns;

endmodule

