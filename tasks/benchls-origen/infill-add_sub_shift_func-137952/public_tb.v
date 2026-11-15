// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 23;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_137952 dut (
    .clk(clk),
    .rst(in_vec[22:22]),
    .a(in_vec[21:14]),
    .b(in_vec[13:6]),
    .add_sub(in_vec[5:5]),
    .shift_in(in_vec[4:1]),
    .control(in_vec[0:0]),
    .final_out(out_vec[8:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 23'h5fb395;
    stim[1] = 23'h784d8b;
    stim[2] = 23'h173c45;
    stim[3] = 23'h22b47a;
    stim[4] = 23'h1b9ea4;
    stim[5] = 23'h258d3a;
    stim[6] = 23'h1c0070;
    stim[7] = 23'h1e5759;
    stim[8] = 23'h374279;
    stim[9] = 23'h3843ad;
    stim[10] = 23'h3460fc;
    stim[11] = 23'h2caa68;
    stim[12] = 23'h15e235;
    stim[13] = 23'h2afeb2;
    stim[14] = 23'h22bcb7;
    stim[15] = 23'h027504;
    stim[16] = 23'h0cdf29;
    stim[17] = 23'h0a30a4;
    stim[18] = 23'h2d3421;
    stim[19] = 23'h336bdd;
    stim[20] = 23'h0a6852;
    stim[21] = 23'h3dee5e;
    stim[22] = 23'h126c0f;
    stim[23] = 23'h21823b;
    stim[24] = 23'h39356f;
    stim[25] = 23'h0dc5f3;
    stim[26] = 23'h15318e;
    stim[27] = 23'h24660f;
    stim[28] = 23'h221cbf;
    stim[29] = 23'h3c4a55;
    stim[30] = 23'h222035;
    stim[31] = 23'h12aaf5;
    stim[32] = 23'h2f0dae;
    stim[33] = 23'h0e05ce;
    stim[34] = 23'h19e1a6;
    stim[35] = 23'h0ca396;
    stim[36] = 23'h08523f;
    stim[37] = 23'h027226;
    stim[38] = 23'h2a4414;
    stim[39] = 23'h326e08;
    stim[40] = 23'h07c757;
    stim[41] = 23'h1d7761;
    stim[42] = 23'h12abe0;
    stim[43] = 23'h25102a;
    stim[44] = 23'h0dcaac;
    stim[45] = 23'h259da9;
    stim[46] = 23'h3ef64a;
    stim[47] = 23'h044e9d;
    stim[48] = 23'h0f99db;
    stim[49] = 23'h3eb414;
    stim[50] = 23'h3e1122;
    stim[51] = 23'h0753ab;
    stim[52] = 23'h377789;
    stim[53] = 23'h27d245;
    stim[54] = 23'h0a5dd8;
    stim[55] = 23'h2d2fc3;
    stim[56] = 23'h013b1e;
    stim[57] = 23'h3aa087;
    stim[58] = 23'h2cb406;
    stim[59] = 23'h3ad10f;
    stim[60] = 23'h2201ff;
    stim[61] = 23'h139ebd;
    stim[62] = 23'h0aafdd;
    stim[63] = 23'h2c3a41;
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
      expv[0] = 9'h005;
      expv[1] = 9'h00a;
      expv[2] = 9'h004;
      expv[3] = 9'h160;
      expv[4] = 9'h157;
      expv[5] = 9'h0dd;
      expv[6] = 9'h0c9;
      expv[7] = 9'h07a;
      expv[8] = 9'h025;
      expv[9] = 9'h0f2;
      expv[10] = 9'h0e2;
      expv[11] = 9'h14c;
      expv[12] = 9'h160;
      expv[13] = 9'h0dc;
      expv[14] = 9'h1ac;
      expv[15] = 9'h178;
      expv[16] = 9'h13d;
      expv[17] = 9'h0ab;
      expv[18] = 9'h0ea;
      expv[19] = 9'h191;
      expv[20] = 9'h01b;
      expv[21] = 9'h179;
      expv[22] = 9'h04c;
      expv[23] = 9'h1a4;
      expv[24] = 9'h09c;
      expv[25] = 9'h1bc;
      expv[26] = 9'h040;
      expv[27] = 9'h19c;
      expv[28] = 9'h008;
      expv[29] = 9'h0ff;
      expv[30] = 9'h0cd;
      expv[31] = 9'h10d;
      expv[32] = 9'h0e7;
      expv[33] = 9'h0e4;
      expv[34] = 9'h01b;
      expv[35] = 9'h0e6;
      expv[36] = 9'h1b3;
      expv[37] = 9'h063;
      expv[38] = 9'h0cc;
      expv[39] = 9'h091;
      expv[40] = 9'h018;
      expv[41] = 9'h002;
      expv[42] = 9'h152;
      expv[43] = 9'h0ef;
      expv[44] = 9'h0c8;
      expv[45] = 9'h069;
      expv[46] = 9'h102;
      expv[47] = 9'h02f;
      expv[48] = 9'h1e2;
      expv[49] = 9'h1d2;
      expv[50] = 9'h028;
      expv[51] = 9'h146;
      expv[52] = 9'h073;
      expv[53] = 9'h003;
      expv[54] = 9'h04d;
      expv[55] = 9'h1b4;
      expv[56] = 9'h1e6;
      expv[57] = 9'h11e;
      expv[58] = 9'h062;
      expv[59] = 9'h1f0;
      expv[60] = 9'h0b6;
      expv[61] = 9'h09c;
      expv[62] = 9'h0d5;
      expv[63] = 9'h16b;
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
