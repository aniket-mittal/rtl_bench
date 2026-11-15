// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 65;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_137670 dut (
    .clk(clk),
    .reset(in_vec[64:64]),
    .x1(in_vec[63:48]),
    .y1(in_vec[47:32]),
    .x2(in_vec[31:16]),
    .y2(in_vec[15:0]),
    .x3(out_vec[32:17]),
    .y3(out_vec[16:1]),
    .valid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 65'h110da4724288d25d3;
    stim[1] = 65'h128789313737b61b4;
    stim[2] = 65'h0e1eb65c2f33a9eb2;
    stim[3] = 65'h09a0d40c711531486;
    stim[4] = 65'h0597c74dc6c837c07;
    stim[5] = 65'h0ff3dc1102119253c;
    stim[6] = 65'h05b2f73be907f81ac;
    stim[7] = 65'h15f71ea080a9746cb;
    stim[8] = 65'h0ff5a3fb993a1f20c;
    stim[9] = 65'h18786d21119f28203;
    stim[10] = 65'h0b24ee206d56cbbcf;
    stim[11] = 65'h09f013a4d3dc3ff99;
    stim[12] = 65'h06ee096e727bf5610;
    stim[13] = 65'h0e6d6078d4c23fc35;
    stim[14] = 65'h0c2c417f8a2d642d1;
    stim[15] = 65'h07728d46a98074143;
    stim[16] = 65'h0f876a74feed8f939;
    stim[17] = 65'h00406f736b97c25ae;
    stim[18] = 65'h0cabeeae4871f423f;
    stim[19] = 65'h07b1f338dece7f320;
    stim[20] = 65'h0c66754de66c83b42;
    stim[21] = 65'h01f7fd27a988bc5fe;
    stim[22] = 65'h0ca72c512963e4c39;
    stim[23] = 65'h005d10f1c15830047;
    stim[24] = 65'h0318e0f781e3196d8;
    stim[25] = 65'h0f0adceaeeee20612;
    stim[26] = 65'h0794562c4a2b8581a;
    stim[27] = 65'h03b5497a9ba435050;
    stim[28] = 65'h03d09799107493a9c;
    stim[29] = 65'h0b62091977031250e;
    stim[30] = 65'h0083940ca8472f211;
    stim[31] = 65'h0ba0aa173efcaacd9;
    stim[32] = 65'h06d258778b7e38ed2;
    stim[33] = 65'h0b10571b696266a30;
    stim[34] = 65'h0e3e01c914727bb74;
    stim[35] = 65'h0bb65bc3e9a675163;
    stim[36] = 65'h059af4b522f22cde3;
    stim[37] = 65'h082adef39b8d5082e;
    stim[38] = 65'h05d7ab895f241a033;
    stim[39] = 65'h0a3e262445c9a90ee;
    stim[40] = 65'h05a49689db9624c85;
    stim[41] = 65'h01eb8cdf9b8c218a3;
    stim[42] = 65'h11bcf40bf88ff2ab2;
    stim[43] = 65'h01a5943ff6c3191f4;
    stim[44] = 65'h02100ff7b937989ce;
    stim[45] = 65'h07dba6a421bf105d8;
    stim[46] = 65'h0c47745baad226465;
    stim[47] = 65'h00cfcec31b1c16419;
    stim[48] = 65'h0d4fdf3aef574cb4a;
    stim[49] = 65'h09fb03c52190580dc;
    stim[50] = 65'h04d8ca5ee8d97c87f;
    stim[51] = 65'h070fd2a6c286c9234;
    stim[52] = 65'h0f0dcb799edb020d7;
    stim[53] = 65'h03815f047cc712ab3;
    stim[54] = 65'h0397e0ef0e09dd614;
    stim[55] = 65'h05bece97bcadb17e4;
    stim[56] = 65'h06ce912c69aa38a29;
    stim[57] = 65'h0dc4abf8e5b543c75;
    stim[58] = 65'h0a2ee053947321293;
    stim[59] = 65'h03abd3ee3e6ff6ad4;
    stim[60] = 65'h077300d2f00542fcc;
    stim[61] = 65'h0cc42ad9e642017b5;
    stim[62] = 65'h0dd2ed681943401b9;
    stim[63] = 65'h0399e8f41df3d12c7;
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
      expv[0] = 33'h000000000;
      expv[1] = 33'h000000000;
      expv[2] = 33'h000000000;
      expv[3] = 33'h000000000;
      expv[4] = 33'h156c0aa9b;
      expv[5] = 33'h156c0aa9b;
      expv[6] = 33'h156c0aa9b;
      expv[7] = 33'h000000000;
      expv[8] = 33'h000000000;
      expv[9] = 33'h000000000;
      expv[10] = 33'h000000000;
      expv[11] = 33'h000000000;
      expv[12] = 33'h1b98873cd;
      expv[13] = 33'h1b98873cd;
      expv[14] = 33'h1b98873cd;
      expv[15] = 33'h0cb34b593;
      expv[16] = 33'h0cb34b593;
      expv[17] = 33'h0cb34b593;
      expv[18] = 33'h17b0439c9;
      expv[19] = 33'h17b0439c9;
      expv[20] = 33'h17b0439c9;
      expv[21] = 33'h05a5f2041;
      expv[22] = 33'h05a5f2041;
      expv[23] = 33'h05a5f2041;
      expv[24] = 33'h036a81ec7;
      expv[25] = 33'h036a81ec7;
      expv[26] = 33'h036a81ec7;
      expv[27] = 33'h037fb75bd;
      expv[28] = 33'h037fb75bd;
      expv[29] = 33'h037fb75bd;
      expv[30] = 33'h04ca36d4b;
      expv[31] = 33'h04ca36d4b;
      expv[32] = 33'h04ca36d4b;
      expv[33] = 33'h04a102c95;
      expv[34] = 33'h04a102c95;
      expv[35] = 33'h04a102c95;
      expv[36] = 33'h0ab981b43;
      expv[37] = 33'h0ab981b43;
      expv[38] = 33'h0ab981b43;
      expv[39] = 33'h09f76b191;
      expv[40] = 33'h09f76b191;
      expv[41] = 33'h09f76b191;
      expv[42] = 33'h000000000;
      expv[43] = 33'h000000000;
      expv[44] = 33'h000000000;
      expv[45] = 33'h168f31293;
      expv[46] = 33'h168f31293;
      expv[47] = 33'h168f31293;
      expv[48] = 33'h17d7aa095;
      expv[49] = 33'h17d7aa095;
      expv[50] = 33'h17d7aa095;
      expv[51] = 33'h1b646dcdb;
      expv[52] = 33'h1b646dcdb;
      expv[53] = 33'h1b646dcdb;
      expv[54] = 33'h0090c35f5;
      expv[55] = 33'h0090c35f5;
      expv[56] = 33'h0090c35f5;
      expv[57] = 33'h00f1939df;
      expv[58] = 33'h00f1939df;
      expv[59] = 33'h00f1939df;
      expv[60] = 33'h04379536f;
      expv[61] = 33'h04379536f;
      expv[62] = 33'h04379536f;
      expv[63] = 33'h0e2c5b075;
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
