// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 122;
  localparam OW = 53;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_09370 dut (
    .clk(clk),
    .MonDReg(in_vec[121:90]),
    .break_readreg(in_vec[89:58]),
    .dbrk_hit0_latch(in_vec[57:57]),
    .dbrk_hit1_latch(in_vec[56:56]),
    .dbrk_hit2_latch(in_vec[55:55]),
    .dbrk_hit3_latch(in_vec[54:54]),
    .debugack(in_vec[53:53]),
    .monitor_error(in_vec[52:52]),
    .monitor_ready(in_vec[51:51]),
    .reset_n(in_vec[50:50]),
    .resetlatch(in_vec[49:49]),
    .tracemem_on(in_vec[48:48]),
    .tracemem_trcdata(in_vec[47:12]),
    .tracemem_tw(in_vec[11:11]),
    .trc_im_addr(in_vec[10:4]),
    .trc_on(in_vec[3:3]),
    .trc_wrap(in_vec[2:2]),
    .trigbrktype(in_vec[1:1]),
    .trigger_state_1(in_vec[0:0]),
    .jdo(out_vec[52:15]),
    .jrst_n(out_vec[14:14]),
    .st_ready_test_idle(out_vec[13:13]),
    .take_action_break_a(out_vec[12:12]),
    .take_action_break_b(out_vec[11:11]),
    .take_action_break_c(out_vec[10:10]),
    .take_action_ocimem_a(out_vec[9:9]),
    .take_action_ocimem_b(out_vec[8:8]),
    .take_action_tracectrl(out_vec[7:7]),
    .take_action_tracemem_a(out_vec[6:6]),
    .take_action_tracemem_b(out_vec[5:5]),
    .take_no_action_break_a(out_vec[4:4]),
    .take_no_action_break_b(out_vec[3:3]),
    .take_no_action_break_c(out_vec[2:2]),
    .take_no_action_ocimem_a(out_vec[1:1]),
    .take_no_action_tracemem_a(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 122'h3b1c256abed9ffdcb680d0c8b199826;
    stim[1] = 122'h1520125ef02d2ac6de3ebf7702d4964;
    stim[2] = 122'h31da0bba2307200ab05028084a94217;
    stim[3] = 122'h3252270c4fe32ed3734883677b4d16e;
    stim[4] = 122'h295c928794b2704baefc3f4a61dd0b7;
    stim[5] = 122'h385176b246e0dee8bbc3bbad04276dc;
    stim[6] = 122'h0765658a4e76060f837551f1d04eb8a;
    stim[7] = 122'h3237ee7cdd8ca95d41c136646b6a3f4;
    stim[8] = 122'h1e3d8ce3c3300d1c2d6ebd4fa1debdc;
    stim[9] = 122'h06b4fbdf1946266d7d1fb23fcd4c802;
    stim[10] = 122'h046625c5a5846013667982e9d76a9e0;
    stim[11] = 122'h1020e9709466517e596006db895d68f;
    stim[12] = 122'h3179126ed6070010abf86afac9e1d84;
    stim[13] = 122'h38fb663ecf90b816f6c453973fb58dd;
    stim[14] = 122'h3c2a0bfaae7d922103e6e910a220c34;
    stim[15] = 122'h32702fa3cc0a1838e94d5c826f208ec;
    stim[16] = 122'h0588e388931b50a1fb5f71c595082df;
    stim[17] = 122'h2af94635facd743743779a2bd861b60;
    stim[18] = 122'h268dcfedf406861703dc0adf09125f6;
    stim[19] = 122'h3ce2eff62a9c0656dbf43df44483611;
    stim[20] = 122'h2bbd335c3e7f4edcdb60649abd6efaf;
    stim[21] = 122'h0a1026ba8e8d994fbc71e8d04437850;
    stim[22] = 122'h13d0ea2d219f24493cfc060a83c1be1;
    stim[23] = 122'h37154eb3dab6ca47ecc2a1cd65788f5;
    stim[24] = 122'h09c919f2a891093463f4439b5911edd;
    stim[25] = 122'h2d709673520e07805c4689e2da0bd49;
    stim[26] = 122'h3a66d12c6403ddec2d66313fb43c8e1;
    stim[27] = 122'h2a1d332751b9e97245cf7d272d6be24;
    stim[28] = 122'h08e6bebf9eed888935fd1da44a9da03;
    stim[29] = 122'h20dea4be203cedda84fe77cf2d5e8d4;
    stim[30] = 122'h2cf02cc27b6bb70792f3878ead9f912;
    stim[31] = 122'h198804e258d26395a04c837d06cbc81;
    stim[32] = 122'h2229d285be1d7557b558cad4fe56279;
    stim[33] = 122'h1d9df44770656249bfd1ab843b75493;
    stim[34] = 122'h1e2f607086d785e5c474cf251990f6e;
    stim[35] = 122'h012e09973e23032bfb6f1732f080293;
    stim[36] = 122'h1d6a8009bec188faf62bcf3ef037aa2;
    stim[37] = 122'h34ce57ac22f80d580fc9bd5b80acad6;
    stim[38] = 122'h1ed77f417d411ba2c0df28c521e9654;
    stim[39] = 122'h00da2fc713e31efafc6ec9b2fc0660e;
    stim[40] = 122'h256df7a310bd4acebef3fd1bc180714;
    stim[41] = 122'h0073a5ea69360ac088fcd897e8fd5f8;
    stim[42] = 122'h308599b22ad5c3135d74d7a1b681f52;
    stim[43] = 122'h33a24a9549ca66ef787fcedcdd4a1b3;
    stim[44] = 122'h2fc0dbea3a3b22bb3f6ca15ba4f04f3;
    stim[45] = 122'h3a49fb86f0c384ce8675e39c8f559c5;
    stim[46] = 122'h1dd839300baa2e7fcafad025dda03a2;
    stim[47] = 122'h01770241875ac91c81e9261af77e4b3;
    stim[48] = 122'h39b31ab222e038c816c6f4b9303b2c3;
    stim[49] = 122'h1a355ebb7e524a167d7cbea5bb763bc;
    stim[50] = 122'h3c3c27ff241473fae5cb0fb23000ac0;
    stim[51] = 122'h14a1b5aea9a320461d4763750de4779;
    stim[52] = 122'h2bb2630d9f0193e5d34a26696618901;
    stim[53] = 122'h177484ec7d8daf9ae6fccfca2a7c2b4;
    stim[54] = 122'h247ac1f02520ae8d25e0cc18e9de732;
    stim[55] = 122'h1c85e76a14eb9b92f6d61b47d1b66cb;
    stim[56] = 122'h07d2c05c6a149f05597e94445751a83;
    stim[57] = 122'h0e057bcfb172d57946f387aa9d92275;
    stim[58] = 122'h0a57994b38ff75dafaf251f4d563d5a;
    stim[59] = 122'h2a29027e7a77bd953debdb673231690;
    stim[60] = 122'h2089ccc5154be17bbadb6705b1ce699;
    stim[61] = 122'h292bbd55ea89600bfb6edba283c12ef;
    stim[62] = 122'h00683a549f54eda320de11400b1854a;
    stim[63] = 122'h308dba98c710091fb8734e840a5d0d3;
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
      expv[0] = 53'h00000000000000;
      expv[1] = 53'h00000000000000;
      expv[2] = 53'h00000000000000;
      expv[3] = 53'h14460e40154000;
      expv[4] = 53'h189fc65da6c000;
      expv[5] = 53'h0f2964e0972000;
      expv[6] = 53'h048dc1bdd14000;
      expv[7] = 53'h149cec0c1f0000;
      expv[8] = 53'h19bb1952bac000;
      expv[9] = 53'h00000000000000;
      expv[10] = 53'h00000000000000;
      expv[11] = 53'h0b4b08c0268000;
      expv[12] = 53'h0128cca2fc8000;
      expv[13] = 53'h1dac0e00210000;
      expv[14] = 53'h1d9f21702de000;
      expv[15] = 53'h155cfb24420000;
      expv[16] = 53'h0798143071c000;
      expv[17] = 53'h112636a143c000;
      expv[18] = 53'h0bf59ae86e8000;
      expv[19] = 53'h1be80d0c2e4000;
      expv[20] = 53'h0c55380cad8000;
      expv[21] = 53'h187cfe9db98000;
      expv[22] = 53'h151d1b329f0000;
      expv[23] = 53'h1a433e48922000;
      expv[24] = 53'h07b56d948fe000;
      expv[25] = 53'h05512212688000;
      expv[26] = 53'h06a41c0f00c000;
      expv[27] = 53'h18c807bbd80000;
      expv[28] = 53'h0ea373d2e4c000;
      expv[29] = 53'h1f3ddb11120000;
      expv[30] = 53'h1c4079dbb52000;
      expv[31] = 53'h04f6d76e0f2000;
      expv[32] = 53'h04b1a4c72b4000;
      expv[33] = 53'h0b7c3aeaaf4000;
      expv[34] = 53'h0ee0cac4934000;
      expv[35] = 53'h010daf0bcb8000;
      expv[36] = 53'h00000000000000;
      expv[37] = 53'h00000000000000;
      expv[38] = 53'h1845f01ab04000;
      expv[39] = 53'h02fa823745e000;
      expv[40] = 53'h0e27c63df58000;
      expv[41] = 53'h06217a959d2000;
      expv[42] = 53'h14d26c15812000;
      expv[43] = 53'h0455ab86268000;
      expv[44] = 53'h0a9394cdde8000;
      expv[45] = 53'h14747645760000;
      expv[46] = 53'h0de187099d0000;
      expv[47] = 53'h0017545cffa000;
      expv[48] = 53'h030eb592390000;
      expv[49] = 53'h0445c071906000;
      expv[50] = 53'h16fca4942c8000;
      expv[51] = 53'h1e4828e7f5c000;
      expv[52] = 53'h1d5346408c4000;
      expv[53] = 53'h1b3e0327cbc000;
      expv[54] = 53'h18fb1b5f35a000;
      expv[55] = 53'h004a415d1a0000;
      expv[56] = 53'h1429d73725e000;
      expv[57] = 53'h18d4293e0a8000;
      expv[58] = 53'h1f62e5aaf2a000;
      expv[59] = 53'h1671feebb5a000;
      expv[60] = 53'h1cf4ef7b2a0000;
      expv[61] = 53'h0a2a97c2f76000;
      expv[62] = 53'h0bd512c0178000;
      expv[63] = 53'h093ea9db466000;
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
