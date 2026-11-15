// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 65;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_10333 dut (
    .clk(clk),
    .A_mul_src1(in_vec[64:33]),
    .A_mul_src2(in_vec[32:1]),
    .reset_n(in_vec[0:0]),
    .A_mul_cell_result(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 65'h185a1be6c19e8aa82;
    stim[1] = 65'h191c8dbe953e6cfac;
    stim[2] = 65'h18f419d569bcb06eb;
    stim[3] = 65'h1e69058a3fa626589;
    stim[4] = 65'h173050c37d111010f;
    stim[5] = 65'h149e246c8e57302eb;
    stim[6] = 65'h1f518bd2524ddc5d9;
    stim[7] = 65'h1c1472a64d59a3223;
    stim[8] = 65'h04286c864714f389b;
    stim[9] = 65'h1aa6fcba4b6f857cf;
    stim[10] = 65'h0cccd39e23b37ef37;
    stim[11] = 65'h02228d186e35d8341;
    stim[12] = 65'h0b1ddc66981907943;
    stim[13] = 65'h0a07c5b79e5960ad7;
    stim[14] = 65'h0acae6ad8c202a659;
    stim[15] = 65'h018448bff967c2b3d;
    stim[16] = 65'h0eb54a69b2b6d43ef;
    stim[17] = 65'h1cfef2324aff352ff;
    stim[18] = 65'h1c3098ca33ed9e035;
    stim[19] = 65'h0f25828878086b9e1;
    stim[20] = 65'h191d395c6915154bf;
    stim[21] = 65'h0e521446750778f7d;
    stim[22] = 65'h0af32298b36ecc275;
    stim[23] = 65'h12195ac918426bba5;
    stim[24] = 65'h199cdd5cfd8635fd9;
    stim[25] = 65'h1aecf1dae794a1d21;
    stim[26] = 65'h0907a5afce43b7f3f;
    stim[27] = 65'h04dbb363de58b3a65;
    stim[28] = 65'h1cdca71ded80f231d;
    stim[29] = 65'h059c6e74065a6d121;
    stim[30] = 65'h10d49e59bb36e560d;
    stim[31] = 65'h0bd645756cf95a1f1;
    stim[32] = 65'h0832e7f489e087fb9;
    stim[33] = 65'h158e73fd0d92753c9;
    stim[34] = 65'h09d93cc8d86b00133;
    stim[35] = 65'h05c0fd9287cf94bf3;
    stim[36] = 65'h1e61c157b2ed4899d;
    stim[37] = 65'h15b5919f628283a47;
    stim[38] = 65'h126d472b381dbacdb;
    stim[39] = 65'h1db7f315898b1d599;
    stim[40] = 65'h0c6cb5179461643d9;
    stim[41] = 65'h06a5897109640a3db;
    stim[42] = 65'h1412873836fdb8ecf;
    stim[43] = 65'h19a5e810c0f96c809;
    stim[44] = 65'h0c4b667c2f86cd365;
    stim[45] = 65'h06b811cd223d7a393;
    stim[46] = 65'h12280ad19b49bb063;
    stim[47] = 65'h1eea75c0baa889763;
    stim[48] = 65'h17e89ff9d6ff3b441;
    stim[49] = 65'h193c65c7405c2b7b9;
    stim[50] = 65'h0e0869b2c58b5dcfd;
    stim[51] = 65'h0113f4a5314e90877;
    stim[52] = 65'h02f27ba72a2b3e7c7;
    stim[53] = 65'h18a3799eef876fa37;
    stim[54] = 65'h1fac4818c1a4255d9;
    stim[55] = 65'h064bcccd7d84f1f83;
    stim[56] = 65'h0547e768a0b040ef5;
    stim[57] = 65'h1438a397e2dfe4dc5;
    stim[58] = 65'h0faa545ce72132915;
    stim[59] = 65'h1824253960a502af1;
    stim[60] = 65'h05759d0c6512d8a91;
    stim[61] = 65'h061620a539d222455;
    stim[62] = 65'h1c557b1d6e7aa38d3;
    stim[63] = 65'h19a3de3c048a39241;
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
      expv[0] = 32'h00000000;
      expv[1] = 32'h00000000;
      expv[2] = 32'h00000000;
      expv[3] = 32'h00000000;
      expv[4] = 32'h863ff527;
      expv[5] = 32'h5be9c004;
      expv[6] = 32'h16e2383d;
      expv[7] = 32'he50a90b4;
      expv[8] = 32'he4e41298;
      expv[9] = 32'he46eca52;
      expv[10] = 32'h12539b0a;
      expv[11] = 32'hc90aa67e;
      expv[12] = 32'h018d8ceb;
      expv[13] = 32'h0fbc7ce0;
      expv[14] = 32'heb7d13b4;
      expv[15] = 32'hc0e1c994;
      expv[16] = 32'h1d4f3290;
      expv[17] = 32'h4ce51e62;
      expv[18] = 32'ha5b9cc4b;
      expv[19] = 32'h82ea996e;
      expv[20] = 32'h6168143a;
      expv[21] = 32'h709b12d0;
      expv[22] = 32'hcf7d083d;
      expv[23] = 32'h756e06da;
      expv[24] = 32'hd98d59a2;
      expv[25] = 32'h763bef10;
      expv[26] = 32'hbf7475f4;
      expv[27] = 32'hd4101af0;
      expv[28] = 32'h82f04342;
      expv[29] = 32'h7f69b1dc;
      expv[30] = 32'he864f392;
      expv[31] = 32'ha6ea0a00;
      expv[32] = 32'hdca61fce;
      expv[33] = 32'h80153da8;
      expv[34] = 32'h96a40cf0;
      expv[35] = 32'heb8a92a0;
      expv[36] = 32'h16aa9fd6;
      expv[37] = 32'he1307ff4;
      expv[38] = 32'h5026d816;
      expv[39] = 32'h4a8fb551;
      expv[40] = 32'h902ad0e5;
      expv[41] = 32'h963ae110;
      expv[42] = 32'hbc77c950;
      expv[43] = 32'h3de7f4e8;
      expv[44] = 32'hd48843a7;
      expv[45] = 32'ha9f15a18;
      expv[46] = 32'hcbb15b72;
      expv[47] = 32'h68738971;
      expv[48] = 32'h1656b0cc;
      expv[49] = 32'h84d6c875;
      expv[50] = 32'haa7565c0;
      expv[51] = 32'h40aa57d8;
      expv[52] = 32'hd341a3d4;
      expv[53] = 32'h4df43473;
      expv[54] = 32'h431a448b;
      expv[55] = 32'h5d03390d;
      expv[56] = 32'hb5343288;
      expv[57] = 32'hb460fbab;
      expv[58] = 32'hdcc121e2;
      expv[59] = 32'h1247ba9e;
      expv[60] = 32'h54b95c86;
      expv[61] = 32'h3ff93e28;
      expv[62] = 32'h57758ad8;
      expv[63] = 32'h6f67baba;
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
