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

  rtlpp_04687 dut (
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
    stim[0] = 18'h3b442;
    stim[1] = 18'h348a1;
    stim[2] = 18'h19076;
    stim[3] = 18'h12f01;
    stim[4] = 18'h1774e;
    stim[5] = 18'h1521b;
    stim[6] = 18'h09f5b;
    stim[7] = 18'h1b90e;
    stim[8] = 18'h0c2c6;
    stim[9] = 18'h1f3f6;
    stim[10] = 18'h0194d;
    stim[11] = 18'h0dc0e;
    stim[12] = 18'h11aab;
    stim[13] = 18'h1697d;
    stim[14] = 18'h04024;
    stim[15] = 18'h0d7ac;
    stim[16] = 18'h1047e;
    stim[17] = 18'h1ca67;
    stim[18] = 18'h1f418;
    stim[19] = 18'h08ea0;
    stim[20] = 18'h04b5f;
    stim[21] = 18'h066f2;
    stim[22] = 18'h10cf4;
    stim[23] = 18'h144d8;
    stim[24] = 18'h15231;
    stim[25] = 18'h190d4;
    stim[26] = 18'h1973f;
    stim[27] = 18'h0d85d;
    stim[28] = 18'h1aca6;
    stim[29] = 18'h06ae4;
    stim[30] = 18'h1cc47;
    stim[31] = 18'h17f3f;
    stim[32] = 18'h0a480;
    stim[33] = 18'h12651;
    stim[34] = 18'h02f66;
    stim[35] = 18'h13097;
    stim[36] = 18'h1f153;
    stim[37] = 18'h02f89;
    stim[38] = 18'h15a2d;
    stim[39] = 18'h08996;
    stim[40] = 18'h1eebf;
    stim[41] = 18'h15950;
    stim[42] = 18'h1e289;
    stim[43] = 18'h07445;
    stim[44] = 18'h0c12a;
    stim[45] = 18'h1c02a;
    stim[46] = 18'h153c0;
    stim[47] = 18'h1f6e1;
    stim[48] = 18'h0bb65;
    stim[49] = 18'h1e7ca;
    stim[50] = 18'h1885e;
    stim[51] = 18'h1d591;
    stim[52] = 18'h0a86e;
    stim[53] = 18'h1a9d9;
    stim[54] = 18'h0521e;
    stim[55] = 18'h0a6a7;
    stim[56] = 18'h1fe51;
    stim[57] = 18'h10622;
    stim[58] = 18'h08902;
    stim[59] = 18'h024a9;
    stim[60] = 18'h1b0ca;
    stim[61] = 18'h14ddd;
    stim[62] = 18'h0de83;
    stim[63] = 18'h1bdc2;
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
      expv[3] = 15'h0029;
      expv[4] = 15'h645d;
      expv[5] = 15'h4bc1;
      expv[6] = 15'h0029;
      expv[7] = 15'h54c7;
      expv[8] = 15'h27d7;
      expv[9] = 15'h0029;
      expv[10] = 15'h30f1;
      expv[11] = 15'h7cfd;
      expv[12] = 15'h0029;
      expv[13] = 15'h0029;
      expv[14] = 15'h46eb;
      expv[15] = 15'h0029;
      expv[16] = 15'h1049;
      expv[17] = 15'h0029;
      expv[18] = 15'h0029;
      expv[19] = 15'h0029;
      expv[20] = 15'h0029;
      expv[21] = 15'h23e9;
      expv[22] = 15'h0029;
      expv[23] = 15'h0029;
      expv[24] = 15'h0029;
      expv[25] = 15'h0029;
      expv[26] = 15'h0029;
      expv[27] = 15'h6475;
      expv[28] = 15'h0029;
      expv[29] = 15'h0029;
      expv[30] = 15'h0029;
      expv[31] = 15'h0029;
      expv[32] = 15'h7351;
      expv[33] = 15'h0029;
      expv[34] = 15'h0029;
      expv[35] = 15'h49d5;
      expv[36] = 15'h0029;
      expv[37] = 15'h4c65;
      expv[38] = 15'h7c55;
      expv[39] = 15'h0029;
      expv[40] = 15'h56cb;
      expv[41] = 15'h0029;
      expv[42] = 15'h7bef;
      expv[43] = 15'h0029;
      expv[44] = 15'h0029;
      expv[45] = 15'h1d51;
      expv[46] = 15'h0029;
      expv[47] = 15'h704b;
      expv[48] = 15'h0029;
      expv[49] = 15'h7df9;
      expv[50] = 15'h2ed9;
      expv[51] = 15'h0029;
      expv[52] = 15'h6257;
      expv[53] = 15'h0029;
      expv[54] = 15'h2a5b;
      expv[55] = 15'h0029;
      expv[56] = 15'h0029;
      expv[57] = 15'h0029;
      expv[58] = 15'h0029;
      expv[59] = 15'h41c9;
      expv[60] = 15'h0029;
      expv[61] = 15'h0029;
      expv[62] = 15'h6c73;
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
