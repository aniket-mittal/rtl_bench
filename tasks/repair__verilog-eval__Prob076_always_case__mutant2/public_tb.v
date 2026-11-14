// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 27;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .sel(in_vec[26:24]),
    .data0(in_vec[23:20]),
    .data1(in_vec[19:16]),
    .data2(in_vec[15:12]),
    .data3(in_vec[11:8]),
    .data4(in_vec[7:4]),
    .data5(in_vec[3:0]),
    .out(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 27'h3de040f;
    stim[1] = 27'h2ed6db5;
    stim[2] = 27'h0d00ae7;
    stim[3] = 27'h562516c;
    stim[4] = 27'h6fc4307;
    stim[5] = 27'h25010d7;
    stim[6] = 27'h33569e7;
    stim[7] = 27'h1662a2f;
    stim[8] = 27'h7afa53e;
    stim[9] = 27'h1e8c794;
    stim[10] = 27'h719d938;
    stim[11] = 27'h5408a66;
    stim[12] = 27'h67d79f4;
    stim[13] = 27'h7a9c6d2;
    stim[14] = 27'h326ba99;
    stim[15] = 27'h6dbb27b;
    stim[16] = 27'h71a0218;
    stim[17] = 27'h7e6e9e3;
    stim[18] = 27'h5616c0d;
    stim[19] = 27'h700fd02;
    stim[20] = 27'h7557ea7;
    stim[21] = 27'h54ddd75;
    stim[22] = 27'h4aa05ec;
    stim[23] = 27'h34e1037;
    stim[24] = 27'h3add090;
    stim[25] = 27'h348f4d3;
    stim[26] = 27'h13e6a9c;
    stim[27] = 27'h46d3eb1;
    stim[28] = 27'h5144c4c;
    stim[29] = 27'h580a253;
    stim[30] = 27'h16fca09;
    stim[31] = 27'h0dae40e;
    stim[32] = 27'h38b543b;
    stim[33] = 27'h3607b1a;
    stim[34] = 27'h3ee055d;
    stim[35] = 27'h360686d;
    stim[36] = 27'h5d85cea;
    stim[37] = 27'h4d30279;
    stim[38] = 27'h7e2719b;
    stim[39] = 27'h14dc132;
    stim[40] = 27'h2672395;
    stim[41] = 27'h379f23b;
    stim[42] = 27'h1f043ab;
    stim[43] = 27'h5812017;
    stim[44] = 27'h5d3d6dc;
    stim[45] = 27'h341f9d7;
    stim[46] = 27'h2766465;
    stim[47] = 27'h6f33a76;
    stim[48] = 27'h6d2e41e;
    stim[49] = 27'h29cd555;
    stim[50] = 27'h697c22c;
    stim[51] = 27'h72af3b0;
    stim[52] = 27'h76f2615;
    stim[53] = 27'h3751d09;
    stim[54] = 27'h6cb439e;
    stim[55] = 27'h16f7b6b;
    stim[56] = 27'h61b3ee8;
    stim[57] = 27'h3414dd3;
    stim[58] = 27'h4d9f039;
    stim[59] = 27'h078f244;
    stim[60] = 27'h5071a2b;
    stim[61] = 27'h558dfb9;
    stim[62] = 27'h173afe1;
    stim[63] = 27'h70800ad;
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
      expv[0] = 4'h4;
      expv[1] = 4'h6;
      expv[2] = 4'hd;
      expv[3] = 4'h0;
      expv[4] = 4'h7;
      expv[5] = 4'h1;
      expv[6] = 4'h9;
      expv[7] = 4'h6;
      expv[8] = 4'h0;
      expv[9] = 4'h8;
      expv[10] = 4'h0;
      expv[11] = 4'h0;
      expv[12] = 4'h4;
      expv[13] = 4'h0;
      expv[14] = 4'ha;
      expv[15] = 4'hb;
      expv[16] = 4'h0;
      expv[17] = 4'h0;
      expv[18] = 4'h0;
      expv[19] = 4'h0;
      expv[20] = 4'h0;
      expv[21] = 4'h0;
      expv[22] = 4'he;
      expv[23] = 4'h0;
      expv[24] = 4'h0;
      expv[25] = 4'h4;
      expv[26] = 4'he;
      expv[27] = 4'hb;
      expv[28] = 4'h0;
      expv[29] = 4'h0;
      expv[30] = 4'hf;
      expv[31] = 4'hd;
      expv[32] = 4'h4;
      expv[33] = 4'hb;
      expv[34] = 4'h5;
      expv[35] = 4'h8;
      expv[36] = 4'h0;
      expv[37] = 4'h7;
      expv[38] = 4'h0;
      expv[39] = 4'hd;
      expv[40] = 4'h2;
      expv[41] = 4'h2;
      expv[42] = 4'h0;
      expv[43] = 4'h0;
      expv[44] = 4'h0;
      expv[45] = 4'h9;
      expv[46] = 4'h6;
      expv[47] = 4'h6;
      expv[48] = 4'he;
      expv[49] = 4'hd;
      expv[50] = 4'hc;
      expv[51] = 4'h0;
      expv[52] = 4'h0;
      expv[53] = 4'hd;
      expv[54] = 4'he;
      expv[55] = 4'hf;
      expv[56] = 4'h8;
      expv[57] = 4'hd;
      expv[58] = 4'h3;
      expv[59] = 4'h7;
      expv[60] = 4'h0;
      expv[61] = 4'h0;
      expv[62] = 4'h3;
      expv[63] = 4'h0;
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
