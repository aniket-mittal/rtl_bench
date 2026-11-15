module autovcoder_092972 (
    input  wire       clock,
    input  wire       reset,
    input  wire [3:0] high,        // IOCPU, prescaleregister
    input  wire [3:0] low,         // IOCPU, prescaleregister
    output reg        Prescale_EN  // DW 2005.06.21 Prescale Enable
);

  //tmrg default triplicate
  //tmrg tmr_error false

  reg  [3:0] lo_count;
  reg  [3:0] hi_count;
  reg        hilo;
  // int_high, int_low entfallen, conversion entfaellt

  wire [3:0] lo_countVoted = lo_count;
  wire [3:0] hi_countVoted = hi_count;
  wire [3:0] hiloVoted = hilo;


  [MASKED]
endmodule

