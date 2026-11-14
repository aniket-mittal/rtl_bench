// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 68;
  localparam OW = 36;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_012872 dut (
    .a(in_vec[67:36]),
    .b(in_vec[35:4]),
    .aluc(in_vec[3:0]),
    .r(out_vec[35:4]),
    .zero(out_vec[3:3]),
    .carry(out_vec[2:2]),
    .negative(out_vec[1:1]),
    .overflow(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 68'he81e1e5f942fac327;
    stim[1] = 68'h9f3a47741e719b2d9;
    stim[2] = 68'ha2cb343ca78bac4a0;
    stim[3] = 68'h0210103a6e2570fe4;
    stim[4] = 68'h0086a96c52bdf0d2d;
    stim[5] = 68'h71e7439b98aadd12a;
    stim[6] = 68'h4286c453ed65d0771;
    stim[7] = 68'h4f381a6e312b433e6;
    stim[8] = 68'hc45917b26661b1b58;
    stim[9] = 68'h851c8036239cc03fd;
    stim[10] = 68'h43300a41d48dbe0cb;
    stim[11] = 68'hd0649931a86636f25;
    stim[12] = 68'h21dfb5fd94b6c1487;
    stim[13] = 68'he4193854fc2e21d35;
    stim[14] = 68'h45bf2d79d13cca92f;
    stim[15] = 68'h292b6e70dfebc0f2c;
    stim[16] = 68'h9141bf131b4e97255;
    stim[17] = 68'hb74ba30bb6c5bf9b3;
    stim[18] = 68'h28cbe3a8cc3a5addd;
    stim[19] = 68'h131856f7de703dbde;
    stim[20] = 68'hc5c5006ab12f1b018;
    stim[21] = 68'hfe9cf68137b394301;
    stim[22] = 68'h30b015cfe935f3f0b;
    stim[23] = 68'h9ad92f76272504e63;
    stim[24] = 68'h22ae883bfe903c8be;
    stim[25] = 68'h3bbeef45862fa080d;
    stim[26] = 68'hfd34bc0bed0924482;
    stim[27] = 68'h6bbbdfc230e48e60a;
    stim[28] = 68'h723ba05d54f50c3fc;
    stim[29] = 68'h698d142970948a1c0;
    stim[30] = 68'h5c2ddbdfd4c7e5bab;
    stim[31] = 68'h2abf8f8bd9d4816e1;
    stim[32] = 68'h4a71a64dd01b7eaa1;
    stim[33] = 68'h6f0e78736b2583ec7;
    stim[34] = 68'h955170df49123ba1f;
    stim[35] = 68'h3b861d2fb95f3fc61;
    stim[36] = 68'h91da390f5c16c1f0d;
    stim[37] = 68'h135de58352f6db667;
    stim[38] = 68'h5d3532b6e5ac60a6b;
    stim[39] = 68'he561d99addc58b7be;
    stim[40] = 68'hd89183cfdeef5c403;
    stim[41] = 68'hfe96918c2bbca66d3;
    stim[42] = 68'hd17ec1a91af1565e8;
    stim[43] = 68'h68aca1c25fc222061;
    stim[44] = 68'h75cca6cdc6fe0a291;
    stim[45] = 68'hb580bee5a34247780;
    stim[46] = 68'h825c89435f02f7fab;
    stim[47] = 68'he240345dc82bcd4fc;
    stim[48] = 68'hcee6404e442554dfe;
    stim[49] = 68'h7dfddbb952dffa0a0;
    stim[50] = 68'h096f6643d996f7e3a;
    stim[51] = 68'hb33e1acd323143892;
    stim[52] = 68'h138751a37ed272a30;
    stim[53] = 68'hf89677227dd493706;
    stim[54] = 68'hb8ccea9cf74ffc1ae;
    stim[55] = 68'h8eaa8acf9d6d61137;
    stim[56] = 68'h6e394e37cf12e9e7f;
    stim[57] = 68'h46a3b87122b54f796;
    stim[58] = 68'h45d8eba29e83547ed;
    stim[59] = 68'h8e4807c93567bc4cc;
    stim[60] = 68'h493335c04187fe368;
    stim[61] = 68'hb89aea3b7f9cf3014;
    stim[62] = 68'h76ff1de4597016832;
    stim[63] = 68'h2574092fc8f360869;
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
      expv[0] = 36'h03c041800;
      expv[1] = 36'h9b2d00002;
      expv[2] = 36'h4a56e0865;
      expv[3] = 36'h0200103a0;
      expv[4] = 36'h000000214;
      expv[5] = 36'h000000010;
      expv[6] = 36'h5520f3dc0;
      expv[7] = 36'h7e1359500;
      expv[8] = 36'hb1b500002;
      expv[9] = 36'h000000010;
      expv[10] = 36'h000000008;
      expv[11] = 36'hf866bff32;
      expv[12] = 36'h4a000a020;
      expv[13] = 36'hfc3f39d72;
      expv[14] = 36'hb5e400002;
      expv[15] = 36'h00000a4a4;
      expv[16] = 36'h9b4fbf372;
      expv[17] = 36'h0085e3704;
      expv[18] = 36'h000000010;
      expv[19] = 36'he00000002;
      expv[20] = 36'h1b0100000;
      expv[21] = 36'hc6e962516;
      expv[22] = 36'h000000008;
      expv[23] = 36'h73b42a905;
      expv[24] = 36'h7441d8004;
      expv[25] = 36'h3bbeef450;
      expv[26] = 36'hea3de0536;
      expv[27] = 36'h000000008;
      expv[28] = 36'h00000000c;
      expv[29] = 36'hda219e453;
      expv[30] = 36'h000000008;
      expv[31] = 36'h50eb0e1d0;
      expv[32] = 36'h7a5627a30;
      expv[33] = 36'h90d004002;
      expv[34] = 36'h2aa2e1be4;
      expv[35] = 36'h8226dd693;
      expv[36] = 36'h000091da0;
      expv[37] = 36'hac0000182;
      expv[38] = 36'h000000008;
      expv[39] = 36'hd00000002;
      expv[40] = 36'hf9a2278f2;
      expv[41] = 36'hd2d9eb1f6;
      expv[42] = 36'h565e00000;
      expv[43] = 36'h08ea7fbc4;
      expv[44] = 36'haece9ca43;
      expv[45] = 36'h58c3065d5;
      expv[46] = 36'h000000012;
      expv[47] = 36'hffffc4802;
      expv[48] = 36'h00000000c;
      expv[49] = 36'hd0ddd5c33;
      expv[50] = 36'h000000010;
      expv[51] = 36'he56f5e562;
      expv[52] = 36'h9259c4463;
      expv[53] = 36'h8542e4522;
      expv[54] = 36'h700000000;
      expv[55] = 36'h601014200;
      expv[56] = 36'h1ca71b804;
      expv[57] = 36'h6416f7080;
      expv[58] = 36'h000000010;
      expv[59] = 36'hfff8e4802;
      expv[60] = 36'hfe3600002;
      expv[61] = 36'h3898e2010;
      expv[62] = 36'hd06f34673;
      expv[63] = 36'h608600000;
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
