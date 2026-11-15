// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 31;
  localparam OW = 36;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_06823 dut (
    .clk(clk),
    .rstn(in_vec[30:30]),
    .tic_enable(in_vec[29:29]),
    .f_control(in_vec[28:0]),
    .carrier_val(out_vec[35:4]),
    .i_sign(out_vec[3:3]),
    .i_mag(out_vec[2:2]),
    .q_sign(out_vec[1:1]),
    .q_mag(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 31'h38c8b245;
    stim[1] = 31'h01d6d213;
    stim[2] = 31'h5749fdf1;
    stim[3] = 31'h12d7326d;
    stim[4] = 31'h492f5609;
    stim[5] = 31'h6bddbd76;
    stim[6] = 31'h6009490f;
    stim[7] = 31'h79028379;
    stim[8] = 31'h4cf272df;
    stim[9] = 31'h4cd3725d;
    stim[10] = 31'h41d3af2c;
    stim[11] = 31'h473a04aa;
    stim[12] = 31'h5b646ec8;
    stim[13] = 31'h470a5845;
    stim[14] = 31'h5b6cc190;
    stim[15] = 31'h57060294;
    stim[16] = 31'h4d7b9335;
    stim[17] = 31'h41be834a;
    stim[18] = 31'h6dbacaf6;
    stim[19] = 31'h4bad97f1;
    stim[20] = 31'h79a659c0;
    stim[21] = 31'h5fddce05;
    stim[22] = 31'h6b37fdfb;
    stim[23] = 31'h61eb5cc8;
    stim[24] = 31'h657f52bb;
    stim[25] = 31'h79d06a98;
    stim[26] = 31'h755274d9;
    stim[27] = 31'h4b6f48c1;
    stim[28] = 31'h47c61aa2;
    stim[29] = 31'h4eb46090;
    stim[30] = 31'h521861b2;
    stim[31] = 31'h7d6fec66;
    stim[32] = 31'h49d3bdc0;
    stim[33] = 31'h6e6488a0;
    stim[34] = 31'h4d7a90e6;
    stim[35] = 31'h6762c77d;
    stim[36] = 31'h5a9578e5;
    stim[37] = 31'h6d07e69d;
    stim[38] = 31'h4e969b66;
    stim[39] = 31'h4963c2cc;
    stim[40] = 31'h47ab1165;
    stim[41] = 31'h661ac8e9;
    stim[42] = 31'h6ae3f334;
    stim[43] = 31'h594f6946;
    stim[44] = 31'h64c83e46;
    stim[45] = 31'h439ebedb;
    stim[46] = 31'h44e31bc4;
    stim[47] = 31'h4479723b;
    stim[48] = 31'h7893d983;
    stim[49] = 31'h6415dfd9;
    stim[50] = 31'h68a7a1cc;
    stim[51] = 31'h6118c01e;
    stim[52] = 31'h6e3eeb70;
    stim[53] = 31'h57adf884;
    stim[54] = 31'h487a96f1;
    stim[55] = 31'h4304653b;
    stim[56] = 31'h48272f29;
    stim[57] = 31'h731068a5;
    stim[58] = 31'h4a099661;
    stim[59] = 31'h6ac21f7d;
    stim[60] = 31'h48684830;
    stim[61] = 31'h5eee64e8;
    stim[62] = 31'h67b92396;
    stim[63] = 31'h471c6fdf;
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
      expv[0] = 36'hxxxxxxxxc;
      expv[1] = 36'hxxxxxxxx3;
      expv[2] = 36'hxxxxxxxxc;
      expv[3] = 36'hxxxxxxxxe;
      expv[4] = 36'hxxxxxxxxb;
      expv[5] = 36'hxxxxxxxxc;
      expv[6] = 36'h00000092c;
      expv[7] = 36'h000001504;
      expv[8] = 36'h000001516;
      expv[9] = 36'h00000151b;
      expv[10] = 36'h00000151b;
      expv[11] = 36'h00000151e;
      expv[12] = 36'h000001514;
      expv[13] = 36'h000001514;
      expv[14] = 36'h00000151e;
      expv[15] = 36'h000001511;
      expv[16] = 36'h000001514;
      expv[17] = 36'h000001516;
      expv[18] = 36'h000001513;
      expv[19] = 36'h00000b50e;
      expv[20] = 36'h00000b501;
      expv[21] = 36'h000000e7b;
      expv[22] = 36'h000000e7e;
      expv[23] = 36'h0000047fc;
      expv[24] = 36'h00000132c;
      expv[25] = 36'h000001516;
      expv[26] = 36'h000001a9b;
      expv[27] = 36'h00000346c;
      expv[28] = 36'h000003469;
      expv[29] = 36'h000003461;
      expv[30] = 36'h000003463;
      expv[31] = 36'h00000346c;
      expv[32] = 36'h000003db1;
      expv[33] = 36'h000003db4;
      expv[34] = 36'h000002503;
      expv[35] = 36'h00000250b;
      expv[36] = 36'h0000040d9;
      expv[37] = 36'h0000040d4;
      expv[38] = 36'h0000022d3;
      expv[39] = 36'h0000022db;
      expv[40] = 36'h0000022de;
      expv[41] = 36'h0000022dc;
      expv[42] = 36'h000004f89;
      expv[43] = 36'h000001596;
      expv[44] = 36'h000001593;
      expv[45] = 36'h0000039d3;
      expv[46] = 36'h0000039db;
      expv[47] = 36'h0000039db;
      expv[48] = 36'h0000039d1;
      expv[49] = 36'h000004b91;
      expv[50] = 36'h000002424;
      expv[51] = 36'h000002844;
      expv[52] = 36'h0000030e3;
      expv[53] = 36'h00000320c;
      expv[54] = 36'h000003209;
      expv[55] = 36'h000003209;
      expv[56] = 36'h000003201;
      expv[57] = 36'h000003203;
      expv[58] = 36'h000002b9b;
      expv[59] = 36'h000002b9e;
      expv[60] = 36'h0000048ac;
      expv[61] = 36'h0000048a6;
      expv[62] = 36'h0000048a3;
      expv[63] = 36'h000003acb;
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
