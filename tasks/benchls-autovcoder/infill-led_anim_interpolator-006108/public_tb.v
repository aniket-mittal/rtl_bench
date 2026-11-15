// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 51;
  localparam OW = 24;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_006108 dut (
    .i_clk(clk),
    .i_drq(in_vec[50:50]),
    .i_target_data(in_vec[49:38]),
    .i_current_data(in_vec[37:26]),
    .i_type(in_vec[25:20]),
    .i_target_time(in_vec[19:10]),
    .i_start_time(in_vec[9:0]),
    .o_wen(out_vec[23:23]),
    .o_addr(out_vec[22:13]),
    .o_data(out_vec[12:1]),
    .o_drq(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 51'h51ad6c72e10a1;
    stim[1] = 51'h57fca1fbb18d4;
    stim[2] = 51'h451f95d6dbe8d;
    stim[3] = 51'h708b546196ce3;
    stim[4] = 51'h5e004257b4780;
    stim[5] = 51'h04006a58d3630;
    stim[6] = 51'h0e5d9cea29af1;
    stim[7] = 51'h162138560b4fe;
    stim[8] = 51'h662190707d803;
    stim[9] = 51'h69fec4d7410c9;
    stim[10] = 51'h3cc59ddd3309b;
    stim[11] = 51'h01603585dcfc2;
    stim[12] = 51'h7257368d9a782;
    stim[13] = 51'h4982275a5d371;
    stim[14] = 51'h588615a31ccda;
    stim[15] = 51'h7416a0a1f5164;
    stim[16] = 51'h5714fe50d294c;
    stim[17] = 51'h6ffd7c5dd1502;
    stim[18] = 51'h115eb6fb1a028;
    stim[19] = 51'h2f6c3a6cb0636;
    stim[20] = 51'h55c0a81a459f8;
    stim[21] = 51'h081e656750343;
    stim[22] = 51'h5819fb61da6fa;
    stim[23] = 51'h782d2781d724e;
    stim[24] = 51'h3463e92db1ec8;
    stim[25] = 51'h28dd2b11407a1;
    stim[26] = 51'h6ddcc8932d4ad;
    stim[27] = 51'h39b794b945614;
    stim[28] = 51'h690cf2e501ca1;
    stim[29] = 51'h513b567702b39;
    stim[30] = 51'h2199e7b04d0a3;
    stim[31] = 51'h6e23c05fa9826;
    stim[32] = 51'h2459caa168594;
    stim[33] = 51'h22fc2f3106b7c;
    stim[34] = 51'h7024da2e481c5;
    stim[35] = 51'h4df1a206faf72;
    stim[36] = 51'h0b55de7537060;
    stim[37] = 51'h2fed521f16765;
    stim[38] = 51'h238c457df3e1c;
    stim[39] = 51'h005b6f2a489ca;
    stim[40] = 51'h16b0e50a8fcab;
    stim[41] = 51'h17523ee5e93f5;
    stim[42] = 51'h2a6f60efc5cf9;
    stim[43] = 51'h3035e616275ae;
    stim[44] = 51'h07f2f997f1ea7;
    stim[45] = 51'h0de87668b22ec;
    stim[46] = 51'h49d25446fa464;
    stim[47] = 51'h55a69c8ae751b;
    stim[48] = 51'h65f8a911c323f;
    stim[49] = 51'h7169ed3fdcc7a;
    stim[50] = 51'h4731bfb3bc1b6;
    stim[51] = 51'h0d760af4c24d7;
    stim[52] = 51'h0a554a829bbee;
    stim[53] = 51'h3177e5b8f14f7;
    stim[54] = 51'h7437ebaff125d;
    stim[55] = 51'h447a6449e6b49;
    stim[56] = 51'h64c40b33e62e4;
    stim[57] = 51'h6b753482d07ff;
    stim[58] = 51'h3302c1e8d4756;
    stim[59] = 51'h712869e57308e;
    stim[60] = 51'h002c2ea28a13c;
    stim[61] = 51'h45e04854f9f78;
    stim[62] = 51'h39d87a6942030;
    stim[63] = 51'h26e9f5edddeeb;
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
      expv[0] = 24'h000000;
      expv[1] = 24'h000000;
      expv[2] = 24'h000000;
      expv[3] = 24'h80xxxx;
      expv[4] = 24'h00xxxx;
      expv[5] = 24'h00xxxx;
      expv[6] = 24'h80xxxx;
      expv[7] = 24'h00xxxx;
      expv[8] = 24'h00xxxx;
      expv[9] = 24'h80xxxx;
      expv[10] = 24'h00xxxx;
      expv[11] = 24'h00xxxx;
      expv[12] = 24'h80xxxx;
      expv[13] = 24'h00xxxx;
      expv[14] = 24'h00xxxx;
      expv[15] = 24'h80xxxx;
      expv[16] = 24'h00xxxx;
      expv[17] = 24'h00xxxx;
      expv[18] = 24'h80xxxx;
      expv[19] = 24'h00xxxx;
      expv[20] = 24'h00xxxx;
      expv[21] = 24'h80xxxx;
      expv[22] = 24'h00xxxx;
      expv[23] = 24'h00xxxx;
      expv[24] = 24'h80e940;
      expv[25] = 24'h010940;
      expv[26] = 24'h010940;
      expv[27] = 24'h810940;
      expv[28] = 24'h012940;
      expv[29] = 24'h012940;
      expv[30] = 24'h812940;
      expv[31] = 24'h014940;
      expv[32] = 24'h014940;
      expv[33] = 24'h814940;
      expv[34] = 24'h016940;
      expv[35] = 24'h016940;
      expv[36] = 24'h816940;
      expv[37] = 24'h018940;
      expv[38] = 24'h018940;
      expv[39] = 24'h818940;
      expv[40] = 24'h01a940;
      expv[41] = 24'h01a940;
      expv[42] = 24'h81a940;
      expv[43] = 24'h01c940;
      expv[44] = 24'h01c940;
      expv[45] = 24'h81c940;
      expv[46] = 24'h01e940;
      expv[47] = 24'h01e940;
      expv[48] = 24'h81e940;
      expv[49] = 24'h020940;
      expv[50] = 24'h020940;
      expv[51] = 24'h820940;
      expv[52] = 24'h022940;
      expv[53] = 24'h022940;
      expv[54] = 24'h822940;
      expv[55] = 24'h024940;
      expv[56] = 24'h024940;
      expv[57] = 24'h824940;
      expv[58] = 24'h026940;
      expv[59] = 24'h026940;
      expv[60] = 24'h826940;
      expv[61] = 24'h028940;
      expv[62] = 24'h028940;
      expv[63] = 24'h828940;
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
