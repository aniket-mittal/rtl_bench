// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 18;
  localparam OW = 26;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_100846 dut (
    .iCLK(clk),
    .iRST_n(in_vec[17:17]),
    .iBUTTON(in_vec[16:16]),
    .readdata(in_vec[15:0]),
    .write(out_vec[25:25]),
    .writedata(out_vec[24:9]),
    .read(out_vec[8:8]),
    .drv_status_pass(out_vec[7:7]),
    .drv_status_fail(out_vec[6:6]),
    .drv_status_test_complete(out_vec[5:5]),
    .c_state(out_vec[4:1]),
    .same(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 18'h1a756;
    stim[1] = 18'h133a2;
    stim[2] = 18'h2ef0e;
    stim[3] = 18'h34529;
    stim[4] = 18'h21cfc;
    stim[5] = 18'h37e2e;
    stim[6] = 18'h35470;
    stim[7] = 18'h3cb04;
    stim[8] = 18'h2066d;
    stim[9] = 18'h2250b;
    stim[10] = 18'h30ecd;
    stim[11] = 18'h351e5;
    stim[12] = 18'h39f1d;
    stim[13] = 18'h2522f;
    stim[14] = 18'h2ae15;
    stim[15] = 18'h338fb;
    stim[16] = 18'h2bac3;
    stim[17] = 18'h21d52;
    stim[18] = 18'h20b05;
    stim[19] = 18'h31764;
    stim[20] = 18'h31f56;
    stim[21] = 18'h23f5e;
    stim[22] = 18'h28626;
    stim[23] = 18'h2585d;
    stim[24] = 18'h3a7d8;
    stim[25] = 18'h2098a;
    stim[26] = 18'h20f2e;
    stim[27] = 18'h287e9;
    stim[28] = 18'h3e7ab;
    stim[29] = 18'h2d5c0;
    stim[30] = 18'h2fbb0;
    stim[31] = 18'h20022;
    stim[32] = 18'h3a4d9;
    stim[33] = 18'h24727;
    stim[34] = 18'h2f575;
    stim[35] = 18'h28411;
    stim[36] = 18'h3f397;
    stim[37] = 18'h3925a;
    stim[38] = 18'h3024d;
    stim[39] = 18'h2e81e;
    stim[40] = 18'h3a03b;
    stim[41] = 18'h2af71;
    stim[42] = 18'h3b598;
    stim[43] = 18'h32659;
    stim[44] = 18'h3487f;
    stim[45] = 18'h2c70d;
    stim[46] = 18'h378ea;
    stim[47] = 18'h3a454;
    stim[48] = 18'h2b660;
    stim[49] = 18'h3bda5;
    stim[50] = 18'h3bcb0;
    stim[51] = 18'h3b9c1;
    stim[52] = 18'h20a48;
    stim[53] = 18'h2fdab;
    stim[54] = 18'h3f792;
    stim[55] = 18'h2a355;
    stim[56] = 18'h2ce51;
    stim[57] = 18'h2310f;
    stim[58] = 18'h379da;
    stim[59] = 18'h3b0c1;
    stim[60] = 18'h25135;
    stim[61] = 18'h3c208;
    stim[62] = 18'h2e925;
    stim[63] = 18'h2b4ca;
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
      expv[0] = 26'hxxxxxxx;
      expv[1] = 26'h0000000;
      expv[2] = 26'h0000000;
      expv[3] = 26'h0000000;
      expv[4] = 26'h0000000;
      expv[5] = 26'h0000002;
      expv[6] = 26'h0000002;
      expv[7] = 26'h0000002;
      expv[8] = 26'h0000002;
      expv[9] = 26'h0000002;
      expv[10] = 26'h0000002;
      expv[11] = 26'h0000002;
      expv[12] = 26'h0000002;
      expv[13] = 26'h0000002;
      expv[14] = 26'h2000004;
      expv[15] = 26'h0000006;
      expv[16] = 26'h0000002;
      expv[17] = 26'h0000002;
      expv[18] = 26'h0000002;
      expv[19] = 26'h0000002;
      expv[20] = 26'h0000002;
      expv[21] = 26'h0000002;
      expv[22] = 26'h0000002;
      expv[23] = 26'h0000002;
      expv[24] = 26'h0000002;
      expv[25] = 26'h2000004;
      expv[26] = 26'h0000006;
      expv[27] = 26'h0000002;
      expv[28] = 26'h0000002;
      expv[29] = 26'h0000002;
      expv[30] = 26'h0000002;
      expv[31] = 26'h0000002;
      expv[32] = 26'h0000002;
      expv[33] = 26'h0000002;
      expv[34] = 26'h0000002;
      expv[35] = 26'h0000002;
      expv[36] = 26'h2000004;
      expv[37] = 26'h0000006;
      expv[38] = 26'h0000002;
      expv[39] = 26'h0000002;
      expv[40] = 26'h0000002;
      expv[41] = 26'h0000002;
      expv[42] = 26'h0000002;
      expv[43] = 26'h0000002;
      expv[44] = 26'h0000002;
      expv[45] = 26'h0000002;
      expv[46] = 26'h0000002;
      expv[47] = 26'h2000004;
      expv[48] = 26'h0000006;
      expv[49] = 26'h0000002;
      expv[50] = 26'h0000002;
      expv[51] = 26'h0000002;
      expv[52] = 26'h0000002;
      expv[53] = 26'h0000002;
      expv[54] = 26'h0000002;
      expv[55] = 26'h0000002;
      expv[56] = 26'h0000002;
      expv[57] = 26'h0000002;
      expv[58] = 26'h2000004;
      expv[59] = 26'h0000006;
      expv[60] = 26'h0000002;
      expv[61] = 26'h0000002;
      expv[62] = 26'h0000002;
      expv[63] = 26'h0000002;
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
