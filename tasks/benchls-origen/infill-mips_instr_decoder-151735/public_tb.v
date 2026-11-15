// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 37;
  localparam OW = 87;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_151735 dut (
    .CODE(in_vec[36:5]),
    .shift(in_vec[4:4]),
    .syscall(in_vec[3:3]),
    .RegDst(in_vec[2:2]),
    .Jal(in_vec[1:1]),
    .Zero_extend(in_vec[0:0]),
    .PC(out_vec[86:59]),
    .OPCODE(out_vec[58:53]),
    .FUNCT(out_vec[52:47]),
    .RA(out_vec[46:42]),
    .RB(out_vec[41:37]),
    .RW(out_vec[36:32]),
    .extend(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 37'h14fbe8372e;
    stim[1] = 37'h09988a47dd;
    stim[2] = 37'h10da231369;
    stim[3] = 37'h06946877b9;
    stim[4] = 37'h1d22429321;
    stim[5] = 37'h0695a1354a;
    stim[6] = 37'h0dfde2e5bd;
    stim[7] = 37'h10977b07b3;
    stim[8] = 37'h10215597cb;
    stim[9] = 37'h1b23c7e9e1;
    stim[10] = 37'h11a96af48e;
    stim[11] = 37'h0dc8686dd8;
    stim[12] = 37'h0340fe3614;
    stim[13] = 37'h1067bc8f80;
    stim[14] = 37'h0d8128d6d0;
    stim[15] = 37'h19043d2036;
    stim[16] = 37'h0dad8f4dae;
    stim[17] = 37'h07dd59b8a4;
    stim[18] = 37'h10ed218363;
    stim[19] = 37'h175f14359b;
    stim[20] = 37'h0493896988;
    stim[21] = 37'h1b744e5b97;
    stim[22] = 37'h1e37227b46;
    stim[23] = 37'h198bd4917f;
    stim[24] = 37'h15d44aa3dd;
    stim[25] = 37'h150f23705f;
    stim[26] = 37'h1712620277;
    stim[27] = 37'h155c2d0558;
    stim[28] = 37'h09362b944a;
    stim[29] = 37'h0259e9bac8;
    stim[30] = 37'h0698c28ea8;
    stim[31] = 37'h133979bc7a;
    stim[32] = 37'h03f12b9ae1;
    stim[33] = 37'h0535985263;
    stim[34] = 37'h0e0dcf5a2a;
    stim[35] = 37'h0e325ebf10;
    stim[36] = 37'h1779cd06b2;
    stim[37] = 37'h0dbcf529a5;
    stim[38] = 37'h1a092cf477;
    stim[39] = 37'h0bdfdb18c9;
    stim[40] = 37'h166286f664;
    stim[41] = 37'h10eca497c6;
    stim[42] = 37'h08195bfebd;
    stim[43] = 37'h00d9d6337d;
    stim[44] = 37'h08315701b8;
    stim[45] = 37'h15548b26bc;
    stim[46] = 37'h19ff895a33;
    stim[47] = 37'h160f2707d1;
    stim[48] = 37'h1039871e00;
    stim[49] = 37'h05f007aec1;
    stim[50] = 37'h0adcfdf65c;
    stim[51] = 37'h0aa70655f2;
    stim[52] = 37'h0a3c5a787e;
    stim[53] = 37'h1c7b76dc04;
    stim[54] = 37'h0cefdc9275;
    stim[55] = 37'h0f77ec1f42;
    stim[56] = 37'h10140d25cf;
    stim[57] = 37'h11ae765500;
    stim[58] = 37'h180ae918c0;
    stim[59] = 37'h1dec97f296;
    stim[60] = 37'h1923d91606;
    stim[61] = 37'h1a96418761;
    stim[62] = 37'h1115f3c810;
    stim[63] = 37'h0dab44dc70;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 87'h000001453cad88000041b9;
      expv[1] = 87'h000000827f2d8a0000523e;
      expv[2] = 87'h000001042dad910000189b;
      expv[3] = 87'h00000061bead83000043bd;
      expv[4] = 87'h000001c74ca25200001499;
      expv[5] = 87'h00000061b52d9f000009aa;
      expv[6] = 87'h000000c376ad820000172d;
      expv[7] = 87'h000001043e977f0000d83d;
      expv[8] = 87'h000001041f2d9f0000acbe;
      expv[9] = 87'h000001a6c7a3de00003f4f;
      expv[10] = 87'h00000104722d8a000057a4;
      expv[11] = 87'h000000c3772d830000436e;
      expv[12] = 87'h00000020d840fefffff1b0;
      expv[13] = 87'h000001041e67bdffffe47c;
      expv[14] = 87'h000000c37b0129000046b6;
      expv[15] = 87'h0000018640843dffffe901;
      expv[16] = 87'h000000c376ad8f00007a6d;
      expv[17] = 87'h00000061e2dd59ffffcdc5;
      expv[18] = 87'h000001042ded3f00000c1b;
      expv[19] = 87'h00000165d62d9f0000a1ac;
      expv[20] = 87'h00000041262d9c00004b4c;
      expv[21] = 87'h000001a6ce744e000072dc;
      expv[22] = 87'h000001e78d3722000013da;
      expv[23] = 87'h0000018665ad940000a48b;
      expv[24] = 87'h000001456f2d8a0000551e;
      expv[25] = 87'h00000145412d8300001b82;
      expv[26] = 87'h00000165c9926200001013;
      expv[27] = 87'h00000145552d810000682a;
      expv[28] = 87'h00000082512d9f00005ca2;
      expv[29] = 87'h000000208b2d8f00004dd6;
      expv[30] = 87'h00000061baad8600001475;
      expv[31] = 87'h00000124d1ad9fffffcde3;
      expv[32] = 87'h00000020ebf12900005cd7;
      expv[33] = 87'h0000004149b59f0000c293;
      expv[34] = 87'h000000e388ad9f00007ad1;
      expv[35] = 87'h000000e39c3252fffff5f8;
      expv[36] = 87'h00000165daf9df00006835;
      expv[37] = 87'h000000c366bcf50000a94d;
      expv[38] = 87'h000001a691892c000067a3;
      expv[39] = 87'h000000a2e32d9e0000d8c6;
      expv[40] = 87'h0000016599e286000037b3;
      expv[41] = 87'h000001043f6ca4000024be;
      expv[42] = 87'h000000821aad9b0000dff5;
      expv[43] = 87'h000000002dad960000b19b;
      expv[44] = 87'h0000008206ad8affffb80d;
      expv[45] = 87'h000001455aad8b00005935;
      expv[46] = 87'h0000018668ff9f00004ad1;
      expv[47] = 87'h000001659f0f390000383e;
      expv[48] = 87'h0000010418398c000038f0;
      expv[49] = 87'h000000417b700000003d76;
      expv[50] = 87'h000000a2b92d9dffffefb2;
      expv[51] = 87'h000000a2b7a71f000032af;
      expv[52] = 87'h000000a281ad9affffd3c3;
      expv[53] = 87'h000001c7107b76ffffb6e0;
      expv[54] = 87'h000000c329efdc0000e493;
      expv[55] = 87'h000000e3dd77ff000060fa;
      expv[56] = 87'h00000104172d8d0000692e;
      expv[57] = 87'h00000104742e73ffffb2a8;
      expv[58] = 87'h00000186030af7000048c6;
      expv[59] = 87'h000001c76a6c97ffffbf94;
      expv[60] = 87'h000001865823d9ffffc8b0;
      expv[61] = 87'h000001a6bd965200000c3b;
      expv[62] = 87'h000001044015efffff9e40;
      expv[63] = 87'h000000c371ab5a000026e3;
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
