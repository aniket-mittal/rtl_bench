module autovcoder_095475 (
    O0,
    O1,
    O2,
    O3,
    A0,
    A1,
    A2,
    A3,
    D0,
    D1,
    D2,
    D3,
    WCLK,
    WE
);

  parameter INIT_00 = 16'h0000;
  parameter INIT_01 = 16'h0000;
  parameter INIT_02 = 16'h0000;
  parameter INIT_03 = 16'h0000;

  output O0, O1, O2, O3;

  input A0, A1, A2, A3, D0, D1, D2, D3, WCLK, WE;

  reg  [15:0] mem0;
  reg  [15:0] mem1;
  reg  [15:0] mem2;
  reg  [15:0] mem3;

  wire [ 3:0] adr;

  assign adr = {A3, A2, A1, A0};
  assign O0  = mem0[adr];
  assign O1  = mem1[adr];
  assign O2  = mem2[adr];
  assign O3  = mem3[adr];

  initial begin
    mem0 = INIT_00;
    mem1 = INIT_01;
    mem2 = INIT_02;
    mem3 = INIT_03;
  end

  always @(posedge WCLK)
    if (WE == 1'b1) begin
      mem0[adr] <= #100 D0;
      mem1[adr] <= #100 D1;
      mem2[adr] <= #100 D2;
      mem3[adr] <= #100 D3;
    end

endmodule

