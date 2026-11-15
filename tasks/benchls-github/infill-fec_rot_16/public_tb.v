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

  fec_rot_16 dut (
    .c(in_vec[31:0]),
    .co(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'h013d1e1b;
    stim[1] = 32'haaf75350;
    stim[2] = 32'h5a2987c3;
    stim[3] = 32'h0117dcae;
    stim[4] = 32'hb40dbf55;
    stim[5] = 32'h1ad61520;
    stim[6] = 32'h88be51a0;
    stim[7] = 32'h26ba52e1;
    stim[8] = 32'hf4574bda;
    stim[9] = 32'hb4607ba2;
    stim[10] = 32'h83e2cee6;
    stim[11] = 32'hf27fd2fe;
    stim[12] = 32'h7e307d19;
    stim[13] = 32'hf28d84e9;
    stim[14] = 32'h8aea3842;
    stim[15] = 32'hdd3253f9;
    stim[16] = 32'h922f128d;
    stim[17] = 32'hdcc8eea4;
    stim[18] = 32'hf6871013;
    stim[19] = 32'he2726254;
    stim[20] = 32'hd425947d;
    stim[21] = 32'h5ec46337;
    stim[22] = 32'h1922bfda;
    stim[23] = 32'h23b41b3f;
    stim[24] = 32'h064041f5;
    stim[25] = 32'hea3e4925;
    stim[26] = 32'hdcc0ff00;
    stim[27] = 32'hef4ec3d3;
    stim[28] = 32'h740ab860;
    stim[29] = 32'ha71a88fc;
    stim[30] = 32'h04c12d01;
    stim[31] = 32'h2e1cf7d0;
    stim[32] = 32'h7660a907;
    stim[33] = 32'hb4b55d24;
    stim[34] = 32'hf327c7b9;
    stim[35] = 32'h930a6ebc;
    stim[36] = 32'h120288c0;
    stim[37] = 32'hc21ab744;
    stim[38] = 32'h7fd44553;
    stim[39] = 32'h54bca207;
    stim[40] = 32'h7dee10f6;
    stim[41] = 32'h236745ce;
    stim[42] = 32'hf2801fef;
    stim[43] = 32'he1aec02d;
    stim[44] = 32'h9546c91a;
    stim[45] = 32'hd2efdaea;
    stim[46] = 32'hf1005092;
    stim[47] = 32'heb0dfbf7;
    stim[48] = 32'h77a90d91;
    stim[49] = 32'h72649135;
    stim[50] = 32'h10b307bb;
    stim[51] = 32'h7a7b63e6;
    stim[52] = 32'head73093;
    stim[53] = 32'h3a815113;
    stim[54] = 32'h7bdf19a3;
    stim[55] = 32'h0e53bb75;
    stim[56] = 32'hd58cc081;
    stim[57] = 32'h077bdf99;
    stim[58] = 32'h20059802;
    stim[59] = 32'h14c52ee4;
    stim[60] = 32'h93555a38;
    stim[61] = 32'h2c8fcfc3;
    stim[62] = 32'hc97f9e34;
    stim[63] = 32'h4e65d018;
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
      expv[0] = 32'ha732edc9;
      expv[1] = 32'h5b67b86b;
      expv[2] = 32'hc3724a33;
      expv[3] = 32'h75c6bd4b;
      expv[4] = 32'h12556d45;
      expv[5] = 32'h22f6b1b8;
      expv[6] = 32'h3d05f347;
      expv[7] = 32'hd0f4d419;
      expv[8] = 32'hd398bcff;
      expv[9] = 32'hed81049c;
      expv[10] = 32'h6519157f;
      expv[11] = 32'h9a6dfa78;
      expv[12] = 32'hbee88600;
      expv[13] = 32'hab3d6942;
      expv[14] = 32'h34d55046;
      expv[15] = 32'h5e70905b;
      expv[16] = 32'h629c7ba4;
      expv[17] = 32'h21624649;
      expv[18] = 32'hbae73d6a;
      expv[19] = 32'h29279263;
      expv[20] = 32'h32fc2d01;
      expv[21] = 32'hcdc12560;
      expv[22] = 32'h0c331599;
      expv[23] = 32'hbe82a525;
      expv[24] = 32'ha827074f;
      expv[25] = 32'h2fb4f30e;
      expv[26] = 32'h35c60661;
      expv[27] = 32'hb22973b4;
      expv[28] = 32'h230054c6;
      expv[29] = 32'hc8e4d229;
      expv[30] = 32'hd4c70fcf;
      expv[31] = 32'h3060e636;
      expv[32] = 32'h4a940701;
      expv[33] = 32'hbb21af1d;
      expv[34] = 32'h08203e40;
      expv[35] = 32'ha8845615;
      expv[36] = 32'hcdf0122d;
      expv[37] = 32'hccb4d3ef;
      expv[38] = 32'h482da074;
      expv[39] = 32'h7d22e6ec;
      expv[40] = 32'h477972a3;
      expv[41] = 32'h93953eba;
      expv[42] = 32'h371b017b;
      expv[43] = 32'h1e6076ca;
      expv[44] = 32'he1703166;
      expv[45] = 32'hc1fd78ec;
      expv[46] = 32'hc8da04fe;
      expv[47] = 32'h228f6ef1;
      expv[48] = 32'h33ac49ec;
      expv[49] = 32'hf146231f;
      expv[50] = 32'h4c9e9a5d;
      expv[51] = 32'h0d95db6d;
      expv[52] = 32'h3fa5b843;
      expv[53] = 32'h4e2708f7;
      expv[54] = 32'h915dfc59;
      expv[55] = 32'h5b279f01;
      expv[56] = 32'h87ad620c;
      expv[57] = 32'h8ca2da98;
      expv[58] = 32'h93a22855;
      expv[59] = 32'hd1622ff9;
      expv[60] = 32'hb862af36;
      expv[61] = 32'h13277eec;
      expv[62] = 32'h393ffd0a;
      expv[63] = 32'h3e8b2f67;
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
