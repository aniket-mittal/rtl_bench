// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 58;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_128166 dut (
    .clk(clk),
    .rst(in_vec[32:32]),
    .RAM_D_pi(in_vec[31:0]),
    .RAM_D_po(out_vec[57:26]),
    .RAM_D_poe(out_vec[25:25]),
    .RAM_A(out_vec[24:6]),
    .RAM_WEn(out_vec[5:5]),
    .RAM_CENn(out_vec[4:4]),
    .RAM_LDn(out_vec[3:3]),
    .RAM_OEn(out_vec[2:2]),
    .RAM_CE1n(out_vec[1:1]),
    .correct(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h1c3ec9374;
    stim[1] = 33'h1399748be;
    stim[2] = 33'h01c3fa038;
    stim[3] = 33'h0776e7823;
    stim[4] = 33'h069542751;
    stim[5] = 33'h0a8250292;
    stim[6] = 33'h0bdce21a8;
    stim[7] = 33'h031129485;
    stim[8] = 33'h05b9c4d56;
    stim[9] = 33'h0bfdf624f;
    stim[10] = 33'h033eb7f52;
    stim[11] = 33'h0f966085e;
    stim[12] = 33'h02d7a3b9c;
    stim[13] = 33'h0dc88a9ce;
    stim[14] = 33'h01a7cc80a;
    stim[15] = 33'h0d313ea95;
    stim[16] = 33'h1a51b464e;
    stim[17] = 33'h0ac97506b;
    stim[18] = 33'h06c2db4ff;
    stim[19] = 33'h0b952b9e7;
    stim[20] = 33'h04675ec6f;
    stim[21] = 33'h05730de85;
    stim[22] = 33'h09bba1529;
    stim[23] = 33'h081956c32;
    stim[24] = 33'h0b473730d;
    stim[25] = 33'h068e00c1e;
    stim[26] = 33'h05f6ac986;
    stim[27] = 33'h15af66555;
    stim[28] = 33'h07c29d052;
    stim[29] = 33'h06ddb7c97;
    stim[30] = 33'h0fef0f625;
    stim[31] = 33'h03c0547d0;
    stim[32] = 33'h0b3777710;
    stim[33] = 33'h0ec3027dc;
    stim[34] = 33'h0b8b448f6;
    stim[35] = 33'h147ce1210;
    stim[36] = 33'h061a1735d;
    stim[37] = 33'h068a132ec;
    stim[38] = 33'h04d62ed21;
    stim[39] = 33'h031fb678b;
    stim[40] = 33'h0f4436894;
    stim[41] = 33'h01db04ba1;
    stim[42] = 33'h0ed2b2474;
    stim[43] = 33'h005ab50a2;
    stim[44] = 33'h1e291a744;
    stim[45] = 33'h0826b7b04;
    stim[46] = 33'h09fc0a950;
    stim[47] = 33'h031d77e30;
    stim[48] = 33'h037bc3f44;
    stim[49] = 33'h02a6e3df9;
    stim[50] = 33'h00657521e;
    stim[51] = 33'h034cead7c;
    stim[52] = 33'h0980b935e;
    stim[53] = 33'h14e99490d;
    stim[54] = 33'h066b0e080;
    stim[55] = 33'h02bd2fbd4;
    stim[56] = 33'h02b747885;
    stim[57] = 33'h05af3bf0b;
    stim[58] = 33'h0be2d0f5d;
    stim[59] = 33'h07eb825e7;
    stim[60] = 33'h0af493088;
    stim[61] = 33'h0ef7910c7;
    stim[62] = 33'h1376710f1;
    stim[63] = 33'h0ac427e97;
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
      expv[0] = 58'h00000000000003f;
      expv[1] = 58'h00000000000003f;
      expv[2] = 58'h00000000000003f;
      expv[3] = 58'h00000000000003f;
      expv[4] = 58'h000000002000005;
      expv[5] = 58'h000000002000005;
      expv[6] = 58'h000000006000045;
      expv[7] = 58'h000000006000045;
      expv[8] = 58'h00000000a000085;
      expv[9] = 58'h00000000a000085;
      expv[10] = 58'h00000000e0000c5;
      expv[11] = 58'h00000000e0000c5;
      expv[12] = 58'h000000012000105;
      expv[13] = 58'h000000012000105;
      expv[14] = 58'h000000016000145;
      expv[15] = 58'h000000016000145;
      expv[16] = 58'h00000000000003f;
      expv[17] = 58'h00000000000003f;
      expv[18] = 58'h00000000000003f;
      expv[19] = 58'h000000002000005;
      expv[20] = 58'h000000002000005;
      expv[21] = 58'h000000006000045;
      expv[22] = 58'h000000006000045;
      expv[23] = 58'h00000000a000085;
      expv[24] = 58'h00000000a000085;
      expv[25] = 58'h00000000e0000c5;
      expv[26] = 58'h00000000e0000c5;
      expv[27] = 58'h00000000000003f;
      expv[28] = 58'h00000000000003f;
      expv[29] = 58'h00000000000003f;
      expv[30] = 58'h000000002000005;
      expv[31] = 58'h000000002000005;
      expv[32] = 58'h000000006000045;
      expv[33] = 58'h000000006000045;
      expv[34] = 58'h00000000a000085;
      expv[35] = 58'h00000000000003f;
      expv[36] = 58'h00000000000003f;
      expv[37] = 58'h00000000000003f;
      expv[38] = 58'h000000002000005;
      expv[39] = 58'h000000002000005;
      expv[40] = 58'h000000006000045;
      expv[41] = 58'h000000006000045;
      expv[42] = 58'h00000000a000085;
      expv[43] = 58'h00000000a000085;
      expv[44] = 58'h00000000000003f;
      expv[45] = 58'h00000000000003f;
      expv[46] = 58'h00000000000003f;
      expv[47] = 58'h000000002000005;
      expv[48] = 58'h000000002000005;
      expv[49] = 58'h000000006000045;
      expv[50] = 58'h000000006000045;
      expv[51] = 58'h00000000a000085;
      expv[52] = 58'h00000000a000085;
      expv[53] = 58'h00000000000003f;
      expv[54] = 58'h00000000000003f;
      expv[55] = 58'h00000000000003f;
      expv[56] = 58'h000000002000005;
      expv[57] = 58'h000000002000005;
      expv[58] = 58'h000000006000045;
      expv[59] = 58'h000000006000045;
      expv[60] = 58'h00000000a000085;
      expv[61] = 58'h00000000a000085;
      expv[62] = 58'h00000000000003f;
      expv[63] = 58'h00000000000003f;
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
