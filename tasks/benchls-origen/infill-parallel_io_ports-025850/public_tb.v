// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 30;
  localparam OW = 26;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_025850 dut (
    .clk(clk),
    .reset_n(in_vec[29:29]),
    .data_in(in_vec[28:21]),
    .cs_n(in_vec[20:20]),
    .rd_n(in_vec[19:19]),
    .wr_n(in_vec[18:18]),
    .addr(in_vec[17:16]),
    .P1_in(in_vec[15:8]),
    .P2_in(in_vec[7:0]),
    .data_out(out_vec[25:18]),
    .P1_out(out_vec[17:10]),
    .P2_out(out_vec[9:2]),
    .P1_oen(out_vec[1:1]),
    .P2_oen(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 30'h07156682;
    stim[1] = 30'h0d964575;
    stim[2] = 30'h2a91ad6e;
    stim[3] = 30'h3fbb2eea;
    stim[4] = 30'h280351ad;
    stim[5] = 30'h23b33f42;
    stim[6] = 30'h24135f92;
    stim[7] = 30'h319a22c5;
    stim[8] = 30'h3c6bfe67;
    stim[9] = 30'h2834b679;
    stim[10] = 30'h22f81577;
    stim[11] = 30'h3178c9fb;
    stim[12] = 30'h3be857e8;
    stim[13] = 30'h3e9b1b2a;
    stim[14] = 30'h2e6fb8c3;
    stim[15] = 30'h376cbe88;
    stim[16] = 30'h2fe5ec05;
    stim[17] = 30'h2e1e8d97;
    stim[18] = 30'h3d667282;
    stim[19] = 30'h319720a3;
    stim[20] = 30'h39a8a1b0;
    stim[21] = 30'h301fc7e6;
    stim[22] = 30'h29093d08;
    stim[23] = 30'h2517f375;
    stim[24] = 30'h244fac45;
    stim[25] = 30'h2ac340c2;
    stim[26] = 30'h3afd6675;
    stim[27] = 30'h358abb04;
    stim[28] = 30'h3a2efac4;
    stim[29] = 30'h30c4759b;
    stim[30] = 30'h3d9b057a;
    stim[31] = 30'h210a71df;
    stim[32] = 30'h27ce3402;
    stim[33] = 30'h22917935;
    stim[34] = 30'h2a4b096a;
    stim[35] = 30'h24689eed;
    stim[36] = 30'h24a65910;
    stim[37] = 30'h31c1a4f9;
    stim[38] = 30'h252a05d0;
    stim[39] = 30'h2bc4ec60;
    stim[40] = 30'h2787528b;
    stim[41] = 30'h21239203;
    stim[42] = 30'h317fb447;
    stim[43] = 30'h2a381d6f;
    stim[44] = 30'h2c704b2a;
    stim[45] = 30'h20d8697e;
    stim[46] = 30'h3acbfadd;
    stim[47] = 30'h338a2066;
    stim[48] = 30'h3ab9be4a;
    stim[49] = 30'h2a519405;
    stim[50] = 30'h3f02d764;
    stim[51] = 30'h275f455b;
    stim[52] = 30'h293edad5;
    stim[53] = 30'h0e5991fe;
    stim[54] = 30'h2a294393;
    stim[55] = 30'h337b0b8d;
    stim[56] = 30'h20691916;
    stim[57] = 30'h3d8748a7;
    stim[58] = 30'h269d1a88;
    stim[59] = 30'h3703db64;
    stim[60] = 30'h26375a5a;
    stim[61] = 30'h24c1d493;
    stim[62] = 30'h224fb0d6;
    stim[63] = 30'h3c3cafd8;
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
      expv[0] = 26'hxxxxxxx;
      expv[1] = 26'hxxxxxxx;
      expv[2] = 26'hxxxxxxx;
      expv[3] = 26'hxxxxxxx;
      expv[4] = 26'hxxxxxxx;
      expv[5] = 26'h00xxxxx;
      expv[6] = 26'h00xxxxx;
      expv[7] = 26'h00xxxxx;
      expv[8] = 26'h00xxxxx;
      expv[9] = 26'h00xxxxx;
      expv[10] = 26'h00xxxxx;
      expv[11] = 26'h00xxxxx;
      expv[12] = 26'h00xxxxx;
      expv[13] = 26'h0037xxx;
      expv[14] = 26'h0037xxx;
      expv[15] = 26'h0037xxx;
      expv[16] = 26'h0037xxx;
      expv[17] = 26'hxxx7xxx;
      expv[18] = 26'hxxx7xxx;
      expv[19] = 26'h0037xxx;
      expv[20] = 26'h0037xxx;
      expv[21] = 26'h0033xxx;
      expv[22] = 26'h0033xxx;
      expv[23] = 26'h003352x;
      expv[24] = 26'h003352x;
      expv[25] = 26'h003352x;
      expv[26] = 26'h003352x;
      expv[27] = 26'h003352x;
      expv[28] = 26'h0033520;
      expv[29] = 26'h0033520;
      expv[30] = 26'h3eb3520;
      expv[31] = 26'h3eb3520;
      expv[32] = 26'h3eb3520;
      expv[33] = 26'h3eb3520;
      expv[34] = 26'h3eb3520;
      expv[35] = 26'h3eb3520;
      expv[36] = 26'h3e88d20;
      expv[37] = 26'h0008d20;
      expv[38] = 26'h0408e38;
      expv[39] = 26'h0408e3a;
      expv[40] = 26'h08c8e3a;
      expv[41] = 26'h0008e3a;
      expv[42] = 26'h0008e3a;
      expv[43] = 26'h0008e3a;
      expv[44] = 26'h0008e3a;
      expv[45] = 26'h0008e3a;
      expv[46] = 26'h0008e3a;
      expv[47] = 26'h0008e3a;
      expv[48] = 26'h0008e38;
      expv[49] = 26'h0008e38;
      expv[50] = 26'h0008e38;
      expv[51] = 26'h0008e38;
      expv[52] = 26'h0008e38;
      expv[53] = 26'h0008e38;
      expv[54] = 26'h0008e38;
      expv[55] = 26'h0008d44;
      expv[56] = 26'h0008d44;
      expv[57] = 26'h0008c0c;
      expv[58] = 26'h0008c0c;
      expv[59] = 26'h0008c0c;
      expv[60] = 26'h0008c0c;
      expv[61] = 26'h0008c0c;
      expv[62] = 26'h1688c98;
      expv[63] = 26'h1688c98;
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
