// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 70;
  localparam OW = 65;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_04512 dut (
    .clk(clk),
    .address(in_vec[69:67]),
    .chipselect(in_vec[66:66]),
    .in_port(in_vec[65:34]),
    .reset_n(in_vec[33:33]),
    .write_n(in_vec[32:32]),
    .writedata(in_vec[31:0]),
    .irq(out_vec[64:64]),
    .out_port(out_vec[63:32]),
    .readdata(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 70'h26dc93be2559a32e43;
    stim[1] = 70'h1f546e6cfcb3c90df8;
    stim[2] = 70'h13579d7c8bf1eff9aa;
    stim[3] = 70'h3e9f737beeb1750f2a;
    stim[4] = 70'h231b1321879b798285;
    stim[5] = 70'h3fb8c83ccbe736a0bb;
    stim[6] = 70'h3eaaea264301f7c268;
    stim[7] = 70'h3639d81e9730c6182d;
    stim[8] = 70'h383f177c52ba74162c;
    stim[9] = 70'h17dda948b3dc509bb5;
    stim[10] = 70'h02d077e603c789d9df;
    stim[11] = 70'h13680eff3e76025a4a;
    stim[12] = 70'h2d84e94856e63f8723;
    stim[13] = 70'h256ddf0cbf4170e7ec;
    stim[14] = 70'h075a77ba51f3fac086;
    stim[15] = 70'h24421621df427d9fc3;
    stim[16] = 70'h01601363d67f28734f;
    stim[17] = 70'h05c75e9cf38860f517;
    stim[18] = 70'h045609e092e7d19c0b;
    stim[19] = 70'h2c833279ae2700863b;
    stim[20] = 70'h144058c98abaaab422;
    stim[21] = 70'h2c8047bb8308ef0ac8;
    stim[22] = 70'h03e5023d8aa018a132;
    stim[23] = 70'h0c29f3544b56f540dc;
    stim[24] = 70'h237d0fe662ae4215ea;
    stim[25] = 70'h1388a1abe3ab95dfc1;
    stim[26] = 70'h15e7524c0781b7b0fd;
    stim[27] = 70'h088d7f85aed3af1800;
    stim[28] = 70'h029f4fab43a3a26ea0;
    stim[29] = 70'h2fa97ed6dfc0490965;
    stim[30] = 70'h1185be0d468d9ff212;
    stim[31] = 70'h0dd1e13e06aee09346;
    stim[32] = 70'h32a0433ee33fedbcdd;
    stim[33] = 70'h3b02e4a29f9230d3fb;
    stim[34] = 70'h36829962073f219eaa;
    stim[35] = 70'h01233f775fbc4085aa;
    stim[36] = 70'h1c746ad73e735c370e;
    stim[37] = 70'h0ab4fd35ea6aacdd18;
    stim[38] = 70'h25dccdaca778c71f6a;
    stim[39] = 70'h0ae0f3a7831b050394;
    stim[40] = 70'h12686066c2c724c17d;
    stim[41] = 70'h1448135c2b64fbdd89;
    stim[42] = 70'h07e649828ac722176e;
    stim[43] = 70'h01ac1caa43e08a1d58;
    stim[44] = 70'h098c88c8db2966c3b6;
    stim[45] = 70'h095846e49e42fb2159;
    stim[46] = 70'h02ebbd516fa0ef5e8a;
    stim[47] = 70'h2bc94261cfe1df19e5;
    stim[48] = 70'h0057ae94f7dc0a6663;
    stim[49] = 70'h045436fcb295c8fcf2;
    stim[50] = 70'h348ed1a2665b0d2129;
    stim[51] = 70'h1358abc91ae346fd9d;
    stim[52] = 70'h194c0831a266d71cfe;
    stim[53] = 70'h052a37d077d0fe066d;
    stim[54] = 70'h1f13e3726bb89324cf;
    stim[55] = 70'h0be98eb78bbbb0f885;
    stim[56] = 70'h0a81d9a86ae942c3f0;
    stim[57] = 70'h133782df0a91288a0f;
    stim[58] = 70'h1de35ae66e5cb1bab0;
    stim[59] = 70'h36de9b6252078bbafd;
    stim[60] = 70'h396fea7373319dcb23;
    stim[61] = 70'h2da0c2c82ab7cc2095;
    stim[62] = 70'h34b9d6a647a692cf14;
    stim[63] = 70'h38c4d108589c854853;
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
      expv[0] = 65'h00000000000000000;
      expv[1] = 65'h00000000000000000;
      expv[2] = 65'h00000000000000000;
      expv[3] = 65'h00000000000000000;
      expv[4] = 65'h00000000000000000;
      expv[5] = 65'h00000000000000000;
      expv[6] = 65'h00000000000000000;
      expv[7] = 65'h00000000000000000;
      expv[8] = 65'h00000000000000000;
      expv[9] = 65'h00000000000000000;
      expv[10] = 65'h00000000000000000;
      expv[11] = 65'h000000000b41df980;
      expv[12] = 65'h00000000000000000;
      expv[13] = 65'h00000000000000000;
      expv[14] = 65'h00000000000000000;
      expv[15] = 65'h00000000000000000;
      expv[16] = 65'h00000000000000000;
      expv[17] = 65'h0000000005804d8f5;
      expv[18] = 65'h00000000071d7a73c;
      expv[19] = 65'h0e7d19c0b15827824;
      expv[20] = 65'h0c0d1180000000000;
      expv[21] = 65'h1c0d1180000000000;
      expv[22] = 65'h1c0d1180000000000;
      expv[23] = 65'h1c0d11800f9408f62;
      expv[24] = 65'h1c0d1180000000000;
      expv[25] = 65'h1c0d1180000000000;
      expv[26] = 65'h1c0d11800baaab422;
      expv[27] = 65'h1c0d11800baaab422;
      expv[28] = 65'h1c0d1180000000000;
      expv[29] = 65'h1c0d11800a7d3ead0;
      expv[30] = 65'h1c0d1180000000000;
      expv[31] = 65'h1c0d11800baaab422;
      expv[32] = 65'h1c0d1180000000000;
      expv[33] = 65'h1c0d1180000000000;
      expv[34] = 65'h1c0d1180000000000;
      expv[35] = 65'h1c0d1180000000000;
      expv[36] = 65'h1c0d1180048cfddd7;
      expv[37] = 65'h1c0d1180000000000;
      expv[38] = 65'h1c0d1180000000000;
      expv[39] = 65'h1c0d1180000000000;
      expv[40] = 65'h1c0d1180000000000;
      expv[41] = 65'h1c0d11800baaab422;
      expv[42] = 65'h1c0d11800baaab422;
      expv[43] = 65'h1c722176ef99260a2;
      expv[44] = 65'h1c722176e6b072a90;
      expv[45] = 65'h1c722176e00000000;
      expv[46] = 65'h1c722176e00000000;
      expv[47] = 65'h1c722176ebaef545b;
      expv[48] = 65'h1c722176e00000000;
      expv[49] = 65'h1c722176e15eba53d;
      expv[50] = 65'h195c8fcf2150dbf2c;
      expv[51] = 65'h195c8fcf200000000;
      expv[52] = 65'h195c8fcf2baaab422;
      expv[53] = 65'h195c8fcf200000000;
      expv[54] = 65'h195c8fcf24a8df41d;
      expv[55] = 65'h195c8fcf200000000;
      expv[56] = 65'h195c8fcf200000000;
      expv[57] = 65'h195c8fcf200000000;
      expv[58] = 65'h195c8fcf2baaab422;
      expv[59] = 65'h195c8fcf200000000;
      expv[60] = 65'h195c8fcf200000000;
      expv[61] = 65'h195c8fcf200000000;
      expv[62] = 65'h10000dc6200000000;
      expv[63] = 65'h00000000000000000;
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
