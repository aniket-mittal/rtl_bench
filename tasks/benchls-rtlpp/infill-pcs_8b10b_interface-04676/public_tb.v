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

  rtlpp_04676 dut (
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
    stim[0] = 18'h29173;
    stim[1] = 18'h29861;
    stim[2] = 18'h05826;
    stim[3] = 18'h0807a;
    stim[4] = 18'h0263d;
    stim[5] = 18'h1860f;
    stim[6] = 18'h0d000;
    stim[7] = 18'h1acc9;
    stim[8] = 18'h080e4;
    stim[9] = 18'h09440;
    stim[10] = 18'h0ebbd;
    stim[11] = 18'h0a871;
    stim[12] = 18'h06d27;
    stim[13] = 18'h0be71;
    stim[14] = 18'h194d1;
    stim[15] = 18'h1acb2;
    stim[16] = 18'h1378a;
    stim[17] = 18'h0800e;
    stim[18] = 18'h1058a;
    stim[19] = 18'h0e5a7;
    stim[20] = 18'h17dcb;
    stim[21] = 18'h0dab5;
    stim[22] = 18'h167a2;
    stim[23] = 18'h32045;
    stim[24] = 18'h0bb65;
    stim[25] = 18'h107be;
    stim[26] = 18'h09149;
    stim[27] = 18'h0b167;
    stim[28] = 18'h0a87a;
    stim[29] = 18'h0715f;
    stim[30] = 18'h08fe1;
    stim[31] = 18'h1863d;
    stim[32] = 18'h1af47;
    stim[33] = 18'h084c3;
    stim[34] = 18'h03432;
    stim[35] = 18'h053b2;
    stim[36] = 18'h07178;
    stim[37] = 18'h037ba;
    stim[38] = 18'h1cbf3;
    stim[39] = 18'h1046e;
    stim[40] = 18'h142e5;
    stim[41] = 18'h073c1;
    stim[42] = 18'h0b456;
    stim[43] = 18'h008ab;
    stim[44] = 18'h0aa62;
    stim[45] = 18'h1bc37;
    stim[46] = 18'h06c1e;
    stim[47] = 18'h0c879;
    stim[48] = 18'h02fdd;
    stim[49] = 18'h1aa34;
    stim[50] = 18'h161c3;
    stim[51] = 18'h04e23;
    stim[52] = 18'h0da86;
    stim[53] = 18'h082e4;
    stim[54] = 18'h1aa2b;
    stim[55] = 18'h08fc8;
    stim[56] = 18'h02167;
    stim[57] = 18'h153f0;
    stim[58] = 18'h1ea75;
    stim[59] = 18'h086c7;
    stim[60] = 18'h0b91d;
    stim[61] = 18'h0f7c9;
    stim[62] = 18'h03214;
    stim[63] = 18'h0e09f;
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
      expv[4] = 15'h0029;
      expv[5] = 15'h0029;
      expv[6] = 15'h0029;
      expv[7] = 15'h0029;
      expv[8] = 15'h0029;
      expv[9] = 15'h0029;
      expv[10] = 15'h0029;
      expv[11] = 15'h2551;
      expv[12] = 15'h0029;
      expv[13] = 15'h2a5d;
      expv[14] = 15'h0029;
      expv[15] = 15'h0029;
      expv[16] = 15'h0029;
      expv[17] = 15'h6b6d;
      expv[18] = 15'h0029;
      expv[19] = 15'h2043;
      expv[20] = 15'h4163;
      expv[21] = 15'h3969;
      expv[22] = 15'h0029;
      expv[23] = 15'h0029;
      expv[24] = 15'h0029;
      expv[25] = 15'h0041;
      expv[26] = 15'h2ed9;
      expv[27] = 15'h41ef;
      expv[28] = 15'h2453;
      expv[29] = 15'h0029;
      expv[30] = 15'h2a5f;
      expv[31] = 15'h1c57;
      expv[32] = 15'h0029;
      expv[33] = 15'h61cf;
      expv[34] = 15'h0029;
      expv[35] = 15'h0029;
      expv[36] = 15'h0d4d;
      expv[37] = 15'h14ed;
      expv[38] = 15'h1c5f;
      expv[39] = 15'h0def;
      expv[40] = 15'h0029;
      expv[41] = 15'h0029;
      expv[42] = 15'h50f9;
      expv[43] = 15'h0029;
      expv[44] = 15'h0029;
      expv[45] = 15'h0029;
      expv[46] = 15'h0029;
      expv[47] = 15'h0029;
      expv[48] = 15'h0029;
      expv[49] = 15'h325f;
      expv[50] = 15'h0029;
      expv[51] = 15'h6acd;
      expv[52] = 15'h0029;
      expv[53] = 15'h0029;
      expv[54] = 15'h0029;
      expv[55] = 15'h0029;
      expv[56] = 15'h6acb;
      expv[57] = 15'h23f3;
      expv[58] = 15'h0859;
      expv[59] = 15'h0029;
      expv[60] = 15'h0029;
      expv[61] = 15'h21f1;
      expv[62] = 15'h2e47;
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
