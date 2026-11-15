// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 110;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_087573 dut (
    .clk(clk),
    .ra(in_vec[109:105]),
    .re(in_vec[104:104]),
    .ore(in_vec[103:103]),
    .wa(in_vec[102:98]),
    .we(in_vec[97:97]),
    .di(in_vec[96:65]),
    .byp_sel(in_vec[64:64]),
    .dbyp(in_vec[63:32]),
    .pwrbus_ram_pd(in_vec[31:0]),
    .dout(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 110'h1a4cc4dd0dafb1dd3fc64579ef21;
    stim[1] = 110'h2de216a604288394bbe79b6fbbcb;
    stim[2] = 110'h3d33d87aa77996eeadac5adb80ea;
    stim[3] = 110'h23007a5bc650aec3c18385b6b2cf;
    stim[4] = 110'h36939049479fa169ae1501b4fbc3;
    stim[5] = 110'h2b7c4adb044d62a20730d44d3ba3;
    stim[6] = 110'h0b7642034432e2bbeb930d1d21b4;
    stim[7] = 110'h31ac395e07af9b23b64f69856d1c;
    stim[8] = 110'h3cde89f3ca531a76cde5046fdadd;
    stim[9] = 110'h1b0c86aea7f7c0ff0711c72b8898;
    stim[10] = 110'h008c678ff457b8d45c6f4407d38f;
    stim[11] = 110'h0dc16f8420862a3d6fa869369ca6;
    stim[12] = 110'h0f3b48b6bae55d7e09b1c3065867;
    stim[13] = 110'h2a9b42818528161dbfc7b9419fb6;
    stim[14] = 110'h2e0a4acafdc2bd6cd2a1365857ee;
    stim[15] = 110'h335d024a955d79fb4b1dc7fafb35;
    stim[16] = 110'h22a0c70949804f29ef0f5c586fd7;
    stim[17] = 110'h285723ce81eab7a0cc47563a6d2a;
    stim[18] = 110'h2e54aa21bc5ab360947d9917a77f;
    stim[19] = 110'h0859e7566e697ed0860a9532f08c;
    stim[20] = 110'h35f61a197167de97a2c87dda09c7;
    stim[21] = 110'h2d3c9ac8687970850245ad8b8f1f;
    stim[22] = 110'h049ad197cf91fa01b7cebb5af3b4;
    stim[23] = 110'h3d67698c110a2043a9be7ea7e942;
    stim[24] = 110'h1c3d08c88786fb603f8836e9b0ed;
    stim[25] = 110'h259e73added99e89b8ac31671c4c;
    stim[26] = 110'h10ed2dc13d87507114ff4c089311;
    stim[27] = 110'h0b4cf406781e1edd2941fbfd4f3f;
    stim[28] = 110'h2c0cc70c42d1e7ad9a542b78ffaf;
    stim[29] = 110'h145892fd866be9df49336c534401;
    stim[30] = 110'h2e207cc51ff6566426ae30626c16;
    stim[31] = 110'h33da23cf8a1dbaf7fa6bcee4157a;
    stim[32] = 110'h1c48b101e6be815149166f69259c;
    stim[33] = 110'h018b8abb62dd9cb62597edd1ab1a;
    stim[34] = 110'h06b8bdc5e0eaea894b2b9553bfd2;
    stim[35] = 110'h0e2cdfc23d799b93e43e1626c133;
    stim[36] = 110'h114bf96860fc9e75f4c2081e789c;
    stim[37] = 110'h3a35ad1666c997537ab1112ed47c;
    stim[38] = 110'h26cc71ff0f63480f8fe5c54809d2;
    stim[39] = 110'h39bfcd118ca4011e6645f336a802;
    stim[40] = 110'h14b5eb256e4683e05da57082b665;
    stim[41] = 110'h1dc8aa9885f031ca48823039b027;
    stim[42] = 110'h2886997ddf0c24b5452f4fbb5087;
    stim[43] = 110'h34abb801adb25fc88a940d8c5e40;
    stim[44] = 110'h1fd49895754f4536a820bc64b201;
    stim[45] = 110'h1fc4bdd790c7142daee27d33b374;
    stim[46] = 110'h3eec325e362ad0710e4a439386fb;
    stim[47] = 110'h0c5cf770928eb37d99fa47aadf71;
    stim[48] = 110'h06c4071bce535398112e79cac1ec;
    stim[49] = 110'h062cc22b67041642b2c91bdb398e;
    stim[50] = 110'h004c4bec75272168752e25e25424;
    stim[51] = 110'h355e8a34f292c46671ad389e077c;
    stim[52] = 110'h0f21157c33059fbf33ac70546632;
    stim[53] = 110'h1c7993d7305bc3064457acde78a8;
    stim[54] = 110'h243cbf0fc903a5319c3ac384973d;
    stim[55] = 110'h0303b58794ba3ae3f6ce5a6f6cec;
    stim[56] = 110'h2361bb4613a75281a438f807bfc0;
    stim[57] = 110'h3471e4a1281628980fe43a64606b;
    stim[58] = 110'h3dc7e8cfcb6a1299e1123e357f76;
    stim[59] = 110'h3e0a3d0d98eb21f9a86397d4b504;
    stim[60] = 110'h3b1412b03cf089482af629cce576;
    stim[61] = 110'h3debf0a50ba9081560ffff6e659e;
    stim[62] = 110'h1e1b5a4d60094b966193b2c7f18e;
    stim[63] = 110'h098f8f5283b9d99c1d8322b7c533;
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
      expv[0] = 32'hxxxxxxxx;
      expv[1] = 32'hxxxxxxxx;
      expv[2] = 32'hxxxxxxxx;
      expv[3] = 32'hxxxxxxxx;
      expv[4] = 32'hxxxxxxxx;
      expv[5] = 32'ha169ae15;
      expv[6] = 32'ha169ae15;
      expv[7] = 32'ha169ae15;
      expv[8] = 32'h9b23b64f;
      expv[9] = 32'h1a76cde5;
      expv[10] = 32'h1a76cde5;
      expv[11] = 32'hb8d45c6f;
      expv[12] = 32'hxxxxxxxx;
      expv[13] = 32'hxxxxxxxx;
      expv[14] = 32'hxxxxxxxx;
      expv[15] = 32'hxxxxxxxx;
      expv[16] = 32'hxxxxxxxx;
      expv[17] = 32'hxxxxxxxx;
      expv[18] = 32'hxxxxxxxx;
      expv[19] = 32'hxxxxxxxx;
      expv[20] = 32'hxxxxxxxx;
      expv[21] = 32'hde97a2c8;
      expv[22] = 32'hde97a2c8;
      expv[23] = 32'hfa01b7ce;
      expv[24] = 32'hfa01b7ce;
      expv[25] = 32'hfa01b7ce;
      expv[26] = 32'h9e89b8ac;
      expv[27] = 32'h507114ff;
      expv[28] = 32'h507114ff;
      expv[29] = 32'h507114ff;
      expv[30] = 32'h507114ff;
      expv[31] = 32'h507114ff;
      expv[32] = 32'hbaf7fa6b;
      expv[33] = 32'hbaf7fa6b;
      expv[34] = 32'h9cb62597;
      expv[35] = 32'hxxxxxxxx;
      expv[36] = 32'hxxxxxxxx;
      expv[37] = 32'hxxxxxxxx;
      expv[38] = 32'hxxxxxxxx;
      expv[39] = 32'h480f8fe5;
      expv[40] = 32'hxxxxxxxx;
      expv[41] = 32'hxxxxxxxx;
      expv[42] = 32'hxxxxxxxx;
      expv[43] = 32'ha45b5d72;
      expv[44] = 32'ha45b5d72;
      expv[45] = 32'h4536a820;
      expv[46] = 32'h142daee2;
      expv[47] = 32'he688c652;
      expv[48] = 32'he688c652;
      expv[49] = 32'h5398112e;
      expv[50] = 32'h5398112e;
      expv[51] = 32'h5398112e;
      expv[52] = 32'h5398112e;
      expv[53] = 32'h5398112e;
      expv[54] = 32'h5398112e;
      expv[55] = 32'h5398112e;
      expv[56] = 32'h5398112e;
      expv[57] = 32'h5398112e;
      expv[58] = 32'h5398112e;
      expv[59] = 32'hxxxxxxxx;
      expv[60] = 32'hxxxxxxxx;
      expv[61] = 32'hxxxxxxxx;
      expv[62] = 32'h081560ff;
      expv[63] = 32'h081560ff;
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
