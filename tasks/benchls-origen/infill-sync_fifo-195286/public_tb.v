// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_195286 dut (
    .in_clk(clk),
    .out_clk(in_vec[11:11]),
    .rst(in_vec[10:10]),
    .i_in_data(in_vec[9:2]),
    .i_in_stb(in_vec[1:1]),
    .i_out_stb(in_vec[0:0]),
    .full(out_vec[9:9]),
    .empty(out_vec[8:8]),
    .o_out_data(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h53c;
    stim[1] = 12'h71a;
    stim[2] = 12'h924;
    stim[3] = 12'h985;
    stim[4] = 12'h3dc;
    stim[5] = 12'h9b8;
    stim[6] = 12'h10f;
    stim[7] = 12'h207;
    stim[8] = 12'haa3;
    stim[9] = 12'hbcd;
    stim[10] = 12'h27f;
    stim[11] = 12'ha43;
    stim[12] = 12'h05d;
    stim[13] = 12'h1f5;
    stim[14] = 12'hbee;
    stim[15] = 12'hbac;
    stim[16] = 12'h89a;
    stim[17] = 12'h0ef;
    stim[18] = 12'h1cd;
    stim[19] = 12'h181;
    stim[20] = 12'heca;
    stim[21] = 12'ha37;
    stim[22] = 12'h194;
    stim[23] = 12'h27a;
    stim[24] = 12'hff1;
    stim[25] = 12'h3eb;
    stim[26] = 12'hc39;
    stim[27] = 12'haeb;
    stim[28] = 12'hb9c;
    stim[29] = 12'h9e3;
    stim[30] = 12'h276;
    stim[31] = 12'h8c1;
    stim[32] = 12'h868;
    stim[33] = 12'h887;
    stim[34] = 12'h3d0;
    stim[35] = 12'h811;
    stim[36] = 12'habb;
    stim[37] = 12'h266;
    stim[38] = 12'h11d;
    stim[39] = 12'h316;
    stim[40] = 12'h20d;
    stim[41] = 12'hb1c;
    stim[42] = 12'h9ff;
    stim[43] = 12'h9a6;
    stim[44] = 12'hb71;
    stim[45] = 12'ha10;
    stim[46] = 12'hb45;
    stim[47] = 12'h037;
    stim[48] = 12'h054;
    stim[49] = 12'haf9;
    stim[50] = 12'h119;
    stim[51] = 12'h8ea;
    stim[52] = 12'h891;
    stim[53] = 12'h169;
    stim[54] = 12'h3df;
    stim[55] = 12'hbdc;
    stim[56] = 12'h9dd;
    stim[57] = 12'ha35;
    stim[58] = 12'h1bf;
    stim[59] = 12'h0de;
    stim[60] = 12'h9c3;
    stim[61] = 12'hb7b;
    stim[62] = 12'h017;
    stim[63] = 12'hf96;
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
      expv[0] = 10'h1xx;
      expv[1] = 10'h1xx;
      expv[2] = 10'h1xx;
      expv[3] = 10'h1xx;
      expv[4] = 10'h1xx;
      expv[5] = 10'h1xx;
      expv[6] = 10'h1xx;
      expv[7] = 10'h043;
      expv[8] = 10'h081;
      expv[9] = 10'h081;
      expv[10] = 10'h081;
      expv[11] = 10'h0a8;
      expv[12] = 10'h0a8;
      expv[13] = 10'h0a8;
      expv[14] = 10'h0a8;
      expv[15] = 10'h0a8;
      expv[16] = 10'h0a8;
      expv[17] = 10'h0a8;
      expv[18] = 10'h0a8;
      expv[19] = 10'h0a8;
      expv[20] = 10'h143;
      expv[21] = 10'h143;
      expv[22] = 10'h08d;
      expv[23] = 10'h08d;
      expv[24] = 10'h18d;
      expv[25] = 10'h18d;
      expv[26] = 10'h1fa;
      expv[27] = 10'h1fa;
      expv[28] = 10'h0ba;
      expv[29] = 10'h0ba;
      expv[30] = 10'h0ba;
      expv[31] = 10'h078;
      expv[32] = 10'h078;
      expv[33] = 10'h078;
      expv[34] = 10'h078;
      expv[35] = 10'h09d;
      expv[36] = 10'h09d;
      expv[37] = 10'h09d;
      expv[38] = 10'h09d;
      expv[39] = 10'h09d;
      expv[40] = 10'h09d;
      expv[41] = 10'h09d;
      expv[42] = 10'h09d;
      expv[43] = 10'h09d;
      expv[44] = 10'h09d;
      expv[45] = 10'h09d;
      expv[46] = 10'h09d;
      expv[47] = 10'h09d;
      expv[48] = 10'h09d;
      expv[49] = 10'h021;
      expv[50] = 10'h021;
      expv[51] = 10'h021;
      expv[52] = 10'h021;
      expv[53] = 10'h021;
      expv[54] = 10'h021;
      expv[55] = 10'h021;
      expv[56] = 10'h021;
      expv[57] = 10'h021;
      expv[58] = 10'h021;
      expv[59] = 10'h021;
      expv[60] = 10'h0ae;
      expv[61] = 10'h0ae;
      expv[62] = 10'h0ae;
      expv[63] = 10'h105;
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
