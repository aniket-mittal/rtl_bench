// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 45;
  localparam OW = 24;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  vga_planar_fml dut (
    .clk(clk),
    .rst(in_vec[44:44]),
    .enable(in_vec[43:43]),
    .fml_dat_i(in_vec[42:27]),
    .attr_plane_enable(in_vec[26:23]),
    .x_dotclockdiv2(in_vec[22:22]),
    .h_count(in_vec[21:12]),
    .v_count(in_vec[11:2]),
    .horiz_sync_i(in_vec[1:1]),
    .video_on_h_i(in_vec[0:0]),
    .fml_adr_o(out_vec[23:7]),
    .fml_stb_o(out_vec[6:6]),
    .video_on_h_o(out_vec[5:5]),
    .attr(out_vec[4:1]),
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
    stim[0] = 45'h1a88b69b1f8c;
    stim[1] = 45'h1753d4dbbf3e;
    stim[2] = 45'h01773553c40b;
    stim[3] = 45'h0c704c1d5e03;
    stim[4] = 45'h03a57129cecc;
    stim[5] = 45'h071926a48afb;
    stim[6] = 45'h02633a553db9;
    stim[7] = 45'h065eead56150;
    stim[8] = 45'h0dd0a44b236d;
    stim[9] = 45'h0215496b25c5;
    stim[10] = 45'h0609d5e2adce;
    stim[11] = 45'h05caa4ea5d5d;
    stim[12] = 45'h0856196c1777;
    stim[13] = 45'h0b58666b9ee4;
    stim[14] = 45'h03b771388eb7;
    stim[15] = 45'h018f50b23cbd;
    stim[16] = 45'h058e2575a394;
    stim[17] = 45'h066626ba025f;
    stim[18] = 45'h021a4b0da8b3;
    stim[19] = 45'h01f0618d7a2d;
    stim[20] = 45'h0ed8868d7a6c;
    stim[21] = 45'h027d52d9a799;
    stim[22] = 45'h0d23713c0430;
    stim[23] = 45'h05fdcd28e83b;
    stim[24] = 45'h04b1d30e15db;
    stim[25] = 45'h0662b901dedd;
    stim[26] = 45'h0802705518d1;
    stim[27] = 45'h0bb38cdcb38a;
    stim[28] = 45'h07eadb810996;
    stim[29] = 45'h04a8f33d3bc0;
    stim[30] = 45'h07fa911dcdcc;
    stim[31] = 45'h05421ba9bf33;
    stim[32] = 45'h1876b3237910;
    stim[33] = 45'h072f462ee79f;
    stim[34] = 45'h0dbb607e20a2;
    stim[35] = 45'h03910e68a7c1;
    stim[36] = 45'h01bdd969a381;
    stim[37] = 45'h06bcfee8cefd;
    stim[38] = 45'h0925d0699d3d;
    stim[39] = 45'h061c827cd98d;
    stim[40] = 45'h05fb77954959;
    stim[41] = 45'h0a438f54a5e0;
    stim[42] = 45'h028ae1756f85;
    stim[43] = 45'h09d823ae9a70;
    stim[44] = 45'h0a7060dc2846;
    stim[45] = 45'h03300232ea7a;
    stim[46] = 45'h0c31c299f97a;
    stim[47] = 45'h00a1c7dea970;
    stim[48] = 45'h010a40bcbc81;
    stim[49] = 45'h0d9dbba0f174;
    stim[50] = 45'h035e0e956adb;
    stim[51] = 45'h03c1c440c19b;
    stim[52] = 45'h0b0c8d4d84ea;
    stim[53] = 45'h06dfa1a743f6;
    stim[54] = 45'h012549d7c604;
    stim[55] = 45'h02b09fc63efe;
    stim[56] = 45'h0949d29bf320;
    stim[57] = 45'h0caa5a666e34;
    stim[58] = 45'h09a00e8c865a;
    stim[59] = 45'h0961bc7a3a17;
    stim[60] = 45'h0509b10a431e;
    stim[61] = 45'h0ce950877639;
    stim[62] = 45'h0592a1653100;
    stim[63] = 45'h034500bc37e8;
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
      expv[0] = 24'hxxxxxx;
      expv[1] = 24'h000000;
      expv[2] = 24'h000000;
      expv[3] = 24'h000000;
      expv[4] = 24'h000000;
      expv[5] = 24'h000000;
      expv[6] = 24'h000000;
      expv[7] = 24'h000000;
      expv[8] = 24'h000000;
      expv[9] = 24'h063a80;
      expv[10] = 24'h063a80;
      expv[11] = 24'h063a80;
      expv[12] = 24'h063a80;
      expv[13] = 24'h12c700;
      expv[14] = 24'h291480;
      expv[15] = 24'h291480;
      expv[16] = 24'h291480;
      expv[17] = 24'h291480;
      expv[18] = 24'h291480;
      expv[19] = 24'h291480;
      expv[20] = 24'h291480;
      expv[21] = 24'h476a80;
      expv[22] = 24'h476a80;
      expv[23] = 24'hd08b80;
      expv[24] = 24'hd08b80;
      expv[25] = 24'hd08b80;
      expv[26] = 24'hd08b80;
      expv[27] = 24'h156840;
      expv[28] = 24'h308cc0;
      expv[29] = 24'h308cc0;
      expv[30] = 24'h308cc0;
      expv[31] = 24'h308cc0;
      expv[32] = 24'h308cc0;
      expv[33] = 24'h000000;
      expv[34] = 24'h000000;
      expv[35] = 24'h000000;
      expv[36] = 24'h000000;
      expv[37] = 24'h000000;
      expv[38] = 24'h000000;
      expv[39] = 24'h03af00;
      expv[40] = 24'h03af00;
      expv[41] = 24'h03af00;
      expv[42] = 24'h08dc80;
      expv[43] = 24'h08dc80;
      expv[44] = 24'h815500;
      expv[45] = 24'h348c80;
      expv[46] = 24'h348c80;
      expv[47] = 24'hb59d00;
      expv[48] = 24'hb59d00;
      expv[49] = 24'hb59d00;
      expv[50] = 24'hbd9380;
      expv[51] = 24'hbd9380;
      expv[52] = 24'hbd9380;
      expv[53] = 24'h078580;
      expv[54] = 24'h078580;
      expv[55] = 24'h078580;
      expv[56] = 24'h078580;
      expv[57] = 24'h6bfc00;
      expv[58] = 24'h0fd781;
      expv[59] = 24'h384720;
      expv[60] = 24'h1fd000;
      expv[61] = 24'h1fd000;
      expv[62] = 24'hdd9b80;
      expv[63] = 24'hdd9b80;
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
