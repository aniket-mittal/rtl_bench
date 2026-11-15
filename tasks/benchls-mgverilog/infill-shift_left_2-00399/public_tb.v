// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_00399 dut (
    .a(in_vec[31:0]),
    .y(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'h74523795;
    stim[1] = 32'h791433e6;
    stim[2] = 32'hd6fbf218;
    stim[3] = 32'h0ab3dd76;
    stim[4] = 32'h898b7682;
    stim[5] = 32'had113719;
    stim[6] = 32'h78bc9044;
    stim[7] = 32'h592c6a89;
    stim[8] = 32'h9098ac41;
    stim[9] = 32'h47520822;
    stim[10] = 32'h16c2766f;
    stim[11] = 32'h266f0e04;
    stim[12] = 32'h1d25e710;
    stim[13] = 32'hef551bd7;
    stim[14] = 32'h437a5137;
    stim[15] = 32'h8c865c32;
    stim[16] = 32'h9286075d;
    stim[17] = 32'hb7fe187d;
    stim[18] = 32'hce5eeb5d;
    stim[19] = 32'h2fb0a5ff;
    stim[20] = 32'he966785d;
    stim[21] = 32'h49df3881;
    stim[22] = 32'hfbc459f1;
    stim[23] = 32'h33fd9313;
    stim[24] = 32'hffcd1a81;
    stim[25] = 32'h72ec6dfa;
    stim[26] = 32'he2c735df;
    stim[27] = 32'h5db0d547;
    stim[28] = 32'hb62c0969;
    stim[29] = 32'h71b2c064;
    stim[30] = 32'h89ef9c2f;
    stim[31] = 32'h07e46f74;
    stim[32] = 32'h51b096b4;
    stim[33] = 32'hf051c693;
    stim[34] = 32'h70078f2c;
    stim[35] = 32'h5a082745;
    stim[36] = 32'hbf6afd46;
    stim[37] = 32'h8ba4a6c9;
    stim[38] = 32'h0aa984a1;
    stim[39] = 32'h371040e9;
    stim[40] = 32'h6949b1d5;
    stim[41] = 32'h81245549;
    stim[42] = 32'he741c714;
    stim[43] = 32'h5db8fec9;
    stim[44] = 32'h660899e7;
    stim[45] = 32'hd5377d56;
    stim[46] = 32'h909ad467;
    stim[47] = 32'hdfb06ae4;
    stim[48] = 32'h3443ed44;
    stim[49] = 32'hf9b4c0ca;
    stim[50] = 32'h20d72dcd;
    stim[51] = 32'h48c01536;
    stim[52] = 32'h282375b3;
    stim[53] = 32'h48503521;
    stim[54] = 32'hcc0ba559;
    stim[55] = 32'ha56a58a5;
    stim[56] = 32'h816f1fa0;
    stim[57] = 32'he719a2f9;
    stim[58] = 32'hafffa51e;
    stim[59] = 32'h66c8aa10;
    stim[60] = 32'h69239989;
    stim[61] = 32'h8065eeea;
    stim[62] = 32'h5fb7aea1;
    stim[63] = 32'he1d8df18;
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
      expv[0] = 32'hd148de54;
      expv[1] = 32'he450cf98;
      expv[2] = 32'h5befc860;
      expv[3] = 32'h2acf75d8;
      expv[4] = 32'h262dda08;
      expv[5] = 32'hb444dc64;
      expv[6] = 32'he2f24110;
      expv[7] = 32'h64b1aa24;
      expv[8] = 32'h4262b104;
      expv[9] = 32'h1d482088;
      expv[10] = 32'h5b09d9bc;
      expv[11] = 32'h99bc3810;
      expv[12] = 32'h74979c40;
      expv[13] = 32'hbd546f5c;
      expv[14] = 32'h0de944dc;
      expv[15] = 32'h321970c8;
      expv[16] = 32'h4a181d74;
      expv[17] = 32'hdff861f4;
      expv[18] = 32'h397bad74;
      expv[19] = 32'hbec297fc;
      expv[20] = 32'ha599e174;
      expv[21] = 32'h277ce204;
      expv[22] = 32'hef1167c4;
      expv[23] = 32'hcff64c4c;
      expv[24] = 32'hff346a04;
      expv[25] = 32'hcbb1b7e8;
      expv[26] = 32'h8b1cd77c;
      expv[27] = 32'h76c3551c;
      expv[28] = 32'hd8b025a4;
      expv[29] = 32'hc6cb0190;
      expv[30] = 32'h27be70bc;
      expv[31] = 32'h1f91bdd0;
      expv[32] = 32'h46c25ad0;
      expv[33] = 32'hc1471a4c;
      expv[34] = 32'hc01e3cb0;
      expv[35] = 32'h68209d14;
      expv[36] = 32'hfdabf518;
      expv[37] = 32'h2e929b24;
      expv[38] = 32'h2aa61284;
      expv[39] = 32'hdc4103a4;
      expv[40] = 32'ha526c754;
      expv[41] = 32'h04915524;
      expv[42] = 32'h9d071c50;
      expv[43] = 32'h76e3fb24;
      expv[44] = 32'h9822679c;
      expv[45] = 32'h54ddf558;
      expv[46] = 32'h426b519c;
      expv[47] = 32'h7ec1ab90;
      expv[48] = 32'hd10fb510;
      expv[49] = 32'he6d30328;
      expv[50] = 32'h835cb734;
      expv[51] = 32'h230054d8;
      expv[52] = 32'ha08dd6cc;
      expv[53] = 32'h2140d484;
      expv[54] = 32'h302e9564;
      expv[55] = 32'h95a96294;
      expv[56] = 32'h05bc7e80;
      expv[57] = 32'h9c668be4;
      expv[58] = 32'hbffe9478;
      expv[59] = 32'h9b22a840;
      expv[60] = 32'ha48e6624;
      expv[61] = 32'h0197bba8;
      expv[62] = 32'h7edeba84;
      expv[63] = 32'h87637c60;
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
