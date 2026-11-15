// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 42;
  localparam OW = 51;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_11604 dut (
    .clk(clk),
    .ir_in(in_vec[41:40]),
    .sr(in_vec[39:2]),
    .vs_udr(in_vec[1:1]),
    .vs_uir(in_vec[0:0]),
    .jdo(out_vec[50:13]),
    .take_action_break_a(out_vec[12:12]),
    .take_action_break_b(out_vec[11:11]),
    .take_action_break_c(out_vec[10:10]),
    .take_action_ocimem_a(out_vec[9:9]),
    .take_action_ocimem_b(out_vec[8:8]),
    .take_action_tracectrl(out_vec[7:7]),
    .take_action_tracemem_a(out_vec[6:6]),
    .take_action_tracemem_b(out_vec[5:5]),
    .take_no_action_break_a(out_vec[4:4]),
    .take_no_action_break_b(out_vec[3:3]),
    .take_no_action_break_c(out_vec[2:2]),
    .take_no_action_ocimem_a(out_vec[1:1]),
    .take_no_action_tracemem_a(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 42'h088019f48cf;
    stim[1] = 42'h0fdc17d44ad;
    stim[2] = 42'h250e299e071;
    stim[3] = 42'h29a705708a4;
    stim[4] = 42'h06b0de1badf;
    stim[5] = 42'h30d3a23ea54;
    stim[6] = 42'h222524c1e0a;
    stim[7] = 42'h07f6bf82116;
    stim[8] = 42'h078fda02f07;
    stim[9] = 42'h366f329fcfa;
    stim[10] = 42'h3703f5249be;
    stim[11] = 42'h3cbdcf01b89;
    stim[12] = 42'h2fa83cde574;
    stim[13] = 42'h0f18a56b921;
    stim[14] = 42'h2b82b2fee0f;
    stim[15] = 42'h2504a3c094b;
    stim[16] = 42'h14a2a73a165;
    stim[17] = 42'h3a42df5e549;
    stim[18] = 42'h0653cd9640b;
    stim[19] = 42'h24c66a6d973;
    stim[20] = 42'h3b9f850285b;
    stim[21] = 42'h20b7b300c07;
    stim[22] = 42'h04be86c5162;
    stim[23] = 42'h3c76cb3bb56;
    stim[24] = 42'h2ecf16ad6b9;
    stim[25] = 42'h0ae6af447bf;
    stim[26] = 42'h3211a948bd4;
    stim[27] = 42'h309a87fc1a9;
    stim[28] = 42'h01f365085eb;
    stim[29] = 42'h2868d3ef5ec;
    stim[30] = 42'h392c34ee465;
    stim[31] = 42'h06aa9a9f001;
    stim[32] = 42'h398586bb29b;
    stim[33] = 42'h070e119dd43;
    stim[34] = 42'h3396273d002;
    stim[35] = 42'h2926a5bc477;
    stim[36] = 42'h108d09cb12c;
    stim[37] = 42'h08937fb8c21;
    stim[38] = 42'h3e9698020fa;
    stim[39] = 42'h00c10791f34;
    stim[40] = 42'h261903d4bd6;
    stim[41] = 42'h3899725e87c;
    stim[42] = 42'h327cdaab0c6;
    stim[43] = 42'h0d978b629f2;
    stim[44] = 42'h0fc3778190b;
    stim[45] = 42'h354332e27bc;
    stim[46] = 42'h3359b631c54;
    stim[47] = 42'h3cbcbd8ddb3;
    stim[48] = 42'h06409a4e0f8;
    stim[49] = 42'h0d46ad7bda4;
    stim[50] = 42'h325c07ff316;
    stim[51] = 42'h2569c4d8462;
    stim[52] = 42'h2de728c2bbb;
    stim[53] = 42'h2a76b33c356;
    stim[54] = 42'h3ef80c0993d;
    stim[55] = 42'h303a66fd20e;
    stim[56] = 42'h32a9bdf584e;
    stim[57] = 42'h0be5822c37c;
    stim[58] = 42'h21d0ce68798;
    stim[59] = 42'h06380c9a706;
    stim[60] = 42'h131ed82dced;
    stim[61] = 42'h1373342fc9a;
    stim[62] = 42'h07efa866f65;
    stim[63] = 42'h0a88a0de9e7;
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
      expv[0] = 51'hxxxxxxxxxxxxx;
      expv[1] = 51'hxxxxxxxxxxxxx;
      expv[2] = 51'hxxxxxxxxxxxxx;
      expv[3] = 51'hxxxxxxxxxxxxx;
      expv[4] = 51'hxxxxxxxxxxxxx;
      expv[5] = 51'hxxxxxxxxxx000;
      expv[6] = 51'hxxxxxxxxxx000;
      expv[7] = 51'hxxxxxxxxxx000;
      expv[8] = 51'h3fb5fc108a100;
      expv[9] = 51'h3fb5fc108a000;
      expv[10] = 51'h337994fe7c100;
      expv[11] = 51'h337994fe7c000;
      expv[12] = 51'h337994fe7c000;
      expv[13] = 51'h337994fe7c000;
      expv[14] = 51'h337994fe7c000;
      expv[15] = 51'h337994fe7c000;
      expv[16] = 51'h337994fe7c000;
      expv[17] = 51'h337994fe7c000;
      expv[18] = 51'h5216faf2a4020;
      expv[19] = 51'h5216faf2a4000;
      expv[20] = 51'h5216faf2a4000;
      expv[21] = 51'h5216faf2a4000;
      expv[22] = 51'h05bd980602001;
      expv[23] = 51'h05bd980602000;
      expv[24] = 51'h05bd980602000;
      expv[25] = 51'h05bd980602000;
      expv[26] = 51'h05bd980602000;
      expv[27] = 51'h05bd980602000;
      expv[28] = 51'h05bd980602000;
      expv[29] = 51'h0f9b2842f4000;
      expv[30] = 51'h0f9b2842f4000;
      expv[31] = 51'h0f9b2842f4000;
      expv[32] = 51'h3554d4f800000;
      expv[33] = 51'h3554d4f800000;
      expv[34] = 51'h3554d4f800000;
      expv[35] = 51'h3554d4f800000;
      expv[36] = 51'h49352de23a200;
      expv[37] = 51'h49352de23a000;
      expv[38] = 51'h49352de23a000;
      expv[39] = 51'h49352de23a000;
      expv[40] = 51'h49352de23a000;
      expv[41] = 51'h49352de23a000;
      expv[42] = 51'h44cb92f43f000;
      expv[43] = 51'h44cb92f43e000;
      expv[44] = 51'h6cbc5b14f8800;
      expv[45] = 51'h6cbc5b14f8000;
      expv[46] = 51'h2a199713de008;
      expv[47] = 51'h2a199713de000;
      expv[48] = 51'h2a199713de000;
      expv[49] = 51'h2a199713de000;
      expv[50] = 51'h2a199713de000;
      expv[51] = 51'h12e03ff98a080;
      expv[52] = 51'h12e03ff98a000;
      expv[53] = 51'h12e03ff98a000;
      expv[54] = 51'h53b599e1aa080;
      expv[55] = 51'h53b599e1aa000;
      expv[56] = 51'h53b599e1aa000;
      expv[57] = 51'h53b599e1aa000;
      expv[58] = 51'h53b599e1aa000;
      expv[59] = 51'h0e867343cc200;
      expv[60] = 51'h0e867343cc000;
      expv[61] = 51'h0e867343cc000;
      expv[62] = 51'h0e867343cc000;
      expv[63] = 51'h3f7d4337b2100;
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
