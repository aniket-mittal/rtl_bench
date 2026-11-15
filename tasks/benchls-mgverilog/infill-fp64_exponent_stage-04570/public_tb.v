// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 99;
  localparam OW = 66;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04570 dut (
    .clock(clk),
    .resetn(in_vec[98:98]),
    .dataa(in_vec[97:34]),
    .datab(in_vec[33:2]),
    .valid_in(in_vec[1:1]),
    .stall_in(in_vec[0:0]),
    .valid_out(out_vec[65:65]),
    .stall_out(out_vec[64:64]),
    .result(out_vec[63:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 99'h3a0b04e67e02459b067e4bb18;
    stim[1] = 99'h2d54f2a7715128293093ecb81;
    stim[2] = 99'h7d128bcbfbbbd524b331c0885;
    stim[3] = 99'h75bfb50e136d635142be661c2;
    stim[4] = 99'h751d83d543e61f93f14a5fcd3;
    stim[5] = 99'h75c6880b38332810e1f41d7c0;
    stim[6] = 99'h44db894b67742d6dadc5b8e06;
    stim[7] = 99'h59463abd63e321ed5fc1b6e46;
    stim[8] = 99'h54b82a9acf23d65e1b8ba84e7;
    stim[9] = 99'h5fb4ea1974c824517699110ea;
    stim[10] = 99'h5fa738e0a831e892e3fcfa527;
    stim[11] = 99'h6d19a145e9a9bb9b81f5ddfaa;
    stim[12] = 99'h685617cde100bbdb65e95b622;
    stim[13] = 99'h62c1e6414d05eecd80e09ff5f;
    stim[14] = 99'h74dadaf8fdc569a4b761c45a8;
    stim[15] = 99'h6c740132c832e5b8138a5bf53;
    stim[16] = 99'h7abd650d5a20ee7411c87516b;
    stim[17] = 99'h5b618213079960c4b23146974;
    stim[18] = 99'h4aeb09fe7d070ec59609f6f89;
    stim[19] = 99'h6466c7613b515dd88493d8a93;
    stim[20] = 99'h62975f9cf092dfed824f29fa2;
    stim[21] = 99'h76bd320ad567fac90d51b39f0;
    stim[22] = 99'h690b0047c60ded390e7d5f4c8;
    stim[23] = 99'h6db62d37add43d5a83b194b47;
    stim[24] = 99'h74a9bcb64685b5dd8ff86c45b;
    stim[25] = 99'h702b3987a578809291b5d7dfb;
    stim[26] = 99'h51322d4f56b1150fd9ad9e1f0;
    stim[27] = 99'h7d1eb1e3829168fe5533ff212;
    stim[28] = 99'h56d6b0fa169e0347b70a4bd24;
    stim[29] = 99'h548376937024405992fb43bee;
    stim[30] = 99'h4505f35e84cd2b181108849fb;
    stim[31] = 99'h49f2f6874130a00cfebc41130;
    stim[32] = 99'h7d12ec5391119cea74a6b6b99;
    stim[33] = 99'h533e487060d524aa109c8a7b4;
    stim[34] = 99'h7c1c9c0b2ed126d93fc78b8c1;
    stim[35] = 99'h76fea0e05cdf47990eec6ddc0;
    stim[36] = 99'h7d8d52a7ccdb6a6fcbedb56e9;
    stim[37] = 99'h58a2e49782c72a929e618f222;
    stim[38] = 99'h577db4b69245c09438f8c7ac3;
    stim[39] = 99'h4678a48fa990aff391a05cd23;
    stim[40] = 99'h7040a0481a94c4769c589f5e1;
    stim[41] = 99'h748b7b47b8b2be30b45724f57;
    stim[42] = 99'h6869bdcb4be58df8305ba0678;
    stim[43] = 99'h6f9c6ccc207aa7c5b339ba5dd;
    stim[44] = 99'h47927dd0ce1d97e9ace1f7554;
    stim[45] = 99'h7938f9bc460d8e60bd399492a;
    stim[46] = 99'h6250f7e2560db34817f5316d6;
    stim[47] = 99'h73f688cd3067756dd10bc5aa9;
    stim[48] = 99'h58f7281080570c42ecbb26023;
    stim[49] = 99'h4d8a526169d4821bbf75c40b4;
    stim[50] = 99'h734b3961568c05c2c99d966cd;
    stim[51] = 99'h6d81ab131479147baf7dd4ff6;
    stim[52] = 99'h52a1910a0cf81b6a131e8b58e;
    stim[53] = 99'h5ff4cc9966a979685cf870112;
    stim[54] = 99'h752aa1b6534a3de0298ed5cf5;
    stim[55] = 99'h689be127e0eb95df0a588c675;
    stim[56] = 99'h4809bc3c097916f0bd45028c6;
    stim[57] = 99'h4aeeaf59e28f9df86c1c9a024;
    stim[58] = 99'h42ad181ae5a006bb55a9adef9;
    stim[59] = 99'h5dcf322cbd881edf2383f0062;
    stim[60] = 99'h570490a8d6c2b10bc3caac73f;
    stim[61] = 99'h7705376f13e6af088d61c5aba;
    stim[62] = 99'h5addf895ba04eefe982a09847;
    stim[63] = 99'h5a3ebe4c4340564b180aa63a8;
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
      expv[0] = 66'h0xxxxxxxxxxxxxxxx;
      expv[1] = 66'h0xxxxxxxxxxxxxxxx;
      expv[2] = 66'h0xxxxxxxxxxxxxxxx;
      expv[3] = 66'h08000000000000000;
      expv[4] = 66'h3fff0000000000000;
      expv[5] = 66'h2fff0000000000000;
      expv[6] = 66'h08000000000000000;
      expv[7] = 66'h20000000000000000;
      expv[8] = 66'h37ff0000000000000;
      expv[9] = 66'h27ff0000000000000;
      expv[10] = 66'h30000000000000000;
      expv[11] = 66'h20000000000000000;
      expv[12] = 66'h2fff0000000000000;
      expv[13] = 66'h38000000000000000;
      expv[14] = 66'h28000000000000000;
      expv[15] = 66'h08000000000000000;
      expv[16] = 66'h3fff0000000000000;
      expv[17] = 66'h2fff0000000000000;
      expv[18] = 66'h00000000000000000;
      expv[19] = 66'h07ff0000000000000;
      expv[20] = 66'h2fff0000000000000;
      expv[21] = 66'h2fff0000000000000;
      expv[22] = 66'h0fff0000000000000;
      expv[23] = 66'h0fff0000000000000;
      expv[24] = 66'h3fff0000000000000;
      expv[25] = 66'h3fff0000000000000;
      expv[26] = 66'h2fff0000000000000;
      expv[27] = 66'h07ff0000000000000;
      expv[28] = 66'h2fff0000000000000;
      expv[29] = 66'h00000000000000000;
      expv[30] = 66'h37ff0000000000000;
      expv[31] = 66'h27ff0000000000000;
      expv[32] = 66'h00000000000000000;
      expv[33] = 66'h08000000000000000;
      expv[34] = 66'h07ff0000000000000;
      expv[35] = 66'h08000000000000000;
      expv[36] = 66'h0fff0000000000000;
      expv[37] = 66'h0fff0000000000000;
      expv[38] = 66'h37ff0000000000000;
      expv[39] = 66'h37ff0000000000000;
      expv[40] = 66'h37ff0000000000000;
      expv[41] = 66'h37ff0000000000000;
      expv[42] = 66'h27ff0000000000000;
      expv[43] = 66'h08000000000000000;
      expv[44] = 66'h08000000000000000;
      expv[45] = 66'h00000000000000000;
      expv[46] = 66'h28000000000000000;
      expv[47] = 66'h3fff0000000000000;
      expv[48] = 66'h3fff0000000000000;
      expv[49] = 66'h2fff0000000000000;
      expv[50] = 66'h00000000000000000;
      expv[51] = 66'h0fff0000000000000;
      expv[52] = 66'h28000000000000000;
      expv[53] = 66'h27ff0000000000000;
      expv[54] = 66'h37ff0000000000000;
      expv[55] = 66'h37ff0000000000000;
      expv[56] = 66'h27ff0000000000000;
      expv[57] = 66'h20000000000000000;
      expv[58] = 66'h00000000000000000;
      expv[59] = 66'h07ff0000000000000;
      expv[60] = 66'h30000000000000000;
      expv[61] = 66'h20000000000000000;
      expv[62] = 66'h3fff0000000000000;
      expv[63] = 66'h2fff0000000000000;
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
