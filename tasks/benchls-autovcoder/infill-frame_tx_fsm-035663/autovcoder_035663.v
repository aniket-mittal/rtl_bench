module autovcoder_035663 (
    clk_top,
    rst,
    SystemEnd,
    SystemStart,
    PHYInitEnd,
    NumbFrameReturned,
    DistFrameReturned,
    DelayFrameReturned,
    DelayDistFrameReturned,
    ConfigEnd,
    DataFrameGo,
    StateIdle,
    StateNumb,
    StateDist,
    StateDelay,
    StateDelayDist,
    StateData,
    StateWait
);

  input       clk_top;   // I think this should be the TX clock since it control the start of transmitting frames
  input rst;
  input SystemEnd;
  input SystemStart;
  input PHYInitEnd;
  input NumbFrameReturned;
  input DistFrameReturned;
  input DelayFrameReturned;
  input DelayDistFrameReturned;
  input ConfigEnd;
  input DataFrameGo;

  output StateIdle;
  output StateNumb;
  output StateDist;
  output StateDelay;
  output StateDelayDist;
  output StateData;
  output StateWait;

  reg  StateIdle;
  reg  StateNumb;
  reg  StateDist;
  reg  StateDelay;
  reg  StateDelayDist;
  reg  StateData;
  reg  StateWait;

  wire StartIdle;
  wire StartNumb;
  wire StartDist;
  wire StartDelay;
  wire StartDelayDist;
  wire StartData;
  wire StartWait;

  assign StartIdle      = SystemEnd;

  assign StartNumb      = StateIdle & SystemStart & PHYInitEnd;

  assign StartDist      = StateWait & NumbFrameReturned;

  assign StartDelay     = StateWait & DistFrameReturned;

  assign StartDelayDist = StateWait & DelayFrameReturned;

  assign StartData      = StateWait & (DelayDistFrameReturned | ConfigEnd & DataFrameGo);

  assign StartWait      = StateNumb | StateDist | StateDelay | StateDelayDist | StateData;


  [MASKED]

endmodule

