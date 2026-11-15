// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 48;
  localparam OW = 79;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_00816 dut (
    .clk_i(clk),
    .reset_i(in_vec[47:47]),
    .A_i(in_vec[46:43]),
    .D_i(in_vec[42:35]),
    .rd_i(in_vec[34:34]),
    .wr_i(in_vec[33:33]),
    .dat_i(in_vec[32:1]),
    .ack_i(in_vec[0:0]),
    .D_o(out_vec[78:71]),
    .adr_o(out_vec[70:39]),
    .dat_o(out_vec[38:7]),
    .we_o(out_vec[6:6]),
    .sel_o(out_vec[5:2]),
    .stb_o(out_vec[1:1]),
    .cyc_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 48'hc728774a55f8;
    stim[1] = 48'h8a1e284e73c1;
    stim[2] = 48'h233cc57994df;
    stim[3] = 48'h08ad256c2054;
    stim[4] = 48'h043c8d7c99a2;
    stim[5] = 48'h4b2050d6221a;
    stim[6] = 48'h19d43a74b64f;
    stim[7] = 48'h7d1c6177c854;
    stim[8] = 48'h2add00de8e76;
    stim[9] = 48'h3beef3f2883f;
    stim[10] = 48'h0ef7dbadd5ad;
    stim[11] = 48'h4a016c570229;
    stim[12] = 48'h73305cde79ed;
    stim[13] = 48'h2fe0000e0682;
    stim[14] = 48'h7b9ebee7d3b2;
    stim[15] = 48'h531a31faca7f;
    stim[16] = 48'h2e3855530953;
    stim[17] = 48'h38f6ef85a403;
    stim[18] = 48'h536c323b352a;
    stim[19] = 48'h65ea44188ca2;
    stim[20] = 48'h25e608c02c05;
    stim[21] = 48'h53d4a4a178f7;
    stim[22] = 48'h48e2af1a84e1;
    stim[23] = 48'h6c6108e90886;
    stim[24] = 48'h726b5d009298;
    stim[25] = 48'h03c0f96cc367;
    stim[26] = 48'h6da86c059853;
    stim[27] = 48'h3af6bc645263;
    stim[28] = 48'h26ae7757a688;
    stim[29] = 48'h53a3c2ee029c;
    stim[30] = 48'h2029441d8403;
    stim[31] = 48'h1fba35dc0ba0;
    stim[32] = 48'h349acd576fa9;
    stim[33] = 48'h1f39c90497a6;
    stim[34] = 48'h45464eba925b;
    stim[35] = 48'h314feff242e4;
    stim[36] = 48'h1bdc93a90b2a;
    stim[37] = 48'h7fc558e8c11b;
    stim[38] = 48'h4e57972f8c1d;
    stim[39] = 48'h1138610cbd58;
    stim[40] = 48'h16449f437d22;
    stim[41] = 48'h162100a72f71;
    stim[42] = 48'h0a787141a35b;
    stim[43] = 48'h64917d03de51;
    stim[44] = 48'h5b351f05097f;
    stim[45] = 48'h2a53820f49ce;
    stim[46] = 48'h3ee063879a11;
    stim[47] = 48'h55a9aa94fa98;
    stim[48] = 48'h3e0c999430e5;
    stim[49] = 48'h42c086eb8e93;
    stim[50] = 48'h129e7ded85f2;
    stim[51] = 48'h4a6700ae8254;
    stim[52] = 48'h4aace63da676;
    stim[53] = 48'h488efa531e83;
    stim[54] = 48'h5bdedf56cddc;
    stim[55] = 48'h25599b59f8dc;
    stim[56] = 48'h5444e9960de1;
    stim[57] = 48'h04d4b944210c;
    stim[58] = 48'h32b291d8313b;
    stim[59] = 48'ha839f382377c;
    stim[60] = 48'h1006caa5150b;
    stim[61] = 48'h43a471b57ff5;
    stim[62] = 48'h35a17e3aec09;
    stim[63] = 48'h25feb743a40d;
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
      expv[0] = 79'hxxx00000000000000000;
      expv[1] = 79'hxxx00000000000000000;
      expv[2] = 79'hxxx00000000000000000;
      expv[3] = 79'hxxx00000338000000000;
      expv[4] = 79'hxxx00000338000000000;
      expv[5] = 79'hxxx00000338000000000;
      expv[6] = 79'hxxx00000338000000000;
      expv[7] = 79'hxxx00000338000000000;
      expv[8] = 79'h00000000338000000000;
      expv[9] = 79'h00000000338000000000;
      expv[10] = 79'h00000000338000000000;
      expv[11] = 79'h000000003380006f0000;
      expv[12] = 79'h000000003380006f0000;
      expv[13] = 79'h000000003380006f0000;
      expv[14] = 79'h000000003380006f0000;
      expv[15] = 79'h000000003380006f0000;
      expv[16] = 79'h000000003380006f0000;
      expv[17] = 79'h000000003380006f0000;
      expv[18] = 79'h000000003380006f0000;
      expv[19] = 79'h000000003380006f0000;
      expv[20] = 79'h000000003380006f0000;
      expv[21] = 79'h000000005e00006f0000;
      expv[22] = 79'h000000005e00006f0000;
      expv[23] = 79'h000000005e00006f0000;
      expv[24] = 79'h000000005e00006f000f;
      expv[25] = 79'h000000005e00006f000f;
      expv[26] = 79'h000000005e00006f3c0f;
      expv[27] = 79'h000000005e00006f3c0c;
      expv[28] = 79'h000000005e00006f3c0c;
      expv[29] = 79'h000000006a80006f3c0c;
      expv[30] = 79'h000000006a80006f3c0c;
      expv[31] = 79'h000000006a80006f3c0c;
      expv[32] = 79'h000000006a80006f3c0c;
      expv[33] = 79'h000049806a80006f3c0c;
      expv[34] = 79'h000049806a80006f3c0c;
      expv[35] = 79'h000049806a80006f3c0c;
      expv[36] = 79'h000014806a80006f3c0c;
      expv[37] = 79'h000014806a80006f3c0c;
      expv[38] = 79'h000014806a80006f3c0c;
      expv[39] = 79'h000014806a80006f3c0c;
      expv[40] = 79'h000014806a8013ef3c0c;
      expv[41] = 79'h000014806a8013ef3c0c;
      expv[42] = 79'h4b8014806a8013ef3c0c;
      expv[43] = 79'h4b8014806a8013ef3c0c;
      expv[44] = 79'h4b8014806a8013ef3c0c;
      expv[45] = 79'h4b8014806a8013ef3c0c;
      expv[46] = 79'h000014806a8013ef3c0c;
      expv[47] = 79'h006e14806a8013ef3c0c;
      expv[48] = 79'h006e14806a8013ef3c0c;
      expv[49] = 79'h006e14806a8013ef3c0c;
      expv[50] = 79'h066e14806a8013ef3c0c;
      expv[51] = 79'h066e14806a8013ef3c0c;
      expv[52] = 79'h066e14806a8013ef3c0c;
      expv[53] = 79'h066e14806a8013ef3c0c;
      expv[54] = 79'h066e14806a8013ef3c0c;
      expv[55] = 79'h066e14806a8013ef3c0c;
      expv[56] = 79'h066e14806a8013ef3c0c;
      expv[57] = 79'h066e14806a8013ef3c0c;
      expv[58] = 79'h786e14806a8013ef3c0c;
      expv[59] = 79'h78000000000000000000;
      expv[60] = 79'h78000000000000000000;
      expv[61] = 79'h78000000000000000000;
      expv[62] = 79'h78000000000000000000;
      expv[63] = 79'h78000000000000000000;
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
