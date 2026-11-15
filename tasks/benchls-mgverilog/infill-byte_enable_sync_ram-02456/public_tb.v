// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 92;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02456 dut (
    .clk(clk),
    .write_en(in_vec[91:91]),
    .write_bytes(in_vec[90:83]),
    .write_addr(in_vec[82:74]),
    .write_data(in_vec[73:10]),
    .read_en(in_vec[9:9]),
    .read_addr(in_vec[8:0]),
    .read_data(out_vec[63:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 92'hf736298cffd648f4826c941;
    stim[1] = 92'h41e738c93484497a2cccdb0;
    stim[2] = 92'h848209be32f87c631ce3055;
    stim[3] = 92'had1a6284f7ecc3364252d43;
    stim[4] = 92'hcebd14104d7c051100eeed9;
    stim[5] = 92'h3477d5d759e23b4ae096f20;
    stim[6] = 92'h2aa2951dd8bb6879bbc458a;
    stim[7] = 92'h14692e7dd13d3fffaafd60d;
    stim[8] = 92'he3a4922d21f4db6ab1751df;
    stim[9] = 92'hc300b62db844f0b7274add0;
    stim[10] = 92'h9c1d61626afd1f9d6931d10;
    stim[11] = 92'hb6f165178b598fc34c5d253;
    stim[12] = 92'h3018121a703492215586663;
    stim[13] = 92'h9d7fcfafdf83493d8fdd8eb;
    stim[14] = 92'h623030d8b40b94612c751cd;
    stim[15] = 92'h6e9685329b5145af10fb255;
    stim[16] = 92'h19ecaa6e3695b81da000da3;
    stim[17] = 92'hec690c59e6b1480e1d60264;
    stim[18] = 92'h6114006ce3e93ee9acdf15a;
    stim[19] = 92'h3e8bdd97ff2fa8e7b889250;
    stim[20] = 92'h32effbdf9e3f2ca4a4ecb5e;
    stim[21] = 92'h02fc197c34067edfa0cec0a;
    stim[22] = 92'h2862af90769f3c1bfbb1b53;
    stim[23] = 92'hb78875b3dea832b63bda66a;
    stim[24] = 92'h1484c1fe85e5805ee229206;
    stim[25] = 92'h66d5dbb771b62e8b1a9059b;
    stim[26] = 92'hdedd6b37d78e14037c88f01;
    stim[27] = 92'hce76cb6931cd84700b2efc0;
    stim[28] = 92'h55297bc77478b8c7a306d8e;
    stim[29] = 92'h874788e365f1bb0b765a3bc;
    stim[30] = 92'h394742a81ca03e4a35b6e19;
    stim[31] = 92'hfed5f56ab7094a2ec145cba;
    stim[32] = 92'h82b8b512320e70d83ad5950;
    stim[33] = 92'h455485eb7e94dd9d8f282c1;
    stim[34] = 92'hc22862e9ccb74842400ef35;
    stim[35] = 92'h24f8fc4b44b4b0922ad9796;
    stim[36] = 92'hdde54b0f219734a3841094b;
    stim[37] = 92'h717f96ae9b1fced37b67d9f;
    stim[38] = 92'hf26764fac4dc0b1fbbb6ca9;
    stim[39] = 92'h07f3523f781269f254870b4;
    stim[40] = 92'hfb8810edaf1bddc4429fb9e;
    stim[41] = 92'h84c79bbc1953c2ac7812676;
    stim[42] = 92'hd7dfaf26201b16cf1f84d4e;
    stim[43] = 92'h0172b2b3052c6b650c654eb;
    stim[44] = 92'h5f8cb0a1304e49fea5feb4d;
    stim[45] = 92'ha5ff9ab9384f47fa65c0669;
    stim[46] = 92'h2bee88c83f220e210fc15bc;
    stim[47] = 92'h62f38309c432ce1b9eb7c8a;
    stim[48] = 92'h3f40e4d1c1a308372fb84d8;
    stim[49] = 92'he885a67fb0e38e56fb0a40d;
    stim[50] = 92'he1dcf864f91885263370b12;
    stim[51] = 92'h9722331df2a6bee0e9ac534;
    stim[52] = 92'h0b14749de0deb4240186a66;
    stim[53] = 92'h8ac61bb5adb5ec05555a0cb;
    stim[54] = 92'h5804f286980b5e83b620eb6;
    stim[55] = 92'h2a39ecce3abdeb17338caf1;
    stim[56] = 92'h920f70ff75f60bf815c613b;
    stim[57] = 92'h45f3f74e8a81b0722c89b64;
    stim[58] = 92'h70aa686cc1802208833a0f6;
    stim[59] = 92'h4314841066ce97f1876ff42;
    stim[60] = 92'ha37ccf2db6c5b20e9b5ec9b;
    stim[61] = 92'hfbfb0bcb1dd005b07e4644e;
    stim[62] = 92'h0486f14dc95ba753008d8dc;
    stim[63] = 92'h1e3e1136935df44a878b830;
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
      expv[0] = 64'hxxxxxxxxxxxxxxxx;
      expv[1] = 64'hxxxxxxxxxxxxxxxx;
      expv[2] = 64'hxxxxxxxxxxxxxxxx;
      expv[3] = 64'hxxxxxxxxxxxxxxxx;
      expv[4] = 64'hxxxxxxxxxxxxxxxx;
      expv[5] = 64'hxxxxxxxxxxxxxxxx;
      expv[6] = 64'hxxxxxxxxxxxxxxxx;
      expv[7] = 64'hxxxxxxxxxxxxxxxx;
      expv[8] = 64'hxxxxxxxxxxxxxxxx;
      expv[9] = 64'hxxxxxxxxxxxxxxxx;
      expv[10] = 64'hxxxxxxxxxxxxxxxx;
      expv[11] = 64'hxxxxxxxxxxxxxxxx;
      expv[12] = 64'hxxxxxxxxxxxxxxxx;
      expv[13] = 64'hxxxxxxxxxxxxxxxx;
      expv[14] = 64'hxxxxxxxxxxxxxxxx;
      expv[15] = 64'hxxxxxxxxxxxxxxxx;
      expv[16] = 64'hxxxxxxxxxxxxxxxx;
      expv[17] = 64'hxxxxxxxxxxxxxxxx;
      expv[18] = 64'hxxxxxxxxxxxxxxxx;
      expv[19] = 64'hxxxxxxxxxxxxxxxx;
      expv[20] = 64'hxxxxxxxxxxxxxxxx;
      expv[21] = 64'hxxxxxxxxxxxxxxxx;
      expv[22] = 64'hxxxxxxxxxxxxxxxx;
      expv[23] = 64'hxxxxxxxxxxxxxxxx;
      expv[24] = 64'hxxxxxxxxxxxxxxxx;
      expv[25] = 64'hxxxxxxxxxxxxxxxx;
      expv[26] = 64'hxxxxxxxxxxxxxxxx;
      expv[27] = 64'hxxxxxxxxxxxxxxxx;
      expv[28] = 64'hxxxxxxxxxxxxxxxx;
      expv[29] = 64'hxxxxxxxxxxxxxxxx;
      expv[30] = 64'hxxxxxxxxxxxxxxxx;
      expv[31] = 64'hxxxxxxxxxxxxxxxx;
      expv[32] = 64'hxxxxxxxxxxxxxxxx;
      expv[33] = 64'hxxxxxxxxxxxxxxxx;
      expv[34] = 64'hxxxxxxxxxxxxxxxx;
      expv[35] = 64'hxxxxxxxxxxxxxxxx;
      expv[36] = 64'hxxxxxxxxxxxxxxxx;
      expv[37] = 64'hxxxxxxxxxxxxxxxx;
      expv[38] = 64'hxxxxxxxxxxxxxxxx;
      expv[39] = 64'hxxxxxxxxxxxxxxxx;
      expv[40] = 64'hxxxxxxxxxxxxxxxx;
      expv[41] = 64'hxxxxxxxxxxxxxxxx;
      expv[42] = 64'hxxxxxxxxxxxxxxxx;
      expv[43] = 64'hxxxxxxxxxxxxxxxx;
      expv[44] = 64'hxxxxxxxxxxxxxxxx;
      expv[45] = 64'hxxxxxxxxxxxxxxxx;
      expv[46] = 64'hxx13xxb30cxx09xx;
      expv[47] = 64'hxx13xxb30cxx09xx;
      expv[48] = 64'hxx13xxb30cxx09xx;
      expv[49] = 64'hxx13xxb30cxx09xx;
      expv[50] = 64'hxx13xxb30cxx09xx;
      expv[51] = 64'hxxxxxxxxxxxxxxxx;
      expv[52] = 64'hxxxxxxxxxxxxxxxx;
      expv[53] = 64'hxxxxxxxxxxxxxxxx;
      expv[54] = 64'hxxxxxxxxxxxxxxxx;
      expv[55] = 64'hxxxxxxxxxxxxxxxx;
      expv[56] = 64'hxxxxxxxxxxxxxxxx;
      expv[57] = 64'hxxxxxxxxxxxxxxxx;
      expv[58] = 64'hxxxxxxxxxxxxxxxx;
      expv[59] = 64'hxxxxxxxxxxxxxxxx;
      expv[60] = 64'hxxxxxxxxxxxxxxxx;
      expv[61] = 64'hxxxxxxxxxxxxxxxx;
      expv[62] = 64'hxxxxxxxxxxxxxxxx;
      expv[63] = 64'hxxxxxxxxxxxxxxxx;
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
