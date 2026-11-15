// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 86;
  localparam OW = 39;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_06320 dut (
    .clk(clk),
    .reset(in_vec[85:85]),
    .sw_reset(in_vec[84:84]),
    .sw_stop(in_vec[83:83]),
    .length(in_vec[82:51]),
    .eop_enabled(in_vec[50:50]),
    .eop(in_vec[49:49]),
    .ready(in_vec[48:48]),
    .valid(in_vec[47:47]),
    .early_termination(in_vec[46:46]),
    .address_in(in_vec[45:14]),
    .write_in(in_vec[13:13]),
    .max_burst_count(in_vec[12:10]),
    .write_fifo_used(in_vec[9:4]),
    .waitrequest(in_vec[3:3]),
    .short_first_access_enable(in_vec[2:2]),
    .short_last_access_enable(in_vec[1:1]),
    .short_first_and_last_access_enable(in_vec[0:0]),
    .address_out(out_vec[38:7]),
    .write_out(out_vec[6:6]),
    .burst_count(out_vec[5:3]),
    .stall(out_vec[2:2]),
    .reset_taken(out_vec[1:1]),
    .stopped(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 86'h24c3cf3ef2aa30f25d91fd;
    stim[1] = 86'h238b9fc27d058b9e6d662a;
    stim[2] = 86'h165191e3a4cceb8c3b9aef;
    stim[3] = 86'h1836d57d1f474ced6c122d;
    stim[4] = 86'h05710b250514ba83a7cab8;
    stim[5] = 86'h02dea61872db0b8195c473;
    stim[6] = 86'h14588ef8161f87aa580a6a;
    stim[7] = 86'h12a5ff43b105f25fc809fe;
    stim[8] = 86'h0006b2f463784cfdaf2cb6;
    stim[9] = 86'h06405f8b82774923401efc;
    stim[10] = 86'h199195b5d3ea18c8dcb872;
    stim[11] = 86'h0bb9eabba55ca68fa33561;
    stim[12] = 86'h0d079ba8b1dec0ce134c0a;
    stim[13] = 86'h06dc306dd12eebeec34bf4;
    stim[14] = 86'h1cc7bd41fcae6da932b9f8;
    stim[15] = 86'h132e5a98f8ebe418d3cabf;
    stim[16] = 86'h05c226132135ab4d807908;
    stim[17] = 86'h139b22d98264a2a3d46b27;
    stim[18] = 86'h0da4ae49bf53e2de65f97a;
    stim[19] = 86'h1d2b872cfc0ec2b16b11de;
    stim[20] = 86'h1880ee2c953775a318fc24;
    stim[21] = 86'h1f37f355df58a227ad62b4;
    stim[22] = 86'h0b4a78b74475ed8091b6f6;
    stim[23] = 86'h010143d9fa498ff0795b21;
    stim[24] = 86'h055a89dc5c873b2a86106f;
    stim[25] = 86'h1e4208d04b521522ae9ff0;
    stim[26] = 86'h0bc185ad43c5a7c2d4bb2f;
    stim[27] = 86'h112ebe8507dfbda8504ba5;
    stim[28] = 86'h1f2e453aad20abacfade71;
    stim[29] = 86'h03c246c8fef06182cd9521;
    stim[30] = 86'h1c1abf41ae6c483d4e0d64;
    stim[31] = 86'h1edeed67f8a86b3f4911dd;
    stim[32] = 86'h166c891d2ee8b6bd79e349;
    stim[33] = 86'h022e248b3a071e7569e210;
    stim[34] = 86'h14299f9a127abf2971c558;
    stim[35] = 86'h1095b64c218d9d4dd543b3;
    stim[36] = 86'h087bfba20152a6843cb741;
    stim[37] = 86'h04a09ef9cef067223b1229;
    stim[38] = 86'h1c25744791f044afb2378d;
    stim[39] = 86'h15729bd84c8de4626ec5fd;
    stim[40] = 86'h16ec17d2e1d29cb706c293;
    stim[41] = 86'h0bac56b7d6c7ac6a19da5a;
    stim[42] = 86'h0dc7a8a449fb929c4b5d8e;
    stim[43] = 86'h0b5a7c6da7de9d9032ac91;
    stim[44] = 86'h188a7dc8b002a7211d877d;
    stim[45] = 86'h05ecdf02ae406c51651c0b;
    stim[46] = 86'h07dbb5be598db34db954b7;
    stim[47] = 86'h1d4ab62f623f4d8429d2aa;
    stim[48] = 86'h0a0344820d61a50e055483;
    stim[49] = 86'h1a8a8d9113fdd7a52c870a;
    stim[50] = 86'h1a842b0a0b0df19c18b17a;
    stim[51] = 86'h087f824040accb8903cae0;
    stim[52] = 86'h0a4def0652224718f9f7ea;
    stim[53] = 86'h0ae8e7518fca3eddd9d98c;
    stim[54] = 86'h17ffcc507ed02b0703e75b;
    stim[55] = 86'h1911fca176b42295834823;
    stim[56] = 86'h076d173894376580f68229;
    stim[57] = 86'h1efff16c8a571e339bec0f;
    stim[58] = 86'h1e963dd5bc7424e7f36025;
    stim[59] = 86'h161b879db6fc527122b720;
    stim[60] = 86'h0016d4bd2d81d06fd62025;
    stim[61] = 86'h049401b9b06ef02f890301;
    stim[62] = 86'h30f011a349cf3de8c7b74e;
    stim[63] = 86'h00af1255118d5ba8320548;
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
      expv[0] = 39'h0000000004;
      expv[1] = 39'h0000000004;
      expv[2] = 39'h0000000006;
      expv[3] = 39'h0000000007;
      expv[4] = 39'h0000000004;
      expv[5] = 39'h0000000004;
      expv[6] = 39'h0000000006;
      expv[7] = 39'h0000000006;
      expv[8] = 39'h0000000004;
      expv[9] = 39'h7099fb5e48;
      expv[10] = 39'h7099fb5e48;
      expv[11] = 39'h7099fb5e0d;
      expv[12] = 39'h394d1f460d;
      expv[13] = 39'h394d1f460c;
      expv[14] = 39'h394d1f460f;
      expv[15] = 39'h5cdb52650e;
      expv[16] = 39'h5cdb52650c;
      expv[17] = 39'h6b569b00f0;
      expv[18] = 39'h6b569b00f0;
      expv[19] = 39'h6b569b00f0;
      expv[20] = 39'h6b569b00f0;
      expv[21] = 39'h6b569b00f0;
      expv[22] = 39'h6b569b00f0;
      expv[23] = 39'h6b569b00f0;
      expv[24] = 39'h6b569b00f0;
      expv[25] = 39'h6b569b00f0;
      expv[26] = 39'h6b569b00b5;
      expv[27] = 39'h0b4f85a90e;
      expv[28] = 39'h0b4f85a90f;
      expv[29] = 39'h0b4f85a90c;
      expv[30] = 39'h0b4f85a90f;
      expv[31] = 39'h0b4f85a90f;
      expv[32] = 39'h0b4f85a90e;
      expv[33] = 39'h516d7af38c;
      expv[34] = 39'h0e3cead3c8;
      expv[35] = 39'h0e3cead3c8;
      expv[36] = 39'h0e3cead38d;
      expv[37] = 39'h254d08790c;
      expv[38] = 39'h254d08790f;
      expv[39] = 39'h60895f640e;
      expv[40] = 39'h60895f640e;
      expv[41] = 39'h60895f640d;
      expv[42] = 39'h60895f640d;
      expv[43] = 39'h60895f640d;
      expv[44] = 39'h3d3b20650f;
      expv[45] = 39'h3d3b20650c;
      expv[46] = 39'h3d3b20650c;
      expv[47] = 39'h3d3b20650f;
      expv[48] = 39'h3d3b20650d;
      expv[49] = 39'h3d3b20650f;
      expv[50] = 39'h3d3b20650f;
      expv[51] = 39'h1be338310d;
      expv[52] = 39'h1be338310d;
      expv[53] = 39'h448e31f38d;
      expv[54] = 39'h448e31f38e;
      expv[55] = 39'h20560e078f;
      expv[56] = 39'h20560e078c;
      expv[57] = 39'h20560e078f;
      expv[58] = 39'h2e3c67378f;
      expv[59] = 39'h6849cfe68e;
      expv[60] = 39'h78a4e2450c;
      expv[61] = 39'h03a0dfac48;
      expv[62] = 39'h0000000006;
      expv[63] = 39'h0000000004;
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
