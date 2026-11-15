// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 37;
  localparam OW = 43;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_08150 dut (
    .clk(clk),
    .address(in_vec[36:35]),
    .chipselect(in_vec[34:34]),
    .reset_n(in_vec[33:33]),
    .write_n(in_vec[32:32]),
    .writedata(in_vec[31:0]),
    .out_port(out_vec[42:32]),
    .readdata(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 37'h141772f420;
    stim[1] = 37'h01f14d4fbd;
    stim[2] = 37'h12b475921f;
    stim[3] = 37'h0a4e3bc7c8;
    stim[4] = 37'h1b0fd25e62;
    stim[5] = 37'h0aee886766;
    stim[6] = 37'h1a435b5ff8;
    stim[7] = 37'h03c725b059;
    stim[8] = 37'h0245113f40;
    stim[9] = 37'h1b823dee69;
    stim[10] = 37'h0f8cfcca07;
    stim[11] = 37'h1a364859b9;
    stim[12] = 37'h07e6b5fe1e;
    stim[13] = 37'h07ddb731ca;
    stim[14] = 37'h021195611a;
    stim[15] = 37'h0aa8d2db8f;
    stim[16] = 37'h0226d05697;
    stim[17] = 37'h020a27f5b3;
    stim[18] = 37'h1a6a27651e;
    stim[19] = 37'h12ec33d21d;
    stim[20] = 37'h1ad4c3713b;
    stim[21] = 37'h1ef723d7d2;
    stim[22] = 37'h0ec3832174;
    stim[23] = 37'h1b2b97f821;
    stim[24] = 37'h16558d0a86;
    stim[25] = 37'h0b5b7cbd33;
    stim[26] = 37'h1a50ace6f2;
    stim[27] = 37'h0af0dd1a2f;
    stim[28] = 37'h03b82b11f1;
    stim[29] = 37'h0bab828e29;
    stim[30] = 37'h164d45eeff;
    stim[31] = 37'h1edd01b4f3;
    stim[32] = 37'h164c7e3898;
    stim[33] = 37'h1600fd0242;
    stim[34] = 37'h0bd043d3ad;
    stim[35] = 37'h1f71a116d3;
    stim[36] = 37'h1efefa2e4f;
    stim[37] = 37'h07ebde1091;
    stim[38] = 37'h06f186eb59;
    stim[39] = 37'h02e812635a;
    stim[40] = 37'h064df6aa20;
    stim[41] = 37'h0ac819e7a0;
    stim[42] = 37'h1fc69a636b;
    stim[43] = 37'h03658a240d;
    stim[44] = 37'h0f0311e86c;
    stim[45] = 37'h1bd3b61811;
    stim[46] = 37'h1331e7945b;
    stim[47] = 37'h13a15eced0;
    stim[48] = 37'h179d561aa5;
    stim[49] = 37'h0e10e0987f;
    stim[50] = 37'h1b83f372bb;
    stim[51] = 37'h1306db6d8e;
    stim[52] = 37'h1643603ff8;
    stim[53] = 37'h1395ba46b2;
    stim[54] = 37'h1e4535d549;
    stim[55] = 37'h1ea90cf813;
    stim[56] = 37'h131b99e4e1;
    stim[57] = 37'h0bc86b51d5;
    stim[58] = 37'h1fd25d721b;
    stim[59] = 37'h0b06e327d9;
    stim[60] = 37'h0f7fe4d780;
    stim[61] = 37'h1eca3d60a8;
    stim[62] = 37'h1a69bb1f60;
    stim[63] = 37'h0b3b0ad920;
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
      expv[0] = 43'h00000000000;
      expv[1] = 43'h00000000000;
      expv[2] = 43'h00000000000;
      expv[3] = 43'h00000000000;
      expv[4] = 43'h00000000000;
      expv[5] = 43'h00000000000;
      expv[6] = 43'h00000000000;
      expv[7] = 43'h00000000000;
      expv[8] = 43'h00000000000;
      expv[9] = 43'h00000000000;
      expv[10] = 43'h00000000000;
      expv[11] = 43'h00000000000;
      expv[12] = 43'h00000000000;
      expv[13] = 43'h00000000000;
      expv[14] = 43'h00000000000;
      expv[15] = 43'h00000000000;
      expv[16] = 43'h00000000000;
      expv[17] = 43'h00000000000;
      expv[18] = 43'h00000000000;
      expv[19] = 43'h00000000000;
      expv[20] = 43'h00000000000;
      expv[21] = 43'h00000000000;
      expv[22] = 43'h00000000000;
      expv[23] = 43'h00000000000;
      expv[24] = 43'h00000000000;
      expv[25] = 43'h00000000000;
      expv[26] = 43'h00000000000;
      expv[27] = 43'h00000000000;
      expv[28] = 43'h00000000000;
      expv[29] = 43'h00000000000;
      expv[30] = 43'h00000000000;
      expv[31] = 43'h00000000000;
      expv[32] = 43'h00000000000;
      expv[33] = 43'h00000000000;
      expv[34] = 43'h00000000000;
      expv[35] = 43'h00000000000;
      expv[36] = 43'h00000000000;
      expv[37] = 43'h00000000000;
      expv[38] = 43'h00000000000;
      expv[39] = 43'h35900000359;
      expv[40] = 43'h35900000359;
      expv[41] = 43'h22000000000;
      expv[42] = 43'h22000000000;
      expv[43] = 43'h22000000220;
      expv[44] = 43'h22000000000;
      expv[45] = 43'h22000000000;
      expv[46] = 43'h22000000000;
      expv[47] = 43'h22000000000;
      expv[48] = 43'h22000000000;
      expv[49] = 43'h22000000000;
      expv[50] = 43'h22000000000;
      expv[51] = 43'h22000000000;
      expv[52] = 43'h22000000000;
      expv[53] = 43'h22000000000;
      expv[54] = 43'h22000000000;
      expv[55] = 43'h22000000000;
      expv[56] = 43'h22000000000;
      expv[57] = 43'h22000000000;
      expv[58] = 43'h22000000000;
      expv[59] = 43'h22000000000;
      expv[60] = 43'h22000000000;
      expv[61] = 43'h22000000000;
      expv[62] = 43'h22000000000;
      expv[63] = 43'h22000000000;
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
