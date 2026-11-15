// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 72;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_111162 dut (
    .clk(clk),
    .rstn(in_vec[71:71]),
    .is_out(in_vec[70:70]),
    .memtoreg(in_vec[69:69]),
    .douta(in_vec[68:37]),
    .d(in_vec[36:5]),
    .rd(in_vec[4:0]),
    .txd(out_vec[32:32]),
    .dtowrite(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 72'h2c38d080008c367de8;
    stim[1] = 72'h52b27192e53efb84e2;
    stim[2] = 72'h9fe2f4c7029aee06aa;
    stim[3] = 72'hea2d4302af5b232fef;
    stim[4] = 72'hc03b9bfd1b94694820;
    stim[5] = 72'h97f58c0361977db540;
    stim[6] = 72'hb4c103cd445761d912;
    stim[7] = 72'he35baaf8ca77835f5d;
    stim[8] = 72'hb8fd758847e025310a;
    stim[9] = 72'h9decc10a6ad187ac9c;
    stim[10] = 72'hcf50f8a0c3021dfb84;
    stim[11] = 72'h5354b3fe99f7d2ff9a;
    stim[12] = 72'h9b20f4e16208caaabf;
    stim[13] = 72'hbff199638307352353;
    stim[14] = 72'hdad723bacc71bfd2d8;
    stim[15] = 72'hc0bd6bbbf5143fc379;
    stim[16] = 72'h97955a7c754b86293d;
    stim[17] = 72'h932154ff9472ec6b06;
    stim[18] = 72'h275ae62b7c322a364a;
    stim[19] = 72'hb00c3630d0ad2b5590;
    stim[20] = 72'hb6ca9a777e76a5e5e5;
    stim[21] = 72'hf477d2b97ebd077677;
    stim[22] = 72'hd6f93a1367c0e1dcc0;
    stim[23] = 72'hb88cd9b826d5565f01;
    stim[24] = 72'ha35a731b8e1694dd54;
    stim[25] = 72'hde2e67a304f89275ae;
    stim[26] = 72'hc58d7c5ba540049012;
    stim[27] = 72'heb035a5a9df88d73cb;
    stim[28] = 72'hefc1a5e50f3c20c294;
    stim[29] = 72'heac88d2a07a342979e;
    stim[30] = 72'h90719854b939e4d1a2;
    stim[31] = 72'hba955a9d84006be687;
    stim[32] = 72'hb063a894c36e46d89f;
    stim[33] = 72'hf05ec6a04c09672ff9;
    stim[34] = 72'hf5948500ae86e89698;
    stim[35] = 72'he0f6451bd6720570b8;
    stim[36] = 72'hbcd1cea59cf090342a;
    stim[37] = 72'hb1ff0a5aa7604c9037;
    stim[38] = 72'h53b29fc07f23cc744e;
    stim[39] = 72'h93052fffe2f5418396;
    stim[40] = 72'hd61f741c3d583b1059;
    stim[41] = 72'hb1c302ebbac90ca8a6;
    stim[42] = 72'hbeea0ada27c3f20791;
    stim[43] = 72'h98d362caa4882c49bc;
    stim[44] = 72'ha7d4ac1a0a86e81a43;
    stim[45] = 72'hb22dd147e6b8b0dcfd;
    stim[46] = 72'ha1196cd59f83125b6e;
    stim[47] = 72'hf80b94753abafab438;
    stim[48] = 72'hbf066e587e9bfdec6b;
    stim[49] = 72'hce841d966ea0b98ea4;
    stim[50] = 72'hda3631fc12ff7ee7a9;
    stim[51] = 72'hdc5cc0e8f2e513a725;
    stim[52] = 72'hf919f21bf9d093e8be;
    stim[53] = 72'hd0d984777fdea580c6;
    stim[54] = 72'h843bf0337cd9d49ac8;
    stim[55] = 72'he0fd473a0cc5e5c26e;
    stim[56] = 72'hf4e521e59cc0ef1372;
    stim[57] = 72'hf55b5417af7f6e4481;
    stim[58] = 72'hb11e5fc1c1a110306a;
    stim[59] = 72'he24cca66f64f5511cf;
    stim[60] = 72'hafad4eb16b8615f47d;
    stim[61] = 72'h95c4c79e8a6eda16c4;
    stim[62] = 72'hf35aa5c338eac32717;
    stim[63] = 72'he1832bafa496d08348;
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
      expv[0] = 33'hx0461b3ef;
      expv[1] = 33'hx29f7dc27;
      expv[2] = 33'hx14d77035;
      expv[3] = 33'hx7ad9197f;
      expv[4] = 33'hxdca34a41;
      expv[5] = 33'hx0cbbedaa;
      expv[6] = 33'hx22bb0ec8;
      expv[7] = 33'hx53bc1afa;
      expv[8] = 33'hx3f012988;
      expv[9] = 33'hx568c3d64;
      expv[10] = 33'hx1810efdc;
      expv[11] = 33'hxcfbe97fc;
      expv[12] = 33'hx10465555;
      expv[13] = 33'hx1839a91a;
      expv[14] = 33'hx638dfe96;
      expv[15] = 33'hxa8a1fe1b;
      expv[16] = 33'hxaa5c3149;
      expv[17] = 33'hxa3976358;
      expv[18] = 33'hxe19151b2;
      expv[19] = 33'hx85695aac;
      expv[20] = 33'hxf3b52f2f;
      expv[21] = 33'hxf5e83bb3;
      expv[22] = 33'hx3e070ee6;
      expv[23] = 33'hx36aab2f8;
      expv[24] = 33'hx70b4a6ea;
      expv[25] = 33'hx27c493ad;
      expv[26] = 33'hx2a002480;
      expv[27] = 33'hxefc46b9e;
      expv[28] = 33'hx79e10614;
      expv[29] = 33'hx3d1a14bc;
      expv[30] = 33'hxc9cf268d;
      expv[31] = 33'hx20035f34;
      expv[32] = 33'hx1b7236c4;
      expv[33] = 33'hx604b397f;
      expv[34] = 33'hx743744b4;
      expv[35] = 33'hxb3902b85;
      expv[36] = 33'hxe78481a1;
      expv[37] = 33'hx3b026481;
      expv[38] = 33'hxf91e63a2;
      expv[39] = 33'hx17aa0c1c;
      expv[40] = 33'hxeac1d882;
      expv[41] = 33'hxd6486545;
      expv[42] = 33'hx3e1f903c;
      expv[43] = 33'hx2441624d;
      expv[44] = 33'hx543740d2;
      expv[45] = 33'hx35c586e7;
      expv[46] = 33'hxfc1892db;
      expv[47] = 33'hxd5d7d5a1;
      expv[48] = 33'hxf4dfef63;
      expv[49] = 33'hx7505cc75;
      expv[50] = 33'hx97fbf73d;
      expv[51] = 33'hx97289d39;
      expv[52] = 33'hxce849f45;
      expv[53] = 33'hxfef52c06;
      expv[54] = 33'hxe6cea4d6;
      expv[55] = 33'hx662f2e13;
      expv[56] = 33'hxe607789b;
      expv[57] = 33'hx7bfb7224;
      expv[58] = 33'hx0d088183;
      expv[59] = 33'hxb27aa88e;
      expv[60] = 33'hx5c30afa3;
      expv[61] = 33'hx5376d0b6;
      expv[62] = 33'hxc7561938;
      expv[63] = 33'hx24b6841a;
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
