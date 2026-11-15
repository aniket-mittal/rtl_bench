// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 65;
  localparam OW = 37;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  delay_module_0 dut (
    .clk(clk),
    .addr(in_vec[64:33]),
    .datain(in_vec[32:1]),
    .debug(in_vec[0:0]),
    .dataout(out_vec[36:5]),
    .enb(out_vec[4:4]),
    .web(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 65'h11a38a336dc5f596b;
    stim[1] = 65'h12df8d20f7ecff428;
    stim[2] = 65'h00ca926cc100d9946;
    stim[3] = 65'h0f6af7ee40d0e0243;
    stim[4] = 65'h0c4d4b25ac1f65da3;
    stim[5] = 65'h13b8e2396ef8533a9;
    stim[6] = 65'h054b15cd69ec01651;
    stim[7] = 65'h1c53329c60c8b5be8;
    stim[8] = 65'h15563f413eb459348;
    stim[9] = 65'h1438b6089b3b305a3;
    stim[10] = 65'h1484d72da9032aa84;
    stim[11] = 65'h1c22cd75027f1a588;
    stim[12] = 65'h1c8b26fedb787a5ed;
    stim[13] = 65'h1998f7f23a223256f;
    stim[14] = 65'h0a99604a184a55148;
    stim[15] = 65'h1a3a150a149151027;
    stim[16] = 65'h1273b1623f70fba13;
    stim[17] = 65'h1a5fd487f672226ae;
    stim[18] = 65'h00448e2fe9bc48757;
    stim[19] = 65'h11d2d1b334c6774f4;
    stim[20] = 65'h0a978a4da3814ee8d;
    stim[21] = 65'h032666e7c3326e1a5;
    stim[22] = 65'h125ada1409c4ea530;
    stim[23] = 65'h0b2d01c45d378c05d;
    stim[24] = 65'h05b4b17183abc7100;
    stim[25] = 65'h0a705b4280b2672b5;
    stim[26] = 65'h1d12e3c7bbca9e6ba;
    stim[27] = 65'h10168319d4bdd890b;
    stim[28] = 65'h08b0928963f5635c1;
    stim[29] = 65'h050f04d8969fec1aa;
    stim[30] = 65'h009ca2998d5fb8405;
    stim[31] = 65'h124d97c26fec0ca43;
    stim[32] = 65'h0a5ceacc1daa8a394;
    stim[33] = 65'h0faef1dbdd5ac2e27;
    stim[34] = 65'h0e759b13f41e40833;
    stim[35] = 65'h1caef617b6520ef15;
    stim[36] = 65'h005f9c359e7ea0a4b;
    stim[37] = 65'h1b0afbbe73f18c74f;
    stim[38] = 65'h0f97298cdf4eb717a;
    stim[39] = 65'h10ac7c4dfbc27c194;
    stim[40] = 65'h1df6820bc46cb4ba1;
    stim[41] = 65'h0cc2b624aebcdd929;
    stim[42] = 65'h1f949db9d0e953a4a;
    stim[43] = 65'h05bdef76df9f7551a;
    stim[44] = 65'h0a80d308cbd586e3e;
    stim[45] = 65'h0d81d62a8d1b1665c;
    stim[46] = 65'h11c811ee2adad574b;
    stim[47] = 65'h0f3c54b4d0d0c26b7;
    stim[48] = 65'h1b412f8247bb8818d;
    stim[49] = 65'h0ce9e4bfacbafe783;
    stim[50] = 65'h05278e27119a69a43;
    stim[51] = 65'h1964298b4cde0fd16;
    stim[52] = 65'h0a008e630da49abe9;
    stim[53] = 65'h075ee2724e3524590;
    stim[54] = 65'h038ef08fe7348610e;
    stim[55] = 65'h1479547c19e5e5d9b;
    stim[56] = 65'h004ee714491c6aedd;
    stim[57] = 65'h047dcc86ba01b28d4;
    stim[58] = 65'h0d3fbe4c48f365bcc;
    stim[59] = 65'h0c156b6b29731251c;
    stim[60] = 65'h044a9f0e519b66696;
    stim[61] = 65'h09976b40f50d953a4;
    stim[62] = 65'h0bc48d829767f8b06;
    stim[63] = 65'h1a890016fac1d013f;
    for (c = 0; c < N; c = c + 1) begin
      #1 in_vec = stim[c];
      #3 sample;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 37'hxxxxxxxxxx;
      expv[1] = 37'hxxxxxxxxxf;
      expv[2] = 37'hxxxxxxxxx0;
      expv[3] = 37'hxxxxxxxxx0;
      expv[4] = 37'hxxxxxxxxxf;
      expv[5] = 37'hxxxxxxxxxf;
      expv[6] = 37'hxxxxxxxxxf;
      expv[7] = 37'hxxxxxxxxxf;
      expv[8] = 37'hxxxxxxxxx0;
      expv[9] = 37'hxxxxxxxxx0;
      expv[10] = 37'hxxxxxxxxxf;
      expv[11] = 37'hxxxxxxxxx0;
      expv[12] = 37'hxxxxxxxxx0;
      expv[13] = 37'hxxxxxxxxxf;
      expv[14] = 37'hxxxxxxxxxf;
      expv[15] = 37'hxxxxxxxxx0;
      expv[16] = 37'hxxxxxxxxxf;
      expv[17] = 37'hxxxxxxxxxf;
      expv[18] = 37'hxxxxxxxxx0;
      expv[19] = 37'hxxxxxxxxxf;
      expv[20] = 37'hxxxxxxxxx0;
      expv[21] = 37'hxxxxxxxxxf;
      expv[22] = 37'hxxxxxxxxxf;
      expv[23] = 37'hxxxxxxxxx0;
      expv[24] = 37'hxxxxxxxxxf;
      expv[25] = 37'hxxxxxxxxx0;
      expv[26] = 37'hxxxxxxxxxf;
      expv[27] = 37'hxxxxxxxxx0;
      expv[28] = 37'hxxxxxxxxxf;
      expv[29] = 37'hxxxxxxxxxf;
      expv[30] = 37'hxxxxxxxxx0;
      expv[31] = 37'hxxxxxxxxxf;
      expv[32] = 37'hxxxxxxxxxf;
      expv[33] = 37'hxxxxxxxxx0;
      expv[34] = 37'hxxxxxxxxxf;
      expv[35] = 37'hxxxxxxxxxf;
      expv[36] = 37'hxxxxxxxxxf;
      expv[37] = 37'hxxxxxxxxxf;
      expv[38] = 37'hxxxxxxxxxf;
      expv[39] = 37'hxxxxxxxxx0;
      expv[40] = 37'hxxxxxxxxx0;
      expv[41] = 37'hxxxxxxxxxf;
      expv[42] = 37'hxxxxxxxxxf;
      expv[43] = 37'hxxxxxxxxx0;
      expv[44] = 37'hxxxxxxxxx0;
      expv[45] = 37'hxxxxxxxxx0;
      expv[46] = 37'hxxxxxxxxx0;
      expv[47] = 37'hxxxxxxxxxf;
      expv[48] = 37'hxxxxxxxxxf;
      expv[49] = 37'hxxxxxxxxxf;
      expv[50] = 37'hxxxxxxxxxf;
      expv[51] = 37'hxxxxxxxxxf;
      expv[52] = 37'hxxxxxxxxx0;
      expv[53] = 37'hxxxxxxxxxf;
      expv[54] = 37'hxxxxxxxxx0;
      expv[55] = 37'hxxxxxxxxx0;
      expv[56] = 37'hxxxxxxxxxf;
      expv[57] = 37'hxxxxxxxxxf;
      expv[58] = 37'hxxxxxxxxx0;
      expv[59] = 37'hxxxxxxxxx0;
      expv[60] = 37'hxxxxxxxxx0;
      expv[61] = 37'hxxxxxxxxx0;
      expv[62] = 37'hxxxxxxxxx0;
      expv[63] = 37'hxxxxxxxxx0;
      mismatches = 0;
      shown = 0;
      for (c = 0; c < N; c = c + 1) begin
        bad = 0;
        for (b = 0; b < OW; b = b + 1)
          if (expv[c][b] !== 1'bx && act[c][b] !== expv[c][b]) bad = 1;
        if (bad) begin
          mismatches = mismatches + 1;
          if (shown < 10) begin
            $display("MISMATCH cycle %0d: inputs=%h expected=%h got=%h", c, stim[c], expv[c], act[c]);
            shown = shown + 1;
          end
        end
      end
      if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
      else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    end
    $finish;
  end
endmodule
