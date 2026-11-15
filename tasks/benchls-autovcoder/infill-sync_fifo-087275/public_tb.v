// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 35;
  localparam OW = 66;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_087275 dut (
    .clk(clk),
    .din(in_vec[34:3]),
    .wr_en(in_vec[2:2]),
    .rd_en(in_vec[1:1]),
    .reset(in_vec[0:0]),
    .fifo_debug(out_vec[65:34]),
    .dout(out_vec[33:2]),
    .full(out_vec[1:1]),
    .empty(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 35'h68fb42575;
    stim[1] = 35'h50bf60b09;
    stim[2] = 35'h34cde4d9c;
    stim[3] = 35'h7fce6540a;
    stim[4] = 35'h41faba7c6;
    stim[5] = 35'h6ffbefab0;
    stim[6] = 35'h49316b39a;
    stim[7] = 35'h4a01b6f5e;
    stim[8] = 35'h553f5dfba;
    stim[9] = 35'h3521a1e00;
    stim[10] = 35'h58b620122;
    stim[11] = 35'h17768b130;
    stim[12] = 35'h2b078a0f2;
    stim[13] = 35'h06c921150;
    stim[14] = 35'h5045918d4;
    stim[15] = 35'h6ed6ce8ee;
    stim[16] = 35'h66f0f9742;
    stim[17] = 35'h21bba8c40;
    stim[18] = 35'h31d23b0a0;
    stim[19] = 35'h63ea421f8;
    stim[20] = 35'h4bba327ca;
    stim[21] = 35'h6e97d2876;
    stim[22] = 35'h36fa848bc;
    stim[23] = 35'h6c9218dfa;
    stim[24] = 35'h43389fb66;
    stim[25] = 35'h1fb2c257c;
    stim[26] = 35'h475159cc8;
    stim[27] = 35'h193aab2c8;
    stim[28] = 35'h1ab3d9454;
    stim[29] = 35'h50bc625de;
    stim[30] = 35'h026df7a66;
    stim[31] = 35'h2275c75e4;
    stim[32] = 35'h6dc697fb4;
    stim[33] = 35'h29c7c28b6;
    stim[34] = 35'h3bfec3d16;
    stim[35] = 35'h628fa3a7e;
    stim[36] = 35'h1c579a5c6;
    stim[37] = 35'h7e0752204;
    stim[38] = 35'h32edeac36;
    stim[39] = 35'h0d28c2f16;
    stim[40] = 35'h57bed6602;
    stim[41] = 35'h7053c97be;
    stim[42] = 35'h5251dbd4a;
    stim[43] = 35'h3ae01dad6;
    stim[44] = 35'h76a7ad296;
    stim[45] = 35'h3ae8b11e0;
    stim[46] = 35'h1abb1aab2;
    stim[47] = 35'h1a946b908;
    stim[48] = 35'h131a852a6;
    stim[49] = 35'h2e8c1de36;
    stim[50] = 35'h4ec408098;
    stim[51] = 35'h7cd42313a;
    stim[52] = 35'h7b3bc9460;
    stim[53] = 35'h6a489cb98;
    stim[54] = 35'h4edb593a6;
    stim[55] = 35'h2b8a80932;
    stim[56] = 35'h79a5ac45c;
    stim[57] = 35'h00766990c;
    stim[58] = 35'h67146b72a;
    stim[59] = 35'h09a3634fe;
    stim[60] = 35'h33076832e;
    stim[61] = 35'h011ed146d;
    stim[62] = 35'h6f1226e2e;
    stim[63] = 35'h1923fe222;
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
      expv[0] = 66'hxxxxxxxxxxxxxxxxx;
      expv[1] = 66'h00000000000000001;
      expv[2] = 66'h00000000000000001;
      expv[3] = 66'h1a66f26cc00000000;
      expv[4] = 66'h1a66f26cda66f26cd;
      expv[5] = 66'h3b644faaxxxxxxxxx;
      expv[6] = 66'h3b644faaxxxxxxxxx;
      expv[7] = 66'h3b644faaxxxxxxxxx;
      expv[8] = 66'h20652b25xxxxxxxxx;
      expv[9] = 66'h20652b25xxxxxxxxx;
      expv[10] = 66'h20652b25xxxxxxxxx;
      expv[11] = 66'h20652b25xxxxxxxxx;
      expv[12] = 66'h20652b25xxxxxxxxx;
      expv[13] = 66'h20652b25xxxxxxxxx;
      expv[14] = 66'h20652b25xxxxxxxxx;
      expv[15] = 66'h0887f3ecxxxxxxxxx;
      expv[16] = 66'h3ff35b33xxxxxxxxx;
      expv[17] = 66'h3ff35b33xxxxxxxxx;
      expv[18] = 66'h3ff35b33xxxxxxxxx;
      expv[19] = 66'h3ff35b33xxxxxxxxx;
      expv[20] = 66'h3ff35b33xxxxxxxxx;
      expv[21] = 66'h3ff35b33xxxxxxxxx;
      expv[22] = 66'h373f4476xxxxxxxxx;
      expv[23] = 66'h12bc86bcxxxxxxxxx;
      expv[24] = 66'h12bc86bcxxxxxxxxx;
      expv[25] = 66'h3458d697xxxxxxxxx;
      expv[26] = 66'h043237c3xxxxxxxxx;
      expv[27] = 66'h043237c3xxxxxxxxx;
      expv[28] = 66'h043237c3xxxxxxxxx;
      expv[29] = 66'h118c2465xxxxxxxxx;
      expv[30] = 66'h39ea5594xxxxxxxxx;
      expv[31] = 66'h3b215167xxxxxxxxx;
      expv[32] = 66'h0c5c3516xxxxxxxxx;
      expv[33] = 66'h033f8114xxxxxxxxx;
      expv[34] = 66'h18236259xxxxxxxxx;
      expv[35] = 66'h3622c442xxxxxxxxx;
      expv[36] = 66'h276a9615xxxxxxxxx;
      expv[37] = 66'h35966343xxxxxxxxx;
      expv[38] = 66'h349a0c53xxxxxxxxx;
      expv[39] = 66'h0e1101b5xxxxxxxxx;
      expv[40] = 66'h14a5632dxxxxxxxxx;
      expv[41] = 66'h14a5632dxxxxxxxxx;
      expv[42] = 66'h0ccf47ebxxxxxxxxx;
      expv[43] = 66'h0ccf47ebxxxxxxxxx;
      expv[44] = 66'h2a3f56c2xxxxxxxxx;
      expv[45] = 66'h25932d56xxxxxxxxx;
      expv[46] = 66'h25932d56xxxxxxxxx;
      expv[47] = 66'h25932d56xxxxxxxxx;
      expv[48] = 66'h25932d56xxxxxxxxx;
      expv[49] = 66'h2f206febxxxxxxxxx;
      expv[50] = 66'h06667eddxxxxxxxxx;
      expv[51] = 66'h06667eddxxxxxxxxx;
      expv[52] = 66'h06667eddxxxxxxxxx;
      expv[53] = 66'h06667eddxxxxxxxxx;
      expv[54] = 66'h06667eddxxxxxxxxx;
      expv[55] = 66'h2dd42b7axxxxxxxxx;
      expv[56] = 66'h2dd42b7axxxxxxxxx;
      expv[57] = 66'h2aa7019cxxxxxxxxx;
      expv[58] = 66'h2ae23665xxxxxxxxx;
      expv[59] = 66'h2ae23665xxxxxxxxx;
      expv[60] = 66'h2fb3e80cxxxxxxxxx;
      expv[61] = 66'h09379c26xxxxxxxxx;
      expv[62] = 66'h00000000000000001;
      expv[63] = 66'h378913715a66f26cd;
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
