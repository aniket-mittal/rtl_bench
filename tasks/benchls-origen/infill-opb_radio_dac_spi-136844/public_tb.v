// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 72;
  localparam OW = 60;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_136844 dut (
    .OPB_Clk(clk),
    .rst(in_vec[71:71]),
    .opb_abus(in_vec[70:39]),
    .opb_be(in_vec[38:35]),
    .opb_dbus(in_vec[34:3]),
    .opb_rnw(in_vec[2:2]),
    .opb_select(in_vec[1:1]),
    .opb_seqaddr(in_vec[0:0]),
    .sl_dbus(out_vec[59:28]),
    .sl_errack(out_vec[27:27]),
    .sl_retry(out_vec[26:26]),
    .sl_toutsup(out_vec[25:25]),
    .sl_xferack(out_vec[24:24]),
    .radio1_sclk(out_vec[23:23]),
    .radio1_dout(out_vec[22:22]),
    .radio1_cs(out_vec[21:21]),
    .radio2_sclk(out_vec[20:20]),
    .radio2_dout(out_vec[19:19]),
    .radio2_cs(out_vec[18:18]),
    .radio3_sclk(out_vec[17:17]),
    .radio3_dout(out_vec[16:16]),
    .radio3_cs(out_vec[15:15]),
    .radio4_sclk(out_vec[14:14]),
    .radio4_dout(out_vec[13:13]),
    .radio4_cs(out_vec[12:12]),
    .dac1_sclk(out_vec[11:11]),
    .dac1_dout(out_vec[10:10]),
    .dac1_cs(out_vec[9:9]),
    .dac2_sclk(out_vec[8:8]),
    .dac2_dout(out_vec[7:7]),
    .dac2_cs(out_vec[6:6]),
    .dac3_sclk(out_vec[5:5]),
    .dac3_dout(out_vec[4:4]),
    .dac3_cs(out_vec[3:3]),
    .dac4_sclk(out_vec[2:2]),
    .dac4_dout(out_vec[1:1]),
    .dac4_cs(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 72'had05376bc1e5801d26;
    stim[1] = 72'h944e34ec79bf52a594;
    stim[2] = 72'h2bba79d11bd1c5e490;
    stim[3] = 72'h62e23da25a193a97dd;
    stim[4] = 72'h3cb6aa670994b1de12;
    stim[5] = 72'h19aa73ef6e851e02cc;
    stim[6] = 72'h1b67fae4b95344aca0;
    stim[7] = 72'h3646fa1081eb23b42a;
    stim[8] = 72'h3f9cf1a96af11ac940;
    stim[9] = 72'h2ceaa8d7cb6037e263;
    stim[10] = 72'h61f0f1a20d006bc5f7;
    stim[11] = 72'h116ca6d1c7859039eb;
    stim[12] = 72'h364c039c33a059e865;
    stim[13] = 72'h190bdeeaab7c391012;
    stim[14] = 72'h5285f4b7b6f2bcc89f;
    stim[15] = 72'h6ae6e98e88e67ae405;
    stim[16] = 72'h52d6906599d922e884;
    stim[17] = 72'h759c0b936985ae9dfd;
    stim[18] = 72'h3b7b0334c7a6508844;
    stim[19] = 72'h30f1d20b3ef701b379;
    stim[20] = 72'h118b9f1e1c4a81adae;
    stim[21] = 72'h7163616f0ce66fcc9b;
    stim[22] = 72'h76ed7a1e3273f4c3a2;
    stim[23] = 72'h741efffdf40fd3c1ee;
    stim[24] = 72'h10cbd647ec816a3a25;
    stim[25] = 72'h101d6aab1df8cb23df;
    stim[26] = 72'h4a84e622a3505726be;
    stim[27] = 72'h64f5014315d0ab3e96;
    stim[28] = 72'h7c157ecf4ea7628a57;
    stim[29] = 72'h73b279b8b2e8838900;
    stim[30] = 72'h6417f71c86e14e7b74;
    stim[31] = 72'h13295403ce2e846e7c;
    stim[32] = 72'h71d9fe83d19bf401d0;
    stim[33] = 72'h5e608fe47f7d730ca4;
    stim[34] = 72'hf22960327231d16301;
    stim[35] = 72'hbbebd507a07c9dbff9;
    stim[36] = 72'h54e144e7784a9af723;
    stim[37] = 72'h329c70174dc24335e5;
    stim[38] = 72'h2edb2ba9ced9d0ada0;
    stim[39] = 72'h50ead4a7a8840857aa;
    stim[40] = 72'h4e2d96de21aa912156;
    stim[41] = 72'h1315d926177d577fa9;
    stim[42] = 72'h50503f68ef4026c0cf;
    stim[43] = 72'h7b3673590dd04865d1;
    stim[44] = 72'h6b7f7b5725eb210940;
    stim[45] = 72'h37c480aca9f88b6ed6;
    stim[46] = 72'h6dae5a407dbda661ff;
    stim[47] = 72'h656e080e413f10bb3a;
    stim[48] = 72'h00bdd7ec1c9f172611;
    stim[49] = 72'hdab842a1d1d555f831;
    stim[50] = 72'h5cd1a5376b72a788cb;
    stim[51] = 72'h465408e5f6cda10bd1;
    stim[52] = 72'h3fc98c5c206a23f39b;
    stim[53] = 72'h60d49001f76ade3919;
    stim[54] = 72'h7bfe97055dd28888df;
    stim[55] = 72'h01a30b6cc88ed4a07e;
    stim[56] = 72'h60d1ce501b244814c5;
    stim[57] = 72'h66e3ff1ef8e07a2cb1;
    stim[58] = 72'h5e8c337f636f66d7a2;
    stim[59] = 72'h0198743003961d6936;
    stim[60] = 72'h6220cabe44fee2b69c;
    stim[61] = 72'h5b91f9e5bc67a75bee;
    stim[62] = 72'h04812b4e315fab8f16;
    stim[63] = 72'h0a08c10b79b33c2207;
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
      expv[0] = 60'h000000000249249;
      expv[1] = 60'h000000000249249;
      expv[2] = 60'h000000000249249;
      expv[3] = 60'h000000000249249;
      expv[4] = 60'h000000000249249;
      expv[5] = 60'h000000000249249;
      expv[6] = 60'h000000001249249;
      expv[7] = 60'h000000000249249;
      expv[8] = 60'h000000000249249;
      expv[9] = 60'h000000001249249;
      expv[10] = 60'h000000000249249;
      expv[11] = 60'h000000001249249;
      expv[12] = 60'h000000001249249;
      expv[13] = 60'h000000001249249;
      expv[14] = 60'h000000000249249;
      expv[15] = 60'h000000001249249;
      expv[16] = 60'h000000001249249;
      expv[17] = 60'h000000000249249;
      expv[18] = 60'h000000000249249;
      expv[19] = 60'h000000000249249;
      expv[20] = 60'h000000000249249;
      expv[21] = 60'h000000000249249;
      expv[22] = 60'h000000001249249;
      expv[23] = 60'h000000001249249;
      expv[24] = 60'h000000001249249;
      expv[25] = 60'h000000001249249;
      expv[26] = 60'h000000000249249;
      expv[27] = 60'h000000001249249;
      expv[28] = 60'h000000001249249;
      expv[29] = 60'h000000001249249;
      expv[30] = 60'h000000001249249;
      expv[31] = 60'h000000000249249;
      expv[32] = 60'h000000000249249;
      expv[33] = 60'h000000000249249;
      expv[34] = 60'h000000000249249;
      expv[35] = 60'h000000000249249;
      expv[36] = 60'h000000000249249;
      expv[37] = 60'h000000000249249;
      expv[38] = 60'h000000001249249;
      expv[39] = 60'h000000000249249;
      expv[40] = 60'h000000000249249;
      expv[41] = 60'h000000001249249;
      expv[42] = 60'h000000001249249;
      expv[43] = 60'h000000000249249;
      expv[44] = 60'h000000001249249;
      expv[45] = 60'h000000000249249;
      expv[46] = 60'h000000000249249;
      expv[47] = 60'h000000001249249;
      expv[48] = 60'h000000001249249;
      expv[49] = 60'h000000000249249;
      expv[50] = 60'h000000000249249;
      expv[51] = 60'h000000000249249;
      expv[52] = 60'h000000001249249;
      expv[53] = 60'h000000000249249;
      expv[54] = 60'h000000001249249;
      expv[55] = 60'h000000000249249;
      expv[56] = 60'h000000001249249;
      expv[57] = 60'h000000001249249;
      expv[58] = 60'h000000000249249;
      expv[59] = 60'h000000000249249;
      expv[60] = 60'h000000001249249;
      expv[61] = 60'h000000001249249;
      expv[62] = 60'h000000000249249;
      expv[63] = 60'h000000001249249;
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
