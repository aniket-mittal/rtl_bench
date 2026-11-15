// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 42;
  localparam OW = 51;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_08043 dut (
    .clk(clk),
    .ir_in(in_vec[41:40]),
    .sr(in_vec[39:2]),
    .vs_udr(in_vec[1:1]),
    .vs_uir(in_vec[0:0]),
    .jdo(out_vec[50:13]),
    .take_action_break_a(out_vec[12:12]),
    .take_action_break_b(out_vec[11:11]),
    .take_action_break_c(out_vec[10:10]),
    .take_action_ocimem_a(out_vec[9:9]),
    .take_action_ocimem_b(out_vec[8:8]),
    .take_action_tracectrl(out_vec[7:7]),
    .take_action_tracemem_a(out_vec[6:6]),
    .take_action_tracemem_b(out_vec[5:5]),
    .take_no_action_break_a(out_vec[4:4]),
    .take_no_action_break_b(out_vec[3:3]),
    .take_no_action_break_c(out_vec[2:2]),
    .take_no_action_ocimem_a(out_vec[1:1]),
    .take_no_action_tracemem_a(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 42'h170f679490f;
    stim[1] = 42'h383d6f03073;
    stim[2] = 42'h0ed867dae19;
    stim[3] = 42'h305f2db2e7e;
    stim[4] = 42'h057bb1b86c8;
    stim[5] = 42'h3a739bf2283;
    stim[6] = 42'h0e4aa5040cd;
    stim[7] = 42'h2d227f9807f;
    stim[8] = 42'h016f45c03cf;
    stim[9] = 42'h05d460fb7d3;
    stim[10] = 42'h2e0f1e32b73;
    stim[11] = 42'h1ac495a38e4;
    stim[12] = 42'h381b6bb0d3d;
    stim[13] = 42'h16002989d50;
    stim[14] = 42'h10b4168ad53;
    stim[15] = 42'h21392c52153;
    stim[16] = 42'h25133ebd913;
    stim[17] = 42'h3cd1a9e35c7;
    stim[18] = 42'h14da6577ff7;
    stim[19] = 42'h121d7b8878c;
    stim[20] = 42'h111b6150d39;
    stim[21] = 42'h18e55a40908;
    stim[22] = 42'h1cbfbefc58a;
    stim[23] = 42'h14c5066cf4f;
    stim[24] = 42'h31b107e13e6;
    stim[25] = 42'h0de071a89c4;
    stim[26] = 42'h0167f5eae27;
    stim[27] = 42'h31402faa0c0;
    stim[28] = 42'h269aa40dcd4;
    stim[29] = 42'h246712b8947;
    stim[30] = 42'h29bd0dbeff8;
    stim[31] = 42'h31f80f31f9d;
    stim[32] = 42'h22b8aa32c83;
    stim[33] = 42'h14cfeea9d86;
    stim[34] = 42'h07feb22b9a3;
    stim[35] = 42'h38ad60becb4;
    stim[36] = 42'h0de173ba7ee;
    stim[37] = 42'h3a9365c2025;
    stim[38] = 42'h2b98335d52b;
    stim[39] = 42'h1ab26035bc1;
    stim[40] = 42'h33db67cc651;
    stim[41] = 42'h11b261f610e;
    stim[42] = 42'h015bfbe07c8;
    stim[43] = 42'h097683a1939;
    stim[44] = 42'h25852fe54e9;
    stim[45] = 42'h14df68e604b;
    stim[46] = 42'h13a238860e1;
    stim[47] = 42'h25f1a69ae64;
    stim[48] = 42'h30c8bbd74d6;
    stim[49] = 42'h2bde718aa0b;
    stim[50] = 42'h3581714adb8;
    stim[51] = 42'h0ca150e4eb1;
    stim[52] = 42'h2fae7911905;
    stim[53] = 42'h06e851807fa;
    stim[54] = 42'h04974ece084;
    stim[55] = 42'h2ee1622b46c;
    stim[56] = 42'h0b64155c8ef;
    stim[57] = 42'h37dfb002fb6;
    stim[58] = 42'h1a8c573b003;
    stim[59] = 42'h06cb92f0f2a;
    stim[60] = 42'h37dbac66062;
    stim[61] = 42'h15edc551feb;
    stim[62] = 42'h01569cda05d;
    stim[63] = 42'h09f311ed3ad;
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
      expv[0] = 51'hxxxxxxxxxxxxx;
      expv[1] = 51'hxxxxxxxxxxxxx;
      expv[2] = 51'hxxxxxxxxxx000;
      expv[3] = 51'hxxxxxxxxxx000;
      expv[4] = 51'h02f96d973e0xx;
      expv[5] = 51'h02f96d973e000;
      expv[6] = 51'h539cdf9140100;
      expv[7] = 51'h539cdf9140000;
      expv[8] = 51'h6913fcc03e200;
      expv[9] = 51'h6913fcc03e000;
      expv[10] = 51'h6913fcc03e000;
      expv[11] = 51'h6913fcc03e000;
      expv[12] = 51'h6913fcc03e000;
      expv[13] = 51'h40db5d869e080;
      expv[14] = 51'h40db5d869e000;
      expv[15] = 51'h40db5d869e000;
      expv[16] = 51'h40db5d869e000;
      expv[17] = 51'h40db5d869e000;
      expv[18] = 51'h40db5d869e000;
      expv[19] = 51'h40db5d869e000;
      expv[20] = 51'h40db5d869e000;
      expv[21] = 51'h08db0a869c001;
      expv[22] = 51'h08db0a869c000;
      expv[23] = 51'h08db0a869c000;
      expv[24] = 51'h08db0a869c000;
      expv[25] = 51'h08db0a869c000;
      expv[26] = 51'h08db0a869c000;
      expv[27] = 51'h0b3faf5712200;
      expv[28] = 51'h0b3faf5712000;
      expv[29] = 51'h34d5206e6a004;
      expv[30] = 51'h34d5206e6a000;
      expv[31] = 51'h34d5206e6a000;
      expv[32] = 51'h0fc0798fce080;
      expv[33] = 51'h0fc0798fce000;
      expv[34] = 51'h0fc0798fce000;
      expv[35] = 51'h0fc0798fce000;
      expv[36] = 51'h0fc0798fce000;
      expv[37] = 51'h6f0b9dd3f6200;
      expv[38] = 51'h6f0b9dd3f6000;
      expv[39] = 51'h5cc19aea94100;
      expv[40] = 51'h5cc19aea94000;
      expv[41] = 51'h1edb3e6328100;
      expv[42] = 51'h1edb3e6328000;
      expv[43] = 51'h1edb3e6328000;
      expv[44] = 51'h4bb41d0c9c200;
      expv[45] = 51'h4bb41d0c9c000;
      expv[46] = 51'h4bb41d0c9c000;
      expv[47] = 51'h4bb41d0c9c000;
      expv[48] = 51'h2f8d34d732200;
      expv[49] = 51'h2f8d34d732000;
      expv[50] = 51'h2f8d34d732000;
      expv[51] = 51'h2f8d34d732000;
      expv[52] = 51'h650a872758002;
      expv[53] = 51'h650a872758000;
      expv[54] = 51'h650a872758000;
      expv[55] = 51'h650a872758000;
      expv[56] = 51'h770b115a36100;
      expv[57] = 51'h770b115a36000;
      expv[58] = 51'h770b115a36000;
      expv[59] = 51'h770b115a36000;
      expv[60] = 51'h770b115a36000;
      expv[61] = 51'h770b115a36000;
      expv[62] = 51'h770b115a36000;
      expv[63] = 51'h770b115a36000;
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
