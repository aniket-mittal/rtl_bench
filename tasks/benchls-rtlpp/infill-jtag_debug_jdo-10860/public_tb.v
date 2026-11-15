// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 42;
  localparam OW = 48;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_10860 dut (
    .clk(clk),
    .ir_in(in_vec[41:40]),
    .sr(in_vec[39:2]),
    .vs_udr(in_vec[1:1]),
    .vs_uir(in_vec[0:0]),
    .jdo(out_vec[47:10]),
    .take_action_break_a(out_vec[9:9]),
    .take_action_break_b(out_vec[8:8]),
    .take_action_break_c(out_vec[7:7]),
    .take_action_ocimem_a(out_vec[6:6]),
    .take_action_ocimem_b(out_vec[5:5]),
    .take_action_tracectrl(out_vec[4:4]),
    .take_no_action_break_a(out_vec[3:3]),
    .take_no_action_break_b(out_vec[2:2]),
    .take_no_action_break_c(out_vec[1:1]),
    .take_no_action_ocimem_a(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 42'h0f88f0b9313;
    stim[1] = 42'h061d8ba22a0;
    stim[2] = 42'h0e8fd2eda4a;
    stim[3] = 42'h096220deca9;
    stim[4] = 42'h202646eb400;
    stim[5] = 42'h17c8ea070e6;
    stim[6] = 42'h1498345247d;
    stim[7] = 42'h01c75f44267;
    stim[8] = 42'h14b0e9f8854;
    stim[9] = 42'h2a6e32e5dff;
    stim[10] = 42'h0e8995efb5c;
    stim[11] = 42'h39c11f57e1f;
    stim[12] = 42'h1b03a052ab2;
    stim[13] = 42'h2a7fbf34070;
    stim[14] = 42'h28fc9b7629e;
    stim[15] = 42'h34839424381;
    stim[16] = 42'h1b5f08b47de;
    stim[17] = 42'h0e42f9b6ee9;
    stim[18] = 42'h02e0c8b2b21;
    stim[19] = 42'h06ccaf9d60a;
    stim[20] = 42'h12afec4774a;
    stim[21] = 42'h04a98843b17;
    stim[22] = 42'h30fea2668eb;
    stim[23] = 42'h367c126b801;
    stim[24] = 42'h1ce42905fee;
    stim[25] = 42'h2b649fad22f;
    stim[26] = 42'h2a18d11e4d9;
    stim[27] = 42'h251f430ab38;
    stim[28] = 42'h1be69a22bde;
    stim[29] = 42'h3c37ce45173;
    stim[30] = 42'h1ce82ee7f3f;
    stim[31] = 42'h18568c9ddc8;
    stim[32] = 42'h1f80e75e983;
    stim[33] = 42'h24c8fee4b77;
    stim[34] = 42'h23016de23d0;
    stim[35] = 42'h04e8b343025;
    stim[36] = 42'h376a8382f87;
    stim[37] = 42'h199259fda04;
    stim[38] = 42'h2c1364346f0;
    stim[39] = 42'h274c6b9fdda;
    stim[40] = 42'h12aca6dc3f1;
    stim[41] = 42'h1aac2cc9c63;
    stim[42] = 42'h001437b030b;
    stim[43] = 42'h3ebabbe8a3b;
    stim[44] = 42'h278df40e55e;
    stim[45] = 42'h107a3db3cac;
    stim[46] = 42'h0bb87afe53e;
    stim[47] = 42'h0cf241bebdd;
    stim[48] = 42'h1ffbc2eb4f0;
    stim[49] = 42'h00e59da005d;
    stim[50] = 42'h25c2376eab4;
    stim[51] = 42'h1f67d1013ab;
    stim[52] = 42'h37c92d76deb;
    stim[53] = 42'h3b8d19abe61;
    stim[54] = 42'h353672402cd;
    stim[55] = 42'h1bd2510e14c;
    stim[56] = 42'h3a2a7f5dac2;
    stim[57] = 42'h0e1c78d9259;
    stim[58] = 42'h31a9b3014a0;
    stim[59] = 42'h3ba16ab4ac1;
    stim[60] = 42'h21810d15b92;
    stim[61] = 42'h252df333654;
    stim[62] = 42'h361cec1188b;
    stim[63] = 42'h25d663245be;
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
      expv[0] = 48'hxxxxxxxxxxxx;
      expv[1] = 48'hxxxxxxxxxxxx;
      expv[2] = 48'hxxxxxxxxxxxx;
      expv[3] = 48'hxxxxxxxxxxxx;
      expv[4] = 48'hxxxxxxxxxxxx;
      expv[5] = 48'hxxxxxxxxxx00;
      expv[6] = 48'h7c8ea070e4xx;
      expv[7] = 48'h7c8ea070e400;
      expv[8] = 48'h7c8ea070e400;
      expv[9] = 48'h4b0e9f885400;
      expv[10] = 48'h4b0e9f885400;
      expv[11] = 48'he8995efb5c80;
      expv[12] = 48'he8995efb5c00;
      expv[13] = 48'hb03a052ab000;
      expv[14] = 48'hb03a052ab000;
      expv[15] = 48'h8fc9b7629e00;
      expv[16] = 48'h8fc9b7629c00;
      expv[17] = 48'h8fc9b7629c00;
      expv[18] = 48'he42f9b6ee880;
      expv[19] = 48'he42f9b6ee800;
      expv[20] = 48'h6ccaf9d60820;
      expv[21] = 48'h6ccaf9d60800;
      expv[22] = 48'h6ccaf9d60800;
      expv[23] = 48'h0fea2668e800;
      expv[24] = 48'h0fea2668e800;
      expv[25] = 48'h0fea2668e800;
      expv[26] = 48'h0fea2668e800;
      expv[27] = 48'h0fea2668e800;
      expv[28] = 48'h51f430ab3800;
      expv[29] = 48'h51f430ab3800;
      expv[30] = 48'h51f430ab3800;
      expv[31] = 48'h51f430ab3800;
      expv[32] = 48'h8568c9ddc800;
      expv[33] = 48'h8568c9ddc800;
      expv[34] = 48'h8568c9ddc800;
      expv[35] = 48'h8568c9ddc800;
      expv[36] = 48'h4e8b34302401;
      expv[37] = 48'h4e8b34302400;
      expv[38] = 48'h4e8b34302400;
      expv[39] = 48'h4e8b34302400;
      expv[40] = 48'h74c6b9fdd802;
      expv[41] = 48'h74c6b9fdd800;
      expv[42] = 48'h74c6b9fdd800;
      expv[43] = 48'h01437b030808;
      expv[44] = 48'h01437b030800;
      expv[45] = 48'h78df40e55c00;
      expv[46] = 48'h78df40e55c00;
      expv[47] = 48'h78df40e55c00;
      expv[48] = 48'h78df40e55c00;
      expv[49] = 48'h78df40e55c00;
      expv[50] = 48'h0e59da005c10;
      expv[51] = 48'h0e59da005c00;
      expv[52] = 48'h0e59da005c00;
      expv[53] = 48'h0e59da005c00;
      expv[54] = 48'h0e59da005c00;
      expv[55] = 48'h53672402cc00;
      expv[56] = 48'h53672402cc00;
      expv[57] = 48'h53672402cc00;
      expv[58] = 48'h53672402cc00;
      expv[59] = 48'h53672402cc00;
      expv[60] = 48'hba16ab4ac010;
      expv[61] = 48'hba16ab4ac000;
      expv[62] = 48'hba16ab4ac000;
      expv[63] = 48'hba16ab4ac000;
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
