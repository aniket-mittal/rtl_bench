// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 262;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_120660 dut (
    .Clock(clk),
    .Current(in_vec[7:0]),
    .PostSequence(out_vec[261:6]),
    .LastPostEntry(out_vec[5:1]),
    .Overflow(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'hfb;
    stim[1] = 8'hbd;
    stim[2] = 8'h97;
    stim[3] = 8'hd1;
    stim[4] = 8'h45;
    stim[5] = 8'hcc;
    stim[6] = 8'h15;
    stim[7] = 8'h31;
    stim[8] = 8'h9b;
    stim[9] = 8'hde;
    stim[10] = 8'h0c;
    stim[11] = 8'h4c;
    stim[12] = 8'h20;
    stim[13] = 8'h44;
    stim[14] = 8'hed;
    stim[15] = 8'h18;
    stim[16] = 8'h1c;
    stim[17] = 8'h82;
    stim[18] = 8'he4;
    stim[19] = 8'h50;
    stim[20] = 8'h56;
    stim[21] = 8'hf9;
    stim[22] = 8'h78;
    stim[23] = 8'h62;
    stim[24] = 8'hbc;
    stim[25] = 8'hc0;
    stim[26] = 8'hc3;
    stim[27] = 8'hec;
    stim[28] = 8'h39;
    stim[29] = 8'h9c;
    stim[30] = 8'h84;
    stim[31] = 8'hba;
    stim[32] = 8'he6;
    stim[33] = 8'h69;
    stim[34] = 8'h86;
    stim[35] = 8'h48;
    stim[36] = 8'h5a;
    stim[37] = 8'hfb;
    stim[38] = 8'h9e;
    stim[39] = 8'hae;
    stim[40] = 8'h54;
    stim[41] = 8'hc2;
    stim[42] = 8'h8b;
    stim[43] = 8'h56;
    stim[44] = 8'hff;
    stim[45] = 8'h2d;
    stim[46] = 8'hc1;
    stim[47] = 8'hd8;
    stim[48] = 8'h67;
    stim[49] = 8'hfe;
    stim[50] = 8'h2e;
    stim[51] = 8'hf2;
    stim[52] = 8'hda;
    stim[53] = 8'ha0;
    stim[54] = 8'he1;
    stim[55] = 8'h54;
    stim[56] = 8'he0;
    stim[57] = 8'hf4;
    stim[58] = 8'hb3;
    stim[59] = 8'hc9;
    stim[60] = 8'hb5;
    stim[61] = 8'ha7;
    stim[62] = 8'h67;
    stim[63] = 8'h4c;
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
      expv[0] = 262'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx0;
      expv[1] = 262'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxec2;
      expv[2] = 262'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxf7ec4;
      expv[3] = 262'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx5ef7ec6;
      expv[4] = 262'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx465ef7ec8;
      expv[5] = 262'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx17465ef7eca;
      expv[6] = 262'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx3117465ef7ecc;
      expv[7] = 262'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx573117465ef7ece;
      expv[8] = 262'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxc4573117465ef7ed0;
      expv[9] = 262'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx6cc4573117465ef7ed2;
      expv[10] = 262'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx7a6cc4573117465ef7ed4;
      expv[11] = 262'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx337a6cc4573117465ef7ed6;
      expv[12] = 262'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx30337a6cc4573117465ef7ed8;
      expv[13] = 262'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx8130337a6cc4573117465ef7eda;
      expv[14] = 262'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx108130337a6cc4573117465ef7edc;
      expv[15] = 262'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxb5108130337a6cc4573117465ef7ede;
      expv[16] = 262'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx63b5108130337a6cc4573117465ef7ee0;
      expv[17] = 262'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx7063b5108130337a6cc4573117465ef7ee2;
      expv[18] = 262'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxx087063b5108130337a6cc4573117465ef7ee4;
      expv[19] = 262'hxxxxxxxxxxxxxxxxxxxxxxxxxxx92087063b5108130337a6cc4573117465ef7ee6;
      expv[20] = 262'hxxxxxxxxxxxxxxxxxxxxxxxxx4392087063b5108130337a6cc4573117465ef7ee8;
      expv[21] = 262'hxxxxxxxxxxxxxxxxxxxxxxx594392087063b5108130337a6cc4573117465ef7eea;
      expv[22] = 262'hxxxxxxxxxxxxxxxxxxxxxe5594392087063b5108130337a6cc4573117465ef7eec;
      expv[23] = 262'hxxxxxxxxxxxxxxxxxxxe3e5594392087063b5108130337a6cc4573117465ef7eee;
      expv[24] = 262'hxxxxxxxxxxxxxxxxx89e3e5594392087063b5108130337a6cc4573117465ef7ef0;
      expv[25] = 262'hxxxxxxxxxxxxxxxf189e3e5594392087063b5108130337a6cc4573117465ef7ef2;
      expv[26] = 262'hxxxxxxxxxxxxx02f189e3e5594392087063b5108130337a6cc4573117465ef7ef4;
      expv[27] = 262'hxxxxxxxxxxx0f02f189e3e5594392087063b5108130337a6cc4573117465ef7ef6;
      expv[28] = 262'hxxxxxxxxxb30f02f189e3e5594392087063b5108130337a6cc4573117465ef7ef8;
      expv[29] = 262'hxxxxxxxe7b30f02f189e3e5594392087063b5108130337a6cc4573117465ef7efa;
      expv[30] = 262'hxxxxx70e7b30f02f189e3e5594392087063b5108130337a6cc4573117465ef7efc;
      expv[31] = 262'hxxx1270e7b30f02f189e3e5594392087063b5108130337a6cc4573117465ef7efe;
      expv[32] = 262'h2ea1270e7b30f02f189e3e5594392087063b5108130337a6cc4573117465ef7eff;
      expv[33] = 262'h2ea1270e7b30f02f189e3e5594392087063b5108130337a6cc4573117465ef7eff;
      expv[34] = 262'h2ea1270e7b30f02f189e3e5594392087063b5108130337a6cc4573117465ef7eff;
      expv[35] = 262'h2ea1270e7b30f02f189e3e5594392087063b5108130337a6cc4573117465ef7eff;
      expv[36] = 262'h2ea1270e7b30f02f189e3e5594392087063b5108130337a6cc4573117465ef7eff;
      expv[37] = 262'h2ea1270e7b30f02f189e3e5594392087063b5108130337a6cc4573117465ef7eff;
      expv[38] = 262'h2ea1270e7b30f02f189e3e5594392087063b5108130337a6cc4573117465ef7eff;
      expv[39] = 262'h2ea1270e7b30f02f189e3e5594392087063b5108130337a6cc4573117465ef7eff;
      expv[40] = 262'h2ea1270e7b30f02f189e3e5594392087063b5108130337a6cc4573117465ef7eff;
      expv[41] = 262'h2ea1270e7b30f02f189e3e5594392087063b5108130337a6cc4573117465ef7eff;
      expv[42] = 262'h2ea1270e7b30f02f189e3e5594392087063b5108130337a6cc4573117465ef7eff;
      expv[43] = 262'h2ea1270e7b30f02f189e3e5594392087063b5108130337a6cc4573117465ef7eff;
      expv[44] = 262'h2ea1270e7b30f02f189e3e5594392087063b5108130337a6cc4573117465ef7eff;
      expv[45] = 262'h2ea1270e7b30f02f189e3e5594392087063b5108130337a6cc4573117465ef7eff;
      expv[46] = 262'h2ea1270e7b30f02f189e3e5594392087063b5108130337a6cc4573117465ef7eff;
      expv[47] = 262'h2ea1270e7b30f02f189e3e5594392087063b5108130337a6cc4573117465ef7eff;
      expv[48] = 262'h2ea1270e7b30f02f189e3e5594392087063b5108130337a6cc4573117465ef7eff;
      expv[49] = 262'h2ea1270e7b30f02f189e3e5594392087063b5108130337a6cc4573117465ef7eff;
      expv[50] = 262'h2ea1270e7b30f02f189e3e5594392087063b5108130337a6cc4573117465ef7eff;
      expv[51] = 262'h2ea1270e7b30f02f189e3e5594392087063b5108130337a6cc4573117465ef7eff;
      expv[52] = 262'h2ea1270e7b30f02f189e3e5594392087063b5108130337a6cc4573117465ef7eff;
      expv[53] = 262'h2ea1270e7b30f02f189e3e5594392087063b5108130337a6cc4573117465ef7eff;
      expv[54] = 262'h2ea1270e7b30f02f189e3e5594392087063b5108130337a6cc4573117465ef7eff;
      expv[55] = 262'h2ea1270e7b30f02f189e3e5594392087063b5108130337a6cc4573117465ef7eff;
      expv[56] = 262'h2ea1270e7b30f02f189e3e5594392087063b5108130337a6cc4573117465ef7eff;
      expv[57] = 262'h2ea1270e7b30f02f189e3e5594392087063b5108130337a6cc4573117465ef7eff;
      expv[58] = 262'h2ea1270e7b30f02f189e3e5594392087063b5108130337a6cc4573117465ef7eff;
      expv[59] = 262'h2ea1270e7b30f02f189e3e5594392087063b5108130337a6cc4573117465ef7eff;
      expv[60] = 262'h2ea1270e7b30f02f189e3e5594392087063b5108130337a6cc4573117465ef7eff;
      expv[61] = 262'h2ea1270e7b30f02f189e3e5594392087063b5108130337a6cc4573117465ef7eff;
      expv[62] = 262'h2ea1270e7b30f02f189e3e5594392087063b5108130337a6cc4573117465ef7eff;
      expv[63] = 262'h2ea1270e7b30f02f189e3e5594392087063b5108130337a6cc4573117465ef7eff;
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
