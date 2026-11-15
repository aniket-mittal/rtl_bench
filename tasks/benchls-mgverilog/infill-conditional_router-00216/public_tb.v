// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 23;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_00216 dut (
    .ready(in_vec[22:22]),
    .cond(in_vec[21:21]),
    .out_req(in_vec[20:20]),
    .true_ack(in_vec[19:19]),
    .true_value(in_vec[18:11]),
    .true_value_valid(in_vec[10:10]),
    .false_ack(in_vec[9:9]),
    .false_value(in_vec[8:1]),
    .false_value_valid(in_vec[0:0]),
    .out_ack(out_vec[11:11]),
    .out_value(out_vec[10:3]),
    .out_value_valid(out_vec[2:2]),
    .true_req(out_vec[1:1]),
    .false_req(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 23'h457eb4;
    stim[1] = 23'h4f9d52;
    stim[2] = 23'h62d52e;
    stim[3] = 23'h1497c9;
    stim[4] = 23'h20ed39;
    stim[5] = 23'h05d6b6;
    stim[6] = 23'h60184d;
    stim[7] = 23'h454057;
    stim[8] = 23'h504b32;
    stim[9] = 23'h256ab5;
    stim[10] = 23'h6187d3;
    stim[11] = 23'h1d0629;
    stim[12] = 23'h7e3b1d;
    stim[13] = 23'h2e3863;
    stim[14] = 23'h67dcd7;
    stim[15] = 23'h29e91d;
    stim[16] = 23'h518379;
    stim[17] = 23'h2f9cff;
    stim[18] = 23'h6870cb;
    stim[19] = 23'h7e9b50;
    stim[20] = 23'h753b8f;
    stim[21] = 23'h5ff8ea;
    stim[22] = 23'h49ba76;
    stim[23] = 23'h58ba39;
    stim[24] = 23'h6b875b;
    stim[25] = 23'h0c2357;
    stim[26] = 23'h680876;
    stim[27] = 23'h0819df;
    stim[28] = 23'h14d672;
    stim[29] = 23'h04f64c;
    stim[30] = 23'h1148db;
    stim[31] = 23'h61c02e;
    stim[32] = 23'h64296b;
    stim[33] = 23'h74fa74;
    stim[34] = 23'h3b57fd;
    stim[35] = 23'h2f5371;
    stim[36] = 23'h5e37bf;
    stim[37] = 23'h202880;
    stim[38] = 23'h2bee36;
    stim[39] = 23'h5bc71a;
    stim[40] = 23'h66cba2;
    stim[41] = 23'h6f6588;
    stim[42] = 23'h764bf8;
    stim[43] = 23'h42472f;
    stim[44] = 23'h1f8bd8;
    stim[45] = 23'h6c53b6;
    stim[46] = 23'h0b1e30;
    stim[47] = 23'h76532e;
    stim[48] = 23'h2b17fc;
    stim[49] = 23'h40da28;
    stim[50] = 23'h703940;
    stim[51] = 23'h1c86d1;
    stim[52] = 23'h4657d6;
    stim[53] = 23'h22c7ce;
    stim[54] = 23'h2de2e6;
    stim[55] = 23'h3aff8d;
    stim[56] = 23'h3e0f2f;
    stim[57] = 23'h3489aa;
    stim[58] = 23'h2a1c36;
    stim[59] = 23'h355cfc;
    stim[60] = 23'h3d43aa;
    stim[61] = 23'h7846ca;
    stim[62] = 23'h48cacb;
    stim[63] = 23'h18b3e3;
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
      expv[0] = 12'had0;
      expv[1] = 12'h548;
      expv[2] = 12'h2d4;
      expv[3] = 12'h7f8;
      expv[4] = 12'h7f8;
      expv[5] = 12'h7f8;
      expv[6] = 12'h018;
      expv[7] = 12'h15c;
      expv[8] = 12'hcc9;
      expv[9] = 12'h7f8;
      expv[10] = 12'h184;
      expv[11] = 12'h7f8;
      expv[12] = 12'he3a;
      expv[13] = 12'h7f8;
      expv[14] = 12'h7dc;
      expv[15] = 12'h7f8;
      expv[16] = 12'hde5;
      expv[17] = 12'h7f8;
      expv[18] = 12'h870;
      expv[19] = 12'he9a;
      expv[20] = 12'h53a;
      expv[21] = 12'h3a9;
      expv[22] = 12'h9d8;
      expv[23] = 12'h8e5;
      expv[24] = 12'hb84;
      expv[25] = 12'h7f8;
      expv[26] = 12'h808;
      expv[27] = 12'h7f8;
      expv[28] = 12'h7f8;
      expv[29] = 12'h7f8;
      expv[30] = 12'h7f8;
      expv[31] = 12'h1c0;
      expv[32] = 12'h428;
      expv[33] = 12'h4fa;
      expv[34] = 12'h7f8;
      expv[35] = 12'h7f8;
      expv[36] = 12'hefd;
      expv[37] = 12'h7f8;
      expv[38] = 12'h7f8;
      expv[39] = 12'hc69;
      expv[40] = 12'h6c8;
      expv[41] = 12'hf64;
      expv[42] = 12'h64a;
      expv[43] = 12'hcbc;
      expv[44] = 12'h7f8;
      expv[45] = 12'hc50;
      expv[46] = 12'h7f8;
      expv[47] = 12'h652;
      expv[48] = 12'h7f8;
      expv[49] = 12'h8a0;
      expv[50] = 12'h03a;
      expv[51] = 12'h7f8;
      expv[52] = 12'hf58;
      expv[53] = 12'h7f8;
      expv[54] = 12'h7f8;
      expv[55] = 12'h7f8;
      expv[56] = 12'h7f8;
      expv[57] = 12'h7f8;
      expv[58] = 12'h7f8;
      expv[59] = 12'h7f8;
      expv[60] = 12'h7f8;
      expv[61] = 12'h846;
      expv[62] = 12'hb2c;
      expv[63] = 12'h7f8;
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
