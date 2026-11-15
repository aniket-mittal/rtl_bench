// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_135548 dut (
    .clk(clk),
    .rst(in_vec[32:32]),
    .x(in_vec[31:16]),
    .d(in_vec[15:0]),
    .y(out_vec[31:16]),
    .error(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h1eff7629a;
    stim[1] = 33'h175de21ae;
    stim[2] = 33'h0009261b3;
    stim[3] = 33'h0b0ded549;
    stim[4] = 33'h07b74ed29;
    stim[5] = 33'h0772a95cc;
    stim[6] = 33'h0be3f5cb2;
    stim[7] = 33'h09e73cb70;
    stim[8] = 33'h0537c76b4;
    stim[9] = 33'h018dcb637;
    stim[10] = 33'h06e4c6278;
    stim[11] = 33'h09ec22159;
    stim[12] = 33'h039e385d5;
    stim[13] = 33'h0c878d0b3;
    stim[14] = 33'h0f81864bc;
    stim[15] = 33'h0b324de1b;
    stim[16] = 33'h084008fe8;
    stim[17] = 33'h0e194ff9c;
    stim[18] = 33'h133a3505e;
    stim[19] = 33'h0a2c82ce3;
    stim[20] = 33'h0c6ee12b6;
    stim[21] = 33'h00141016e;
    stim[22] = 33'h01bc5e906;
    stim[23] = 33'h0c50dd6b9;
    stim[24] = 33'h0c729fef0;
    stim[25] = 33'h0545bb911;
    stim[26] = 33'h0d695ead6;
    stim[27] = 33'h1d90c4953;
    stim[28] = 33'h0748aecf5;
    stim[29] = 33'h0f3ea6a22;
    stim[30] = 33'h08fed0df9;
    stim[31] = 33'h0171d0f95;
    stim[32] = 33'h0e67dc18c;
    stim[33] = 33'h0fadd5581;
    stim[34] = 33'h0522ad957;
    stim[35] = 33'h0be2656c1;
    stim[36] = 33'h0b856d1ac;
    stim[37] = 33'h1cfbc84b4;
    stim[38] = 33'h0f7286d76;
    stim[39] = 33'h0257cd529;
    stim[40] = 33'h00c64fc89;
    stim[41] = 33'h0251c3c9b;
    stim[42] = 33'h015e9960b;
    stim[43] = 33'h03ce12895;
    stim[44] = 33'h01899388f;
    stim[45] = 33'h04d235cf7;
    stim[46] = 33'h08b09f417;
    stim[47] = 33'h09a9d091b;
    stim[48] = 33'h04d0e44b8;
    stim[49] = 33'h0d9568096;
    stim[50] = 33'h07d7973ae;
    stim[51] = 33'h099edea8c;
    stim[52] = 33'h017458d6f;
    stim[53] = 33'h0140b2318;
    stim[54] = 33'h0b41698c0;
    stim[55] = 33'h012bee17d;
    stim[56] = 33'h0f41f87be;
    stim[57] = 33'h059958967;
    stim[58] = 33'h053d608ea;
    stim[59] = 33'h0be08340d;
    stim[60] = 33'h08ad0e281;
    stim[61] = 33'h07c2672de;
    stim[62] = 33'h014f48190;
    stim[63] = 33'h0ffc840d1;
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
      expv[0] = 32'h00000000;
      expv[1] = 32'h00000000;
      expv[2] = 32'h00000000;
      expv[3] = 32'h000061b3;
      expv[4] = 32'h0000d549;
      expv[5] = 32'h467ca6ad;
      expv[6] = 32'hbf8cd640;
      expv[7] = 32'hff985d1a;
      expv[8] = 32'h0d38be38;
      expv[9] = 32'h53f222c2;
      expv[10] = 32'hf1f8c43f;
      expv[11] = 32'ha147c131;
      expv[12] = 32'h5b64c5f5;
      expv[13] = 32'hede897ed;
      expv[14] = 32'h42228e91;
      expv[15] = 32'hde71864b;
      expv[16] = 32'haba23279;
      expv[17] = 32'hbd44d2a4;
      expv[18] = 32'h00000000;
      expv[19] = 32'h00000000;
      expv[20] = 32'h00002ce3;
      expv[21] = 32'h000012b6;
      expv[22] = 32'h18a0e8ce;
      expv[23] = 32'hf5d4f332;
      expv[24] = 32'h8cca49ef;
      expv[25] = 32'he5a6194a;
      expv[26] = 32'ha7f01121;
      expv[27] = 32'h00000000;
      expv[28] = 32'h00000000;
      expv[29] = 32'h0000ecf5;
      expv[30] = 32'h00006a22;
      expv[31] = 32'h74c89931;
      expv[32] = 32'hb4aa5aeb;
      expv[33] = 32'h2b7d960f;
      expv[34] = 32'h228332fe;
      expv[35] = 32'hfd8ddbca;
      expv[36] = 32'hd7a37f1e;
      expv[37] = 32'h00000000;
      expv[38] = 32'h00000000;
      expv[39] = 32'h00006d76;
      expv[40] = 32'h0000d529;
      expv[41] = 32'h4660b629;
      expv[42] = 32'h48f0f3ab;
      expv[43] = 32'hd650bfbb;
      expv[44] = 32'he5b442e1;
      expv[45] = 32'h99719f1e;
      expv[46] = 32'h945dc89a;
      expv[47] = 32'h03cdf04a;
      expv[48] = 32'hf9490fd2;
      expv[49] = 32'h8027c491;
      expv[50] = 32'h5a462650;
      expv[51] = 32'hbadfb8cf;
      expv[52] = 32'hd45e162e;
      expv[53] = 32'h33c559aa;
      expv[54] = 32'hf7812b97;
      expv[55] = 32'h47ec50d4;
      expv[56] = 32'h1431cd4c;
      expv[57] = 32'he52ba293;
      expv[58] = 32'h028786e0;
      expv[59] = 32'h893f7fab;
      expv[60] = 32'hebd54838;
      expv[61] = 32'hf978e909;
      expv[62] = 32'h05aa6d34;
      expv[63] = 32'hc790ba00;
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
