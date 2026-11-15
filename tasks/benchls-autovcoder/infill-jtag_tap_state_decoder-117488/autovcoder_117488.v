module autovcoder_117488 (
    input  tck,
    tms,
    trst,
    output cdr1,
    sdr1,
    udr1,
    cir1,
    sir1,
    uir1
);

  /*where -
c= capture
u= update
s= shift
dr= data register
ir= instruction register
tck = input clock
tms = state mode signal
trst= reset signal

*/
  localparam TEST_LOGIC_RESET = 4'h0;
  localparam RUN_TEST_IDLE = 4'h1;
  localparam SELECT_DR = 4'h2;
  localparam CAPTURE_DR = 4'h3;
  localparam SHIFT_DR = 4'h4;
  localparam EXIT1_DR = 4'h5;
  localparam EXIT2_DR = 4'h6;
  localparam UPDATE_DR = 4'h7;
  localparam PAUSE_DR = 4'h8;
  localparam SELECT_IR = 4'h9;
  localparam CAPTURE_IR = 4'hA;
  localparam SHIFT_IR = 4'hB;
  localparam EXIT1_IR = 4'hC;
  localparam EXIT2_IR = 4'hD;
  localparam UPDATE_IR = 4'hE;
  localparam PAUSE_IR = 4'hf;

  reg [3:0] state;  // next_state;
  //reg cdr1, sdr1, udr1, cir1,sir1,uir1;

  assign cdr1 = (state == CAPTURE_DR);
  assign sdr1 = (state == SHIFT_DR);
  assign udr1 = (state == UPDATE_DR);
  assign cir1 = (state == CAPTURE_IR);
  assign sir1 = (state == SHIFT_IR);
  assign uir1 = (state == UPDATE_IR);

  [MASKED]



endmodule

