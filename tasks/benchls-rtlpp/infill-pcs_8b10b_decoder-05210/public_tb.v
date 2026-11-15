// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 18;
  localparam OW = 15;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_05210 dut (
    .clk(clk),
    .reset(in_vec[17:17]),
    .alt_dataout(in_vec[16:9]),
    .alt_sync(in_vec[8:8]),
    .alt_disperr(in_vec[7:7]),
    .alt_ctrldetect(in_vec[6:6]),
    .alt_errdetect(in_vec[5:5]),
    .alt_rmfifodatadeleted(in_vec[4:4]),
    .alt_rmfifodatainserted(in_vec[3:3]),
    .alt_runlengthviolation(in_vec[2:2]),
    .alt_patterndetect(in_vec[1:1]),
    .alt_runningdisp(in_vec[0:0]),
    .altpcs_dataout(out_vec[14:7]),
    .altpcs_sync(out_vec[6:6]),
    .altpcs_disperr(out_vec[5:5]),
    .altpcs_ctrldetect(out_vec[4:4]),
    .altpcs_errdetect(out_vec[3:3]),
    .altpcs_rmfifodatadeleted(out_vec[2:2]),
    .altpcs_rmfifodatainserted(out_vec[1:1]),
    .altpcs_carrierdetect(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 18'h2f311;
    stim[1] = 18'h218bd;
    stim[2] = 18'h10736;
    stim[3] = 18'h0db54;
    stim[4] = 18'h0802a;
    stim[5] = 18'h04519;
    stim[6] = 18'h13cbb;
    stim[7] = 18'h059c3;
    stim[8] = 18'h1dcfc;
    stim[9] = 18'h1b72e;
    stim[10] = 18'h1292a;
    stim[11] = 18'h1c9b1;
    stim[12] = 18'h0f282;
    stim[13] = 18'h0ce90;
    stim[14] = 18'h18ac1;
    stim[15] = 18'h0c427;
    stim[16] = 18'h0897a;
    stim[17] = 18'h021d8;
    stim[18] = 18'h0c613;
    stim[19] = 18'h07fdb;
    stim[20] = 18'h0ec46;
    stim[21] = 18'h06ffd;
    stim[22] = 18'h17c0d;
    stim[23] = 18'h1952e;
    stim[24] = 18'h06c03;
    stim[25] = 18'h177a7;
    stim[26] = 18'h159b3;
    stim[27] = 18'h0616d;
    stim[28] = 18'h1a7ef;
    stim[29] = 18'h197dd;
    stim[30] = 18'h1a652;
    stim[31] = 18'h069cc;
    stim[32] = 18'h03354;
    stim[33] = 18'h12341;
    stim[34] = 18'h0392c;
    stim[35] = 18'h0f68d;
    stim[36] = 18'h0208a;
    stim[37] = 18'h0a66b;
    stim[38] = 18'h0c1c1;
    stim[39] = 18'h1700e;
    stim[40] = 18'h002ec;
    stim[41] = 18'h03b23;
    stim[42] = 18'h01c40;
    stim[43] = 18'h09154;
    stim[44] = 18'h07608;
    stim[45] = 18'h1f4c9;
    stim[46] = 18'h0525b;
    stim[47] = 18'h135f6;
    stim[48] = 18'h121e3;
    stim[49] = 18'h116f2;
    stim[50] = 18'h1c945;
    stim[51] = 18'h0d91f;
    stim[52] = 18'h03925;
    stim[53] = 18'h108ce;
    stim[54] = 18'h0dab0;
    stim[55] = 18'h0e2f6;
    stim[56] = 18'h0fa77;
    stim[57] = 18'h0f140;
    stim[58] = 18'h0ce3e;
    stim[59] = 18'h032a7;
    stim[60] = 18'h04419;
    stim[61] = 18'h11e2f;
    stim[62] = 18'h04a0a;
    stim[63] = 18'h0f421;
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
      expv[0] = 15'h0029;
      expv[1] = 15'h0029;
      expv[2] = 15'h0029;
      expv[3] = 15'h0041;
      expv[4] = 15'h41cd;
      expv[5] = 15'h0029;
      expv[6] = 15'h204b;
      expv[7] = 15'h0029;
      expv[8] = 15'h4f6f;
      expv[9] = 15'h0029;
      expv[10] = 15'h777f;
      expv[11] = 15'h6dcb;
      expv[12] = 15'h4a4b;
      expv[13] = 15'h0029;
      expv[14] = 15'h0029;
      expv[15] = 15'h0029;
      expv[16] = 15'h0029;
      expv[17] = 15'h3149;
      expv[18] = 15'h225f;
      expv[19] = 15'h0029;
      expv[20] = 15'h31c5;
      expv[21] = 15'h0029;
      expv[22] = 15'h3b51;
      expv[23] = 15'h0029;
      expv[24] = 15'h5f43;
      expv[25] = 15'h0029;
      expv[26] = 15'h1b41;
      expv[27] = 15'h5de9;
      expv[28] = 15'h566d;
      expv[29] = 15'h185b;
      expv[30] = 15'h69fb;
      expv[31] = 15'h0029;
      expv[32] = 15'h69d5;
      expv[33] = 15'h1a73;
      expv[34] = 15'h0cd5;
      expv[35] = 15'h48d1;
      expv[36] = 15'h0029;
      expv[37] = 15'h0029;
      expv[38] = 15'h0029;
      expv[39] = 15'h29db;
      expv[40] = 15'h0029;
      expv[41] = 15'h0029;
      expv[42] = 15'h00fb;
      expv[43] = 15'h0029;
      expv[44] = 15'h0751;
      expv[45] = 15'h0029;
      expv[46] = 15'h0029;
      expv[47] = 15'h0029;
      expv[48] = 15'h14d7;
      expv[49] = 15'h4d7d;
      expv[50] = 15'h0029;
      expv[51] = 15'h45fd;
      expv[52] = 15'h7251;
      expv[53] = 15'h3647;
      expv[54] = 15'h0029;
      expv[55] = 15'h0029;
      expv[56] = 15'h0029;
      expv[57] = 15'h0029;
      expv[58] = 15'h3edd;
      expv[59] = 15'h0029;
      expv[60] = 15'h0029;
      expv[61] = 15'h0029;
      expv[62] = 15'h0029;
      expv[63] = 15'h0029;
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
