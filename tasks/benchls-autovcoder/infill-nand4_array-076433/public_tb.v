// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 24;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_076433 dut (
    .A1(in_vec[23:23]),
    .B1(in_vec[22:22]),
    .C1(in_vec[21:21]),
    .D1(in_vec[20:20]),
    .F1(in_vec[19:19]),
    .H1(in_vec[18:18]),
    .J1(in_vec[17:17]),
    .K1(in_vec[16:16]),
    .M1(in_vec[15:15]),
    .N1(in_vec[14:14]),
    .P1(in_vec[13:13]),
    .R1(in_vec[12:12]),
    .D2(in_vec[11:11]),
    .E2(in_vec[10:10]),
    .F2(in_vec[9:9]),
    .H2(in_vec[8:8]),
    .K2(in_vec[7:7]),
    .L2(in_vec[6:6]),
    .M2(in_vec[5:5]),
    .N2(in_vec[4:4]),
    .R2(in_vec[3:3]),
    .S2(in_vec[2:2]),
    .T2(in_vec[1:1]),
    .U2(in_vec[0:0]),
    .E1(out_vec[7:7]),
    .L1(out_vec[6:6]),
    .S1(out_vec[5:5]),
    .U1(out_vec[4:4]),
    .V1(out_vec[3:3]),
    .J2(out_vec[2:2]),
    .P2(out_vec[1:1]),
    .V2(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 24'h0e83b6;
    stim[1] = 24'h383782;
    stim[2] = 24'h5fff34;
    stim[3] = 24'hcfe294;
    stim[4] = 24'h1e7854;
    stim[5] = 24'h10a3f7;
    stim[6] = 24'h22ade0;
    stim[7] = 24'h633e03;
    stim[8] = 24'h7a5600;
    stim[9] = 24'h270f85;
    stim[10] = 24'h95a133;
    stim[11] = 24'h133167;
    stim[12] = 24'h5430c8;
    stim[13] = 24'h413b3b;
    stim[14] = 24'h7818bc;
    stim[15] = 24'h03190e;
    stim[16] = 24'ha268e9;
    stim[17] = 24'h5d2f8e;
    stim[18] = 24'h9831f7;
    stim[19] = 24'hcb9b04;
    stim[20] = 24'h877fee;
    stim[21] = 24'h9e9d9b;
    stim[22] = 24'h4af295;
    stim[23] = 24'ha61ce6;
    stim[24] = 24'h768df6;
    stim[25] = 24'h19a025;
    stim[26] = 24'h582ee0;
    stim[27] = 24'h9973ef;
    stim[28] = 24'h72002a;
    stim[29] = 24'h2dc2bf;
    stim[30] = 24'h4f86b9;
    stim[31] = 24'h0fa77e;
    stim[32] = 24'he26d0e;
    stim[33] = 24'h139c59;
    stim[34] = 24'h510742;
    stim[35] = 24'hb5715e;
    stim[36] = 24'h110e5f;
    stim[37] = 24'hf95f1f;
    stim[38] = 24'h648f9f;
    stim[39] = 24'hdd9b8e;
    stim[40] = 24'hdc88f9;
    stim[41] = 24'h033396;
    stim[42] = 24'h2e0b08;
    stim[43] = 24'h1d889d;
    stim[44] = 24'h5052dd;
    stim[45] = 24'h5f4e30;
    stim[46] = 24'h09359b;
    stim[47] = 24'hc0a07a;
    stim[48] = 24'h706a08;
    stim[49] = 24'h059367;
    stim[50] = 24'hdc67fe;
    stim[51] = 24'he6dbea;
    stim[52] = 24'h17295d;
    stim[53] = 24'h6edc29;
    stim[54] = 24'h258aa1;
    stim[55] = 24'hdd6987;
    stim[56] = 24'h6a0542;
    stim[57] = 24'h4a5bc0;
    stim[58] = 24'h15830f;
    stim[59] = 24'h09f37d;
    stim[60] = 24'hb8ebfb;
    stim[61] = 24'h78f539;
    stim[62] = 24'h9d7485;
    stim[63] = 24'h5b2912;
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
      expv[0] = 8'hff;
      expv[1] = 8'hff;
      expv[2] = 8'h9b;
      expv[3] = 8'hbf;
      expv[4] = 8'hff;
      expv[5] = 8'hfd;
      expv[6] = 8'hff;
      expv[7] = 8'hff;
      expv[8] = 8'hff;
      expv[9] = 8'hfb;
      expv[10] = 8'hff;
      expv[11] = 8'hff;
      expv[12] = 8'hff;
      expv[13] = 8'hff;
      expv[14] = 8'hff;
      expv[15] = 8'hff;
      expv[16] = 8'hff;
      expv[17] = 8'hfb;
      expv[18] = 8'hfd;
      expv[19] = 8'hff;
      expv[20] = 8'hfb;
      expv[21] = 8'hff;
      expv[22] = 8'hdf;
      expv[23] = 8'hff;
      expv[24] = 8'hfd;
      expv[25] = 8'hff;
      expv[26] = 8'hff;
      expv[27] = 8'hfe;
      expv[28] = 8'hff;
      expv[29] = 8'hfe;
      expv[30] = 8'hbf;
      expv[31] = 8'hbf;
      expv[32] = 8'hff;
      expv[33] = 8'hff;
      expv[34] = 8'hff;
      expv[35] = 8'hff;
      expv[36] = 8'hfe;
      expv[37] = 8'h7a;
      expv[38] = 8'hfa;
      expv[39] = 8'hff;
      expv[40] = 8'hfd;
      expv[41] = 8'hff;
      expv[42] = 8'hff;
      expv[43] = 8'hff;
      expv[44] = 8'hff;
      expv[45] = 8'hbf;
      expv[46] = 8'hff;
      expv[47] = 8'hff;
      expv[48] = 8'hff;
      expv[49] = 8'hff;
      expv[50] = 8'hfd;
      expv[51] = 8'hff;
      expv[52] = 8'hff;
      expv[53] = 8'hff;
      expv[54] = 8'hff;
      expv[55] = 8'hff;
      expv[56] = 8'hff;
      expv[57] = 8'hff;
      expv[58] = 8'hfe;
      expv[59] = 8'hdf;
      expv[60] = 8'hfd;
      expv[61] = 8'hdf;
      expv[62] = 8'hff;
      expv[63] = 8'hff;
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
