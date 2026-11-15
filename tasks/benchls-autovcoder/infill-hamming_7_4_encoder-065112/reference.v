module autovcoder_065112 (
    clk,
    reset,
    data_in,
    dvin,
    code,
    dvout
);

  input clk, reset;
  input [3:0] data_in;
  input dvin;

  output [6:0] code;
  output dvout;
  reg [6:0] code;
  reg dvout;

  reg [3:0] datareg;
  reg dvinreg;

  ////////////////////////////////////////////
  ////// matrix multiplication ///////////////
  ////////////////////////////////////////////

  wire c0 = datareg[3] ^ datareg[2] ^ datareg[0];
  wire c1 = datareg[3] ^ datareg[1] ^ datareg[0];
  wire c2 = datareg[3];
  wire c3 = datareg[2] ^ datareg[1] ^ datareg[0];
  wire c4 = datareg[2];
  wire c5 = datareg[1];
  wire c6 = datareg[0];

  ////////////////////////////////////////////
  ///////////// Getting inputs ///////////////
  ////////////////////////////////////////////

  always @(posedge clk or negedge reset)
    if (!reset) dvinreg <= 1;
    else dvinreg <= dvin;

  always @(posedge clk)
    if (reset) datareg <= 0;
    else if (!dvin) datareg <= data_in;



  ////////////////////////////////////////////
  // Codeword is generated 1-clock cycle /////
  // after the inputs are registered.    /////
  ////////////////////////////////////////////

  always @(posedge clk)
    if (reset) dvout <= 1;
    else dvout <= dvinreg;

  always @(posedge clk)
    if (reset) code <= 0;
    else code <= {c6, c5, c4, c3, c2, c1, c0};


endmodule

