module autovcoder_020610 (
    input Clk,
    Reset,
    input [31:0] Ain,
    Bin,
    input Start,
    MorD,
    HorL,
    Sign,
    We,
    output Ready,
    output [31:0] DC
);

  reg [63:0] HILO;
  reg [ 5:0] count;
  wire [31:0] DA, DB;
  wire [63:0] BB;

  assign DA = (Sign && Ain[31]) ? (~Ain) + 1 : Ain;
  assign DB = (Sign && Bin[31]) ? (~Bin) + 1 : Bin;

  assign DC = (HorL) ? HILO[63:32] : HILO[31:0];

  assign Ready = (Start && ((count == 6'b100000 && MorD) || (count == 6'b100010 && ~MorD)));

  assign BB = (MorD) ? {{32{1'b0}}, DB} : {DB, {32{1'b0}}};

  [MASKED]

endmodule

