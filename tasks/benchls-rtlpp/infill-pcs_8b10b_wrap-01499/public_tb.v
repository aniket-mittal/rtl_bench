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

  rtlpp_01499 dut (
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
    stim[0] = 18'h2280b;
    stim[1] = 18'h3f403;
    stim[2] = 18'h1919f;
    stim[3] = 18'h013e4;
    stim[4] = 18'h1c306;
    stim[5] = 18'h0e64f;
    stim[6] = 18'h0acf3;
    stim[7] = 18'h15163;
    stim[8] = 18'h11612;
    stim[9] = 18'h0efd3;
    stim[10] = 18'h02365;
    stim[11] = 18'h0f0f4;
    stim[12] = 18'h1238b;
    stim[13] = 18'h01fbc;
    stim[14] = 18'h038f9;
    stim[15] = 18'h1b0ae;
    stim[16] = 18'h06aec;
    stim[17] = 18'h13bed;
    stim[18] = 18'h0c876;
    stim[19] = 18'h1b03e;
    stim[20] = 18'h0cff9;
    stim[21] = 18'h0360e;
    stim[22] = 18'h14e7c;
    stim[23] = 18'h07b38;
    stim[24] = 18'h00a04;
    stim[25] = 18'h00a71;
    stim[26] = 18'h07946;
    stim[27] = 18'h1291a;
    stim[28] = 18'h17ae8;
    stim[29] = 18'h01f43;
    stim[30] = 18'h16314;
    stim[31] = 18'h10b2b;
    stim[32] = 18'h08ef7;
    stim[33] = 18'h081c7;
    stim[34] = 18'h0efb2;
    stim[35] = 18'h106cc;
    stim[36] = 18'h19732;
    stim[37] = 18'h16300;
    stim[38] = 18'h0f17a;
    stim[39] = 18'h1f77b;
    stim[40] = 18'h038ba;
    stim[41] = 18'h05890;
    stim[42] = 18'h046f7;
    stim[43] = 18'h156df;
    stim[44] = 18'h0d966;
    stim[45] = 18'h0b4a6;
    stim[46] = 18'h10183;
    stim[47] = 18'h041df;
    stim[48] = 18'h1412e;
    stim[49] = 18'h04e50;
    stim[50] = 18'h1ad5d;
    stim[51] = 18'h090e3;
    stim[52] = 18'h0323d;
    stim[53] = 18'h0333f;
    stim[54] = 18'h045e2;
    stim[55] = 18'h1b903;
    stim[56] = 18'h0d238;
    stim[57] = 18'h0a987;
    stim[58] = 18'h0eb92;
    stim[59] = 18'h161c1;
    stim[60] = 18'h10d46;
    stim[61] = 18'h0abf9;
    stim[62] = 18'h1d1fb;
    stim[63] = 18'h1e2e3;
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
      expv[4] = 15'h6467;
      expv[5] = 15'h04f9;
      expv[6] = 15'h0029;
      expv[7] = 15'h0029;
      expv[8] = 15'h2b7d;
      expv[9] = 15'h0029;
      expv[10] = 15'h45c5;
      expv[11] = 15'h3bf5;
      expv[12] = 15'h0029;
      expv[13] = 15'h3c7d;
      expv[14] = 15'h48e3;
      expv[15] = 15'h0029;
      expv[16] = 15'h0029;
      expv[17] = 15'h0029;
      expv[18] = 15'h1afb;
      expv[19] = 15'h0029;
      expv[20] = 15'h0029;
      expv[21] = 15'h6c4f;
      expv[22] = 15'h0029;
      expv[23] = 15'h0029;
      expv[24] = 15'h53df;
      expv[25] = 15'h0029;
      expv[26] = 15'h0029;
      expv[27] = 15'h02dd;
      expv[28] = 15'h1e51;
      expv[29] = 15'h0029;
      expv[30] = 15'h5efb;
      expv[31] = 15'h07d1;
      expv[32] = 15'h58c5;
      expv[33] = 15'h0029;
      expv[34] = 15'h23fd;
      expv[35] = 15'h2071;
      expv[36] = 15'h0029;
      expv[37] = 15'h41f3;
      expv[38] = 15'h65cd;
      expv[39] = 15'h58c1;
      expv[40] = 15'h3c5f;
      expv[41] = 15'h0029;
      expv[42] = 15'h0029;
      expv[43] = 15'h0029;
      expv[44] = 15'h0029;
      expv[45] = 15'h55f7;
      expv[46] = 15'h0029;
      expv[47] = 15'h2d69;
      expv[48] = 15'h4061;
      expv[49] = 15'h1077;
      expv[50] = 15'h0029;
      expv[51] = 15'h13d5;
      expv[52] = 15'h0029;
      expv[53] = 15'h0029;
      expv[54] = 15'h0ccf;
      expv[55] = 15'h0ccf;
      expv[56] = 15'h1179;
      expv[57] = 15'h0029;
      expv[58] = 15'h34cf;
      expv[59] = 15'h2a61;
      expv[60] = 15'h3ae5;
      expv[61] = 15'h5871;
      expv[62] = 15'h4351;
      expv[63] = 15'h2aff;
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
