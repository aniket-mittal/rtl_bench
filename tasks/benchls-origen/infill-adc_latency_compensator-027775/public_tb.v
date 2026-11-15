// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_027775 dut (
    .SYS_CLK(clk),
    .Q_IN(in_vec[16:3]),
    .Q_IN_OV(in_vec[2:2]),
    .acq_en(in_vec[1:1]),
    .RESET(in_vec[0:0]),
    .Q_OUT(out_vec[16:3]),
    .Q_OUT_OV(out_vec[2:2]),
    .data_ready(out_vec[1:1]),
    .out_en(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h1a26f;
    stim[1] = 17'h056c5;
    stim[2] = 17'h14802;
    stim[3] = 17'h16dbe;
    stim[4] = 17'h0d367;
    stim[5] = 17'h11dae;
    stim[6] = 17'h1f456;
    stim[7] = 17'h16aae;
    stim[8] = 17'h17a7d;
    stim[9] = 17'h1bbc6;
    stim[10] = 17'h08523;
    stim[11] = 17'h1c974;
    stim[12] = 17'h113f2;
    stim[13] = 17'h10056;
    stim[14] = 17'h1f5e8;
    stim[15] = 17'h1487a;
    stim[16] = 17'h09628;
    stim[17] = 17'h0e460;
    stim[18] = 17'h04ed4;
    stim[19] = 17'h13fd0;
    stim[20] = 17'h05be6;
    stim[21] = 17'h0ffd0;
    stim[22] = 17'h02f68;
    stim[23] = 17'h052a6;
    stim[24] = 17'h1ca42;
    stim[25] = 17'h1fb7e;
    stim[26] = 17'h16354;
    stim[27] = 17'h11c6a;
    stim[28] = 17'h0d5de;
    stim[29] = 17'h1c48c;
    stim[30] = 17'h06238;
    stim[31] = 17'h06152;
    stim[32] = 17'h0d35c;
    stim[33] = 17'h07ee4;
    stim[34] = 17'h071a2;
    stim[35] = 17'h0ec38;
    stim[36] = 17'h11290;
    stim[37] = 17'h036ec;
    stim[38] = 17'h06a94;
    stim[39] = 17'h1d83c;
    stim[40] = 17'h0d9b0;
    stim[41] = 17'h082ca;
    stim[42] = 17'h15622;
    stim[43] = 17'h0a0c0;
    stim[44] = 17'h1bfa0;
    stim[45] = 17'h06320;
    stim[46] = 17'h1f3c0;
    stim[47] = 17'h07578;
    stim[48] = 17'h06c52;
    stim[49] = 17'h1a5a2;
    stim[50] = 17'h02864;
    stim[51] = 17'h09954;
    stim[52] = 17'h17e18;
    stim[53] = 17'h14990;
    stim[54] = 17'h0e256;
    stim[55] = 17'h05936;
    stim[56] = 17'h05c10;
    stim[57] = 17'h06176;
    stim[58] = 17'h1808c;
    stim[59] = 17'h0019c;
    stim[60] = 17'h0cfe0;
    stim[61] = 17'h19973;
    stim[62] = 17'h1718c;
    stim[63] = 17'h07b24;
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
      expv[0] = 17'h00001;
      expv[1] = 17'h00001;
      expv[2] = 17'h00001;
      expv[3] = 17'h14801;
      expv[4] = 17'h00001;
      expv[5] = 17'h00001;
      expv[6] = 17'h11dad;
      expv[7] = 17'h1f455;
      expv[8] = 17'h00001;
      expv[9] = 17'h00001;
      expv[10] = 17'h00001;
      expv[11] = 17'h00001;
      expv[12] = 17'h1c975;
      expv[13] = 17'h113f1;
      expv[14] = 17'h10055;
      expv[15] = 17'h1f5e9;
      expv[16] = 17'h14879;
      expv[17] = 17'h0962b;
      expv[18] = 17'h0e463;
      expv[19] = 17'h04ed5;
      expv[20] = 17'h13fd3;
      expv[21] = 17'h05be5;
      expv[22] = 17'h0ffd1;
      expv[23] = 17'h02f69;
      expv[24] = 17'h052a5;
      expv[25] = 17'h1ca43;
      expv[26] = 17'h1fb7d;
      expv[27] = 17'h16355;
      expv[28] = 17'h11c6b;
      expv[29] = 17'h0d5df;
      expv[30] = 17'h1c48f;
      expv[31] = 17'h06239;
      expv[32] = 17'h06153;
      expv[33] = 17'h0d35f;
      expv[34] = 17'h07ee5;
      expv[35] = 17'h071a1;
      expv[36] = 17'h0ec3b;
      expv[37] = 17'h11291;
      expv[38] = 17'h036ed;
      expv[39] = 17'h06a97;
      expv[40] = 17'h1d83d;
      expv[41] = 17'h0d9b1;
      expv[42] = 17'h082c9;
      expv[43] = 17'h15621;
      expv[44] = 17'h0a0c1;
      expv[45] = 17'h1bfa1;
      expv[46] = 17'h06323;
      expv[47] = 17'h1f3c3;
      expv[48] = 17'h07579;
      expv[49] = 17'h06c51;
      expv[50] = 17'h1a5a1;
      expv[51] = 17'h02865;
      expv[52] = 17'h09955;
      expv[53] = 17'h17e1b;
      expv[54] = 17'h14993;
      expv[55] = 17'h0e255;
      expv[56] = 17'h05935;
      expv[57] = 17'h05c11;
      expv[58] = 17'h06175;
      expv[59] = 17'h1808f;
      expv[60] = 17'h0019f;
      expv[61] = 17'h00001;
      expv[62] = 17'h00001;
      expv[63] = 17'h1718d;
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
