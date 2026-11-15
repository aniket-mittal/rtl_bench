// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 78;
  localparam OW = 75;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_059664 dut (
    .clk(clk),
    .reset(in_vec[77:77]),
    .if_write_ce(in_vec[76:76]),
    .if_write(in_vec[75:75]),
    .if_din(in_vec[74:2]),
    .if_read_ce(in_vec[1:1]),
    .if_read(in_vec[0:0]),
    .if_full_n(out_vec[74:74]),
    .if_empty_n(out_vec[73:73]),
    .if_dout(out_vec[72:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 78'h3b0807280e847a6bcac7;
    stim[1] = 78'h3b4de33afb89370d4c42;
    stim[2] = 78'h1300b128b0df34546149;
    stim[3] = 78'h08121983122bdcbbf236;
    stim[4] = 78'h0fc202ffa30fc959f86a;
    stim[5] = 78'h066c1d70f00f6e363104;
    stim[6] = 78'h153462edf65b01486a14;
    stim[7] = 78'h15f5c0639b7a70ecfb04;
    stim[8] = 78'h04ee8714b3bfbdf2a08d;
    stim[9] = 78'h004b7745938844cd517e;
    stim[10] = 78'h0283b10e0941cda17887;
    stim[11] = 78'h0905b06932add6e589f1;
    stim[12] = 78'h0fd54a1061f1c5191d40;
    stim[13] = 78'h16dbfab0f7558beb1631;
    stim[14] = 78'h1263c08b3e680f4f7827;
    stim[15] = 78'h05aff064af2a8c22562e;
    stim[16] = 78'h05dfcb9b607b9203ec4d;
    stim[17] = 78'h11a5950b3139b99a297b;
    stim[18] = 78'h187eba19be0e41534078;
    stim[19] = 78'h1ba3eb3f759fd8f3ab6f;
    stim[20] = 78'h1e949ce214901ea378fc;
    stim[21] = 78'h0850e329a2670c6f61d2;
    stim[22] = 78'h06abe14ccbb1b7fc4d24;
    stim[23] = 78'h1382c9ceade71d1b5b1c;
    stim[24] = 78'h11424bc75159b46f3a46;
    stim[25] = 78'h061a20452d48cccc1f19;
    stim[26] = 78'h1b669ed56ac3d9639084;
    stim[27] = 78'h0eacfd56a329aa264417;
    stim[28] = 78'h07dc38486a78f239e7b9;
    stim[29] = 78'h10e8735f52464ff616fd;
    stim[30] = 78'h0a07125cbaa6a1528414;
    stim[31] = 78'h1d85e20972b3428a103f;
    stim[32] = 78'h03b2f5b264718b8f13db;
    stim[33] = 78'h0772cb3abfa37b8faf69;
    stim[34] = 78'h1bf83dbc7c4eb8afe6dd;
    stim[35] = 78'h1330a77e5b57eab5a0cb;
    stim[36] = 78'h0372adaf3e62906de75b;
    stim[37] = 78'h1f1d9eaca25506ec7e63;
    stim[38] = 78'h06152c2adddc9baedf36;
    stim[39] = 78'h199e1043885ebfe6ed7b;
    stim[40] = 78'h0f284a691307d5db2165;
    stim[41] = 78'h19c5c879e8316ee77801;
    stim[42] = 78'h07ae8c21d8450d636bee;
    stim[43] = 78'h170da11f7ac235b4961e;
    stim[44] = 78'h05e63b2fa67230ff0f94;
    stim[45] = 78'h1fed17aba0de7d72ea76;
    stim[46] = 78'h15dbc32523543dae6a21;
    stim[47] = 78'h10e8f4b3c6c08bb24c74;
    stim[48] = 78'h14a8d07a8852e9d20487;
    stim[49] = 78'h0a0911e8db91702e11fc;
    stim[50] = 78'h0b893a3575eec6d38d66;
    stim[51] = 78'h0a7ed995512cbb487caf;
    stim[52] = 78'h1d1b9e8509872d7cb2a9;
    stim[53] = 78'h106a7bb5562c3fa95407;
    stim[54] = 78'h1bee958f7efb0bed8c1c;
    stim[55] = 78'h08dd4067cd25bf057138;
    stim[56] = 78'h1b65b8634121384c3a04;
    stim[57] = 78'h1a8b684e6da6cf7f9145;
    stim[58] = 78'h0d2cda5b59f034c8588c;
    stim[59] = 78'h1410248d82656ba14154;
    stim[60] = 78'h08d88ffcc895834b3524;
    stim[61] = 78'h2db1589d3e86ad15cc0e;
    stim[62] = 78'h1a53aac6d5ef0898bca3;
    stim[63] = 78'h0edc029b4eb86ddb7649;
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
      expv[0] = 75'h4000000000000000000;
      expv[1] = 75'h4000000000000000000;
      expv[2] = 75'h4000000000000000000;
      expv[3] = 75'h4000000000000000000;
      expv[4] = 75'h4000000000000000000;
      expv[5] = 75'h4000000000000000000;
      expv[6] = 75'h4000000000000000000;
      expv[7] = 75'h4000000000000000000;
      expv[8] = 75'h4000000000000000000;
      expv[9] = 75'h4000000000000000000;
      expv[10] = 75'h4000000000000000000;
      expv[11] = 75'h4000000000000000000;
      expv[12] = 75'h4000000000000000000;
      expv[13] = 75'h4000000000000000000;
      expv[14] = 75'h4000000000000000000;
      expv[15] = 75'h4000000000000000000;
      expv[16] = 75'h4000000000000000000;
      expv[17] = 75'h4000000000000000000;
      expv[18] = 75'h4000000000000000000;
      expv[19] = 75'h4000000000000000000;
      expv[20] = 75'h61fae866f839054d01e;
      expv[21] = 75'h61fae866f839054d01e;
      expv[22] = 75'h61fae866f839054d01e;
      expv[23] = 75'h61fae866f839054d01e;
      expv[24] = 75'h61fae866f839054d01e;
      expv[25] = 75'h61fae866f839054d01e;
      expv[26] = 75'h61fae866f839054d01e;
      expv[27] = 75'h61fae866f839054d01e;
      expv[28] = 75'h6e8facfdd67f63ceadb;
      expv[29] = 75'h6e8facfdd67f63ceadb;
      expv[30] = 75'h6e8facfdd67f63ceadb;
      expv[31] = 75'h6e8facfdd67f63ceadb;
      expv[32] = 75'h7a52738852407a8de3f;
      expv[33] = 75'h6d9a7b55ab0f658e421;
      expv[34] = 75'h6d9a7b55ab0f658e421;
      expv[35] = 75'h6d9a7b55ab0f658e421;
      expv[36] = 75'h76178825cacd0a2840f;
      expv[37] = 75'h6fe0f6f1f13ae2bf9b7;
      expv[38] = 75'h4fe0f6f1f13ae2bf9b7;
      expv[39] = 75'h7c767ab289541bb1f98;
      expv[40] = 75'h5c767ab289541bb1f98;
      expv[41] = 75'h5c767ab289541bb1f98;
      expv[42] = 75'h5c767ab289541bb1f98;
      expv[43] = 75'h6678410e217aff9bb5e;
      expv[44] = 75'h6678410e217aff9bb5e;
      expv[45] = 75'h6678410e217aff9bb5e;
      expv[46] = 75'h6678410e217aff9bb5e;
      expv[47] = 75'h6678410e217aff9bb5e;
      expv[48] = 75'h6678410e217aff9bb5e;
      expv[49] = 75'h671721e7a0c5bb9de00;
      expv[50] = 75'h671721e7a0c5bb9de00;
      expv[51] = 75'h671721e7a0c5bb9de00;
      expv[52] = 75'h7fb45eae8379f5cba9d;
      expv[53] = 75'h7fb45eae8379f5cba9d;
      expv[54] = 75'h746e7a14261cb5f2caa;
      expv[55] = 75'h746e7a14261cb5f2caa;
      expv[56] = 75'h746e7a14261cb5f2caa;
      expv[57] = 75'h746e7a14261cb5f2caa;
      expv[58] = 75'h746e7a14261cb5f2caa;
      expv[59] = 75'h746e7a14261cb5f2caa;
      expv[60] = 75'h746e7a14261cb5f2caa;
      expv[61] = 75'h746e7a14261cb5f2caa;
      expv[62] = 75'h4000000000000000000;
      expv[63] = 75'h4000000000000000000;
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
