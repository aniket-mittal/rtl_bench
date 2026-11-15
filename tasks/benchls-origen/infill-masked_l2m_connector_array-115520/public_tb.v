// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 36;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_115520 dut (
    .MASK_IN(in_vec[35:32]),
    .DATA(in_vec[31:0]),
    .MEM(out_vec[63:32]),
    .AOUT(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 36'hc595c91fc;
    stim[1] = 36'h65801ff83;
    stim[2] = 36'h73d0bfbba;
    stim[3] = 36'h856e941d7;
    stim[4] = 36'h13ac33bc7;
    stim[5] = 36'h210bda927;
    stim[6] = 36'h5d8c2ee4b;
    stim[7] = 36'hc9900f685;
    stim[8] = 36'h948623754;
    stim[9] = 36'h6acb20a53;
    stim[10] = 36'h8cb0b7ca0;
    stim[11] = 36'h602ab05b5;
    stim[12] = 36'hd23e86ed3;
    stim[13] = 36'h894c75c53;
    stim[14] = 36'hbab085494;
    stim[15] = 36'h3bcb60355;
    stim[16] = 36'hdab206027;
    stim[17] = 36'h628b8e5e0;
    stim[18] = 36'hc9bbd1689;
    stim[19] = 36'hf25e690c3;
    stim[20] = 36'hafc88084a;
    stim[21] = 36'h8d78f30f3;
    stim[22] = 36'h9eba08bfe;
    stim[23] = 36'h2c21b52e1;
    stim[24] = 36'h1488ee040;
    stim[25] = 36'h0f9fc5cd4;
    stim[26] = 36'hac53e57ac;
    stim[27] = 36'hc693bc6b6;
    stim[28] = 36'h7930bb849;
    stim[29] = 36'h3ecf9e300;
    stim[30] = 36'ha887505f6;
    stim[31] = 36'h68a77d367;
    stim[32] = 36'ha430b712b;
    stim[33] = 36'h7f313f916;
    stim[34] = 36'ha799336c7;
    stim[35] = 36'h8f2361455;
    stim[36] = 36'h55b03ea9b;
    stim[37] = 36'he9f6e2fa8;
    stim[38] = 36'h9ba49bcc8;
    stim[39] = 36'h3a9968b78;
    stim[40] = 36'h4f673e7f2;
    stim[41] = 36'haf83874e8;
    stim[42] = 36'h053f38a4d;
    stim[43] = 36'he75d1cdbd;
    stim[44] = 36'h35e651734;
    stim[45] = 36'h3c5ac7e73;
    stim[46] = 36'hb6dfa6f07;
    stim[47] = 36'hf7203a1cd;
    stim[48] = 36'h52b922d2f;
    stim[49] = 36'hf78953320;
    stim[50] = 36'h326f6cd48;
    stim[51] = 36'h75987d768;
    stim[52] = 36'h0c7ef66aa;
    stim[53] = 36'h64980c3cc;
    stim[54] = 36'hf048547ca;
    stim[55] = 36'h7491c5bad;
    stim[56] = 36'hf031c5408;
    stim[57] = 36'h9b57f39d1;
    stim[58] = 36'h9a83d75cf;
    stim[59] = 36'h6143af933;
    stim[60] = 36'hcedb97df7;
    stim[61] = 36'ha84d5e9c3;
    stim[62] = 36'hef0863252;
    stim[63] = 36'hfd4b260b5;
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
      expv[0] = 64'h0000005c00000002;
      expv[1] = 64'h000000ff00000002;
      expv[2] = 64'h000000ba00000003;
      expv[3] = 64'h0000005600000001;
      expv[4] = 64'h000000c700000001;
      expv[5] = 64'h000000a900000001;
      expv[6] = 64'h0000004b00000002;
      expv[7] = 64'h0000000000000002;
      expv[8] = 64'h0000005400000002;
      expv[9] = 64'h0000000a00000002;
      expv[10] = 64'h000000cb00000001;
      expv[11] = 64'h0000000500000002;
      expv[12] = 64'h000000d300000003;
      expv[13] = 64'h0000009400000001;
      expv[14] = 64'h0000009400000003;
      expv[15] = 64'h0000005500000002;
      expv[16] = 64'h0000002700000003;
      expv[17] = 64'h000000e500000002;
      expv[18] = 64'h000000bd00000002;
      expv[19] = 64'h000000c300000004;
      expv[20] = 64'h0000000800000002;
      expv[21] = 64'h000000d700000001;
      expv[22] = 64'h000000fe00000002;
      expv[23] = 64'h0000005200000001;
      expv[24] = 64'h0000004000000001;
      expv[25] = 64'h0000000000000000;
      expv[26] = 64'h0000005700000002;
      expv[27] = 64'h0000003b00000002;
      expv[28] = 64'h0000004900000003;
      expv[29] = 64'h0000000000000002;
      expv[30] = 64'h0000000500000002;
      expv[31] = 64'h000000d300000002;
      expv[32] = 64'h0000007100000002;
      expv[33] = 64'h0000001600000003;
      expv[34] = 64'h0000003600000002;
      expv[35] = 64'h000000f200000001;
      expv[36] = 64'h0000009b00000002;
      expv[37] = 64'h0000002f00000003;
      expv[38] = 64'h000000c800000002;
      expv[39] = 64'h0000007800000002;
      expv[40] = 64'h0000007300000001;
      expv[41] = 64'h0000007400000002;
      expv[42] = 64'h0000000000000000;
      expv[43] = 64'h000000cd00000003;
      expv[44] = 64'h0000003400000002;
      expv[45] = 64'h0000007300000002;
      expv[46] = 64'h0000000700000003;
      expv[47] = 64'h000000cd00000004;
      expv[48] = 64'h0000002f00000002;
      expv[49] = 64'h0000002000000004;
      expv[50] = 64'h0000004800000002;
      expv[51] = 64'h0000006800000003;
      expv[52] = 64'h0000000000000000;
      expv[53] = 64'h000000c300000002;
      expv[54] = 64'h000000ca00000004;
      expv[55] = 64'h000000ad00000003;
      expv[56] = 64'h0000000800000004;
      expv[57] = 64'h000000d100000002;
      expv[58] = 64'h000000cf00000002;
      expv[59] = 64'h000000f900000002;
      expv[60] = 64'h000000b900000002;
      expv[61] = 64'h000000e900000002;
      expv[62] = 64'h0000003200000003;
      expv[63] = 64'h000000b500000004;
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
