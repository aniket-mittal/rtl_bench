// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 64;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01672 dut (
    .a(in_vec[63:32]),
    .b(in_vec[31:0]),
    .Z(out_vec[32:1]),
    .ovf(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 64'h8cb1d782113fc73b;
    stim[1] = 64'hffa090e1ce01ba22;
    stim[2] = 64'h0445372d91006d7a;
    stim[3] = 64'h9fd31f54fc56c931;
    stim[4] = 64'heff4e016c3ee828e;
    stim[5] = 64'h59255e1328280d90;
    stim[6] = 64'h1a10cfd10216b69a;
    stim[7] = 64'h66d032fb9efa1f1e;
    stim[8] = 64'heb76b5d8a2b4d029;
    stim[9] = 64'hd4590df1e81e2069;
    stim[10] = 64'h9df480e6f335fe2f;
    stim[11] = 64'h7b1290d133cbfc88;
    stim[12] = 64'hfa35103285b2017f;
    stim[13] = 64'hac1f1ffca2e17beb;
    stim[14] = 64'h5318b9457963a76f;
    stim[15] = 64'hfcfc0c8a89a74140;
    stim[16] = 64'hfa45bb0fa0d8d889;
    stim[17] = 64'h206ba596ba172e2f;
    stim[18] = 64'h9f2ff9c85df09c48;
    stim[19] = 64'ha02dc55a67d3b61b;
    stim[20] = 64'h1a6fbdc3a53a6c2f;
    stim[21] = 64'h19fa7cecaf7a7759;
    stim[22] = 64'h8fc3315af76176e2;
    stim[23] = 64'hc0093cea8fc13cf0;
    stim[24] = 64'h31eef10245420c6e;
    stim[25] = 64'h59bf0d534eda543d;
    stim[26] = 64'h6a01c254c2da46bc;
    stim[27] = 64'h63e102f84d92e698;
    stim[28] = 64'h43ae0d712502dc30;
    stim[29] = 64'hd973f67537e0cd32;
    stim[30] = 64'h4bd110d71bf98046;
    stim[31] = 64'h7a8eff0ada76e5f8;
    stim[32] = 64'hbec5c9513c20358e;
    stim[33] = 64'h99f2679a1c7bb956;
    stim[34] = 64'h37b7d988ca4d5ec8;
    stim[35] = 64'h9583b6ae20787551;
    stim[36] = 64'h4a8050c0d37eb39b;
    stim[37] = 64'h4de63d19c1a567c8;
    stim[38] = 64'hb7ab08ce39db4e87;
    stim[39] = 64'h2c481791e2dbf782;
    stim[40] = 64'h4e220f085e63b195;
    stim[41] = 64'h7abd8d86ce9492cb;
    stim[42] = 64'hbd0a4401712d6be5;
    stim[43] = 64'h1a094cc4335cc29d;
    stim[44] = 64'hc79b3f58aa2d22d8;
    stim[45] = 64'h652607726c5d4998;
    stim[46] = 64'hddbf2690ce542e23;
    stim[47] = 64'h33f661c309b15a59;
    stim[48] = 64'ha353d0156f336ff5;
    stim[49] = 64'h4339509ca3dcaaec;
    stim[50] = 64'h278f433fc4990cdc;
    stim[51] = 64'h1bac759c75187f94;
    stim[52] = 64'hfe6c653d2962f307;
    stim[53] = 64'hd4c82f8d5482329f;
    stim[54] = 64'h484fc683b8f50254;
    stim[55] = 64'hfd07dce3ac86cc19;
    stim[56] = 64'h93b305de0179b127;
    stim[57] = 64'h32a3413f51f78730;
    stim[58] = 64'h928116d5a72911f8;
    stim[59] = 64'h37f082e9592bf85e;
    stim[60] = 64'hc08a2f89bdbac315;
    stim[61] = 64'h3f97cf679e030060;
    stim[62] = 64'h3146fd0677bbd260;
    stim[63] = 64'hea24e844463e40cb;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 33'h0091bdf72;
      expv[1] = 33'h19b449607;
      expv[2] = 33'h119766c9a;
      expv[3] = 33'h13853d10b;
      expv[4] = 33'h167c6c549;
      expv[5] = 33'h0029ad747;
      expv[6] = 33'h0384f0cd6;
      expv[7] = 33'h08fac27ba;
      expv[8] = 33'h11c570c03;
      expv[9] = 33'h178ee5cb5;
      expv[10] = 33'h12254fe2b;
      expv[11] = 33'h05dbd1ab3;
      expv[12] = 33'h1ffce2362;
      expv[13] = 33'h19e0137ce;
      expv[14] = 33'h098f8c169;
      expv[15] = 33'h10d469b95;
      expv[16] = 33'h1363d2731;
      expv[17] = 33'h133571132;
      expv[18] = 33'h07d814500;
      expv[19] = 33'h08f4be182;
      expv[20] = 33'h115955cd8;
      expv[21] = 33'h12afff4da;
      expv[22] = 33'h10e495079;
      expv[23] = 33'h19f94f3b4;
      expv[24] = 33'h0ee61fae0;
      expv[25] = 33'h05132c321;
      expv[26] = 33'h04e4ef730;
      expv[27] = 33'h062e7d321;
      expv[28] = 33'h0d161d342;
      expv[29] = 33'h143265286;
      expv[30] = 33'h0cf95223a;
      expv[31] = 33'h040303224;
      expv[32] = 33'h1054b2786;
      expv[33] = 33'h00512a378;
      expv[34] = 33'h1252b0a80;
      expv[35] = 33'h015e97d46;
      expv[36] = 33'h111fcc5b6;
      expv[37] = 33'h01881aaa2;
      expv[38] = 33'h004608b72;
      expv[39] = 33'h16d27bfe2;
      expv[40] = 33'h0590b813b;
      expv[41] = 33'h05851f576;
      expv[42] = 33'h068464fc8;
      expv[43] = 33'h09acc1ec2;
      expv[44] = 33'h1e390c460;
      expv[45] = 33'h0a306a215;
      expv[46] = 33'h15826a967;
      expv[47] = 33'h07b4f7838;
      expv[48] = 33'h097bf3fc0;
      expv[49] = 33'h03eb94b60;
      expv[50] = 33'h13a13933a;
      expv[51] = 33'h02189ea61;
      expv[52] = 33'h1aa12e46c;
      expv[53] = 33'h1008bf9dc;
      expv[54] = 33'h01eb5885e;
      expv[55] = 33'h1531d51f9;
      expv[56] = 33'h12472a96e;
      expv[57] = 33'h0093590df;
      expv[58] = 33'h17354519a;
      expv[59] = 33'h02238f68f;
      expv[60] = 33'h1fc89e53c;
      expv[61] = 33'h043299e0e;
      expv[62] = 33'h052059ecd;
      expv[63] = 33'h147cd4ef2;
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
