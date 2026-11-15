// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 48;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_009053 dut (
    .hf_in(in_vec[47:0]),
    .hf_out(out_vec[9:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 48'h52ba6f0a3a71;
    stim[1] = 48'hbe8caf41d071;
    stim[2] = 48'h5a5f6ca6d853;
    stim[3] = 48'h3724a6dca7a5;
    stim[4] = 48'hc5d5e11b6927;
    stim[5] = 48'h6a535c81cab1;
    stim[6] = 48'h4099425d0be5;
    stim[7] = 48'h0dd12cdd11e1;
    stim[8] = 48'hd9fd87ae0156;
    stim[9] = 48'h7899fee1fb64;
    stim[10] = 48'h83f494638f69;
    stim[11] = 48'h59dec72d857e;
    stim[12] = 48'haafaf4c36fbf;
    stim[13] = 48'h93214cf97c7c;
    stim[14] = 48'h30a3cceff27c;
    stim[15] = 48'h80bb7f5044e8;
    stim[16] = 48'he3a99eacf359;
    stim[17] = 48'he307f03ef9a6;
    stim[18] = 48'h0cd126e5f922;
    stim[19] = 48'hc9ed244d6f21;
    stim[20] = 48'h63cffd04ce30;
    stim[21] = 48'h54f2a24e7217;
    stim[22] = 48'ha2fed2c0a1a3;
    stim[23] = 48'h253fe7e9d072;
    stim[24] = 48'he5c6abf37814;
    stim[25] = 48'h0b8114ff70c9;
    stim[26] = 48'h635a3722b107;
    stim[27] = 48'hdbc495198d22;
    stim[28] = 48'hbc439d093d5e;
    stim[29] = 48'h581b3c11c810;
    stim[30] = 48'h9445213a7829;
    stim[31] = 48'h35495cebac56;
    stim[32] = 48'ha56e816fdec8;
    stim[33] = 48'h8dd9c5103936;
    stim[34] = 48'he66b004631de;
    stim[35] = 48'hd465c05b85e0;
    stim[36] = 48'h4d831566bdee;
    stim[37] = 48'h90389da15fd3;
    stim[38] = 48'hb1d9b67ed466;
    stim[39] = 48'h408b458838ca;
    stim[40] = 48'hd50413a55ad5;
    stim[41] = 48'h65b773da96b6;
    stim[42] = 48'hbdd69f00a14e;
    stim[43] = 48'h7851c58cb1cd;
    stim[44] = 48'ha7e9dd81342d;
    stim[45] = 48'h2753a895d8dd;
    stim[46] = 48'hb5b20891b670;
    stim[47] = 48'h34acea0a62a2;
    stim[48] = 48'hd530012fa16e;
    stim[49] = 48'hd8c0f0c8c395;
    stim[50] = 48'hd3b9a01dd10c;
    stim[51] = 48'h3b4c8c7a817f;
    stim[52] = 48'h7ddab107b021;
    stim[53] = 48'hd47558622594;
    stim[54] = 48'h740882d3a13f;
    stim[55] = 48'hb1603b9708ce;
    stim[56] = 48'hba7c425700ce;
    stim[57] = 48'h6e6c94178484;
    stim[58] = 48'h7a357c4f91f1;
    stim[59] = 48'h4f9c4272f488;
    stim[60] = 48'ha96118e26940;
    stim[61] = 48'h947912375dcd;
    stim[62] = 48'hc8c7b7c900ec;
    stim[63] = 48'h19ba1922a8b9;
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
      expv[0] = 10'h0b4;
      expv[1] = 10'h07d;
      expv[2] = 10'h208;
      expv[3] = 10'h244;
      expv[4] = 10'h27e;
      expv[5] = 10'h22c;
      expv[6] = 10'h2a7;
      expv[7] = 10'h321;
      expv[8] = 10'h183;
      expv[9] = 10'h2eb;
      expv[10] = 10'h19d;
      expv[11] = 10'h14f;
      expv[12] = 10'h369;
      expv[13] = 10'h2fa;
      expv[14] = 10'h3f1;
      expv[15] = 10'h161;
      expv[16] = 10'h3ca;
      expv[17] = 10'h1e7;
      expv[18] = 10'h17a;
      expv[19] = 10'h143;
      expv[20] = 10'h38f;
      expv[21] = 10'h031;
      expv[22] = 10'h3fe;
      expv[23] = 10'h0a2;
      expv[24] = 10'h18a;
      expv[25] = 10'h055;
      expv[26] = 10'h3d2;
      expv[27] = 10'h1d9;
      expv[28] = 10'h373;
      expv[29] = 10'h397;
      expv[30] = 10'h124;
      expv[31] = 10'h263;
      expv[32] = 10'h036;
      expv[33] = 10'h283;
      expv[34] = 10'h11c;
      expv[35] = 10'h247;
      expv[36] = 10'h356;
      expv[37] = 10'h22c;
      expv[38] = 10'h363;
      expv[39] = 10'h0f1;
      expv[40] = 10'h27c;
      expv[41] = 10'h196;
      expv[42] = 10'h371;
      expv[43] = 10'h386;
      expv[44] = 10'h2b8;
      expv[45] = 10'h24b;
      expv[46] = 10'h0e9;
      expv[47] = 10'h01d;
      expv[48] = 10'h281;
      expv[49] = 10'h172;
      expv[50] = 10'h24c;
      expv[51] = 10'h211;
      expv[52] = 10'h1ca;
      expv[53] = 10'h19a;
      expv[54] = 10'h1ac;
      expv[55] = 10'h384;
      expv[56] = 10'h060;
      expv[57] = 10'h1f8;
      expv[58] = 10'h17e;
      expv[59] = 10'h22c;
      expv[60] = 10'h179;
      expv[61] = 10'h049;
      expv[62] = 10'h206;
      expv[63] = 10'h370;
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
