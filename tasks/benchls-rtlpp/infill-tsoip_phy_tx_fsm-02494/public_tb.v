// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 22;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_02494 dut (
    .i_Clk27(clk),
    .i_nRst(in_vec[21:21]),
    .i_Data_table_fnios(in_vec[20:13]),
    .i_Valid_table_fnios(in_vec[12:12]),
    .i_Sync_table_fnios(in_vec[11:11]),
    .i_ts_Data(in_vec[10:3]),
    .i_ts_Valid(in_vec[2:2]),
    .i_ts_Sync(in_vec[1:1]),
    .i_PhyTxClk(in_vec[0:0]),
    .o_PhyTxEna(out_vec[4:4]),
    .o_PhyTxData(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 22'h2cc9dd;
    stim[1] = 22'h21052a;
    stim[2] = 22'h1887d3;
    stim[3] = 22'h15d8c5;
    stim[4] = 22'h1bb8c9;
    stim[5] = 22'h01c78c;
    stim[6] = 22'h0c0327;
    stim[7] = 22'h1659be;
    stim[8] = 22'h07ba95;
    stim[9] = 22'h008858;
    stim[10] = 22'h0641b2;
    stim[11] = 22'h11c4f0;
    stim[12] = 22'h0d8272;
    stim[13] = 22'h08f2d9;
    stim[14] = 22'h0d2d60;
    stim[15] = 22'h090083;
    stim[16] = 22'h15e7ac;
    stim[17] = 22'h1056b0;
    stim[18] = 22'h133b2b;
    stim[19] = 22'h047e07;
    stim[20] = 22'h0022d9;
    stim[21] = 22'h050497;
    stim[22] = 22'h0dc846;
    stim[23] = 22'h026ea6;
    stim[24] = 22'h218f69;
    stim[25] = 22'h06c0a3;
    stim[26] = 22'h133371;
    stim[27] = 22'h13f9ac;
    stim[28] = 22'h02ab90;
    stim[29] = 22'h145431;
    stim[30] = 22'h139e9c;
    stim[31] = 22'h1cb7ec;
    stim[32] = 22'h13df97;
    stim[33] = 22'h12496d;
    stim[34] = 22'h020d5a;
    stim[35] = 22'h0648ef;
    stim[36] = 22'h182fab;
    stim[37] = 22'h04d5d9;
    stim[38] = 22'h0a9a60;
    stim[39] = 22'h1135b6;
    stim[40] = 22'h095d9c;
    stim[41] = 22'h10d1fa;
    stim[42] = 22'h038e7d;
    stim[43] = 22'h04219a;
    stim[44] = 22'h010899;
    stim[45] = 22'h06bc80;
    stim[46] = 22'h17fa7d;
    stim[47] = 22'h1b3c14;
    stim[48] = 22'h02bcb8;
    stim[49] = 22'h00dcd0;
    stim[50] = 22'h0e0aa2;
    stim[51] = 22'h0bcf08;
    stim[52] = 22'h062325;
    stim[53] = 22'h12cb72;
    stim[54] = 22'h154640;
    stim[55] = 22'h03f863;
    stim[56] = 22'h1655a8;
    stim[57] = 22'h00ff7c;
    stim[58] = 22'h1b7be3;
    stim[59] = 22'h3e287c;
    stim[60] = 22'h19ccd1;
    stim[61] = 22'h1e5a90;
    stim[62] = 22'h032ca3;
    stim[63] = 22'h0f0132;
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
      expv[0] = 5'h00;
      expv[1] = 5'h1b;
      expv[2] = 5'h00;
      expv[3] = 5'h00;
      expv[4] = 5'h00;
      expv[5] = 5'h00;
      expv[6] = 5'h00;
      expv[7] = 5'h00;
      expv[8] = 5'h00;
      expv[9] = 5'h00;
      expv[10] = 5'h00;
      expv[11] = 5'h00;
      expv[12] = 5'h00;
      expv[13] = 5'h00;
      expv[14] = 5'h00;
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
      expv[26] = 5'h00;
      expv[27] = 5'h00;
      expv[28] = 5'h00;
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
      expv[63] = 5'h00;
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
