// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 30;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_138694 dut (
    .voltage(in_vec[9:2]),
    .charge(in_vec[1:1]),
    .discharge(in_vec[0:0]),
    .icharge(out_vec[29:22]),
    .idischg(out_vec[21:14]),
    .soc(out_vec[13:7]),
    .soh(out_vec[6:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h37b;
    stim[1] = 10'h207;
    stim[2] = 10'h070;
    stim[3] = 10'h24f;
    stim[4] = 10'h14b;
    stim[5] = 10'h2ed;
    stim[6] = 10'h1a3;
    stim[7] = 10'h2aa;
    stim[8] = 10'h0b6;
    stim[9] = 10'h2ba;
    stim[10] = 10'h3ea;
    stim[11] = 10'h355;
    stim[12] = 10'h3c8;
    stim[13] = 10'h1e0;
    stim[14] = 10'h3c1;
    stim[15] = 10'h07a;
    stim[16] = 10'h37b;
    stim[17] = 10'h249;
    stim[18] = 10'h1a9;
    stim[19] = 10'h13d;
    stim[20] = 10'h3f9;
    stim[21] = 10'h148;
    stim[22] = 10'h195;
    stim[23] = 10'h276;
    stim[24] = 10'h125;
    stim[25] = 10'h3b4;
    stim[26] = 10'h2c5;
    stim[27] = 10'h2fa;
    stim[28] = 10'h17a;
    stim[29] = 10'h23d;
    stim[30] = 10'h0f1;
    stim[31] = 10'h16f;
    stim[32] = 10'h2e0;
    stim[33] = 10'h3d2;
    stim[34] = 10'h0e4;
    stim[35] = 10'h176;
    stim[36] = 10'h105;
    stim[37] = 10'h2fd;
    stim[38] = 10'h14f;
    stim[39] = 10'h19f;
    stim[40] = 10'h1ee;
    stim[41] = 10'h36a;
    stim[42] = 10'h1fa;
    stim[43] = 10'h157;
    stim[44] = 10'h121;
    stim[45] = 10'h1d2;
    stim[46] = 10'h0dc;
    stim[47] = 10'h117;
    stim[48] = 10'h151;
    stim[49] = 10'h031;
    stim[50] = 10'h2c0;
    stim[51] = 10'h3c5;
    stim[52] = 10'h184;
    stim[53] = 10'h07d;
    stim[54] = 10'h144;
    stim[55] = 10'h2bc;
    stim[56] = 10'h1a3;
    stim[57] = 10'h105;
    stim[58] = 10'h2d1;
    stim[59] = 10'h26e;
    stim[60] = 10'h336;
    stim[61] = 10'h153;
    stim[62] = 10'h1d2;
    stim[63] = 10'h0fa;
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
      expv[0] = 30'h040c3263;
      expv[1] = 30'h040c1c63;
      expv[2] = 30'h000031e4;
      expv[3] = 30'h040c2263;
      expv[4] = 30'h080c0be3;
      expv[5] = 30'h000c3063;
      expv[6] = 30'h080c1363;
      expv[7] = 30'h04002a64;
      expv[8] = 30'h08003264;
      expv[9] = 30'h04002be4;
      expv[10] = 30'h04000664;
      expv[11] = 30'h000c3263;
      expv[12] = 30'h00000364;
      expv[13] = 30'h00001964;
      expv[14] = 30'h000c02e3;
      expv[15] = 30'h08003264;
      expv[16] = 30'h040c3263;
      expv[17] = 30'h000c2263;
      expv[18] = 30'h000c1463;
      expv[19] = 30'h000c0ae3;
      expv[20] = 30'h000c07e3;
      expv[21] = 30'h00000be4;
      expv[22] = 30'h000c1263;
      expv[23] = 30'h040025e4;
      expv[24] = 30'h000c08e3;
      expv[25] = 30'h000001e4;
      expv[26] = 30'h000c2ce3;
      expv[27] = 30'h04003164;
      expv[28] = 30'h08000fe4;
      expv[29] = 30'h000c20e3;
      expv[30] = 30'h00080464;
      expv[31] = 30'h080c0ee3;
      expv[32] = 30'h00002f64;
      expv[33] = 30'h04000464;
      expv[34] = 30'h00000364;
      expv[35] = 30'h08000fe4;
      expv[36] = 30'h000c05e3;
      expv[37] = 30'h000c31e3;
      expv[38] = 30'h080c0c63;
      expv[39] = 30'h080c1363;
      expv[40] = 30'h08001a64;
      expv[41] = 30'h04003264;
      expv[42] = 30'h08001b64;
      expv[43] = 30'h080c0ce3;
      expv[44] = 30'h000c0863;
      expv[45] = 30'h080017e4;
      expv[46] = 30'h00000264;
      expv[47] = 30'h080c0763;
      expv[48] = 30'h000c0ce3;
      expv[49] = 30'h00082c64;
      expv[50] = 30'h00002c64;
      expv[51] = 30'h000c0363;
      expv[52] = 30'h00001164;
      expv[53] = 30'h00083264;
      expv[54] = 30'h00000b64;
      expv[55] = 30'h00002c64;
      expv[56] = 30'h080c1363;
      expv[57] = 30'h000c05e3;
      expv[58] = 30'h000c2de3;
      expv[59] = 30'h04002564;
      expv[60] = 30'h04003264;
      expv[61] = 30'h080c0ce3;
      expv[62] = 30'h080017e4;
      expv[63] = 30'h080004e4;
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
