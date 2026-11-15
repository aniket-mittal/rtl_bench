// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 38;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_071898 dut (
    .clk(clk),
    .reset(in_vec[37:37]),
    .sclk_en(in_vec[36:36]),
    .if_write_ce(in_vec[35:35]),
    .if_write(in_vec[34:34]),
    .if_din(in_vec[33:2]),
    .if_read_ce(in_vec[1:1]),
    .if_read(in_vec[0:0]),
    .if_full_n(out_vec[33:33]),
    .if_empty_n(out_vec[32:32]),
    .if_dout(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 38'h3d257155a3;
    stim[1] = 38'h21a324ba2c;
    stim[2] = 38'h17f8721146;
    stim[3] = 38'h0393ed6183;
    stim[4] = 38'h023fdda6d6;
    stim[5] = 38'h1bd305df21;
    stim[6] = 38'h10d39dab6f;
    stim[7] = 38'h1a77e9a5db;
    stim[8] = 38'h000c4901dd;
    stim[9] = 38'h00cc018edc;
    stim[10] = 38'h02cb1addbd;
    stim[11] = 38'h096dc9ff8d;
    stim[12] = 38'h175a81a081;
    stim[13] = 38'h052c63da6b;
    stim[14] = 38'h00bb90db48;
    stim[15] = 38'h0149e383a3;
    stim[16] = 38'h164a1c534e;
    stim[17] = 38'h28431e2706;
    stim[18] = 38'h0bd972f080;
    stim[19] = 38'h0fca3091d5;
    stim[20] = 38'h17b047c05a;
    stim[21] = 38'h1ebeac7a87;
    stim[22] = 38'h1d0e6754b5;
    stim[23] = 38'h0e589d996f;
    stim[24] = 38'h1013fae750;
    stim[25] = 38'h0ec8bd7a59;
    stim[26] = 38'h0c13fb9a0a;
    stim[27] = 38'h0efb7512a2;
    stim[28] = 38'h101219cf38;
    stim[29] = 38'h1ba913d394;
    stim[30] = 38'h0fbd08983b;
    stim[31] = 38'h0224737e45;
    stim[32] = 38'h1c76762b70;
    stim[33] = 38'h1f293126c8;
    stim[34] = 38'h11598642ee;
    stim[35] = 38'h1c201bc4f9;
    stim[36] = 38'h111613503e;
    stim[37] = 38'h0a8839a8d0;
    stim[38] = 38'h1106a9b001;
    stim[39] = 38'h0a8455a7e5;
    stim[40] = 38'h105b8074af;
    stim[41] = 38'h141a556973;
    stim[42] = 38'h0d4ce9e0f3;
    stim[43] = 38'h0db2e9159e;
    stim[44] = 38'h1c11b2f59e;
    stim[45] = 38'h1b2f46ee83;
    stim[46] = 38'h1c76961662;
    stim[47] = 38'h13b2a4df19;
    stim[48] = 38'h11e42d51e5;
    stim[49] = 38'h01119e0389;
    stim[50] = 38'h129a1e549a;
    stim[51] = 38'h064d06e1aa;
    stim[52] = 38'h1b8b94584b;
    stim[53] = 38'h1b846a40c8;
    stim[54] = 38'h1cde56bb85;
    stim[55] = 38'h0ab5e29a11;
    stim[56] = 38'h0b28a03a3f;
    stim[57] = 38'h1fd2748843;
    stim[58] = 38'h153ebbada7;
    stim[59] = 38'h0f9fd98b19;
    stim[60] = 38'h15f4138f67;
    stim[61] = 38'h071c5d9fde;
    stim[62] = 38'h08252e6339;
    stim[63] = 38'h126184a338;
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
      expv[0] = 34'h200000000;
      expv[1] = 34'h200000000;
      expv[2] = 34'h200000000;
      expv[3] = 34'h200000000;
      expv[4] = 34'h200000000;
      expv[5] = 34'h200000000;
      expv[6] = 34'h200000000;
      expv[7] = 34'h200000000;
      expv[8] = 34'h200000000;
      expv[9] = 34'h200000000;
      expv[10] = 34'h200000000;
      expv[11] = 34'h200000000;
      expv[12] = 34'h200000000;
      expv[13] = 34'h200000000;
      expv[14] = 34'h200000000;
      expv[15] = 34'h200000000;
      expv[16] = 34'h200000000;
      expv[17] = 34'h200000000;
      expv[18] = 34'h200000000;
      expv[19] = 34'h200000000;
      expv[20] = 34'h200000000;
      expv[21] = 34'h200000000;
      expv[22] = 34'h200000000;
      expv[23] = 34'h200000000;
      expv[24] = 34'h200000000;
      expv[25] = 34'h200000000;
      expv[26] = 34'h200000000;
      expv[27] = 34'h200000000;
      expv[28] = 34'h200000000;
      expv[29] = 34'h200000000;
      expv[30] = 34'h200000000;
      expv[31] = 34'h200000000;
      expv[32] = 34'h200000000;
      expv[33] = 34'h200000000;
      expv[34] = 34'h200000000;
      expv[35] = 34'h3afab1ea1;
      expv[36] = 34'h3afab1ea1;
      expv[37] = 34'h3afab1ea1;
      expv[38] = 34'h3afab1ea1;
      expv[39] = 34'h3afab1ea1;
      expv[40] = 34'h3afab1ea1;
      expv[41] = 34'h34399d52d;
      expv[42] = 34'h31d9d8adc;
      expv[43] = 34'h31d9d8adc;
      expv[44] = 34'h31d9d8adc;
      expv[45] = 34'h31d9d8adc;
      expv[46] = 34'h3ca4c49b2;
      expv[47] = 34'h3ca4c49b2;
      expv[48] = 34'h3ca4c49b2;
      expv[49] = 34'h3ca4c49b2;
      expv[50] = 34'h3ca4c49b2;
      expv[51] = 34'h3ca4c49b2;
      expv[52] = 34'h3ca4c49b2;
      expv[53] = 34'h30806f13e;
      expv[54] = 34'h30806f13e;
      expv[55] = 34'h30806f13e;
      expv[56] = 34'h30806f13e;
      expv[57] = 34'h30806f13e;
      expv[58] = 34'h31da58598;
      expv[59] = 34'h31da58598;
      expv[60] = 34'h31da58598;
      expv[61] = 34'h33795aee1;
      expv[62] = 34'h33795aee1;
      expv[63] = 34'h33795aee1;
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
