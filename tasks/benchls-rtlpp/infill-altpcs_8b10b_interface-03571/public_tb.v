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

  rtlpp_03571 dut (
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
    stim[0] = 18'h2f64a;
    stim[1] = 18'h2e6a6;
    stim[2] = 18'h06d1d;
    stim[3] = 18'h035c0;
    stim[4] = 18'h1b2d5;
    stim[5] = 18'h1dd0f;
    stim[6] = 18'h10dc5;
    stim[7] = 18'h13aa8;
    stim[8] = 18'h1bcea;
    stim[9] = 18'h0772e;
    stim[10] = 18'h17e00;
    stim[11] = 18'h0fae4;
    stim[12] = 18'h14e5c;
    stim[13] = 18'h0f292;
    stim[14] = 18'h13d72;
    stim[15] = 18'h0c9e5;
    stim[16] = 18'h1b6bb;
    stim[17] = 18'h0691a;
    stim[18] = 18'h07878;
    stim[19] = 18'h1bdbc;
    stim[20] = 18'h0327b;
    stim[21] = 18'h07adc;
    stim[22] = 18'h1879b;
    stim[23] = 18'h00dd9;
    stim[24] = 18'h1834f;
    stim[25] = 18'h1a9ed;
    stim[26] = 18'h1e03a;
    stim[27] = 18'h0eb96;
    stim[28] = 18'h00f3c;
    stim[29] = 18'h0c3b7;
    stim[30] = 18'h0cca3;
    stim[31] = 18'h0d29a;
    stim[32] = 18'h1e565;
    stim[33] = 18'h186b5;
    stim[34] = 18'h1747c;
    stim[35] = 18'h17bde;
    stim[36] = 18'h12a80;
    stim[37] = 18'h09fbb;
    stim[38] = 18'h1aaf9;
    stim[39] = 18'h11264;
    stim[40] = 18'h14bb0;
    stim[41] = 18'h0904c;
    stim[42] = 18'h03326;
    stim[43] = 18'h0a526;
    stim[44] = 18'h0c558;
    stim[45] = 18'h1555b;
    stim[46] = 18'h1987f;
    stim[47] = 18'h19997;
    stim[48] = 18'h1ecad;
    stim[49] = 18'h1c018;
    stim[50] = 18'h01ec8;
    stim[51] = 18'h057e6;
    stim[52] = 18'h13838;
    stim[53] = 18'h1a9e5;
    stim[54] = 18'h1a47b;
    stim[55] = 18'h09c0b;
    stim[56] = 18'h1206f;
    stim[57] = 18'h0f7d4;
    stim[58] = 18'h1bd0e;
    stim[59] = 18'h0577f;
    stim[60] = 18'h0bbbf;
    stim[61] = 18'h00b7b;
    stim[62] = 18'h0f492;
    stim[63] = 18'h16b80;
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
      expv[4] = 15'h1b47;
      expv[5] = 15'h0029;
      expv[6] = 15'h6cf5;
      expv[7] = 15'h7743;
      expv[8] = 15'h0029;
      expv[9] = 15'h0029;
      expv[10] = 15'h6f7b;
      expv[11] = 15'h0029;
      expv[12] = 15'h0029;
      expv[13] = 15'h0029;
      expv[14] = 15'h0029;
      expv[15] = 15'h3ce5;
      expv[16] = 15'h4f5d;
      expv[17] = 15'h0029;
      expv[18] = 15'h6def;
      expv[19] = 15'h0029;
      expv[20] = 15'h1e5f;
      expv[21] = 15'h0029;
      expv[22] = 15'h0029;
      expv[23] = 15'h1ef7;
      expv[24] = 15'h61e7;
      expv[25] = 15'h0377;
      expv[26] = 15'h60d3;
      expv[27] = 15'h0029;
      expv[28] = 15'h784f;
      expv[29] = 15'h3ae5;
      expv[30] = 15'h03cf;
      expv[31] = 15'h0029;
      expv[32] = 15'h0029;
      expv[33] = 15'h34e7;
      expv[34] = 15'h0029;
      expv[35] = 15'h0029;
      expv[36] = 15'h5d5f;
      expv[37] = 15'h0029;
      expv[38] = 15'h4ae1;
      expv[39] = 15'h0029;
      expv[40] = 15'h0029;
      expv[41] = 15'h44d9;
      expv[42] = 15'h0029;
      expv[43] = 15'h2453;
      expv[44] = 15'h0cc9;
      expv[45] = 15'h2949;
      expv[46] = 15'h3157;
      expv[47] = 15'h0029;
      expv[48] = 15'h665f;
      expv[49] = 15'h0029;
      expv[50] = 15'h0029;
      expv[51] = 15'h0029;
      expv[52] = 15'h07f3;
      expv[53] = 15'h0029;
      expv[54] = 15'h4e4f;
      expv[55] = 15'h0029;
      expv[56] = 15'h0029;
      expv[57] = 15'h0029;
      expv[58] = 15'h485b;
      expv[59] = 15'h3df5;
      expv[60] = 15'h6f43;
      expv[61] = 15'h15df;
      expv[62] = 15'h2eef;
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
