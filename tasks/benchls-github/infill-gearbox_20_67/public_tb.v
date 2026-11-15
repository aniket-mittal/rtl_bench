// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 22;
  localparam OW = 68;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  gearbox_20_67 dut (
    .clk(clk),
    .arst(in_vec[21:21]),
    .din(in_vec[20:1]),
    .slip_to_frame(in_vec[0:0]),
    .dout(out_vec[67:1]),
    .dout_valid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 22'h2ef89f;
    stim[1] = 22'h29dcaf;
    stim[2] = 22'h0c6505;
    stim[3] = 22'h022dec;
    stim[4] = 22'h180e5b;
    stim[5] = 22'h042a7a;
    stim[6] = 22'h0ef796;
    stim[7] = 22'h1340de;
    stim[8] = 22'h165496;
    stim[9] = 22'h17ae59;
    stim[10] = 22'h19152c;
    stim[11] = 22'h19b659;
    stim[12] = 22'h00775e;
    stim[13] = 22'h0c94d8;
    stim[14] = 22'h08e0fe;
    stim[15] = 22'h0dd731;
    stim[16] = 22'h032bfb;
    stim[17] = 22'h1bb9b3;
    stim[18] = 22'h18437d;
    stim[19] = 22'h07fa76;
    stim[20] = 22'h0a6347;
    stim[21] = 22'h1cba51;
    stim[22] = 22'h131a8d;
    stim[23] = 22'h15a845;
    stim[24] = 22'h0f1925;
    stim[25] = 22'h03a055;
    stim[26] = 22'h2a5ed7;
    stim[27] = 22'h1bbc42;
    stim[28] = 22'h036353;
    stim[29] = 22'h1570db;
    stim[30] = 22'h0cb7f0;
    stim[31] = 22'h142398;
    stim[32] = 22'h0cbc68;
    stim[33] = 22'h06225e;
    stim[34] = 22'h0d4c84;
    stim[35] = 22'h0c1d16;
    stim[36] = 22'h0ba60c;
    stim[37] = 22'h1795ab;
    stim[38] = 22'h0eff6b;
    stim[39] = 22'h0bf6d6;
    stim[40] = 22'h0f7628;
    stim[41] = 22'h1a8b61;
    stim[42] = 22'h1ebeac;
    stim[43] = 22'h1ee11d;
    stim[44] = 22'h15951c;
    stim[45] = 22'h1c4aeb;
    stim[46] = 22'h1fee7e;
    stim[47] = 22'h02e6fa;
    stim[48] = 22'h18f365;
    stim[49] = 22'h1eb1bd;
    stim[50] = 22'h0f8a26;
    stim[51] = 22'h012457;
    stim[52] = 22'h1f7b56;
    stim[53] = 22'h1103e3;
    stim[54] = 22'h0ed418;
    stim[55] = 22'h15f1fc;
    stim[56] = 22'h065560;
    stim[57] = 22'h10aad6;
    stim[58] = 22'h17abb3;
    stim[59] = 22'h1dc889;
    stim[60] = 22'h020d32;
    stim[61] = 22'h0488b2;
    stim[62] = 22'h094cea;
    stim[63] = 22'h12bc3f;
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
      expv[0] = 68'h00000000000000000;
      expv[1] = 68'h00000000000000000;
      expv[2] = 68'h00000000000000000;
      expv[3] = 68'h00000000000000000;
      expv[4] = 68'h00000000000000000;
      expv[5] = 68'h00000000000632820;
      expv[6] = 68'h6328200000045bdb0;
      expv[7] = 68'h63282116f6c072d21;
      expv[8] = 68'h63282116f6ca9ebbc;
      expv[9] = 68'ha9ebbd16f6c797340;
      expv[10] = 68'ha9ebbde5cd037d953;
      expv[11] = 68'ha9ebbde5cd02ef5ca;
      expv[12] = 68'h2ef5c9e5cd0cc8a96;
      expv[13] = 68'h2ef5cb322a5b36cb0;
      expv[14] = 68'h2ef5cb322a5b36cb1;
      expv[15] = 68'h2ef5cb322a50775ec;
      expv[16] = 68'h0775ef322a5253622;
      expv[17] = 68'h0775ec94d88e0fedc;
      expv[18] = 68'he0fedc94d885cc0ca;
      expv[19] = 68'he0fedd73032bfbbb8;
      expv[20] = 68'hbfbbb9730326ce10c;
      expv[21] = 68'hbfbbb9b38437c7fa7;
      expv[22] = 68'hbfbbb9b3843b531a2;
      expv[23] = 68'hb531a1b3843f974a0;
      expv[24] = 68'hb531a3e5d28000000;
      expv[25] = 68'hb531a3e5d2898d46b;
      expv[26] = 68'h00000000000000000;
      expv[27] = 68'h00000000000000000;
      expv[28] = 68'h00000000000000000;
      expv[29] = 68'h00000000000000000;
      expv[30] = 68'h00000000000dde210;
      expv[31] = 68'hdde210000006c6a6a;
      expv[32] = 68'hdde211b1a9ab86d65;
      expv[33] = 68'hdde211b1a9adfc508;
      expv[34] = 68'hdfc509b1a9a398cbc;
      expv[35] = 68'hdfc508e632f1a1889;
      expv[36] = 68'hdfc508e632fbda990;
      expv[37] = 68'hbda990e632f260e8a;
      expv[38] = 68'hbda990983a2d74c18;
      expv[39] = 68'hbda990983a2d74c1b;
      expv[40] = 68'hbda990983a2795aae;
      expv[41] = 68'h795aac983a2bfdaae;
      expv[42] = 68'h795aaeff6abf6d6f7;
      expv[43] = 68'h795aaeff6abb14d44;
      expv[44] = 68'hb14d46ff6ab6c3d7c;
      expv[45] = 68'hb14d45b0f5f56f709;
      expv[46] = 68'hb14d45b0f5f756546;
      expv[47] = 68'h756545b0f5fdc4aea;
      expv[48] = 68'h756547712ba000000;
      expv[49] = 68'h756547712baffb9f9;
      expv[50] = 68'h756547712ba5cdf70;
      expv[51] = 68'h5cdf73712ba79b2f4;
      expv[52] = 68'h5cdf71e6cbd6379f1;
      expv[53] = 68'h5cdf71e6cbda26124;
      expv[54] = 68'ha26125e6cbd15fdec;
      expv[55] = 68'ha2612457f7b57103f;
      expv[56] = 68'ha2612457f7b176a0c;
      expv[57] = 68'h176a0c57f7b2be3f8;
      expv[58] = 68'h176a0caf8fe000000;
      expv[59] = 68'h176a0caf8fe32ab09;
      expv[60] = 68'h176a0caf8fe2ab5de;
      expv[61] = 68'h2ab5dcaf8feabb3dc;
      expv[62] = 68'h2ab5deaecf7222083;
      expv[63] = 68'h2ab5deaecf7a64910;
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
