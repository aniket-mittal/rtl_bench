// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 34;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_157665 dut (
    .clk200(clk),
    .rst(in_vec[33:33]),
    .cap_wdis(in_vec[32:17]),
    .cap_plus(in_vec[16:1]),
    .cap_trig(in_vec[0:0]),
    .capr_rdy(out_vec[16:16]),
    .wdis(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 34'h2da894127;
    stim[1] = 34'h35fd0039a;
    stim[2] = 34'h0d0905bb5;
    stim[3] = 34'h1da0a6b03;
    stim[4] = 34'h0a0573f5d;
    stim[5] = 34'h1068fc599;
    stim[6] = 34'h06f56ad0f;
    stim[7] = 34'h111a1ac42;
    stim[8] = 34'h1b84fcb1d;
    stim[9] = 34'h0b797ac3f;
    stim[10] = 34'h116797992;
    stim[11] = 34'h03a2e4faf;
    stim[12] = 34'h140f7c78a;
    stim[13] = 34'h042f3d10e;
    stim[14] = 34'h04f3a790e;
    stim[15] = 34'h05776b854;
    stim[16] = 34'h21782c93e;
    stim[17] = 34'h1357b5c25;
    stim[18] = 34'h0726e1583;
    stim[19] = 34'h07b5e1bb3;
    stim[20] = 34'h1c95fab46;
    stim[21] = 34'h0c856cf1b;
    stim[22] = 34'h0232dd939;
    stim[23] = 34'h03223996b;
    stim[24] = 34'h16c029f95;
    stim[25] = 34'h10945a3de;
    stim[26] = 34'h09c070ea7;
    stim[27] = 34'h12cecb2be;
    stim[28] = 34'h1c6c260ae;
    stim[29] = 34'h1caf34fb8;
    stim[30] = 34'h1d3349382;
    stim[31] = 34'h055f1ea59;
    stim[32] = 34'h1dbf87ee6;
    stim[33] = 34'h165614017;
    stim[34] = 34'h09385542c;
    stim[35] = 34'h068483718;
    stim[36] = 34'h11387818f;
    stim[37] = 34'h29c3645f5;
    stim[38] = 34'h03e48e547;
    stim[39] = 34'h0b83d16fc;
    stim[40] = 34'h310dfd9b7;
    stim[41] = 34'h0eac65d7d;
    stim[42] = 34'h14c689d54;
    stim[43] = 34'h11b9b9ca1;
    stim[44] = 34'h0866b50f9;
    stim[45] = 34'h0a1006571;
    stim[46] = 34'h001ff23fd;
    stim[47] = 34'h1e73c0761;
    stim[48] = 34'h1ebb37b52;
    stim[49] = 34'h01bfec317;
    stim[50] = 34'h11954d314;
    stim[51] = 34'h1edfb5f58;
    stim[52] = 34'h0d748821c;
    stim[53] = 34'h15ac43673;
    stim[54] = 34'h0611abbd9;
    stim[55] = 34'h0e80332e1;
    stim[56] = 34'h0ab6de0b0;
    stim[57] = 34'h02419d82b;
    stim[58] = 34'h02727735e;
    stim[59] = 34'h1067de836;
    stim[60] = 34'h1177e2c81;
    stim[61] = 34'h046fdf96b;
    stim[62] = 34'h1b0c5a34b;
    stim[63] = 34'h149d4e59b;
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
      expv[0] = 17'h00000;
      expv[1] = 17'h00000;
      expv[2] = 17'h00000;
      expv[3] = 17'h06848;
      expv[4] = 17'h06848;
      expv[5] = 17'h06848;
      expv[6] = 17'h06848;
      expv[7] = 17'h06848;
      expv[8] = 17'h06848;
      expv[9] = 17'h06848;
      expv[10] = 17'h06848;
      expv[11] = 17'h06848;
      expv[12] = 17'h06848;
      expv[13] = 17'h06848;
      expv[14] = 17'h06848;
      expv[15] = 17'h06848;
      expv[16] = 17'h00000;
      expv[17] = 17'h00000;
      expv[18] = 17'h09abd;
      expv[19] = 17'h09abd;
      expv[20] = 17'h09abd;
      expv[21] = 17'h09abd;
      expv[22] = 17'h09abd;
      expv[23] = 17'h09abd;
      expv[24] = 17'h09abd;
      expv[25] = 17'h09abd;
      expv[26] = 17'h09abd;
      expv[27] = 17'h09abd;
      expv[28] = 17'h09abd;
      expv[29] = 17'h09abd;
      expv[30] = 17'h09abd;
      expv[31] = 17'h09abd;
      expv[32] = 17'h09abd;
      expv[33] = 17'h09abd;
      expv[34] = 17'h09abd;
      expv[35] = 17'h09abd;
      expv[36] = 17'h09abd;
      expv[37] = 17'h00000;
      expv[38] = 17'h00000;
      expv[39] = 17'h01f24;
      expv[40] = 17'h00000;
      expv[41] = 17'h00000;
      expv[42] = 17'h07563;
      expv[43] = 17'h07563;
      expv[44] = 17'h07563;
      expv[45] = 17'h07563;
      expv[46] = 17'h07563;
      expv[47] = 17'h07563;
      expv[48] = 17'h07563;
      expv[49] = 17'h07563;
      expv[50] = 17'h07563;
      expv[51] = 17'h07563;
      expv[52] = 17'h07563;
      expv[53] = 17'h07563;
      expv[54] = 17'h07563;
      expv[55] = 17'h07563;
      expv[56] = 17'h07563;
      expv[57] = 17'h07563;
      expv[58] = 17'h07563;
      expv[59] = 17'h07563;
      expv[60] = 17'h07563;
      expv[61] = 17'h07563;
      expv[62] = 17'h07563;
      expv[63] = 17'h07563;
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
