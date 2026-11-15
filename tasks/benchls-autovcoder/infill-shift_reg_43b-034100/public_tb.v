// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 43;
  localparam OW = 43;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_034100 dut (
    .clock(clk),
    .io_d(in_vec[42:0]),
    .io_q(out_vec[42:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 43'h4ff9db84031;
    stim[1] = 43'h34c5872869f;
    stim[2] = 43'h09e59099807;
    stim[3] = 43'h3b9bb039c32;
    stim[4] = 43'h208e82847be;
    stim[5] = 43'h1410f103f23;
    stim[6] = 43'h09f43241e79;
    stim[7] = 43'h3718a85427d;
    stim[8] = 43'h6792f3734c5;
    stim[9] = 43'h5cc88b1fe03;
    stim[10] = 43'h5aa767f79a5;
    stim[11] = 43'h355ba5a5253;
    stim[12] = 43'h3d1e2793ea5;
    stim[13] = 43'h32ae951c186;
    stim[14] = 43'h42499b80d6f;
    stim[15] = 43'h1ec2fc0b005;
    stim[16] = 43'h53e7f22f66f;
    stim[17] = 43'h72194ab1f53;
    stim[18] = 43'h57be84125a0;
    stim[19] = 43'h26f12be8418;
    stim[20] = 43'h289ed893f9c;
    stim[21] = 43'h778f7dde849;
    stim[22] = 43'h0e69a3fcbb6;
    stim[23] = 43'h60bb68e81fd;
    stim[24] = 43'h590df7f0183;
    stim[25] = 43'h5085deae5c6;
    stim[26] = 43'h45f1cff9333;
    stim[27] = 43'h310d6b28a88;
    stim[28] = 43'h2f48666f565;
    stim[29] = 43'h1f37ad58ced;
    stim[30] = 43'h2e3b682dd60;
    stim[31] = 43'h202bf1b56e3;
    stim[32] = 43'h7f6c3f41598;
    stim[33] = 43'h3f92dcfe397;
    stim[34] = 43'h199ff79f97d;
    stim[35] = 43'h35b6d813fb0;
    stim[36] = 43'h212fc8d44a5;
    stim[37] = 43'h5d303ca2163;
    stim[38] = 43'h7825031b094;
    stim[39] = 43'h20828c5702f;
    stim[40] = 43'h49c78a17b3b;
    stim[41] = 43'h66947940885;
    stim[42] = 43'h07df08a2bbd;
    stim[43] = 43'h1da429cdfe0;
    stim[44] = 43'h12d88f89a91;
    stim[45] = 43'h59c8d5950a8;
    stim[46] = 43'h62db8547928;
    stim[47] = 43'h58e1e978877;
    stim[48] = 43'h7a1d7bd9a51;
    stim[49] = 43'h37fbf2b0dea;
    stim[50] = 43'h29925c285f4;
    stim[51] = 43'h213e436c91a;
    stim[52] = 43'h7e47c221422;
    stim[53] = 43'h32c0caa5e32;
    stim[54] = 43'h7d2a3f3bd65;
    stim[55] = 43'h5560d3f71e1;
    stim[56] = 43'h6f6352732b8;
    stim[57] = 43'h44a71e94d73;
    stim[58] = 43'h1dc9b153354;
    stim[59] = 43'h63d8dac4998;
    stim[60] = 43'h4db5437f554;
    stim[61] = 43'h45206523a54;
    stim[62] = 43'h28600b3cf48;
    stim[63] = 43'h7ef056a332c;
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
      expv[0] = 43'hxxxxxxxxxxx;
      expv[1] = 43'h4ff9db84031;
      expv[2] = 43'h34c5872869f;
      expv[3] = 43'h09e59099807;
      expv[4] = 43'h3b9bb039c32;
      expv[5] = 43'h208e82847be;
      expv[6] = 43'h1410f103f23;
      expv[7] = 43'h09f43241e79;
      expv[8] = 43'h3718a85427d;
      expv[9] = 43'h6792f3734c5;
      expv[10] = 43'h5cc88b1fe03;
      expv[11] = 43'h5aa767f79a5;
      expv[12] = 43'h355ba5a5253;
      expv[13] = 43'h3d1e2793ea5;
      expv[14] = 43'h32ae951c186;
      expv[15] = 43'h42499b80d6f;
      expv[16] = 43'h1ec2fc0b005;
      expv[17] = 43'h53e7f22f66f;
      expv[18] = 43'h72194ab1f53;
      expv[19] = 43'h57be84125a0;
      expv[20] = 43'h26f12be8418;
      expv[21] = 43'h289ed893f9c;
      expv[22] = 43'h778f7dde849;
      expv[23] = 43'h0e69a3fcbb6;
      expv[24] = 43'h60bb68e81fd;
      expv[25] = 43'h590df7f0183;
      expv[26] = 43'h5085deae5c6;
      expv[27] = 43'h45f1cff9333;
      expv[28] = 43'h310d6b28a88;
      expv[29] = 43'h2f48666f565;
      expv[30] = 43'h1f37ad58ced;
      expv[31] = 43'h2e3b682dd60;
      expv[32] = 43'h202bf1b56e3;
      expv[33] = 43'h7f6c3f41598;
      expv[34] = 43'h3f92dcfe397;
      expv[35] = 43'h199ff79f97d;
      expv[36] = 43'h35b6d813fb0;
      expv[37] = 43'h212fc8d44a5;
      expv[38] = 43'h5d303ca2163;
      expv[39] = 43'h7825031b094;
      expv[40] = 43'h20828c5702f;
      expv[41] = 43'h49c78a17b3b;
      expv[42] = 43'h66947940885;
      expv[43] = 43'h07df08a2bbd;
      expv[44] = 43'h1da429cdfe0;
      expv[45] = 43'h12d88f89a91;
      expv[46] = 43'h59c8d5950a8;
      expv[47] = 43'h62db8547928;
      expv[48] = 43'h58e1e978877;
      expv[49] = 43'h7a1d7bd9a51;
      expv[50] = 43'h37fbf2b0dea;
      expv[51] = 43'h29925c285f4;
      expv[52] = 43'h213e436c91a;
      expv[53] = 43'h7e47c221422;
      expv[54] = 43'h32c0caa5e32;
      expv[55] = 43'h7d2a3f3bd65;
      expv[56] = 43'h5560d3f71e1;
      expv[57] = 43'h6f6352732b8;
      expv[58] = 43'h44a71e94d73;
      expv[59] = 43'h1dc9b153354;
      expv[60] = 43'h63d8dac4998;
      expv[61] = 43'h4db5437f554;
      expv[62] = 43'h45206523a54;
      expv[63] = 43'h28600b3cf48;
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
