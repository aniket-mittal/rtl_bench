// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 36;
  localparam OW = 36;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04052 dut (
    .iSRC_MASK(in_vec[35:32]),
    .iSRC_DATA(in_vec[31:0]),
    .oDEST_MASK(out_vec[35:32]),
    .oDEST_DATA(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 36'h4c02e760e;
    stim[1] = 36'h181acb34e;
    stim[2] = 36'he15c9aaa9;
    stim[3] = 36'h34492ac4a;
    stim[4] = 36'h275277f63;
    stim[5] = 36'hf8621b8b4;
    stim[6] = 36'h520d3faf5;
    stim[7] = 36'h6dfc662b6;
    stim[8] = 36'h1c105ecca;
    stim[9] = 36'h3e9d678f2;
    stim[10] = 36'h35d77d249;
    stim[11] = 36'h4d59eba65;
    stim[12] = 36'hdd1e54988;
    stim[13] = 36'ha0982caf2;
    stim[14] = 36'h66ea2f0a7;
    stim[15] = 36'hfb91d60e1;
    stim[16] = 36'h8d836c4bd;
    stim[17] = 36'ha123f6fa0;
    stim[18] = 36'h7ba151bd4;
    stim[19] = 36'hb57426a48;
    stim[20] = 36'h4a13e8349;
    stim[21] = 36'hc8fe68682;
    stim[22] = 36'h31bcbd1fd;
    stim[23] = 36'h4ce08fc1c;
    stim[24] = 36'h20f4d7c41;
    stim[25] = 36'h858a03982;
    stim[26] = 36'ha777c9146;
    stim[27] = 36'hf171e14d9;
    stim[28] = 36'hdfea32e00;
    stim[29] = 36'h547bacbbe;
    stim[30] = 36'hc9c4ecdaa;
    stim[31] = 36'h6cb40a6c8;
    stim[32] = 36'h73028780f;
    stim[33] = 36'h34359c065;
    stim[34] = 36'h8405b76cd;
    stim[35] = 36'h65b5d7f44;
    stim[36] = 36'hcf1df1a0d;
    stim[37] = 36'haf9da905d;
    stim[38] = 36'hb5f5d97b6;
    stim[39] = 36'ha6ae973fa;
    stim[40] = 36'h4bf81e596;
    stim[41] = 36'h0b22a6e4f;
    stim[42] = 36'h40183b79a;
    stim[43] = 36'ha9b88f47b;
    stim[44] = 36'h7063d33e3;
    stim[45] = 36'h189a22ec9;
    stim[46] = 36'h514e7752a;
    stim[47] = 36'h0bbc767f3;
    stim[48] = 36'h28c84a3b9;
    stim[49] = 36'hbefebd735;
    stim[50] = 36'h4e2f3ec96;
    stim[51] = 36'h4f1ef69ab;
    stim[52] = 36'hc73efe300;
    stim[53] = 36'h70a92c7b5;
    stim[54] = 36'hd58f02c0b;
    stim[55] = 36'hfd3308b3b;
    stim[56] = 36'hde7a5939c;
    stim[57] = 36'hbe113e2fe;
    stim[58] = 36'h7b241e0ed;
    stim[59] = 36'h98b300dfb;
    stim[60] = 36'h0cb941a41;
    stim[61] = 36'he46b329ed;
    stim[62] = 36'h925d2f989;
    stim[63] = 36'h17db9c989;
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
      expv[0] = 36'h4002e0000;
      expv[1] = 36'h10000004e;
      expv[2] = 36'he15000000;
      expv[3] = 36'h300004aac;
      expv[4] = 36'h200007f00;
      expv[5] = 36'hfb4b82186;
      expv[6] = 36'h520000000;
      expv[7] = 36'h6df000000;
      expv[8] = 36'h1000000ca;
      expv[9] = 36'h30000f278;
      expv[10] = 36'h3000049d2;
      expv[11] = 36'h4009e0000;
      expv[12] = 36'hdd1000000;
      expv[13] = 36'ha09000000;
      expv[14] = 36'h66e000000;
      expv[15] = 36'hfe1601db9;
      expv[16] = 36'h8d8000000;
      expv[17] = 36'ha12000000;
      expv[18] = 36'h7ba000000;
      expv[19] = 36'hb57000000;
      expv[20] = 36'h4003e0000;
      expv[21] = 36'hce68f0000;
      expv[22] = 36'h30000fdd1;
      expv[23] = 36'h400080000;
      expv[24] = 36'h200007c00;
      expv[25] = 36'h858000000;
      expv[26] = 36'ha77000000;
      expv[27] = 36'hfd9141e17;
      expv[28] = 36'hdfe000000;
      expv[29] = 36'h547000000;
      expv[30] = 36'hc4e9c0000;
      expv[31] = 36'h6cb000000;
      expv[32] = 36'h730000000;
      expv[33] = 36'h3000065c0;
      expv[34] = 36'h840000000;
      expv[35] = 36'h65b000000;
      expv[36] = 36'hcdff10000;
      expv[37] = 36'haf9000000;
      expv[38] = 36'hb5f000000;
      expv[39] = 36'ha6a000000;
      expv[40] = 36'h400810000;
      expv[41] = 36'h0b2000000;
      expv[42] = 36'h400830000;
      expv[43] = 36'ha9b000000;
      expv[44] = 36'h706000000;
      expv[45] = 36'h1000000c9;
      expv[46] = 36'h514000000;
      expv[47] = 36'h0bb000000;
      expv[48] = 36'h20000a300;
      expv[49] = 36'hbef000000;
      expv[50] = 36'h400f30000;
      expv[51] = 36'h400ef0000;
      expv[52] = 36'hcef730000;
      expv[53] = 36'h70a000000;
      expv[54] = 36'hd58000000;
      expv[55] = 36'hf3b8b30d3;
      expv[56] = 36'hde7000000;
      expv[57] = 36'hbe1000000;
      expv[58] = 36'h7b2000000;
      expv[59] = 36'h98b000000;
      expv[60] = 36'h0cb000000;
      expv[61] = 36'he46000000;
      expv[62] = 36'h925000000;
      expv[63] = 36'h100000089;
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
