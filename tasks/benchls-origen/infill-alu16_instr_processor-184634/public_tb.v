// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 50;
  localparam OW = 29;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_184634 dut (
    .instr(in_vec[49:34]),
    .inreg1(in_vec[33:18]),
    .inreg2(in_vec[17:2]),
    .carrystatus(in_vec[1:1]),
    .exec1(in_vec[0:0]),
    .aluout(out_vec[28:13]),
    .regM(out_vec[12:11]),
    .sel_mux_mem_alu(out_vec[10:10]),
    .sel_mux_inp(out_vec[9:9]),
    .output_en(out_vec[8:8]),
    .carryout(out_vec[7:7]),
    .carryen(out_vec[6:6]),
    .wenout(out_vec[5:5]),
    .RegN(out_vec[4:3]),
    .RegD(out_vec[2:1]),
    .sel_mux_regD(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 50'h24afa9d360b17;
    stim[1] = 50'h24f8c7d0237f7;
    stim[2] = 50'h3074296664b16;
    stim[3] = 50'h164957e28ca61;
    stim[4] = 50'h1311a057fc2f0;
    stim[5] = 50'h2af4ba3e13baf;
    stim[6] = 50'h27a996300ec5d;
    stim[7] = 50'h3307071cc705d;
    stim[8] = 50'h00b0fb388c07a;
    stim[9] = 50'h242c86148120c;
    stim[10] = 50'h30cdf39e10f97;
    stim[11] = 50'h1ee66dee579b2;
    stim[12] = 50'h09b44e2305966;
    stim[13] = 50'h3b61ce6220eab;
    stim[14] = 50'h13ea1cb26d66a;
    stim[15] = 50'h321beac7d870a;
    stim[16] = 50'h0ff0edaf858ab;
    stim[17] = 50'h0ccfc106257cd;
    stim[18] = 50'h286f1e811a27b;
    stim[19] = 50'h0fffe51d2c46b;
    stim[20] = 50'h2bccd7945a794;
    stim[21] = 50'h1c7536b724cd9;
    stim[22] = 50'h2b7bed0f88c3d;
    stim[23] = 50'h1920b743af8be;
    stim[24] = 50'h1b975974e39cc;
    stim[25] = 50'h20c88ec79b726;
    stim[26] = 50'h2f223193d73dd;
    stim[27] = 50'h0a15260c10fb2;
    stim[28] = 50'h132da64823074;
    stim[29] = 50'h22d2ebae11a83;
    stim[30] = 50'h32cf52ed2e49a;
    stim[31] = 50'h2e9a97a2ddff4;
    stim[32] = 50'h1d7eabd1c1b76;
    stim[33] = 50'h2c5f93a9972b5;
    stim[34] = 50'h07a543192f88b;
    stim[35] = 50'h140ae5ad0f44f;
    stim[36] = 50'h26315c656a79e;
    stim[37] = 50'h2e96f4b15e5b2;
    stim[38] = 50'h38ff40992d7b6;
    stim[39] = 50'h0c373472f17f1;
    stim[40] = 50'h357f38dcad255;
    stim[41] = 50'h29396bd6982c0;
    stim[42] = 50'h3f73c0104e6ba;
    stim[43] = 50'h010e390dcd3dd;
    stim[44] = 50'h1ee3fa581a295;
    stim[45] = 50'h27b2bc30a151c;
    stim[46] = 50'h3cbbac5e7c7b8;
    stim[47] = 50'h21ac6a5930000;
    stim[48] = 50'h339dc13102741;
    stim[49] = 50'h072fde7ca4111;
    stim[50] = 50'h12bae8cf78e4c;
    stim[51] = 50'h282e89b0f2ae5;
    stim[52] = 50'h1a54e7f07eafb;
    stim[53] = 50'h03736bd8dbd93;
    stim[54] = 50'h006b3f53fa6f9;
    stim[55] = 50'h35ec899501be5;
    stim[56] = 50'h3554b56d48b06;
    stim[57] = 50'h05b26ba071f7b;
    stim[58] = 50'h0869ba15336f0;
    stim[59] = 50'h3d5ee7461c710;
    stim[60] = 50'h0bad5154c62d9;
    stim[61] = 50'h1163eee817fe3;
    stim[62] = 50'h134e78c477658;
    stim[63] = 50'h08dc845190208;
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
      expv[0] = 29'h00000000;
      expv[1] = 29'h00000000;
      expv[2] = 29'h00000000;
      expv[3] = 29'h00000000;
      expv[4] = 29'h00000000;
      expv[5] = 29'h00000000;
      expv[6] = 29'h00000000;
      expv[7] = 29'h00000000;
      expv[8] = 29'h00000000;
      expv[9] = 29'h00000000;
      expv[10] = 29'h00000000;
      expv[11] = 29'h00000000;
      expv[12] = 29'h00000000;
      expv[13] = 29'h00000000;
      expv[14] = 29'h00000000;
      expv[15] = 29'h00000000;
      expv[16] = 29'h00000000;
      expv[17] = 29'h00000000;
      expv[18] = 29'h00000000;
      expv[19] = 29'h00000000;
      expv[20] = 29'h00000000;
      expv[21] = 29'h00000000;
      expv[22] = 29'h00000000;
      expv[23] = 29'h00000000;
      expv[24] = 29'h00000000;
      expv[25] = 29'h00000000;
      expv[26] = 29'h00000000;
      expv[27] = 29'h00000000;
      expv[28] = 29'h00000000;
      expv[29] = 29'h00000000;
      expv[30] = 29'h00000000;
      expv[31] = 29'h00000000;
      expv[32] = 29'h00000000;
      expv[33] = 29'h00000000;
      expv[34] = 29'h00000000;
      expv[35] = 29'h00000000;
      expv[36] = 29'h00000000;
      expv[37] = 29'h00000000;
      expv[38] = 29'h00000000;
      expv[39] = 29'h00000000;
      expv[40] = 29'h00000000;
      expv[41] = 29'h00000000;
      expv[42] = 29'h00000000;
      expv[43] = 29'h0ba22d22;
      expv[44] = 29'h00000000;
      expv[45] = 29'h00000000;
      expv[46] = 29'h00000000;
      expv[47] = 29'h00000000;
      expv[48] = 29'h00000000;
      expv[49] = 29'h00000000;
      expv[50] = 29'h00000000;
      expv[51] = 29'h00000000;
      expv[52] = 29'h00000000;
      expv[53] = 29'h00000000;
      expv[54] = 29'h02722d62;
      expv[55] = 29'h00000000;
      expv[56] = 29'h00000000;
      expv[57] = 29'h00000000;
      expv[58] = 29'h00000000;
      expv[59] = 29'h00000000;
      expv[60] = 29'h00000000;
      expv[61] = 29'h00000000;
      expv[62] = 29'h00000000;
      expv[63] = 29'h00000000;
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
