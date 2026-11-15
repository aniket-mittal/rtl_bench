// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 22;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_05592 dut (
    .clk(clk),
    .address(in_vec[21:19]),
    .chipselect(in_vec[18:18]),
    .reset_n(in_vec[17:17]),
    .write_n(in_vec[16:16]),
    .writedata(in_vec[15:0]),
    .irq(out_vec[16:16]),
    .readdata(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 22'h15d861;
    stim[1] = 22'h117fef;
    stim[2] = 22'h162421;
    stim[3] = 22'h0ff96a;
    stim[4] = 22'h3a563d;
    stim[5] = 22'h0eab9a;
    stim[6] = 22'h26941f;
    stim[7] = 22'h235ae5;
    stim[8] = 22'h0288ff;
    stim[9] = 22'h169548;
    stim[10] = 22'h0a99b3;
    stim[11] = 22'h1ada9c;
    stim[12] = 22'h3fd9d6;
    stim[13] = 22'h3faeff;
    stim[14] = 22'h227bf7;
    stim[15] = 22'h06b683;
    stim[16] = 22'h07ed23;
    stim[17] = 22'h167021;
    stim[18] = 22'h0388f2;
    stim[19] = 22'h13e8d0;
    stim[20] = 22'h016c27;
    stim[21] = 22'h2795ad;
    stim[22] = 22'h3f1f3e;
    stim[23] = 22'h3c35f6;
    stim[24] = 22'h0ee45a;
    stim[25] = 22'h1e8c7b;
    stim[26] = 22'h2bb319;
    stim[27] = 22'h02b176;
    stim[28] = 22'h2fdcc6;
    stim[29] = 22'h1b7c9b;
    stim[30] = 22'h277678;
    stim[31] = 22'h066a0a;
    stim[32] = 22'h2a1848;
    stim[33] = 22'h13f79a;
    stim[34] = 22'h2e43c5;
    stim[35] = 22'h3e025a;
    stim[36] = 22'h1e82f2;
    stim[37] = 22'h1bfd22;
    stim[38] = 22'h2723a4;
    stim[39] = 22'h07881b;
    stim[40] = 22'h1e8a2c;
    stim[41] = 22'h0b01ad;
    stim[42] = 22'h3b54e0;
    stim[43] = 22'h2a49ef;
    stim[44] = 22'h2f1d0c;
    stim[45] = 22'h12de0a;
    stim[46] = 22'h023a1c;
    stim[47] = 22'h1e9aa3;
    stim[48] = 22'h1aebe5;
    stim[49] = 22'h3fa4d8;
    stim[50] = 22'h1bad70;
    stim[51] = 22'h16e0b0;
    stim[52] = 22'h0afe1f;
    stim[53] = 22'h2f9ebb;
    stim[54] = 22'h077114;
    stim[55] = 22'h160ee0;
    stim[56] = 22'h2e1bab;
    stim[57] = 22'h0a3f9e;
    stim[58] = 22'h26cac3;
    stim[59] = 22'h0e22b2;
    stim[60] = 22'h0f129a;
    stim[61] = 22'h3b1582;
    stim[62] = 22'h14c874;
    stim[63] = 22'h02673d;
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
      expv[3] = 17'h0869f;
      expv[4] = 17'h00000;
      expv[5] = 17'h00000;
      expv[6] = 17'h00000;
      expv[7] = 17'h00000;
      expv[8] = 17'h02421;
      expv[9] = 17'h00000;
      expv[10] = 17'h02421;
      expv[11] = 17'h0000a;
      expv[12] = 17'h00001;
      expv[13] = 17'h00000;
      expv[14] = 17'h00000;
      expv[15] = 17'h02421;
      expv[16] = 17'h00000;
      expv[17] = 17'h00000;
      expv[18] = 17'h09548;
      expv[19] = 17'h00000;
      expv[20] = 17'h00000;
      expv[21] = 17'h00000;
      expv[22] = 17'h00000;
      expv[23] = 17'h00000;
      expv[24] = 17'h00000;
      expv[25] = 17'h00000;
      expv[26] = 17'h00001;
      expv[27] = 17'h00000;
      expv[28] = 17'h00000;
      expv[29] = 17'h00000;
      expv[30] = 17'h08c7b;
      expv[31] = 17'h00000;
      expv[32] = 17'h00000;
      expv[33] = 17'h00000;
      expv[34] = 17'h0869f;
      expv[35] = 17'h00000;
      expv[36] = 17'h00000;
      expv[37] = 17'h08c7b;
      expv[38] = 17'h082f2;
      expv[39] = 17'h0869f;
      expv[40] = 17'h00000;
      expv[41] = 17'h082f2;
      expv[42] = 17'h0000a;
      expv[43] = 17'h00000;
      expv[44] = 17'h08c7b;
      expv[45] = 17'h08c7b;
      expv[46] = 17'h0869f;
      expv[47] = 17'h00000;
      expv[48] = 17'h08a2c;
      expv[49] = 17'h09aa3;
      expv[50] = 17'h00000;
      expv[51] = 17'h09aa3;
      expv[52] = 17'h0869f;
      expv[53] = 17'h0000a;
      expv[54] = 17'h08c7b;
      expv[55] = 17'h00000;
      expv[56] = 17'h0e0b0;
      expv[57] = 17'h08c7b;
      expv[58] = 17'h0000a;
      expv[59] = 17'h0e0b0;
      expv[60] = 17'h0000a;
      expv[61] = 17'h00002;
      expv[62] = 17'h00000;
      expv[63] = 17'h00000;
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
