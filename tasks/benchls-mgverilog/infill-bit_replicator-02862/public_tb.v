// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02862 dut (
    .data_in(in_vec[31:0]),
    .data_out(out_vec[63:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'h0ff6daf3;
    stim[1] = 32'h5b2399a4;
    stim[2] = 32'h8bdd5209;
    stim[3] = 32'h05256598;
    stim[4] = 32'h4d1369be;
    stim[5] = 32'h81aeae9c;
    stim[6] = 32'h2f59de69;
    stim[7] = 32'hd98be859;
    stim[8] = 32'hccaf1e14;
    stim[9] = 32'h9688ddc5;
    stim[10] = 32'h11b3cd8c;
    stim[11] = 32'hf2042fee;
    stim[12] = 32'hecadaa83;
    stim[13] = 32'h04c61014;
    stim[14] = 32'h3025a8a0;
    stim[15] = 32'hecd416bd;
    stim[16] = 32'h6b4ee12a;
    stim[17] = 32'h84ecfda9;
    stim[18] = 32'h39ea0d65;
    stim[19] = 32'h43daddd7;
    stim[20] = 32'h6a110594;
    stim[21] = 32'h8549218e;
    stim[22] = 32'h0877e61f;
    stim[23] = 32'h72d3a413;
    stim[24] = 32'h8e8d680b;
    stim[25] = 32'hbb5a07fa;
    stim[26] = 32'h4adcf362;
    stim[27] = 32'hc14c13a2;
    stim[28] = 32'ha3d64ecf;
    stim[29] = 32'ha0e67ff6;
    stim[30] = 32'hba356f02;
    stim[31] = 32'h283268d9;
    stim[32] = 32'hb7dd4993;
    stim[33] = 32'hccb34c37;
    stim[34] = 32'h3d108183;
    stim[35] = 32'ha29b3bb7;
    stim[36] = 32'hde55bee2;
    stim[37] = 32'hd153bd0a;
    stim[38] = 32'hcfb116d5;
    stim[39] = 32'haee786d0;
    stim[40] = 32'hbde7d9dd;
    stim[41] = 32'h836002da;
    stim[42] = 32'h5a37aaea;
    stim[43] = 32'hfd1294a4;
    stim[44] = 32'h63e4cca2;
    stim[45] = 32'h23dc0f78;
    stim[46] = 32'he5f20fc6;
    stim[47] = 32'h8648bc6a;
    stim[48] = 32'h48115435;
    stim[49] = 32'hedd4f418;
    stim[50] = 32'hc24b658d;
    stim[51] = 32'h5a45e63f;
    stim[52] = 32'hf3b57303;
    stim[53] = 32'h06045d14;
    stim[54] = 32'h3d05aeb1;
    stim[55] = 32'heecc7d97;
    stim[56] = 32'h4a3dd2f1;
    stim[57] = 32'ha2915918;
    stim[58] = 32'he49c69d8;
    stim[59] = 32'hf860f003;
    stim[60] = 32'h04ebec4a;
    stim[61] = 32'h6709ca7a;
    stim[62] = 32'hcb648083;
    stim[63] = 32'h4d94d3a9;
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
      expv[0] = 64'h00ffff3cf3ccff0f;
      expv[1] = 64'h33cf0c0fc3c3cc30;
      expv[2] = 64'hc0cff3f3330c00c3;
      expv[3] = 64'h00330c333c33c3c0;
      expv[4] = 64'h30f3030f3cc3cffc;
      expv[5] = 64'hc003ccfcccfcc3f0;
      expv[6] = 64'h0cff33c3f3fc3cc3;
      expv[7] = 64'hf3c3c0cffcc033c3;
      expv[8] = 64'hf0f0ccff03fc0330;
      expv[9] = 64'hc33cc0c0f3f3f033;
      expv[10] = 64'h0303cf0ff0f3c0f0;
      expv[11] = 64'hff0c00300cfffcfc;
      expv[12] = 64'hfcf0ccf3ccccc00f;
      expv[13] = 64'h0030f03c03000330;
      expv[14] = 64'h0f000c33ccc0cc00;
      expv[15] = 64'hfcf0f330033ccff3;
      expv[16] = 64'h3ccf30fcfc030ccc;
      expv[17] = 64'hc030fcf0fff3ccc3;
      expv[18] = 64'h0fc3fccc00f33c33;
      expv[19] = 64'h300ff3ccf3f3f33f;
      expv[20] = 64'h3ccc03030033c330;
      expv[21] = 64'hc03330c30c03c0fc;
      expv[22] = 64'h00c03f3ffc3c03ff;
      expv[23] = 64'h3f0cf30fcc30030f;
      expv[24] = 64'hc0fcc0f33cc000cf;
      expv[25] = 64'hcfcf33cc003fffcc;
      expv[26] = 64'h30ccf3f0ff0f3c0c;
      expv[27] = 64'hf00330f0030fcc0c;
      expv[28] = 64'hcc0ff33c30fcf0ff;
      expv[29] = 64'hcc00fc3c3fffff3c;
      expv[30] = 64'hcfcc0f333cff000c;
      expv[31] = 64'h0cc00f0c3cc0f3c3;
      expv[32] = 64'hcf3ff3f330c3c30f;
      expv[33] = 64'hf0f0cf0f30f00f3f;
      expv[34] = 64'h0ff30300c003c00f;
      expv[35] = 64'hcc0cc3cf0fcfcf3f;
      expv[36] = 64'hf3fc3333cffcfc0c;
      expv[37] = 64'hf303330fcff300cc;
      expv[38] = 64'hf0ffcf03033cf333;
      expv[39] = 64'hccfcfc3fc03cf300;
      expv[40] = 64'hcff3fc3ff3c3f3f3;
      expv[41] = 64'hc00f3c00000cf3cc;
      expv[42] = 64'h33cc0f3fccccfccc;
      expv[43] = 64'hfff3030cc330cc30;
      expv[44] = 64'h3c0ffc30f0f0cc0c;
      expv[45] = 64'h0c0ff3f000ff3fc0;
      expv[46] = 64'hfc33ff0c00fff03c;
      expv[47] = 64'hc03c30c0cff03ccc;
      expv[48] = 64'h30c0030333300f33;
      expv[49] = 64'hfcf3f330ff3003c0;
      expv[50] = 64'hf00c30cf3c33c0f3;
      expv[51] = 64'h33cc3033fc3c0fff;
      expv[52] = 64'hff0fcf333f0f000f;
      expv[53] = 64'h003c003033f30330;
      expv[54] = 64'h0ff30033ccfccf03;
      expv[55] = 64'hfcfcf0f03ff3c33f;
      expv[56] = 64'h30cc0ff3f30cff03;
      expv[57] = 64'hcc0cc30333c303c0;
      expv[58] = 64'hfc30c3f03cc3f3c0;
      expv[59] = 64'hffc03c00ff00000f;
      expv[60] = 64'h0030fccffcf030cc;
      expv[61] = 64'h3c3f00c3f0cc3fcc;
      expv[62] = 64'hf0cf3c30c000c00f;
      expv[63] = 64'h30f3c330f30fccc3;
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
