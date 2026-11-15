// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_063136 dut (
    .note_clk(clk),
    .note_in(in_vec[11:6]),
    .speed(in_vec[5:4]),
    .depth(in_vec[3:2]),
    .en(in_vec[1:1]),
    .clk50mhz(in_vec[0:0]),
    .note_out(out_vec[9:4]),
    .offset_mul(out_vec[3:1]),
    .offset_dir(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'hf57;
    stim[1] = 12'h8e3;
    stim[2] = 12'hb2a;
    stim[3] = 12'hc1a;
    stim[4] = 12'h730;
    stim[5] = 12'h8aa;
    stim[6] = 12'hd5b;
    stim[7] = 12'hacf;
    stim[8] = 12'hc06;
    stim[9] = 12'h866;
    stim[10] = 12'h9a5;
    stim[11] = 12'hd2c;
    stim[12] = 12'h56b;
    stim[13] = 12'ha7c;
    stim[14] = 12'hc5d;
    stim[15] = 12'h415;
    stim[16] = 12'h037;
    stim[17] = 12'hc13;
    stim[18] = 12'hd88;
    stim[19] = 12'he56;
    stim[20] = 12'hddd;
    stim[21] = 12'h610;
    stim[22] = 12'hafe;
    stim[23] = 12'h72d;
    stim[24] = 12'h7c1;
    stim[25] = 12'h8dc;
    stim[26] = 12'hfab;
    stim[27] = 12'he77;
    stim[28] = 12'h1ef;
    stim[29] = 12'h5fd;
    stim[30] = 12'h432;
    stim[31] = 12'h024;
    stim[32] = 12'h7e5;
    stim[33] = 12'hdb7;
    stim[34] = 12'h891;
    stim[35] = 12'h292;
    stim[36] = 12'hed1;
    stim[37] = 12'h2bd;
    stim[38] = 12'h33a;
    stim[39] = 12'h453;
    stim[40] = 12'hbcb;
    stim[41] = 12'h79b;
    stim[42] = 12'h587;
    stim[43] = 12'h82e;
    stim[44] = 12'h01a;
    stim[45] = 12'h993;
    stim[46] = 12'h3da;
    stim[47] = 12'h467;
    stim[48] = 12'h23c;
    stim[49] = 12'hee5;
    stim[50] = 12'ha53;
    stim[51] = 12'h77b;
    stim[52] = 12'ha96;
    stim[53] = 12'h787;
    stim[54] = 12'hbf4;
    stim[55] = 12'h52c;
    stim[56] = 12'h4dc;
    stim[57] = 12'hdb4;
    stim[58] = 12'h04d;
    stim[59] = 12'hb4c;
    stim[60] = 12'h4cb;
    stim[61] = 12'h17b;
    stim[62] = 12'h319;
    stim[63] = 12'h18b;
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
      expv[0] = 10'h3d0;
      expv[1] = 10'h230;
      expv[2] = 10'h2c0;
      expv[3] = 10'h302;
      expv[4] = 10'h1c2;
      expv[5] = 10'h220;
      expv[6] = 10'h352;
      expv[7] = 10'h2b4;
      expv[8] = 10'h308;
      expv[9] = 10'h212;
      expv[10] = 10'h262;
      expv[11] = 10'h344;
      expv[12] = 10'h15c;
      expv[13] = 10'h296;
      expv[14] = 10'h31c;
      expv[15] = 10'h10c;
      expv[16] = 10'h004;
      expv[17] = 10'h304;
      expv[18] = 10'h362;
      expv[19] = 10'h398;
      expv[20] = 10'h374;
      expv[21] = 10'h18c;
      expv[22] = 10'h2b2;
      expv[23] = 10'h1cc;
      expv[24] = 10'h1fc;
      expv[25] = 10'h232;
      expv[26] = 10'h3ea;
      expv[27] = 10'h396;
      expv[28] = 10'h072;
      expv[29] = 10'h178;
      expv[30] = 10'h108;
      expv[31] = 10'h002;
      expv[32] = 10'h1f2;
      expv[33] = 10'h362;
      expv[34] = 10'h222;
      expv[35] = 10'h0a0;
      expv[36] = 10'h3b0;
      expv[37] = 10'h0a0;
      expv[38] = 10'h0c4;
      expv[39] = 10'h112;
      expv[40] = 10'h2f0;
      expv[41] = 10'h1e0;
      expv[42] = 10'h161;
      expv[43] = 10'h201;
      expv[44] = 10'h003;
      expv[45] = 10'h263;
      expv[46] = 10'h0f1;
      expv[47] = 10'h115;
      expv[48] = 10'h083;
      expv[49] = 10'h3b9;
      expv[50] = 10'h293;
      expv[51] = 10'h1d3;
      expv[52] = 10'h2a5;
      expv[53] = 10'h1e3;
      expv[54] = 10'h2f5;
      expv[55] = 10'h145;
      expv[56] = 10'h13d;
      expv[57] = 10'h36d;
      expv[58] = 10'h015;
      expv[59] = 10'h2df;
      expv[60] = 10'h13f;
      expv[61] = 10'h057;
      expv[62] = 10'h0c7;
      expv[63] = 10'h067;
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
