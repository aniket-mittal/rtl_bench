// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 24;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_060116 dut (
    .instruction(in_vec[31:0]),
    .Af(out_vec[23:20]),
    .I(out_vec[19:19]),
    .ALU_MUX_SEL(out_vec[18:18]),
    .Cad(out_vec[17:13]),
    .GP_WE(out_vec[12:12]),
    .GP_MUX_SEL(out_vec[11:10]),
    .Bf(out_vec[9:6]),
    .PC_MUX_SEL(out_vec[5:4]),
    .DM_WE(out_vec[3:3]),
    .Shift_type(out_vec[2:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'h7bea7dd6;
    stim[1] = 32'h7e73ea50;
    stim[2] = 32'hf20d6907;
    stim[3] = 32'h730941bc;
    stim[4] = 32'h3a1381ca;
    stim[5] = 32'hf796c01f;
    stim[6] = 32'h59e4f25b;
    stim[7] = 32'h92806f24;
    stim[8] = 32'h2480aa3a;
    stim[9] = 32'h3afecf85;
    stim[10] = 32'h93e4715b;
    stim[11] = 32'he517068f;
    stim[12] = 32'he191c542;
    stim[13] = 32'hd1b1113a;
    stim[14] = 32'h955a312c;
    stim[15] = 32'h5180b300;
    stim[16] = 32'h58f0877e;
    stim[17] = 32'h67e7bd4c;
    stim[18] = 32'hed7612f3;
    stim[19] = 32'hed5873fb;
    stim[20] = 32'h5cd2ea9b;
    stim[21] = 32'he3634763;
    stim[22] = 32'hca1649ca;
    stim[23] = 32'h1fe52c59;
    stim[24] = 32'h04b0c240;
    stim[25] = 32'hb7050c57;
    stim[26] = 32'h14687fb6;
    stim[27] = 32'h45f8997b;
    stim[28] = 32'h8227e572;
    stim[29] = 32'h9a46dcf9;
    stim[30] = 32'he80d3dc8;
    stim[31] = 32'h4293c05e;
    stim[32] = 32'hafd7ae13;
    stim[33] = 32'h7a8d1a19;
    stim[34] = 32'h72a51662;
    stim[35] = 32'hb37c9b1b;
    stim[36] = 32'ha2abb5e3;
    stim[37] = 32'hfb720fcb;
    stim[38] = 32'hd94566f4;
    stim[39] = 32'he202dba1;
    stim[40] = 32'hf15e36e4;
    stim[41] = 32'he162a753;
    stim[42] = 32'h2abd4f73;
    stim[43] = 32'he82c70a3;
    stim[44] = 32'h4603d532;
    stim[45] = 32'h3c8d9ff2;
    stim[46] = 32'h076cbd5a;
    stim[47] = 32'h24ff269d;
    stim[48] = 32'hc76921bc;
    stim[49] = 32'h500624e2;
    stim[50] = 32'h15c90708;
    stim[51] = 32'h79c9ff43;
    stim[52] = 32'h4ffa8d69;
    stim[53] = 32'hfd1e4370;
    stim[54] = 32'h33b545ed;
    stim[55] = 32'h75654272;
    stim[56] = 32'h2bc2301d;
    stim[57] = 32'hcf211c10;
    stim[58] = 32'h221482f3;
    stim[59] = 32'h1af3e769;
    stim[60] = 32'h35de94d0;
    stim[61] = 32'hf3f5569c;
    stim[62] = 32'hdf8a92dc;
    stim[63] = 32'ha6f1f7c5;
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
      expv[0] = 24'h000000;
      expv[1] = 24'h000000;
      expv[2] = 24'h000000;
      expv[3] = 24'h000000;
      expv[4] = 24'h000000;
      expv[5] = 24'h000000;
      expv[6] = 24'h000000;
      expv[7] = 24'h000000;
      expv[8] = 24'h000000;
      expv[9] = 24'h000000;
      expv[10] = 24'h000000;
      expv[11] = 24'h000000;
      expv[12] = 24'h000000;
      expv[13] = 24'h000000;
      expv[14] = 24'h000000;
      expv[15] = 24'h000000;
      expv[16] = 24'h000000;
      expv[17] = 24'h000000;
      expv[18] = 24'h000000;
      expv[19] = 24'h000000;
      expv[20] = 24'h000000;
      expv[21] = 24'h000000;
      expv[22] = 24'h000000;
      expv[23] = 24'h000000;
      expv[24] = 24'h000000;
      expv[25] = 24'h000000;
      expv[26] = 24'h000050;
      expv[27] = 24'h000000;
      expv[28] = 24'h000000;
      expv[29] = 24'h000000;
      expv[30] = 24'h000000;
      expv[31] = 24'h000000;
      expv[32] = 24'h2c0008;
      expv[33] = 24'h000000;
      expv[34] = 24'h000000;
      expv[35] = 24'h000000;
      expv[36] = 24'h000000;
      expv[37] = 24'h000000;
      expv[38] = 24'h000000;
      expv[39] = 24'h000000;
      expv[40] = 24'h000000;
      expv[41] = 24'h000000;
      expv[42] = 24'h000000;
      expv[43] = 24'h000000;
      expv[44] = 24'h000000;
      expv[45] = 24'h000000;
      expv[46] = 24'h000000;
      expv[47] = 24'h000000;
      expv[48] = 24'h000000;
      expv[49] = 24'h000000;
      expv[50] = 24'h000050;
      expv[51] = 24'h000000;
      expv[52] = 24'h000000;
      expv[53] = 24'h000000;
      expv[54] = 24'h0eb000;
      expv[55] = 24'h000000;
      expv[56] = 24'h000000;
      expv[57] = 24'h000000;
      expv[58] = 24'h2e9000;
      expv[59] = 24'h000000;
      expv[60] = 24'h1fd000;
      expv[61] = 24'h000000;
      expv[62] = 24'h000000;
      expv[63] = 24'h000000;
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
