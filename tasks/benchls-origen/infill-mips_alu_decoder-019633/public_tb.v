// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_019633 dut (
    .ALUOp(in_vec[11:6]),
    .ALUFunction(in_vec[5:0]),
    .ALUOperation(out_vec[4:1]),
    .JrFlag(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h9a2;
    stim[1] = 12'h4e1;
    stim[2] = 12'h86c;
    stim[3] = 12'h792;
    stim[4] = 12'h927;
    stim[5] = 12'hf63;
    stim[6] = 12'h2e9;
    stim[7] = 12'h209;
    stim[8] = 12'h54d;
    stim[9] = 12'h380;
    stim[10] = 12'h6cb;
    stim[11] = 12'h2a6;
    stim[12] = 12'h7d1;
    stim[13] = 12'hc8b;
    stim[14] = 12'hacb;
    stim[15] = 12'hfc0;
    stim[16] = 12'h099;
    stim[17] = 12'h531;
    stim[18] = 12'h739;
    stim[19] = 12'h0a2;
    stim[20] = 12'h67c;
    stim[21] = 12'h93d;
    stim[22] = 12'h01a;
    stim[23] = 12'h85d;
    stim[24] = 12'h4e6;
    stim[25] = 12'h408;
    stim[26] = 12'h365;
    stim[27] = 12'h5f0;
    stim[28] = 12'h8ed;
    stim[29] = 12'he3c;
    stim[30] = 12'hd2b;
    stim[31] = 12'h1eb;
    stim[32] = 12'h1e4;
    stim[33] = 12'h25f;
    stim[34] = 12'h53b;
    stim[35] = 12'hfe8;
    stim[36] = 12'hb56;
    stim[37] = 12'h677;
    stim[38] = 12'hc0e;
    stim[39] = 12'hb9e;
    stim[40] = 12'hb53;
    stim[41] = 12'hab6;
    stim[42] = 12'hfed;
    stim[43] = 12'h247;
    stim[44] = 12'h269;
    stim[45] = 12'h0c3;
    stim[46] = 12'hce8;
    stim[47] = 12'hc30;
    stim[48] = 12'h7bb;
    stim[49] = 12'h281;
    stim[50] = 12'h2c3;
    stim[51] = 12'hdfd;
    stim[52] = 12'h681;
    stim[53] = 12'h834;
    stim[54] = 12'h734;
    stim[55] = 12'he84;
    stim[56] = 12'h461;
    stim[57] = 12'h490;
    stim[58] = 12'h62f;
    stim[59] = 12'hf3a;
    stim[60] = 12'h06a;
    stim[61] = 12'h6e9;
    stim[62] = 12'h02c;
    stim[63] = 12'h34a;
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
      expv[0] = 5'h00;
      expv[1] = 5'h00;
      expv[2] = 5'h00;
      expv[3] = 5'h00;
      expv[4] = 5'h00;
      expv[5] = 5'h00;
      expv[6] = 5'h00;
      expv[7] = 5'h06;
      expv[8] = 5'h00;
      expv[9] = 5'h00;
      expv[10] = 5'h00;
      expv[11] = 5'h00;
      expv[12] = 5'h00;
      expv[13] = 5'h00;
      expv[14] = 5'h06;
      expv[15] = 5'h00;
      expv[16] = 5'h00;
      expv[17] = 5'h00;
      expv[18] = 5'h00;
      expv[19] = 5'h00;
      expv[20] = 5'h00;
      expv[21] = 5'h00;
      expv[22] = 5'h00;
      expv[23] = 5'h00;
      expv[24] = 5'h00;
      expv[25] = 5'h00;
      expv[26] = 5'h02;
      expv[27] = 5'h00;
      expv[28] = 5'h06;
      expv[29] = 5'h00;
      expv[30] = 5'h00;
      expv[31] = 5'h00;
      expv[32] = 5'h00;
      expv[33] = 5'h00;
      expv[34] = 5'h00;
      expv[35] = 5'h00;
      expv[36] = 5'h00;
      expv[37] = 5'h00;
      expv[38] = 5'h00;
      expv[39] = 5'h00;
      expv[40] = 5'h00;
      expv[41] = 5'h00;
      expv[42] = 5'h00;
      expv[43] = 5'h00;
      expv[44] = 5'h00;
      expv[45] = 5'h00;
      expv[46] = 5'h00;
      expv[47] = 5'h00;
      expv[48] = 5'h00;
      expv[49] = 5'h00;
      expv[50] = 5'h00;
      expv[51] = 5'h00;
      expv[52] = 5'h00;
      expv[53] = 5'h00;
      expv[54] = 5'h00;
      expv[55] = 5'h00;
      expv[56] = 5'h00;
      expv[57] = 5'h00;
      expv[58] = 5'h00;
      expv[59] = 5'h00;
      expv[60] = 5'h00;
      expv[61] = 5'h00;
      expv[62] = 5'h00;
      expv[63] = 5'h02;
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
