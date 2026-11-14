module autovcoder_009039 (
    Rs1E,
    Rs2E,
    ForwardAE,
    ForwardBE,
    RdM,
    RdW,
    RegWriteM,
    RegWriteW,
    ResultSrc0,
    RdE,
    Rs1D,
    Rs2D,
    StallF,
    StallD,
    FlushE,
    PCSrcE,
    FlushD,
    intrupt,
    FlushM,
    ret
);

  input [4:0] Rs1E, Rs2E, Rs1D, Rs2D, RdE, RdM, RdW;
  input RegWriteM, RegWriteW, ResultSrc0, PCSrcE, intrupt, ret;
  output reg [1:0] ForwardAE, ForwardBE;
  output reg StallF, StallD, FlushE, FlushD, FlushM;
  reg lwStall;

  always @(*) begin
    if (((Rs1E == RdM) & RegWriteM) & (Rs1E != 0)) ForwardAE = 2'b10;

    else if (((Rs1E == RdW) & RegWriteW) & (Rs1E != 0)) ForwardAE = 2'b01;

    else ForwardAE = 2'b00;
  end

  always @(*) begin
    if (((Rs2E == RdM) & RegWriteM) & (Rs2E != 0)) ForwardBE = 2'b10;

    else if (((Rs2E == RdW) & RegWriteW) & (Rs2E != 0)) ForwardBE = 2'b01;

    else ForwardBE = 2'b00;
  end

  always @(*) begin

    lwStall = ResultSrc0 & ((Rs1D == RdE) || (Rs2D == RdE));

    FlushE  = lwStall || PCSrcE || intrupt;
    StallD  = lwStall;
    StallF  = lwStall;

    FlushD  = PCSrcE || intrupt || ret;

    FlushM  = intrupt;

  end

endmodule

