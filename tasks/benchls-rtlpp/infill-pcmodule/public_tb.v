// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 19;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  pcmodule dut (
    .clk(clk),
    .in(in_vec[18:3]),
    .load(in_vec[2:2]),
    .inc(in_vec[1:1]),
    .reset(in_vec[0:0]),
    .out(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 19'h1869d;
    stim[1] = 19'h19747;
    stim[2] = 19'h09424;
    stim[3] = 19'h11b56;
    stim[4] = 19'h3b046;
    stim[5] = 19'h5bb18;
    stim[6] = 19'h06d50;
    stim[7] = 19'h1112a;
    stim[8] = 19'h0eac4;
    stim[9] = 19'h20788;
    stim[10] = 19'h3b3c0;
    stim[11] = 19'h01d06;
    stim[12] = 19'h6c546;
    stim[13] = 19'h50c26;
    stim[14] = 19'h12e66;
    stim[15] = 19'h73b36;
    stim[16] = 19'h06c18;
    stim[17] = 19'h24474;
    stim[18] = 19'h4ab86;
    stim[19] = 19'h732b2;
    stim[20] = 19'h75ad2;
    stim[21] = 19'h6505e;
    stim[22] = 19'h32104;
    stim[23] = 19'h79694;
    stim[24] = 19'h352f4;
    stim[25] = 19'h1fb38;
    stim[26] = 19'h3bea2;
    stim[27] = 19'h129f6;
    stim[28] = 19'h79ff6;
    stim[29] = 19'h471d4;
    stim[30] = 19'h4320e;
    stim[31] = 19'h58a74;
    stim[32] = 19'h5871e;
    stim[33] = 19'h35882;
    stim[34] = 19'h70fea;
    stim[35] = 19'h39398;
    stim[36] = 19'h14612;
    stim[37] = 19'h319e0;
    stim[38] = 19'h06984;
    stim[39] = 19'h27732;
    stim[40] = 19'h56b1a;
    stim[41] = 19'h1d342;
    stim[42] = 19'h72430;
    stim[43] = 19'h2a142;
    stim[44] = 19'h3cdc8;
    stim[45] = 19'h288b4;
    stim[46] = 19'h6ac02;
    stim[47] = 19'h270de;
    stim[48] = 19'h307e6;
    stim[49] = 19'h0fc32;
    stim[50] = 19'h0440c;
    stim[51] = 19'h57f56;
    stim[52] = 19'h22ad6;
    stim[53] = 19'h7497d;
    stim[54] = 19'h2be62;
    stim[55] = 19'h52270;
    stim[56] = 19'h3f676;
    stim[57] = 19'h503c8;
    stim[58] = 19'h06654;
    stim[59] = 19'h4bd90;
    stim[60] = 19'h117a0;
    stim[61] = 19'h5e0ec;
    stim[62] = 19'h06052;
    stim[63] = 19'h1bbc4;
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
      expv[0] = 16'h0000;
      expv[1] = 16'h0000;
      expv[2] = 16'h0000;
      expv[3] = 16'h1284;
      expv[4] = 16'h236a;
      expv[5] = 16'h7608;
      expv[6] = 16'h7608;
      expv[7] = 16'h7608;
      expv[8] = 16'h7609;
      expv[9] = 16'h1d58;
      expv[10] = 16'h1d58;
      expv[11] = 16'h1d58;
      expv[12] = 16'h03a0;
      expv[13] = 16'hd8a8;
      expv[14] = 16'ha184;
      expv[15] = 16'h25cc;
      expv[16] = 16'he766;
      expv[17] = 16'he766;
      expv[18] = 16'h488e;
      expv[19] = 16'h9570;
      expv[20] = 16'h9571;
      expv[21] = 16'h9572;
      expv[22] = 16'hca0b;
      expv[23] = 16'h6420;
      expv[24] = 16'hf2d2;
      expv[25] = 16'h6a5e;
      expv[26] = 16'h6a5e;
      expv[27] = 16'h6a5f;
      expv[28] = 16'h253e;
      expv[29] = 16'hf3fe;
      expv[30] = 16'h8e3a;
      expv[31] = 16'h8641;
      expv[32] = 16'hb14e;
      expv[33] = 16'hb0e3;
      expv[34] = 16'hb0e4;
      expv[35] = 16'hb0e5;
      expv[36] = 16'hb0e5;
      expv[37] = 16'hb0e6;
      expv[38] = 16'hb0e6;
      expv[39] = 16'h0d30;
      expv[40] = 16'h0d31;
      expv[41] = 16'h0d32;
      expv[42] = 16'h0d33;
      expv[43] = 16'h0d33;
      expv[44] = 16'h0d34;
      expv[45] = 16'h0d34;
      expv[46] = 16'h5116;
      expv[47] = 16'h5117;
      expv[48] = 16'h4e1b;
      expv[49] = 16'h60fc;
      expv[50] = 16'h60fd;
      expv[51] = 16'h0881;
      expv[52] = 16'hafea;
      expv[53] = 16'h0000;
      expv[54] = 16'h0000;
      expv[55] = 16'h0001;
      expv[56] = 16'h0001;
      expv[57] = 16'h7ece;
      expv[58] = 16'h7ece;
      expv[59] = 16'h0cca;
      expv[60] = 16'h0cca;
      expv[61] = 16'h0cca;
      expv[62] = 16'hbc1d;
      expv[63] = 16'hbc1e;
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
