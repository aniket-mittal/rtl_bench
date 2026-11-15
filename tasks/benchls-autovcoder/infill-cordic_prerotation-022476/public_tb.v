// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 99;
  localparam OW = 100;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_022476 dut (
    .clk(clk),
    .x(in_vec[98:67]),
    .y(in_vec[66:35]),
    .z(in_vec[34:3]),
    .rst_n(in_vec[2:2]),
    .mode(in_vec[1:1]),
    .en(in_vec[0:0]),
    .phase(out_vec[99:98]),
    .en_out(out_vec[97:97]),
    .mode_out(out_vec[96:96]),
    .xt(out_vec[95:64]),
    .yt(out_vec[63:32]),
    .zt(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 99'h78dc340e3a8caf2ac8521c421;
    stim[1] = 99'h41b982121e9455cfcfa5d15b9;
    stim[2] = 99'h6f05426efaca7bdf37d4d48b6;
    stim[3] = 99'h6afa93cc9168cc47a57758636;
    stim[4] = 99'h749ac93b9d45076138dec0a6f;
    stim[5] = 99'h03d9d5b1ca03cc3da9b01714c;
    stim[6] = 99'h305979e58e61a8215acff6ebf;
    stim[7] = 99'h78a9fc135f4dc7d0079dc9e4e;
    stim[8] = 99'h39d73edd73446d3d45d10d747;
    stim[9] = 99'h35948fc0dc606a75715e40dcc;
    stim[10] = 99'h27d22f3c279a7d0618ddca556;
    stim[11] = 99'h21ab253a459c6e7da4f6971c5;
    stim[12] = 99'h2413498f21624814930d6140d;
    stim[13] = 99'h72636a71fa1f20bb85f642054;
    stim[14] = 99'h7e390df419f185a6214bc812e;
    stim[15] = 99'h716cb05c6600fc53e8192a0ad;
    stim[16] = 99'h73285cf20d59bd0ce4be4b937;
    stim[17] = 99'h45207bb6007b4ac674d829ab4;
    stim[18] = 99'h0f627af45410793b4894c20ae;
    stim[19] = 99'h5b33fe5250902a1a9d7392377;
    stim[20] = 99'h1072e873aaa90d8a8303f66e7;
    stim[21] = 99'h7e809cdecf09a6cea196fc12d;
    stim[22] = 99'h0b0f5364bc8a1abe534d7c824;
    stim[23] = 99'h3ed86ce355bd814d202a6740d;
    stim[24] = 99'h655691bef9765167af6c07f85;
    stim[25] = 99'h2e02fc7949c904907df78df3c;
    stim[26] = 99'h2a12afb3000ec0d54b0d0a0c6;
    stim[27] = 99'h54018c80f19d1e8972a6652b6;
    stim[28] = 99'h3dbcae528c7acfc587e446914;
    stim[29] = 99'h305581f7ba84f7c1a0a44ff3d;
    stim[30] = 99'h7b56332df98f645e5d3c470fe;
    stim[31] = 99'h08237e7d3b0b01ddceadf45b9;
    stim[32] = 99'h1e0113c7b7ce66c86fa24b156;
    stim[33] = 99'h464ee4b39eb8a9d7988e84a3f;
    stim[34] = 99'h68598ae6d730025fa9b13352c;
    stim[35] = 99'h5864b2f8b6e51a98fedaf5c7c;
    stim[36] = 99'h76b01fbbdebb6538c324caf85;
    stim[37] = 99'h5e0d1bf76f55f214389568df6;
    stim[38] = 99'h3f772dc077e66e0d292ce454d;
    stim[39] = 99'h32ac9bb21af4c97e1c13e7e27;
    stim[40] = 99'h7e856d509b3b5387810232646;
    stim[41] = 99'h46887ec1c349400e3d3200cff;
    stim[42] = 99'h7d9e667f051499f7d227d0cf5;
    stim[43] = 99'h006e7f631cc47244c62350edd;
    stim[44] = 99'h1c44456c5582014bc1f74638d;
    stim[45] = 99'h7cc8fd437cc39dd7f6b95906c;
    stim[46] = 99'h25df8c58ffac7bfe86bc5d4c5;
    stim[47] = 99'h7f226904c0eb5c0f555f7abce;
    stim[48] = 99'h3765a56925175d443875ef407;
    stim[49] = 99'h0ccf9974477dfb14ec952d8c3;
    stim[50] = 99'h2e37e4655884a275b4a72d23d;
    stim[51] = 99'h012d43938754e44f260c040ec;
    stim[52] = 99'h5388f492676d5099273488714;
    stim[53] = 99'h63d6cb79eb9f1d4c0d7f27434;
    stim[54] = 99'h7c8eb103692ceea53058811fe;
    stim[55] = 99'h2bf9c0dd95f48d1173f9c17f6;
    stim[56] = 99'h2e36d2a6753cd9675269b1ebd;
    stim[57] = 99'h6199e77b2e15ea45cbbd19275;
    stim[58] = 99'h6f1b944519979799e59950056;
    stim[59] = 99'h3da87d319c2a4ff2f9c25f53c;
    stim[60] = 99'h2012dbadd14d1af423cb337bc;
    stim[61] = 99'h4e27c9d43d4d939bc64d7a2d6;
    stim[62] = 99'h32a50657b881ca6164b39f9bc;
    stim[63] = 99'h6f85f996d688a13f50331680c;
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
      expv[0] = 100'h0000000000000000000000000;
      expv[1] = 100'h0000000000000000000000000;
      expv[2] = 100'h0000000000000000000000000;
      expv[3] = 100'h0000000000000000000000000;
      expv[4] = 100'h0000000000000000000000000;
      expv[5] = 100'h3e93592773a8a0ec271bd814d;
      expv[6] = 100'h0000000000000000000000000;
      expv[7] = 100'h360b2f3cb1cc35042b59fedd7;
      expv[8] = 100'h0000000000000000000000000;
      expv[9] = 100'h373ae7dbae688da7a8ba21ae8;
      expv[10] = 100'h0000000000000000000000000;
      expv[11] = 100'h0000000000000000000000000;
      expv[12] = 100'he43564a748b38dcfb49ed2e38;
      expv[13] = 100'h24826931e42c49029261ac281;
      expv[14] = 100'h0000000000000000000000000;
      expv[15] = 100'h0000000000000000000000000;
      expv[16] = 100'ha1d269f48cc01f8a7d0325415;
      expv[17] = 100'hbe650b9e41ab37a19c97c9726;
      expv[18] = 100'h0000000000000000000000000;
      expv[19] = 100'h0000000000000000000000000;
      expv[20] = 100'h3b667fca4a12054353ae7246e;
      expv[21] = 100'h320e5d0e755521b150607ecdc;
      expv[22] = 100'ha02fec6439e134d9d432df825;
      expv[23] = 100'h0000000000000000000000000;
      expv[24] = 100'he7db0d9c6ab7b029a4054ce81;
      expv[25] = 100'ha3552dc83f2eca2cf5ed80ff0;
      expv[26] = 100'h0000000000000000000000000;
      expv[27] = 100'h0000000000000000000000000;
      expv[28] = 100'h0000000000000000000000000;
      expv[29] = 100'h0000000000000000000000000;
      expv[30] = 100'h260ab03ef7509ef8341489fe7;
      expv[31] = 100'h0000000000000000000000000;
      expv[32] = 100'h0000000000000000000000000;
      expv[33] = 100'h0000000000000000000000000;
      expv[34] = 100'h38c9dc9673d7153af311d0947;
      expv[35] = 100'h0000000000000000000000000;
      expv[36] = 100'h0000000000000000000000000;
      expv[37] = 100'ha129fc089bd76ca71864995f0;
      expv[38] = 100'h0000000000000000000000000;
      expv[39] = 100'he7eee5b80efccdc1a5259c8a9;
      expv[40] = 100'hf6559376435e992fc3827cfc4;
      expv[41] = 100'h0000000000000000000000000;
      expv[42] = 100'h38d10fd838692801c7a64019f;
      expv[43] = 100'h604c333020a2933efa44fa19e;
      expv[44] = 100'h200dcfec63988e4898c46a1db;
      expv[45] = 100'he38888ad8ab04029783ee8c71;
      expv[46] = 100'h0000000000000000000000000;
      expv[47] = 100'he4bbf18b1ff58f7fd0d78ba98;
      expv[48] = 100'h0000000000000000000000000;
      expv[49] = 100'h0000000000000000000000000;
      expv[50] = 100'h0000000000000000000000000;
      expv[51] = 100'he5c6fc8cab10944eb694e5a47;
      expv[52] = 100'h0000000000000000000000000;
      expv[53] = 100'h0000000000000000000000000;
      expv[54] = 100'h0000000000000000000000000;
      expv[55] = 100'h0000000000000000000000000;
      expv[56] = 100'h0000000000000000000000000;
      expv[57] = 100'he5c6da54cea79b2cea4d363d7;
      expv[58] = 100'h63ccc310a5c2bd48b977a324e;
      expv[59] = 100'h0000000000000000000000000;
      expv[60] = 100'h0000000000000000000000000;
      expv[61] = 100'h0000000000000000000000000;
      expv[62] = 100'h0000000000000000000000000;
      expv[63] = 100'h0000000000000000000000000;
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
