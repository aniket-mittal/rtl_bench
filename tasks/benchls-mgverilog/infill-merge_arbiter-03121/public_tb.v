// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 16;
  localparam OW = 2;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_03121 dut (
    .clock(clk),
    .resetn(in_vec[15:15]),
    .merge_node_valid_in_0_staging_reg(in_vec[14:14]),
    .merge_node_valid_in_1_staging_reg(in_vec[13:13]),
    .valid_in_0(in_vec[12:12]),
    .valid_in_1(in_vec[11:11]),
    .merge_stalled_by_successors(in_vec[10:10]),
    .workgroup_size(in_vec[9:0]),
    .merge_block_selector(out_vec[1:1]),
    .is_merge_data_to_local_regs_valid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 16'h67c4;
    stim[1] = 16'h4087;
    stim[2] = 16'h8514;
    stim[3] = 16'he03b;
    stim[4] = 16'h1f73;
    stim[5] = 16'he0a6;
    stim[6] = 16'hee48;
    stim[7] = 16'he166;
    stim[8] = 16'hd183;
    stim[9] = 16'hda33;
    stim[10] = 16'he116;
    stim[11] = 16'h9aa8;
    stim[12] = 16'hab8c;
    stim[13] = 16'hcc3d;
    stim[14] = 16'h8df2;
    stim[15] = 16'haa12;
    stim[16] = 16'he1da;
    stim[17] = 16'h9c02;
    stim[18] = 16'hb54f;
    stim[19] = 16'hd510;
    stim[20] = 16'he2d2;
    stim[21] = 16'hbd7d;
    stim[22] = 16'hcc1a;
    stim[23] = 16'h9d48;
    stim[24] = 16'h8df0;
    stim[25] = 16'he1f7;
    stim[26] = 16'ha3f3;
    stim[27] = 16'h99d2;
    stim[28] = 16'hf87e;
    stim[29] = 16'h970a;
    stim[30] = 16'hcf9f;
    stim[31] = 16'haeb3;
    stim[32] = 16'hff88;
    stim[33] = 16'he480;
    stim[34] = 16'h0188;
    stim[35] = 16'hb1cd;
    stim[36] = 16'hf2e6;
    stim[37] = 16'haa6b;
    stim[38] = 16'he473;
    stim[39] = 16'hc57f;
    stim[40] = 16'hf181;
    stim[41] = 16'hfe43;
    stim[42] = 16'ha69b;
    stim[43] = 16'hf40d;
    stim[44] = 16'hdc21;
    stim[45] = 16'ha86c;
    stim[46] = 16'hf76b;
    stim[47] = 16'h8402;
    stim[48] = 16'h8ba8;
    stim[49] = 16'h4f8d;
    stim[50] = 16'hbca5;
    stim[51] = 16'hdfda;
    stim[52] = 16'hc2b5;
    stim[53] = 16'hff1b;
    stim[54] = 16'h8b8a;
    stim[55] = 16'he030;
    stim[56] = 16'h80b6;
    stim[57] = 16'h98f4;
    stim[58] = 16'hdc7d;
    stim[59] = 16'h89dc;
    stim[60] = 16'hab06;
    stim[61] = 16'hb8f4;
    stim[62] = 16'hda24;
    stim[63] = 16'hcbad;
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
      expv[0] = 2'h3;
      expv[1] = 2'h1;
      expv[2] = 2'h0;
      expv[3] = 2'h3;
      expv[4] = 2'h3;
      expv[5] = 2'h3;
      expv[6] = 2'h3;
      expv[7] = 2'h3;
      expv[8] = 2'h2;
      expv[9] = 2'h3;
      expv[10] = 2'h3;
      expv[11] = 2'h3;
      expv[12] = 2'h3;
      expv[13] = 2'h3;
      expv[14] = 2'h3;
      expv[15] = 2'h3;
      expv[16] = 2'h3;
      expv[17] = 2'h3;
      expv[18] = 2'h3;
      expv[19] = 2'h2;
      expv[20] = 2'h3;
      expv[21] = 2'h3;
      expv[22] = 2'h3;
      expv[23] = 2'h3;
      expv[24] = 2'h3;
      expv[25] = 2'h3;
      expv[26] = 2'h3;
      expv[27] = 2'h3;
      expv[28] = 2'h3;
      expv[29] = 2'h2;
      expv[30] = 2'h3;
      expv[31] = 2'h3;
      expv[32] = 2'h3;
      expv[33] = 2'h3;
      expv[34] = 2'h0;
      expv[35] = 2'h3;
      expv[36] = 2'h3;
      expv[37] = 2'h3;
      expv[38] = 2'h3;
      expv[39] = 2'h2;
      expv[40] = 2'h3;
      expv[41] = 2'h3;
      expv[42] = 2'h3;
      expv[43] = 2'h3;
      expv[44] = 2'h3;
      expv[45] = 2'h3;
      expv[46] = 2'h3;
      expv[47] = 2'h2;
      expv[48] = 2'h3;
      expv[49] = 2'h3;
      expv[50] = 2'h3;
      expv[51] = 2'h3;
      expv[52] = 2'h1;
      expv[53] = 2'h1;
      expv[54] = 2'h0;
      expv[55] = 2'h1;
      expv[56] = 2'h0;
      expv[57] = 2'h1;
      expv[58] = 2'h1;
      expv[59] = 2'h0;
      expv[60] = 2'h0;
      expv[61] = 2'h1;
      expv[62] = 2'h1;
      expv[63] = 2'h1;
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
