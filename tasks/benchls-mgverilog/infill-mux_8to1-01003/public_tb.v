// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 67;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01003 dut (
    .sel(in_vec[66:64]),
    .in0(in_vec[63:56]),
    .in1(in_vec[55:48]),
    .in2(in_vec[47:40]),
    .in3(in_vec[39:32]),
    .in4(in_vec[31:24]),
    .in5(in_vec[23:16]),
    .in6(in_vec[15:8]),
    .in7(in_vec[7:0]),
    .out(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 67'h3256e7ee9503baf3d;
    stim[1] = 67'h7a0892a468dcf8bfd;
    stim[2] = 67'h3a750e9a55c98decf;
    stim[3] = 67'h4064e064d449bdbc8;
    stim[4] = 67'h0f5a33830b24d649f;
    stim[5] = 67'h3649e9b90499d399c;
    stim[6] = 67'h4fddb98027b603fc3;
    stim[7] = 67'h7fb058133c56b0a06;
    stim[8] = 67'h2562727d70a0e2d12;
    stim[9] = 67'h60e82dc0334401f13;
    stim[10] = 67'h257a87eb16b69b91e;
    stim[11] = 67'h0b187d4224d7ba933;
    stim[12] = 67'h171fda255fe6d9233;
    stim[13] = 67'h413e95a80683851f7;
    stim[14] = 67'h49767212856979cda;
    stim[15] = 67'h00aebe53b4ef643a3;
    stim[16] = 67'h1702f04dfee389446;
    stim[17] = 67'h2d077cb28c515e9b2;
    stim[18] = 67'h3afc10ab5e3a02c46;
    stim[19] = 67'h389dbec1d98773186;
    stim[20] = 67'h7f53a78bc3dd114ec;
    stim[21] = 67'h13e979c12268f8000;
    stim[22] = 67'h12fb1bca518cadb40;
    stim[23] = 67'h6b8d7d4312647060e;
    stim[24] = 67'h3341b5b07aa4fd9c2;
    stim[25] = 67'h25b3a1abce51ad770;
    stim[26] = 67'h6c1d1adc03c6f44b1;
    stim[27] = 67'h79dc9a980d0b306a9;
    stim[28] = 67'h58f5099932ac62278;
    stim[29] = 67'h1165b63226780c498;
    stim[30] = 67'h058b93e5c66fc565c;
    stim[31] = 67'h11e02bfb16919f496;
    stim[32] = 67'h2cf45a8b297955044;
    stim[33] = 67'h0c5f2773bcb72c14b;
    stim[34] = 67'h684df6b2029870d6b;
    stim[35] = 67'h2187830d623866d86;
    stim[36] = 67'h7ab4e4f7d8ca69a93;
    stim[37] = 67'h04c2312ac5ce5bf2f;
    stim[38] = 67'h039a2d82cea1dd2d7;
    stim[39] = 67'h36c360e7053482cb4;
    stim[40] = 67'h45f643ca11958dea7;
    stim[41] = 67'h17ea20bbb8ad3ff5b;
    stim[42] = 67'h42a844124352c2706;
    stim[43] = 67'h5dfe2c5aecfd0e764;
    stim[44] = 67'h412e4fbbd7fbf87fc;
    stim[45] = 67'h7eea59a25ed5c1ad4;
    stim[46] = 67'h38cb4ae654f6f13e5;
    stim[47] = 67'h44a8cd5837c05adf8;
    stim[48] = 67'h4edf03ea85bc26723;
    stim[49] = 67'h5254a6fc820936f5d;
    stim[50] = 67'h3c57f771a8949008e;
    stim[51] = 67'h122924578b1b7ab34;
    stim[52] = 67'h6bfe9a6e6122d6b5f;
    stim[53] = 67'h3b46f83ab34b5311b;
    stim[54] = 67'h33502b112db9be6b3;
    stim[55] = 67'h011779b45045972b4;
    stim[56] = 67'h174672c83e771abb6;
    stim[57] = 67'h499c95551c0a38b0e;
    stim[58] = 67'h11a8dfc17c22b428d;
    stim[59] = 67'h13831b8d3e27b175b;
    stim[60] = 67'h3bce38bd129acb406;
    stim[61] = 67'h3df11d4dc39a5894b;
    stim[62] = 67'h0c6a521467bd96196;
    stim[63] = 67'h4f3ce81c561dcbfa6;
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
      expv[0] = 8'he9;
      expv[1] = 8'hfd;
      expv[2] = 8'ha5;
      expv[3] = 8'h44;
      expv[4] = 8'hf5;
      expv[5] = 8'h90;
      expv[6] = 8'h7b;
      expv[7] = 8'h06;
      expv[8] = 8'h27;
      expv[9] = 8'h1f;
      expv[10] = 8'h7e;
      expv[11] = 8'hb1;
      expv[12] = 8'hfd;
      expv[13] = 8'h68;
      expv[14] = 8'h56;
      expv[15] = 8'h0a;
      expv[16] = 8'h2f;
      expv[17] = 8'hcb;
      expv[18] = 8'hb5;
      expv[19] = 8'h1d;
      expv[20] = 8'hec;
      expv[21] = 8'h97;
      expv[22] = 8'hb1;
      expv[23] = 8'h06;
      expv[24] = 8'h07;
      expv[25] = 8'h1a;
      expv[26] = 8'h44;
      expv[27] = 8'ha9;
      expv[28] = 8'hc6;
      expv[29] = 8'h5b;
      expv[30] = 8'h58;
      expv[31] = 8'h02;
      expv[32] = 8'ha8;
      expv[33] = 8'hc5;
      expv[34] = 8'h0d;
      expv[35] = 8'h30;
      expv[36] = 8'h93;
      expv[37] = 8'h4c;
      expv[38] = 8'h39;
      expv[39] = 8'h70;
      expv[40] = 8'h19;
      expv[41] = 8'ha2;
      expv[42] = 8'h35;
      expv[43] = 8'hd0;
      expv[44] = 8'h7f;
      expv[45] = 8'hd4;
      expv[46] = 8'h65;
      expv[47] = 8'h7c;
      expv[48] = 8'h5b;
      expv[49] = 8'h93;
      expv[50] = 8'h1a;
      expv[51] = 8'h92;
      expv[52] = 8'h6b;
      expv[53] = 8'hab;
      expv[54] = 8'h12;
      expv[55] = 8'h11;
      expv[56] = 8'h67;
      expv[57] = 8'hc0;
      expv[58] = 8'h8d;
      expv[59] = 8'h31;
      expv[60] = 8'hd1;
      expv[61] = 8'hdc;
      expv[62] = 8'hc6;
      expv[63] = 8'h61;
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
