// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 39;
  localparam OW = 28;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  vga_linear dut (
    .clk(clk),
    .rst(in_vec[38:38]),
    .csr_dat_i(in_vec[37:22]),
    .h_count(in_vec[21:12]),
    .v_count(in_vec[11:2]),
    .horiz_sync_i(in_vec[1:1]),
    .video_on_h_i(in_vec[0:0]),
    .csr_adr_o(out_vec[27:11]),
    .csr_stb_o(out_vec[10:10]),
    .video_on_h_o(out_vec[9:9]),
    .color(out_vec[8:1]),
    .horiz_sync_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 39'h7658fe6000;
    stim[1] = 39'h706f4f851c;
    stim[2] = 39'h1ec7c492a5;
    stim[3] = 39'h0b6069acb2;
    stim[4] = 39'h0a9ba8c4fb;
    stim[5] = 39'h2ba31ad8cf;
    stim[6] = 39'h2b03544463;
    stim[7] = 39'h3ad3da8fd3;
    stim[8] = 39'h2f4bf05ceb;
    stim[9] = 39'h09373f04fd;
    stim[10] = 39'h16b18c2e89;
    stim[11] = 39'h38bda85a5a;
    stim[12] = 39'h062442062c;
    stim[13] = 39'h05298d6203;
    stim[14] = 39'h3f607a7923;
    stim[15] = 39'h04aa919605;
    stim[16] = 39'h3dce5bf320;
    stim[17] = 39'h0a1ec8c496;
    stim[18] = 39'h04cc161007;
    stim[19] = 39'h19047c5723;
    stim[20] = 39'h32bf394ecf;
    stim[21] = 39'h3d5541a433;
    stim[22] = 39'h3974273761;
    stim[23] = 39'h1534dd2327;
    stim[24] = 39'h14c04d1e0c;
    stim[25] = 39'h3af85a836d;
    stim[26] = 39'h3d0634fa15;
    stim[27] = 39'h177962389b;
    stim[28] = 39'h0f4693f19b;
    stim[29] = 39'h2814f2c807;
    stim[30] = 39'h2fa5a54912;
    stim[31] = 39'h2b49a689e2;
    stim[32] = 39'h2295395562;
    stim[33] = 39'h1b3191a1fe;
    stim[34] = 39'h0e4d2e3d95;
    stim[35] = 39'h23aedae88a;
    stim[36] = 39'h2110440058;
    stim[37] = 39'h1572b2f039;
    stim[38] = 39'h060dab7542;
    stim[39] = 39'h0b9c6e54f1;
    stim[40] = 39'h2a7b2a057a;
    stim[41] = 39'h11717ae25a;
    stim[42] = 39'h067d507a0c;
    stim[43] = 39'h227f7a58f1;
    stim[44] = 39'h1f3e0eef04;
    stim[45] = 39'h15e2bb0e04;
    stim[46] = 39'h22fab8b151;
    stim[47] = 39'h25704bcf92;
    stim[48] = 39'h0dbd3c872e;
    stim[49] = 39'h00a78c6f89;
    stim[50] = 39'h3db76425d6;
    stim[51] = 39'h10a29b8c61;
    stim[52] = 39'h0c81179efb;
    stim[53] = 39'h39eeb41e34;
    stim[54] = 39'h08e1d9eb64;
    stim[55] = 39'h2f277dc567;
    stim[56] = 39'h05aad60c64;
    stim[57] = 39'h3731ee2d5b;
    stim[58] = 39'h3772bf66b0;
    stim[59] = 39'h16af5daa9b;
    stim[60] = 39'h197992d76d;
    stim[61] = 39'h153da6cf80;
    stim[62] = 39'h08830a637c;
    stim[63] = 39'h24d4213822;
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
      expv[0] = 28'hxxxxxxx;
      expv[1] = 28'h0000000;
      expv[2] = 28'h0000000;
      expv[3] = 28'h0000000;
      expv[4] = 28'h6924000;
      expv[5] = 28'hbccd400;
      expv[6] = 28'hc806400;
      expv[7] = 28'h2016200;
      expv[8] = 28'hafa245f;
      expv[9] = 28'h39547b9;
      expv[10] = 28'hc5c23b9;
      expv[11] = 28'hc8b87ed;
      expv[12] = 28'h05a1723;
      expv[13] = 28'h5f02323;
      expv[14] = 28'hf650702;
      expv[15] = 28'h506b754;
      expv[16] = 28'h2ed3155;
      expv[17] = 28'hf08c0f6;
      expv[18] = 28'h7ddf261;
      expv[19] = 28'hb6c6661;
      expv[20] = 28'h00b0260;
      expv[21] = 28'h1ee2060;
      expv[22] = 28'h110a5a1;
      expv[23] = 28'ha78d7a1;
      expv[24] = 28'h28393a1;
      expv[25] = 28'h7de97c3;
      expv[26] = 28'hf1a8231;
      expv[27] = 28'h8914630;
      expv[28] = 28'h5427235;
      expv[29] = 28'h18d1034;
      expv[30] = 28'h405f32c;
      expv[31] = 28'h019672c;
      expv[32] = 28'h2baa72d;
      expv[33] = 28'h4c3472d;
      expv[34] = 28'hd8ca269;
      expv[35] = 28'h4f4d577;
      expv[36] = 28'hdff1083;
      expv[37] = 28'h1617483;
      expv[38] = 28'h0de046d;
      expv[39] = 28'h0a5726c;
      expv[40] = 28'hd35b1d9;
      expv[41] = 28'hc6f218a;
      expv[42] = 28'hdc1078a;
      expv[43] = 28'h5f9758b;
      expv[44] = 28'h51c338a;
      expv[45] = 28'h2752115;
      expv[46] = 28'h18775d5;
      expv[47] = 28'hf1d85d4;
      expv[48] = 28'h36453d4;
      expv[49] = 28'h2ede53c;
      expv[50] = 28'h20245ba;
      expv[51] = 28'h2da37ba;
      expv[52] = 28'he9a1409;
      expv[53] = 28'hafdc575;
      expv[54] = 28'h177c30e;
      expv[55] = 28'hf92013b;
      expv[56] = 28'h87cf756;
      expv[57] = 28'hd8ee757;
      expv[58] = 28'hafb0556;
      expv[59] = 28'hd73157a;
      expv[60] = 28'h0d7b7cd;
      expv[61] = 28'h68ad5ec;
      expv[62] = 28'h28d6219;
      expv[63] = 28'h2d364a0;
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
