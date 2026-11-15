// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 76;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_045017 dut (
    .aluop(in_vec[75:64]),
    .alu_in_1(in_vec[63:32]),
    .alu_in_2(in_vec[31:0]),
    .result(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 76'h850af257764f7c5d3e3;
    stim[1] = 76'hffc312d5012d74694c6;
    stim[2] = 76'h5404b36c897b0141049;
    stim[3] = 76'ha80c6ac9ae5db7a392f;
    stim[4] = 76'hb72e68565936bcf1848;
    stim[5] = 76'hb60a54ba382aeb1406b;
    stim[6] = 76'h1acf5d9c728c6e11e4f;
    stim[7] = 76'h0adfc8f7055648f4997;
    stim[8] = 76'he475ea8e11d809a7efa;
    stim[9] = 76'had6a0b470bdfced1db9;
    stim[10] = 76'ha2e50c990566d50716b;
    stim[11] = 76'h53c0e3c4fa86c8e27af;
    stim[12] = 76'h4e2526a82ebee42faa3;
    stim[13] = 76'he5e1e9ab564d371c262;
    stim[14] = 76'hf24a5b8a0d196281b67;
    stim[15] = 76'h8acceff036c590e743e;
    stim[16] = 76'hb940c424126020bfe6b;
    stim[17] = 76'hb83af43b4506cbb4e4c;
    stim[18] = 76'h13ecad23b02c0e253a3;
    stim[19] = 76'h73e99452cf789de4597;
    stim[20] = 76'h1a645725d166b4f23df;
    stim[21] = 76'h633c43049deec37076c;
    stim[22] = 76'he35ad31e371a7e45139;
    stim[23] = 76'h5b89f2351f6438fdb98;
    stim[24] = 76'hef26b51ec0847fa654a;
    stim[25] = 76'haf49da19589e5ae025f;
    stim[26] = 76'h4d9b42abc655aa8be44;
    stim[27] = 76'he1e8fbc2d21188bb6c3;
    stim[28] = 76'hcb961ef2048a2cdf199;
    stim[29] = 76'h2bbe3f7211e5348a6e2;
    stim[30] = 76'hdb9b907157583f17b0d;
    stim[31] = 76'he2e622b905863e8b3d4;
    stim[32] = 76'habd28cbf872547e39ad;
    stim[33] = 76'h0697585dd2cd9beaeed;
    stim[34] = 76'h726ec0ed6cb0acddb7e;
    stim[35] = 76'hdf3d0174c420246b408;
    stim[36] = 76'h29df88fda36cb0a72d6;
    stim[37] = 76'h76e4dc70ecd6c2566e8;
    stim[38] = 76'h93a17a3dc5f845cde3c;
    stim[39] = 76'h56796f21c97431d823a;
    stim[40] = 76'h284bad080d46aea35a7;
    stim[41] = 76'h6650916fd12dfdf3d48;
    stim[42] = 76'h48d802154207af68851;
    stim[43] = 76'h487e15e2f04b3b001a5;
    stim[44] = 76'h6aaec0b1fef9969fd15;
    stim[45] = 76'h502c3ad163461269e4a;
    stim[46] = 76'h25c2268c78b828dee38;
    stim[47] = 76'hff2e5c2f5d5d3de9968;
    stim[48] = 76'h7bf6c6c7d56bb927a33;
    stim[49] = 76'hbf0ce7fdfe3de28a648;
    stim[50] = 76'h59a6f4a1b35adf1102a;
    stim[51] = 76'h9981ca1a9ec96750747;
    stim[52] = 76'ha745c758f5150eacdc5;
    stim[53] = 76'hd4dbd947d70d9fb314e;
    stim[54] = 76'hfa912f11747685eda5e;
    stim[55] = 76'hfe3752ecaf26826826f;
    stim[56] = 76'hed19d86b7c4e2f2c756;
    stim[57] = 76'h2071a7eb985ae80c537;
    stim[58] = 76'h99b6df8320f4d8bea26;
    stim[59] = 76'hb01bb291f6d0e10cc65;
    stim[60] = 76'h82466ec801abbb03385;
    stim[61] = 76'hebb6b8a250004f381d6;
    stim[62] = 76'hb5422812f1a8d297dc0;
    stim[63] = 76'h2fb6462d2585667a137;
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
      expv[0] = 32'h00000000;
      expv[1] = 32'h00000000;
      expv[2] = 32'h00000000;
      expv[3] = 32'h00000000;
      expv[4] = 32'h00000000;
      expv[5] = 32'h00000000;
      expv[6] = 32'h00000000;
      expv[7] = 32'h00000000;
      expv[8] = 32'h00000000;
      expv[9] = 32'h00000000;
      expv[10] = 32'h00000000;
      expv[11] = 32'h00000000;
      expv[12] = 32'h00000000;
      expv[13] = 32'h00000000;
      expv[14] = 32'h00000000;
      expv[15] = 32'h00000000;
      expv[16] = 32'h00000000;
      expv[17] = 32'h00000000;
      expv[18] = 32'h00000000;
      expv[19] = 32'h00000000;
      expv[20] = 32'h00000000;
      expv[21] = 32'h00000000;
      expv[22] = 32'h00000000;
      expv[23] = 32'h00000000;
      expv[24] = 32'h00000000;
      expv[25] = 32'h00000000;
      expv[26] = 32'h00000000;
      expv[27] = 32'h00000000;
      expv[28] = 32'h00000000;
      expv[29] = 32'h00000000;
      expv[30] = 32'h00000000;
      expv[31] = 32'h00000000;
      expv[32] = 32'h00000000;
      expv[33] = 32'h00000000;
      expv[34] = 32'h00000000;
      expv[35] = 32'h00000000;
      expv[36] = 32'h00000000;
      expv[37] = 32'h00000000;
      expv[38] = 32'h00000000;
      expv[39] = 32'h00000000;
      expv[40] = 32'h00000000;
      expv[41] = 32'h00000000;
      expv[42] = 32'h00000000;
      expv[43] = 32'h00000000;
      expv[44] = 32'h00000000;
      expv[45] = 32'h00000000;
      expv[46] = 32'h00000000;
      expv[47] = 32'h00000000;
      expv[48] = 32'h00000000;
      expv[49] = 32'h00000000;
      expv[50] = 32'h00000000;
      expv[51] = 32'h00000000;
      expv[52] = 32'h00000000;
      expv[53] = 32'h00000000;
      expv[54] = 32'h00000000;
      expv[55] = 32'h00000000;
      expv[56] = 32'h00000000;
      expv[57] = 32'h00000000;
      expv[58] = 32'h00000000;
      expv[59] = 32'h00000000;
      expv[60] = 32'h00000000;
      expv[61] = 32'h00000000;
      expv[62] = 32'h00000000;
      expv[63] = 32'h00000000;
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
