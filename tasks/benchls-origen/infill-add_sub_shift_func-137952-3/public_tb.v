// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 23;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_137952 dut (
    .clk(clk),
    .rst(in_vec[22:22]),
    .a(in_vec[21:14]),
    .b(in_vec[13:6]),
    .add_sub(in_vec[5:5]),
    .shift_in(in_vec[4:1]),
    .control(in_vec[0:0]),
    .final_out(out_vec[8:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 23'h5c2fdb;
    stim[1] = 23'h51127b;
    stim[2] = 23'h2f734c;
    stim[3] = 23'h120ffb;
    stim[4] = 23'h15a2ee;
    stim[5] = 23'h05f4aa;
    stim[6] = 23'h25925a;
    stim[7] = 23'h115171;
    stim[8] = 23'h08326f;
    stim[9] = 23'h32b96b;
    stim[10] = 23'h30cc88;
    stim[11] = 23'h3a990b;
    stim[12] = 23'h54946d;
    stim[13] = 23'h17adb6;
    stim[14] = 23'h3d45c6;
    stim[15] = 23'h3c7fc3;
    stim[16] = 23'h05ba07;
    stim[17] = 23'h013da9;
    stim[18] = 23'h1d68d9;
    stim[19] = 23'h00a997;
    stim[20] = 23'h037ea4;
    stim[21] = 23'h025c36;
    stim[22] = 23'h01042c;
    stim[23] = 23'h1d08d2;
    stim[24] = 23'h1c9b6b;
    stim[25] = 23'h34a8dc;
    stim[26] = 23'h3cd419;
    stim[27] = 23'h034766;
    stim[28] = 23'h671ad2;
    stim[29] = 23'h3bd2b7;
    stim[30] = 23'h2574cf;
    stim[31] = 23'h3e61e1;
    stim[32] = 23'h0897eb;
    stim[33] = 23'h0e4041;
    stim[34] = 23'h22921d;
    stim[35] = 23'h350403;
    stim[36] = 23'h1d663e;
    stim[37] = 23'h145b0e;
    stim[38] = 23'h041d0e;
    stim[39] = 23'h3e1f09;
    stim[40] = 23'h028b06;
    stim[41] = 23'h0da69f;
    stim[42] = 23'h317d2d;
    stim[43] = 23'h3315c2;
    stim[44] = 23'h1f218d;
    stim[45] = 23'h1ada3b;
    stim[46] = 23'h38d6fa;
    stim[47] = 23'h1083e3;
    stim[48] = 23'h014aca;
    stim[49] = 23'h2b22b7;
    stim[50] = 23'h25f6e5;
    stim[51] = 23'h399619;
    stim[52] = 23'h06d945;
    stim[53] = 23'h07a312;
    stim[54] = 23'h2542e6;
    stim[55] = 23'h3e63be;
    stim[56] = 23'h2fc998;
    stim[57] = 23'h369133;
    stim[58] = 23'h35db27;
    stim[59] = 23'h211dc2;
    stim[60] = 23'h344650;
    stim[61] = 23'h02a167;
    stim[62] = 23'h20e634;
    stim[63] = 23'h24b38e;
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
      expv[0] = 9'h00b;
      expv[1] = 9'h00b;
      expv[2] = 9'h1f4;
      expv[3] = 9'h1fb;
      expv[4] = 9'h079;
      expv[5] = 9'h0d7;
      expv[6] = 9'h0de;
      expv[7] = 9'h04e;
      expv[8] = 9'h098;
      expv[9] = 9'h0f3;
      expv[10] = 9'h1a7;
      expv[11] = 9'h09b;
      expv[12] = 9'h00c;
      expv[13] = 9'h1f9;
      expv[14] = 9'h10e;
      expv[15] = 9'h0e0;
      expv[16] = 9'h1f8;
      expv[17] = 9'h136;
      expv[18] = 9'h103;
      expv[19] = 9'h1d9;
      expv[20] = 9'h158;
      expv[21] = 9'h100;
      expv[22] = 9'h06d;
      expv[23] = 9'h011;
      expv[24] = 9'h05b;
      expv[25] = 9'h0d2;
      expv[26] = 9'h038;
      expv[27] = 9'h09d;
      expv[28] = 9'h1fd;
      expv[29] = 9'h007;
      expv[30] = 9'h147;
      expv[31] = 9'h1c2;
      expv[32] = 9'h18a;
      expv[33] = 9'h081;
      expv[34] = 9'h045;
      expv[35] = 9'h044;
      expv[36] = 9'h0b5;
      expv[37] = 9'h0ff;
      expv[38] = 9'h1d7;
      expv[39] = 9'h1a4;
      expv[40] = 9'h076;
      expv[41] = 9'h1ed;
      expv[42] = 9'h1a8;
      expv[43] = 9'h1b7;
      expv[44] = 9'h081;
      expv[45] = 9'h001;
      expv[46] = 9'h0c8;
      expv[47] = 9'h140;
      expv[48] = 9'h047;
      expv[49] = 9'h1e1;
      expv[50] = 9'h13a;
      expv[51] = 9'h17b;
      expv[52] = 9'h092;
      expv[53] = 9'h1b3;
      expv[54] = 9'h18c;
      expv[55] = 9'h091;
      expv[56] = 9'h17e;
      expv[57] = 9'h09c;
      expv[58] = 9'h124;
      expv[59] = 9'h141;
      expv[60] = 9'h00c;
      expv[61] = 9'h0be;
      expv[62] = 9'h08a;
      expv[63] = 9'h10d;
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
