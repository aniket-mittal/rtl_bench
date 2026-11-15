// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 96;
  localparam OW = 96;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04438 dut (
    .clk(clk),
    .ibus(in_vec[95:64]),
    .PCIn(in_vec[63:0]),
    .ibusWire(out_vec[95:64]),
    .PCOut(out_vec[63:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 96'h5086e91edf6ebbab1080223a;
    stim[1] = 96'h3402883234767d01e590019d;
    stim[2] = 96'h8e5ec42e3e7e20cae325fb38;
    stim[3] = 96'ha2b793ce1acb793642723a7d;
    stim[4] = 96'h45a627b73253d7d722084a9a;
    stim[5] = 96'h179c6440c03ba8cb2a2e7b5f;
    stim[6] = 96'h0112956219b621b9ee59830a;
    stim[7] = 96'hd1d4431c8ebe796c66c5ab6f;
    stim[8] = 96'h27c4a1cabed72e0a03e046ea;
    stim[9] = 96'h55bc6478a20e1895ca48476a;
    stim[10] = 96'h78a00e9f5211cf97606304b4;
    stim[11] = 96'h805abd6c588c7dbc11017da3;
    stim[12] = 96'h1e96d72d79af7607937a5314;
    stim[13] = 96'h7bd96e409db1338b512aa337;
    stim[14] = 96'h6ae7aa47a740fd717f1f7f45;
    stim[15] = 96'h7aee3ce443bf045bc979751f;
    stim[16] = 96'h617603ad66082cfc9020d566;
    stim[17] = 96'h656c5fabd680acdf16e02717;
    stim[18] = 96'h6e4b486d765b23784c728d2a;
    stim[19] = 96'h5da7a17504f4eea1d0a29b2c;
    stim[20] = 96'h891f353798975aee22606874;
    stim[21] = 96'hfaab2843626dd528b7bc2721;
    stim[22] = 96'h9534c402182fb854f80dcd06;
    stim[23] = 96'h88571600d629b077b648418b;
    stim[24] = 96'he33d84b92ca02d83d0365c44;
    stim[25] = 96'h7ad985c3fd0af074e5b61b63;
    stim[26] = 96'h117f2a5770e31440ce00d90f;
    stim[27] = 96'hadcf4d2370ce058c20c7f76b;
    stim[28] = 96'h628cec2ba0ad6c7ae12c7321;
    stim[29] = 96'h9f025bf44cc59cee2637152c;
    stim[30] = 96'hd3fc4abffebec1f2aab6c195;
    stim[31] = 96'h7aaecaeb15654245c14f7197;
    stim[32] = 96'h56b27de07662fd62c33541cd;
    stim[33] = 96'h8a88d59af45c9f203b5cb255;
    stim[34] = 96'hc95e99f328113df9c17505d5;
    stim[35] = 96'h414bd8ee9aacd92caefd2781;
    stim[36] = 96'h5447195026abdab59f5d1805;
    stim[37] = 96'h5d5979451f2f1d7dcec88557;
    stim[38] = 96'h0df377e620cd29d92e2be6a7;
    stim[39] = 96'h854013e11d718d9b0290bdfd;
    stim[40] = 96'h20917698e250982801d43b0c;
    stim[41] = 96'h24cadba9917d237abbd9965a;
    stim[42] = 96'h887310c502f019b3afbae622;
    stim[43] = 96'h7c224cc8d3d939baf8eff4e3;
    stim[44] = 96'h90c386a97104ee712a2d6c44;
    stim[45] = 96'h358db635196bfdbc4c6ebebe;
    stim[46] = 96'h1c3ffdeb3144870f85503ad8;
    stim[47] = 96'hdc7979f8d0b89034e47773d6;
    stim[48] = 96'h35b0fd08d5fd710391f53b42;
    stim[49] = 96'h62a3acbd2e1f7b1c243bd574;
    stim[50] = 96'hb7206680f7e5a8b89c1103d1;
    stim[51] = 96'he15ba4aa7a80bccce3563e49;
    stim[52] = 96'h2930f16f11d4d40a37f4c5a9;
    stim[53] = 96'hf18a0827dfa3d73b456271fe;
    stim[54] = 96'h2154bfe9daf185498cf9237a;
    stim[55] = 96'h95251e6776fe3f31209a6c45;
    stim[56] = 96'h2b9ba2f2765c3877c83618d6;
    stim[57] = 96'h14ed4dbf6afc690d7ae7d20f;
    stim[58] = 96'h09a39978aee2fa0a78b33f35;
    stim[59] = 96'ha58c454120a7a0d5e0aea0f6;
    stim[60] = 96'hd9e5a8dc218b1c360a7b2061;
    stim[61] = 96'h57fa7ddd9a182b74dcd80316;
    stim[62] = 96'h39076da558fda3dd60e5b98a;
    stim[63] = 96'he5c061062eb7aa1aeb1be16a;
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
      expv[0] = 96'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 96'h5086e91edf6ebbab1080223a;
      expv[2] = 96'h3402883234767d01e590019d;
      expv[3] = 96'h8e5ec42e3e7e20cae325fb38;
      expv[4] = 96'ha2b793ce1acb793642723a7d;
      expv[5] = 96'h45a627b73253d7d722084a9a;
      expv[6] = 96'h179c6440c03ba8cb2a2e7b5f;
      expv[7] = 96'h0112956219b621b9ee59830a;
      expv[8] = 96'hd1d4431c8ebe796c66c5ab6f;
      expv[9] = 96'h27c4a1cabed72e0a03e046ea;
      expv[10] = 96'h55bc6478a20e1895ca48476a;
      expv[11] = 96'h78a00e9f5211cf97606304b4;
      expv[12] = 96'h805abd6c588c7dbc11017da3;
      expv[13] = 96'h1e96d72d79af7607937a5314;
      expv[14] = 96'h7bd96e409db1338b512aa337;
      expv[15] = 96'h6ae7aa47a740fd717f1f7f45;
      expv[16] = 96'h7aee3ce443bf045bc979751f;
      expv[17] = 96'h617603ad66082cfc9020d566;
      expv[18] = 96'h656c5fabd680acdf16e02717;
      expv[19] = 96'h6e4b486d765b23784c728d2a;
      expv[20] = 96'h5da7a17504f4eea1d0a29b2c;
      expv[21] = 96'h891f353798975aee22606874;
      expv[22] = 96'hfaab2843626dd528b7bc2721;
      expv[23] = 96'h9534c402182fb854f80dcd06;
      expv[24] = 96'h88571600d629b077b648418b;
      expv[25] = 96'he33d84b92ca02d83d0365c44;
      expv[26] = 96'h7ad985c3fd0af074e5b61b63;
      expv[27] = 96'h117f2a5770e31440ce00d90f;
      expv[28] = 96'hadcf4d2370ce058c20c7f76b;
      expv[29] = 96'h628cec2ba0ad6c7ae12c7321;
      expv[30] = 96'h9f025bf44cc59cee2637152c;
      expv[31] = 96'hd3fc4abffebec1f2aab6c195;
      expv[32] = 96'h7aaecaeb15654245c14f7197;
      expv[33] = 96'h56b27de07662fd62c33541cd;
      expv[34] = 96'h8a88d59af45c9f203b5cb255;
      expv[35] = 96'hc95e99f328113df9c17505d5;
      expv[36] = 96'h414bd8ee9aacd92caefd2781;
      expv[37] = 96'h5447195026abdab59f5d1805;
      expv[38] = 96'h5d5979451f2f1d7dcec88557;
      expv[39] = 96'h0df377e620cd29d92e2be6a7;
      expv[40] = 96'h854013e11d718d9b0290bdfd;
      expv[41] = 96'h20917698e250982801d43b0c;
      expv[42] = 96'h24cadba9917d237abbd9965a;
      expv[43] = 96'h887310c502f019b3afbae622;
      expv[44] = 96'h7c224cc8d3d939baf8eff4e3;
      expv[45] = 96'h90c386a97104ee712a2d6c44;
      expv[46] = 96'h358db635196bfdbc4c6ebebe;
      expv[47] = 96'h1c3ffdeb3144870f85503ad8;
      expv[48] = 96'hdc7979f8d0b89034e47773d6;
      expv[49] = 96'h35b0fd08d5fd710391f53b42;
      expv[50] = 96'h62a3acbd2e1f7b1c243bd574;
      expv[51] = 96'hb7206680f7e5a8b89c1103d1;
      expv[52] = 96'he15ba4aa7a80bccce3563e49;
      expv[53] = 96'h2930f16f11d4d40a37f4c5a9;
      expv[54] = 96'hf18a0827dfa3d73b456271fe;
      expv[55] = 96'h2154bfe9daf185498cf9237a;
      expv[56] = 96'h95251e6776fe3f31209a6c45;
      expv[57] = 96'h2b9ba2f2765c3877c83618d6;
      expv[58] = 96'h14ed4dbf6afc690d7ae7d20f;
      expv[59] = 96'h09a39978aee2fa0a78b33f35;
      expv[60] = 96'ha58c454120a7a0d5e0aea0f6;
      expv[61] = 96'hd9e5a8dc218b1c360a7b2061;
      expv[62] = 96'h57fa7ddd9a182b74dcd80316;
      expv[63] = 96'h39076da558fda3dd60e5b98a;
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
