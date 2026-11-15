// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 18;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01578 dut (
    .op(in_vec[17:16]),
    .din(in_vec[15:0]),
    .dout(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 18'h26b3c;
    stim[1] = 18'h0e5cd;
    stim[2] = 18'h3d39a;
    stim[3] = 18'h3ca48;
    stim[4] = 18'h100c0;
    stim[5] = 18'h0c364;
    stim[6] = 18'h3eea9;
    stim[7] = 18'h0a224;
    stim[8] = 18'h0037f;
    stim[9] = 18'h3bed3;
    stim[10] = 18'h3b035;
    stim[11] = 18'h2e7ac;
    stim[12] = 18'h2d3c6;
    stim[13] = 18'h175f8;
    stim[14] = 18'h330ff;
    stim[15] = 18'h066aa;
    stim[16] = 18'h1791c;
    stim[17] = 18'h244c3;
    stim[18] = 18'h1ce22;
    stim[19] = 18'h2eaaf;
    stim[20] = 18'h3b6b5;
    stim[21] = 18'h39548;
    stim[22] = 18'h03287;
    stim[23] = 18'h2916d;
    stim[24] = 18'h0e740;
    stim[25] = 18'h21b86;
    stim[26] = 18'h0b3b1;
    stim[27] = 18'h01aa6;
    stim[28] = 18'h18a1f;
    stim[29] = 18'h17958;
    stim[30] = 18'h3efd6;
    stim[31] = 18'h0f791;
    stim[32] = 18'h24a69;
    stim[33] = 18'h2eb22;
    stim[34] = 18'h246d3;
    stim[35] = 18'h298d7;
    stim[36] = 18'h16335;
    stim[37] = 18'h26da3;
    stim[38] = 18'h0d594;
    stim[39] = 18'h10e8c;
    stim[40] = 18'h1bf68;
    stim[41] = 18'h22c17;
    stim[42] = 18'h1f1f2;
    stim[43] = 18'h2d4ba;
    stim[44] = 18'h1455a;
    stim[45] = 18'h0aa2c;
    stim[46] = 18'h1406f;
    stim[47] = 18'h22cf9;
    stim[48] = 18'h1d409;
    stim[49] = 18'h3efd2;
    stim[50] = 18'h18c8e;
    stim[51] = 18'h3e0ca;
    stim[52] = 18'h1396f;
    stim[53] = 18'h1d952;
    stim[54] = 18'h17b90;
    stim[55] = 18'h37470;
    stim[56] = 18'h238af;
    stim[57] = 18'h10047;
    stim[58] = 18'h29f57;
    stim[59] = 18'h2c26c;
    stim[60] = 18'h3bbb5;
    stim[61] = 18'h21424;
    stim[62] = 18'h31d62;
    stim[63] = 18'h1cee7;
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
      expv[0] = 32'h6b3c0000;
      expv[1] = 32'h0000e5cd;
      expv[2] = 32'hd39a0000;
      expv[3] = 32'hca480000;
      expv[4] = 32'h000000c0;
      expv[5] = 32'h0000c364;
      expv[6] = 32'heea90000;
      expv[7] = 32'h0000a224;
      expv[8] = 32'h0000037f;
      expv[9] = 32'hbed30000;
      expv[10] = 32'hb0350000;
      expv[11] = 32'he7ac0000;
      expv[12] = 32'hd3c60000;
      expv[13] = 32'h000075f8;
      expv[14] = 32'h30ff0000;
      expv[15] = 32'h000066aa;
      expv[16] = 32'h0000791c;
      expv[17] = 32'h44c30000;
      expv[18] = 32'hffffce22;
      expv[19] = 32'heaaf0000;
      expv[20] = 32'hb6b50000;
      expv[21] = 32'h95480000;
      expv[22] = 32'h00003287;
      expv[23] = 32'h916d0000;
      expv[24] = 32'h0000e740;
      expv[25] = 32'h1b860000;
      expv[26] = 32'h0000b3b1;
      expv[27] = 32'h00001aa6;
      expv[28] = 32'hffff8a1f;
      expv[29] = 32'h00007958;
      expv[30] = 32'hefd60000;
      expv[31] = 32'h0000f791;
      expv[32] = 32'h4a690000;
      expv[33] = 32'heb220000;
      expv[34] = 32'h46d30000;
      expv[35] = 32'h98d70000;
      expv[36] = 32'h00006335;
      expv[37] = 32'h6da30000;
      expv[38] = 32'h0000d594;
      expv[39] = 32'h00000e8c;
      expv[40] = 32'hffffbf68;
      expv[41] = 32'h2c170000;
      expv[42] = 32'hfffff1f2;
      expv[43] = 32'hd4ba0000;
      expv[44] = 32'h0000455a;
      expv[45] = 32'h0000aa2c;
      expv[46] = 32'h0000406f;
      expv[47] = 32'h2cf90000;
      expv[48] = 32'hffffd409;
      expv[49] = 32'hefd20000;
      expv[50] = 32'hffff8c8e;
      expv[51] = 32'he0ca0000;
      expv[52] = 32'h0000396f;
      expv[53] = 32'hffffd952;
      expv[54] = 32'h00007b90;
      expv[55] = 32'h74700000;
      expv[56] = 32'h38af0000;
      expv[57] = 32'h00000047;
      expv[58] = 32'h9f570000;
      expv[59] = 32'hc26c0000;
      expv[60] = 32'hbbb50000;
      expv[61] = 32'h14240000;
      expv[62] = 32'h1d620000;
      expv[63] = 32'hffffcee7;
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
