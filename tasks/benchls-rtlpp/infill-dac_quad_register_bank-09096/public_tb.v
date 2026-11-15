// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 71;
  localparam OW = 130;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_09096 dut (
    .clk_i(clk),
    .rstn_i(in_vec[70:70]),
    .sys_addr(in_vec[69:38]),
    .sys_wdata(in_vec[37:6]),
    .sys_sel(in_vec[5:2]),
    .sys_wen(in_vec[1:1]),
    .sys_ren(in_vec[0:0]),
    .dac_a_o(out_vec[129:106]),
    .dac_b_o(out_vec[105:82]),
    .dac_c_o(out_vec[81:58]),
    .dac_d_o(out_vec[57:34]),
    .sys_rdata(out_vec[33:2]),
    .sys_err(out_vec[1:1]),
    .sys_ack(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 71'h6638712a033c574d91;
    stim[1] = 71'h7028ab0e6e255b24cd;
    stim[2] = 71'h1e87adcff57cd15093;
    stim[3] = 71'h0ddd664c615c38dc36;
    stim[4] = 71'h0c4f7e2d5dfba4708a;
    stim[5] = 71'h27491319b82b159c27;
    stim[6] = 71'h37d3f4592b431b9567;
    stim[7] = 71'h01f5ccbee976d7a9d4;
    stim[8] = 71'h3a0ddd994a15e49527;
    stim[9] = 71'h021dcb7e3c9a52a477;
    stim[10] = 71'h164947426f583c6ece;
    stim[11] = 71'h0cf792bff41948722c;
    stim[12] = 71'h18fee195cf33914e98;
    stim[13] = 71'h0e265cb2a676400dce;
    stim[14] = 71'h008d123ee2e8fe3fb4;
    stim[15] = 71'h325510acc2c36e1f4a;
    stim[16] = 71'h154de00d442b7a1f05;
    stim[17] = 71'h200fb10571fc541308;
    stim[18] = 71'h3613f8d76f5419b9c2;
    stim[19] = 71'h2064f5c7a0d3591670;
    stim[20] = 71'h29d5311df808a8e0d5;
    stim[21] = 71'h300fa7dea834304603;
    stim[22] = 71'h0a86958acf4940a6d2;
    stim[23] = 71'h2b749f4d92dbf81496;
    stim[24] = 71'h2ef383e54d8d025122;
    stim[25] = 71'h1fab4c69d51e0bb3fa;
    stim[26] = 71'h1853bb625227254f3a;
    stim[27] = 71'h04a69b4db8e5af7aaf;
    stim[28] = 71'h329e3ba6f25f42836d;
    stim[29] = 71'h26506e303aa846b259;
    stim[30] = 71'h3c8e72481b8082288c;
    stim[31] = 71'h133bd69cefbb5ac314;
    stim[32] = 71'h17b0860dffd7c68156;
    stim[33] = 71'h1424902d66c6dacb76;
    stim[34] = 71'h3620263cd6021f8105;
    stim[35] = 71'h1102c2e454b082d196;
    stim[36] = 71'h36e58d36d15de4c136;
    stim[37] = 71'h2e404cca0b09e4c423;
    stim[38] = 71'h35f578aa62f9853490;
    stim[39] = 71'h16c528ccea5e4e5572;
    stim[40] = 71'h05eabdaaac6901efd0;
    stim[41] = 71'h3407f179bb543c8127;
    stim[42] = 71'h05d2cde53a1869d610;
    stim[43] = 71'h086af17906a3b9b2fa;
    stim[44] = 71'h038c041f7352adf09e;
    stim[45] = 71'h181e90cb5b988e9a51;
    stim[46] = 71'h1beb9f43de2640b92d;
    stim[47] = 71'h330bdf8cff359879fc;
    stim[48] = 71'h0dd192a0f002766a8a;
    stim[49] = 71'h100f0ea4d0cf9da50e;
    stim[50] = 71'h2a3f6deb1f4fc44595;
    stim[51] = 71'h2fa7bc77e4e87e3048;
    stim[52] = 71'h32ce4405fbe1da09f9;
    stim[53] = 71'h0c36409b2d8e4dd473;
    stim[54] = 71'h2c1a5278b73720500f;
    stim[55] = 71'h34b2804af5d41fb07d;
    stim[56] = 71'h177c84b8fb65925f65;
    stim[57] = 71'h3537254186e11a725f;
    stim[58] = 71'h011fbd7b828c3f1a51;
    stim[59] = 71'h19204b59c7df653264;
    stim[60] = 71'h06c56507f302378388;
    stim[61] = 71'h2e6ab636e73fceae99;
    stim[62] = 71'h3fc10d6e9438882166;
    stim[63] = 71'h073aaf4622bdbb7ed8;
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
      expv[0] = 130'h03c0001380001d4000270000xxxxxxxxx;
      expv[1] = 130'h03c0001380001d4000270000000000001;
      expv[2] = 130'h03c0001380001d4000270000000000000;
      expv[3] = 130'h03c0001380001d4000270000000000000;
      expv[4] = 130'h03c0001380001d4000270000000000000;
      expv[5] = 130'h03c0001380001d4000270000000000000;
      expv[6] = 130'h03c0001380001d4000270000000000000;
      expv[7] = 130'h03c0001380001d4000270000000000000;
      expv[8] = 130'h03c0001380001d4000270000000000000;
      expv[9] = 130'h03c0001380001d4000270000000000000;
      expv[10] = 130'h03c0001380001d4000270000000000000;
      expv[11] = 130'h03c0001380001d4000270000000000000;
      expv[12] = 130'h03c0001380001d4000270000000000000;
      expv[13] = 130'h03c0001380001d4000270000000000000;
      expv[14] = 130'h03c0001380001d4000270000000000000;
      expv[15] = 130'h03c0001380001d4000270000000000000;
      expv[16] = 130'h03c0001380001d4000270000000000000;
      expv[17] = 130'h03c0001380001d4000270000000000000;
      expv[18] = 130'h03c0001380001d4000270000000000000;
      expv[19] = 130'h03c0001380001d4000270000000000000;
      expv[20] = 130'h03c0001380001d4000270000000000000;
      expv[21] = 130'h03c0001380001d4000270000000000000;
      expv[22] = 130'h03c0001380001d4000270000000000000;
      expv[23] = 130'h03c0001380001d4000270000000000000;
      expv[24] = 130'h03c0001380001d4000270000000000000;
      expv[25] = 130'h03c0001380001d4000270000000000000;
      expv[26] = 130'h03c0001380001d4000270000000000000;
      expv[27] = 130'h03c0001380001d4000270000000000000;
      expv[28] = 130'h03c0001380001d4000270000000000000;
      expv[29] = 130'h03c0001380001d4000270000000000000;
      expv[30] = 130'h03c0001380001d4000270000000000000;
      expv[31] = 130'h03c0001380001d4000270000000000000;
      expv[32] = 130'h03c0001380001d4000270000000000000;
      expv[33] = 130'h03c0001380001d4000270000000000000;
      expv[34] = 130'h03c0001380001d4000270000000000000;
      expv[35] = 130'h03c0001380001d4000270000000000000;
      expv[36] = 130'h03c0001380001d4000270000000000000;
      expv[37] = 130'h03c0001380001d4000270000000000000;
      expv[38] = 130'h03c0001380001d4000270000000000000;
      expv[39] = 130'h03c0001380001d4000270000000000000;
      expv[40] = 130'h03c0001380001d4000270000000000000;
      expv[41] = 130'h03c0001380001d4000270000000000000;
      expv[42] = 130'h03c0001380001d4000270000000000000;
      expv[43] = 130'h03c0001380001d4000270000000000000;
      expv[44] = 130'h03c0001380001d4000270000000000000;
      expv[45] = 130'h03c0001380001d4000270000000000000;
      expv[46] = 130'h03c0001380001d4000270000000000000;
      expv[47] = 130'h03c0001380001d4000270000000000000;
      expv[48] = 130'h03c0001380001d4000270000000000000;
      expv[49] = 130'h03c0001380001d4000270000000000000;
      expv[50] = 130'h03c0001380001d4000270000000000000;
      expv[51] = 130'h03c0001380001d4000270000000000000;
      expv[52] = 130'h03c0001380001d4000270000000000000;
      expv[53] = 130'h03c0001380001d4000270000000000000;
      expv[54] = 130'h03c0001380001d4000270000000000000;
      expv[55] = 130'h03c0001380001d4000270000000000000;
      expv[56] = 130'h03c0001380001d4000270000000000000;
      expv[57] = 130'h03c0001380001d4000270000000000000;
      expv[58] = 130'h03c0001380001d4000270000000000000;
      expv[59] = 130'h03c0001380001d4000270000000000000;
      expv[60] = 130'h03c0001380001d4000270000000000000;
      expv[61] = 130'h03c0001380001d4000270000000000000;
      expv[62] = 130'h03c0001380001d4000270000000000000;
      expv[63] = 130'h03c0001380001d4000270000000000000;
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
