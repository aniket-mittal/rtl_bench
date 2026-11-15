// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 67;
  localparam OW = 66;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_09323 dut (
    .clk(clk),
    .rst(in_vec[66:66]),
    .rx_hs_valid(in_vec[65:65]),
    .rx_hs_data(in_vec[64:1]),
    .tx_hs_ready(in_vec[0:0]),
    .rx_hs_ready(out_vec[65:65]),
    .tx_hs_valid(out_vec[64:64]),
    .tx_hs_data(out_vec[63:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 67'h5ca439932cf359478;
    stim[1] = 67'h7665752448b454130;
    stim[2] = 67'h1ab7db478f9c8fa46;
    stim[3] = 67'h30529bb496cd20a02;
    stim[4] = 67'h126686efae77b74dd;
    stim[5] = 67'h2b841c1c9d41cb743;
    stim[6] = 67'h1a58eb99f1d4c66d5;
    stim[7] = 67'h02fb731e7a79e97ac;
    stim[8] = 67'h176d0ab4eb40d2411;
    stim[9] = 67'h3a789f299771150fd;
    stim[10] = 67'h1e469bd828dc2378a;
    stim[11] = 67'h00e6d4f7b2173a63b;
    stim[12] = 67'h20683dfd55c229e40;
    stim[13] = 67'h13ac61f2dd4cbf62c;
    stim[14] = 67'h3db7f52b2a4cf3de9;
    stim[15] = 67'h2c16e0bc0e5c062e8;
    stim[16] = 67'h01460676eeb0cca55;
    stim[17] = 67'h2d7b6d6f35172b604;
    stim[18] = 67'h18c44d327e16a42d6;
    stim[19] = 67'h2e581435ee344d66e;
    stim[20] = 67'h2ba8d436a3c7d15f0;
    stim[21] = 67'h0b038d4bece238821;
    stim[22] = 67'h08858f837d3570521;
    stim[23] = 67'h137a124b9d389581d;
    stim[24] = 67'h0b268b4b98ceb90e7;
    stim[25] = 67'h2f8de0b6ae6859a68;
    stim[26] = 67'h11a5e7fd1fc8aa07e;
    stim[27] = 67'h316336ad7e3fc672e;
    stim[28] = 67'h3b0cc5cf957327e2b;
    stim[29] = 67'h35f4b685ff007a627;
    stim[30] = 67'h26bfae7cb1713ecd7;
    stim[31] = 67'h34403f4334c231516;
    stim[32] = 67'h3a065492f2f93cb32;
    stim[33] = 67'h1fddbb436aeed258e;
    stim[34] = 67'h22dbea4979d994675;
    stim[35] = 67'h1819f25fcfc2aab8c;
    stim[36] = 67'h268ddf12172b3ba90;
    stim[37] = 67'h17c8d8c36c61f764f;
    stim[38] = 67'h326c5d28647e94add;
    stim[39] = 67'h3145c6ae0ba3f99ae;
    stim[40] = 67'h03d010939deb27b9e;
    stim[41] = 67'h28fed8df31c47db89;
    stim[42] = 67'h1234a4df55f92cfc1;
    stim[43] = 67'h32604928c05a9c49b;
    stim[44] = 67'h2bcad1b2a44256309;
    stim[45] = 67'h2f220cb66f8257088;
    stim[46] = 67'h20d86291b0a39dff0;
    stim[47] = 67'h24a4b00666543e214;
    stim[48] = 67'h0ea3e105a06fb02e4;
    stim[49] = 67'h25b9cd36193f359fe;
    stim[50] = 67'h301cfcbb9c4575870;
    stim[51] = 67'h15690c5fb7c2c0f4f;
    stim[52] = 67'h0318065c9777d80b1;
    stim[53] = 67'h286049eb7da6b1305;
    stim[54] = 67'h22b5c165a2b6692c7;
    stim[55] = 67'h3d2da63eb05dc3064;
    stim[56] = 67'h0f93ca6a15c02df0f;
    stim[57] = 67'h245525a2810cf6894;
    stim[58] = 67'h13ab454fc21462dae;
    stim[59] = 67'h109d020a7d09accc4;
    stim[60] = 67'h3a5cbfc8daabd12f5;
    stim[61] = 67'h1f688ce14d489b789;
    stim[62] = 67'h0c04734e7f346c2a4;
    stim[63] = 67'h39a6fa6d58c15a26c;
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
      expv[0] = 66'hx0000000000000000;
      expv[1] = 66'h20000000000000000;
      expv[2] = 66'h20000000000000000;
      expv[3] = 66'h20000000000000000;
      expv[4] = 66'h38294dda4b6690501;
      expv[5] = 66'h28294dda4b6690501;
      expv[6] = 66'h35c20e0e4ea0e5ba1;
      expv[7] = 66'h25c20e0e4ea0e5ba1;
      expv[8] = 66'h25c20e0e4ea0e5ba1;
      expv[9] = 66'h25c20e0e4ea0e5ba1;
      expv[10] = 66'h1d3c4f94cbb88a87e;
      expv[11] = 66'h3d3c4f94cbb88a87e;
      expv[12] = 66'h2d3c4f94cbb88a87e;
      expv[13] = 66'h10341efeaae114f20;
      expv[14] = 66'h30341efeaae114f20;
      expv[15] = 66'h1edbfa95952679ef4;
      expv[16] = 66'h3edbfa95952679ef4;
      expv[17] = 66'h2edbfa95952679ef4;
      expv[18] = 66'h16bdb6b79a8b95b02;
      expv[19] = 66'h16bdb6b79a8b95b02;
      expv[20] = 66'h16bdb6b79a8b95b02;
      expv[21] = 66'h36bdb6b79a8b95b02;
      expv[22] = 66'h26bdb6b79a8b95b02;
      expv[23] = 66'h26bdb6b79a8b95b02;
      expv[24] = 66'h26bdb6b79a8b95b02;
      expv[25] = 66'h26bdb6b79a8b95b02;
      expv[26] = 66'h17c6f05b57342cd34;
      expv[27] = 66'h17c6f05b57342cd34;
      expv[28] = 66'h37c6f05b57342cd34;
      expv[29] = 66'h3d8662e7cab993f15;
      expv[30] = 66'h3afa5b42ff803d313;
      expv[31] = 66'h135fd73e58b89f66b;
      expv[32] = 66'h135fd73e58b89f66b;
      expv[33] = 66'h135fd73e58b89f66b;
      expv[34] = 66'h335fd73e58b89f66b;
      expv[35] = 66'h116df524bcecca33a;
      expv[36] = 66'h116df524bcecca33a;
      expv[37] = 66'h316df524bcecca33a;
      expv[38] = 66'h216df524bcecca33a;
      expv[39] = 66'h19362e94323f4a56e;
      expv[40] = 66'h19362e94323f4a56e;
      expv[41] = 66'h39362e94323f4a56e;
      expv[42] = 66'h347f6c6f98e23edc4;
      expv[43] = 66'h247f6c6f98e23edc4;
      expv[44] = 66'h39302494602d4e24d;
      expv[45] = 66'h15e568d952212b184;
      expv[46] = 66'h15e568d952212b184;
      expv[47] = 66'h15e568d952212b184;
      expv[48] = 66'h15e568d952212b184;
      expv[49] = 66'h15e568d952212b184;
      expv[50] = 66'h15e568d952212b184;
      expv[51] = 66'h35e568d952212b184;
      expv[52] = 66'h25e568d952212b184;
      expv[53] = 66'h25e568d952212b184;
      expv[54] = 66'h343024f5bed358982;
      expv[55] = 66'h115ae0b2d15b34963;
      expv[56] = 66'h315ae0b2d15b34963;
      expv[57] = 66'h215ae0b2d15b34963;
      expv[58] = 66'h122a92d140867b44a;
      expv[59] = 66'h122a92d140867b44a;
      expv[60] = 66'h322a92d140867b44a;
      expv[61] = 66'h3d2e5fe46d55e897a;
      expv[62] = 66'h2d2e5fe46d55e897a;
      expv[63] = 66'h2d2e5fe46d55e897a;
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
