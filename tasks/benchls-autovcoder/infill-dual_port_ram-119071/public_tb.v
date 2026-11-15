// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 41;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_119071 dut (
    .clock1(clk),
    .enable1(in_vec[40:40]),
    .write1(in_vec[39:39]),
    .addr1(in_vec[38:29]),
    .idata1(in_vec[28:21]),
    .clock2(in_vec[20:20]),
    .enable2(in_vec[19:19]),
    .write2(in_vec[18:18]),
    .addr2(in_vec[17:8]),
    .idata2(in_vec[7:0]),
    .odata1(out_vec[15:8]),
    .odata2(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 41'h14446c66f89;
    stim[1] = 41'h163d9b5c1c8;
    stim[2] = 41'h0e7ef91b3b2;
    stim[3] = 41'h0947a53dae0;
    stim[4] = 41'h06a54118d47;
    stim[5] = 41'h147bde4790e;
    stim[6] = 41'h147c8dd26a6;
    stim[7] = 41'h0562f518bd1;
    stim[8] = 41'h01fcb012970;
    stim[9] = 41'h1a9ec1b3e40;
    stim[10] = 41'h1bf14ebcbf1;
    stim[11] = 41'h1828ba2c7f0;
    stim[12] = 41'h0a958d519a9;
    stim[13] = 41'h056c1463885;
    stim[14] = 41'h0378fdfd8fe;
    stim[15] = 41'h191b82e3ac6;
    stim[16] = 41'h028b2d1ca5c;
    stim[17] = 41'h05f464f7f07;
    stim[18] = 41'h1f4697d07c5;
    stim[19] = 41'h0505f089436;
    stim[20] = 41'h089006a8e45;
    stim[21] = 41'h1e91db1536e;
    stim[22] = 41'h00f95ca534c;
    stim[23] = 41'h0bd3950cc1c;
    stim[24] = 41'h0198478cff2;
    stim[25] = 41'h1d688cf1d8b;
    stim[26] = 41'h17e1bc9b038;
    stim[27] = 41'h0071d8fe637;
    stim[28] = 41'h0845751eb5c;
    stim[29] = 41'h0ba31229f4a;
    stim[30] = 41'h150e06314f1;
    stim[31] = 41'h0155590e4fa;
    stim[32] = 41'h083884fb7a5;
    stim[33] = 41'h0111b9c00c3;
    stim[34] = 41'h1af12ea3d49;
    stim[35] = 41'h118cefaafaa;
    stim[36] = 41'h0bc6f50645f;
    stim[37] = 41'h015df02e904;
    stim[38] = 41'h14068e44e3a;
    stim[39] = 41'h0c0dacaa2cf;
    stim[40] = 41'h09ffaa539ff;
    stim[41] = 41'h02890e86324;
    stim[42] = 41'h112c45b66de;
    stim[43] = 41'h17b75289071;
    stim[44] = 41'h043ef2fe382;
    stim[45] = 41'h0d8d95eb210;
    stim[46] = 41'h10117542b98;
    stim[47] = 41'h1387d879f8b;
    stim[48] = 41'h06d46ca85c9;
    stim[49] = 41'h15de3c2f593;
    stim[50] = 41'h16823c13449;
    stim[51] = 41'h138fc839487;
    stim[52] = 41'h17a056278d0;
    stim[53] = 41'h1f2e7d4d88d;
    stim[54] = 41'h0b9bc472a41;
    stim[55] = 41'h0ec4f7f8c0e;
    stim[56] = 41'h07bd0fac8d5;
    stim[57] = 41'h07a944c97d7;
    stim[58] = 41'h01c276dbda9;
    stim[59] = 41'h1f3851ef329;
    stim[60] = 41'h1c9e2a7b327;
    stim[61] = 41'h1fd7594b291;
    stim[62] = 41'h08401e612e7;
    stim[63] = 41'h1305bf8457d;
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
      expv[0] = 16'hxxxx;
      expv[1] = 16'hxxxx;
      expv[2] = 16'hxxxx;
      expv[3] = 16'hxxxx;
      expv[4] = 16'hxxxx;
      expv[5] = 16'hxxxx;
      expv[6] = 16'hxxxx;
      expv[7] = 16'hxxxx;
      expv[8] = 16'hxxxx;
      expv[9] = 16'hxxa6;
      expv[10] = 16'hxxa6;
      expv[11] = 16'h60a6;
      expv[12] = 16'ha7xx;
      expv[13] = 16'h5dxx;
      expv[14] = 16'h5dxx;
      expv[15] = 16'h5dxx;
      expv[16] = 16'h5dfe;
      expv[17] = 16'hc1fe;
      expv[18] = 16'hc1fe;
      expv[19] = 16'hc1fe;
      expv[20] = 16'h4bfe;
      expv[21] = 16'h4bc5;
      expv[22] = 16'h4bc5;
      expv[23] = 16'hedc5;
      expv[24] = 16'hedc5;
      expv[25] = 16'hedc5;
      expv[26] = 16'hedc5;
      expv[27] = 16'h46c5;
      expv[28] = 16'hxxc5;
      expv[29] = 16'hxxc5;
      expv[30] = 16'hxxc5;
      expv[31] = 16'hxxc5;
      expv[32] = 16'hxxc5;
      expv[33] = 16'hxxc5;
      expv[34] = 16'hxxc5;
      expv[35] = 16'hxxc3;
      expv[36] = 16'h97c3;
      expv[37] = 16'hxxc3;
      expv[38] = 16'hxxc3;
      expv[39] = 16'hxxc3;
      expv[40] = 16'hxxc3;
      expv[41] = 16'hxxc3;
      expv[42] = 16'hxxxx;
      expv[43] = 16'hxxxx;
      expv[44] = 16'hxxxx;
      expv[45] = 16'hxxxx;
      expv[46] = 16'hxxxx;
      expv[47] = 16'hxxxx;
      expv[48] = 16'hxxxx;
      expv[49] = 16'hxxxx;
      expv[50] = 16'hxxxx;
      expv[51] = 16'hxxxx;
      expv[52] = 16'hxxxx;
      expv[53] = 16'hxx10;
      expv[54] = 16'hxx10;
      expv[55] = 16'h3e10;
      expv[56] = 16'h3e10;
      expv[57] = 16'h3e10;
      expv[58] = 16'h3e10;
      expv[59] = 16'h3e0e;
      expv[60] = 16'h3e0e;
      expv[61] = 16'h2829;
      expv[62] = 16'h1529;
      expv[63] = 16'hac29;
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
