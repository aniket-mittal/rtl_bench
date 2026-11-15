// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 101;
  localparam OW = 36;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_071220 dut (
    .clk(clk),
    .rst(in_vec[100:100]),
    .cpu_cen(in_vec[99:99]),
    .A(in_vec[98:83]),
    .VMA(in_vec[82:82]),
    .RnW(in_vec[81:81]),
    .pal_cs(in_vec[80:80]),
    .rom_data(in_vec[79:72]),
    .rom_ok(in_vec[71:71]),
    .cab_1p(in_vec[70:69]),
    .coin(in_vec[68:67]),
    .joystick1(in_vec[66:60]),
    .joystick2(in_vec[59:53]),
    .service(in_vec[52:52]),
    .cpu_dout(in_vec[51:44]),
    .pal_dout(in_vec[43:36]),
    .gfx1_dout(in_vec[35:28]),
    .ram_dout(in_vec[27:20]),
    .dipsw_a(in_vec[19:12]),
    .dipsw_b(in_vec[11:4]),
    .dipsw_c(in_vec[3:0]),
    .gfx1_cs(out_vec[35:35]),
    .snd_irq(out_vec[34:34]),
    .snd_latch(out_vec[33:26]),
    .rom_addr(out_vec[25:10]),
    .rom_cs(out_vec[9:9]),
    .ram_cs(out_vec[8:8]),
    .cpu_din(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 101'h18f2ac01f66681746588dd800f;
    stim[1] = 101'h1f33609ae6cb8ee4b45362b6c9;
    stim[2] = 101'h021dbc9f0f0a52efdcd477f285;
    stim[3] = 101'h04c807779474c19985b02c9d46;
    stim[4] = 101'h0b3a801ae2ee39aeb7efeb2317;
    stim[5] = 101'h003d3cbc01a5a8e73ea49997b3;
    stim[6] = 101'h016238bf222c3d0fee249516dc;
    stim[7] = 101'h00e48c42f19dc39be3a85fb45e;
    stim[8] = 101'h15a1a8d1d6d757e3d9593aeed4;
    stim[9] = 101'h09dcd3ac38a57caa187dd2da5d;
    stim[10] = 101'h0b015d3e4e0d631cbcca37ba39;
    stim[11] = 101'h0beda3a94925575ec5e554c4f2;
    stim[12] = 101'h009b0ee613d412b6b7ea973b6a;
    stim[13] = 101'h053a91fd5a815f3f70ffd4d6bd;
    stim[14] = 101'h09ed359e8a2ab150e59fd48e1b;
    stim[15] = 101'h042eca65f04888d828984acc32;
    stim[16] = 101'h0db81f7838c43b2260aa1a930a;
    stim[17] = 101'h0ee2603bd7339dabe8a09a4bdc;
    stim[18] = 101'h044905a46b8da35e767e62318c;
    stim[19] = 101'h0b629d28795f51649a8d904570;
    stim[20] = 101'h0ab6361f4d4e26459efc564fa3;
    stim[21] = 101'h02d0df7fbb7c68a64d91e476ff;
    stim[22] = 101'h08f9548bebc04a5bef25976aec;
    stim[23] = 101'h05eb6df36087f353ee7b8691b8;
    stim[24] = 101'h050fcbbb3b0de1e44e946408da;
    stim[25] = 101'h05bf47cccc7ac41ac1f485b521;
    stim[26] = 101'h0b9c9b5014150310c29b56eceb;
    stim[27] = 101'h04f8c5e7030a6a964caf1f8c61;
    stim[28] = 101'h005ddf5eeea1856b8c62685533;
    stim[29] = 101'h0e8e0e4243d702dd6184f0ca9d;
    stim[30] = 101'h0259a6b4254bfaa53deb1d0817;
    stim[31] = 101'h04e29bc22e01cf6b785652b326;
    stim[32] = 101'h0d2f24e32fa33b034786ba275a;
    stim[33] = 101'h09a659cdcce4a5fbc8fd4ade54;
    stim[34] = 101'h0e3f468c31459be3b4369561e5;
    stim[35] = 101'h09a7fa1e3bf8b4f40e3a898775;
    stim[36] = 101'h0e1ea8953d51db7853b0b6d6f9;
    stim[37] = 101'h0006a06b2c9f8d9730affba157;
    stim[38] = 101'h0432234c2e291c4fff0c1f58b6;
    stim[39] = 101'h000275fd8d17e93580796e80cf;
    stim[40] = 101'h00a6b8435cbf55245ccfa1c4fb;
    stim[41] = 101'h081db1893f5d35cf68c176fc31;
    stim[42] = 101'h0e8f6102b9261b49c60cb8b3ce;
    stim[43] = 101'h083340542b72090cb4f39f80bd;
    stim[44] = 101'h0edacd28eaadb11f69be6b262c;
    stim[45] = 101'h02d9d0dcd69bb4d51f93ac63e9;
    stim[46] = 101'h052c34f820d81e14251d2b36eb;
    stim[47] = 101'h01646337fff9cbe11d010273de;
    stim[48] = 101'h091ebdb462f7eb9393a64cd550;
    stim[49] = 101'h0f7a29e58c8acf582735ad3318;
    stim[50] = 101'h073e2f8936a3648c3ef1524bf6;
    stim[51] = 101'h0eb281dc78bbf77c6a055c6eb7;
    stim[52] = 101'h0e734b997599a36a4dca3e7211;
    stim[53] = 101'h0641b560e723d3dbcc4cef2fa0;
    stim[54] = 101'h0ac44f3f5021a77449bd925be6;
    stim[55] = 101'h00edc47d5e6ec93b302bcbe1b5;
    stim[56] = 101'h083dbf1dbe751782164211add6;
    stim[57] = 101'h039c63b08167f21bce7c4d20ea;
    stim[58] = 101'h067b2ca8e017e763b852c168aa;
    stim[59] = 101'h04a006becbd10292d04a2b2d15;
    stim[60] = 101'h0236a34c55baa47fa138e7a5bd;
    stim[61] = 101'h057ac90e24fe668b4ec40a77e7;
    stim[62] = 101'h06fc342782e7b8afaf9aa399b9;
    stim[63] = 101'h0e10a14ab11e2245d939062710;
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
      expv[0] = 36'hxxxx954xx;
      expv[1] = 36'h00399b058;
      expv[2] = 36'h0000edcff;
      expv[3] = 36'h0026402ff;
      expv[4] = 36'h0019d4077;
      expv[5] = 36'h0001e9cff;
      expv[6] = 36'h800311cff;
      expv[7] = 36'h8007244e2;
      expv[8] = 36'h002d0d43a;
      expv[9] = 36'h0006e69ff;
      expv[10] = 36'h00180acdd;
      expv[11] = 36'h001f6d0ff;
      expv[12] = 36'h8004d84ff;
      expv[13] = 36'h0029d487e;
      expv[14] = 36'h0007699ff;
      expv[15] = 36'h0021764fd;
      expv[16] = 36'h002dc0eff;
      expv[17] = 36'h003713078;
      expv[18] = 36'h0022480ff;
      expv[19] = 36'h001b14cff;
      expv[20] = 36'h0005b1aff;
      expv[21] = 36'h000686e1f;
      expv[22] = 36'h8007ca87f;
      expv[23] = 36'h002f5b4f2;
      expv[24] = 36'h00287e4ff;
      expv[25] = 36'h002dfa2ff;
      expv[26] = 36'h001ce4ccc;
      expv[27] = 36'h0027c60ff;
      expv[28] = 36'h8002eecff;
      expv[29] = 36'h0034706b8;
      expv[30] = 36'h0002cd242;
      expv[31] = 36'h002714cb4;
      expv[32] = 36'h0029790ff;
      expv[33] = 36'h000532dff;
      expv[34] = 36'h0031fa2d4;
      expv[35] = 36'h00053fd8c;
      expv[36] = 36'h0030f54a8;
      expv[37] = 36'h8000350ff;
      expv[38] = 36'h00219100a;
      expv[39] = 36'h8000138ff;
      expv[40] = 36'h800535c58;
      expv[41] = 36'h8000ed8cc;
      expv[42] = 36'h00347b0f6;
      expv[43] = 36'h00019a0ff;
      expv[44] = 36'h0036d64ff;
      expv[45] = 36'h0006ce8ff;
      expv[46] = 36'h0029618ff;
      expv[47] = 36'h8003230ff;
      expv[48] = 36'h8000f5c11;
      expv[49] = 36'h003bd1439;
      expv[50] = 36'h0039f16ff;
      expv[51] = 36'h003594089;
      expv[52] = 36'h00339a4ff;
      expv[53] = 36'h00320d8ff;
      expv[54] = 36'h0006226ff;
      expv[55] = 36'h80076e03f;
      expv[56] = 36'h0001edc02;
      expv[57] = 36'h001ce30ff;
      expv[58] = 36'h0033d94ff;
      expv[59] = 36'h0025002ff;
      expv[60] = 36'h0001b50be;
      expv[61] = 36'h002bd64ff;
      expv[62] = 36'h0037e18ff;
      expv[63] = 36'h0030850ff;
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
