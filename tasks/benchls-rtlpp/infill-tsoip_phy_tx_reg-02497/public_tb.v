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

  rtlpp_02497 dut (
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
    stim[0] = 22'h35e332;
    stim[1] = 22'h3f0054;
    stim[2] = 22'h012055;
    stim[3] = 22'h13e037;
    stim[4] = 22'h003523;
    stim[5] = 22'h092bf0;
    stim[6] = 22'h00fa12;
    stim[7] = 22'h123155;
    stim[8] = 22'h0b6263;
    stim[9] = 22'h1f115b;
    stim[10] = 22'h1f543b;
    stim[11] = 22'h18843e;
    stim[12] = 22'h1bb98a;
    stim[13] = 22'h0e0b95;
    stim[14] = 22'h103c8d;
    stim[15] = 22'h10c746;
    stim[16] = 22'h1da052;
    stim[17] = 22'h060fc5;
    stim[18] = 22'h0b2d1f;
    stim[19] = 22'h11f8f7;
    stim[20] = 22'h192416;
    stim[21] = 22'h1a7341;
    stim[22] = 22'h09a2ba;
    stim[23] = 22'h02f1ea;
    stim[24] = 22'h0e246e;
    stim[25] = 22'h1c0b4b;
    stim[26] = 22'h05d54a;
    stim[27] = 22'h0ebd8e;
    stim[28] = 22'h2604cb;
    stim[29] = 22'h07023e;
    stim[30] = 22'h1232b6;
    stim[31] = 22'h1499ef;
    stim[32] = 22'h1b9ed6;
    stim[33] = 22'h084d23;
    stim[34] = 22'h1fd715;
    stim[35] = 22'h17edf3;
    stim[36] = 22'h1ff9f6;
    stim[37] = 22'h0d54c4;
    stim[38] = 22'h1df448;
    stim[39] = 22'h177fd4;
    stim[40] = 22'h08b14c;
    stim[41] = 22'h1def47;
    stim[42] = 22'h1fd038;
    stim[43] = 22'h0af774;
    stim[44] = 22'h1c61d7;
    stim[45] = 22'h1c903d;
    stim[46] = 22'h1e37ec;
    stim[47] = 22'h0830f0;
    stim[48] = 22'h1a9411;
    stim[49] = 22'h1d40eb;
    stim[50] = 22'h184e0a;
    stim[51] = 22'h0da275;
    stim[52] = 22'h154fd5;
    stim[53] = 22'h1a4110;
    stim[54] = 22'h136946;
    stim[55] = 22'h1f43e7;
    stim[56] = 22'h130dbb;
    stim[57] = 22'h1d3cf3;
    stim[58] = 22'h1a8c98;
    stim[59] = 22'h117b1e;
    stim[60] = 22'h1fd434;
    stim[61] = 22'h113636;
    stim[62] = 22'h1a43ac;
    stim[63] = 22'h0189d1;
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
      expv[1] = 5'h10;
      expv[2] = 5'h10;
      expv[3] = 5'h10;
      expv[4] = 5'h00;
      expv[5] = 5'h00;
      expv[6] = 5'h00;
      expv[7] = 5'h10;
      expv[8] = 5'h00;
      expv[9] = 5'h00;
      expv[10] = 5'h00;
      expv[11] = 5'h10;
      expv[12] = 5'h00;
      expv[13] = 5'h10;
      expv[14] = 5'h10;
      expv[15] = 5'h10;
      expv[16] = 5'h00;
      expv[17] = 5'h10;
      expv[18] = 5'h10;
      expv[19] = 5'h10;
      expv[20] = 5'h10;
      expv[21] = 5'h00;
      expv[22] = 5'h00;
      expv[23] = 5'h00;
      expv[24] = 5'h10;
      expv[25] = 5'h00;
      expv[26] = 5'h00;
      expv[27] = 5'h10;
      expv[28] = 5'h00;
      expv[29] = 5'h10;
      expv[30] = 5'h10;
      expv[31] = 5'h10;
      expv[32] = 5'h10;
      expv[33] = 5'h00;
      expv[34] = 5'h10;
      expv[35] = 5'h00;
      expv[36] = 5'h10;
      expv[37] = 5'h10;
      expv[38] = 5'h00;
      expv[39] = 5'h10;
      expv[40] = 5'h10;
      expv[41] = 5'h10;
      expv[42] = 5'h00;
      expv[43] = 5'h10;
      expv[44] = 5'h10;
      expv[45] = 5'h10;
      expv[46] = 5'h10;
      expv[47] = 5'h00;
      expv[48] = 5'h00;
      expv[49] = 5'h00;
      expv[50] = 5'h00;
      expv[51] = 5'h10;
      expv[52] = 5'h10;
      expv[53] = 5'h00;
      expv[54] = 5'h10;
      expv[55] = 5'h10;
      expv[56] = 5'h00;
      expv[57] = 5'h00;
      expv[58] = 5'h00;
      expv[59] = 5'h10;
      expv[60] = 5'h10;
      expv[61] = 5'h10;
      expv[62] = 5'h10;
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
