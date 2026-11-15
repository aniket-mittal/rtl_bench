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

  autovcoder_072036 dut (
    .sclk(clk),
    .reset(in_vec[11:11]),
    .sclk_en(in_vec[10:10]),
    .rdreq(in_vec[9:9]),
    .wrreq(in_vec[8:8]),
    .data(in_vec[7:0]),
    .empty_n(out_vec[9:9]),
    .full_n(out_vec[8:8]),
    .q(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'hd33;
    stim[1] = 12'hcaf;
    stim[2] = 12'h53a;
    stim[3] = 12'h28a;
    stim[4] = 12'h02b;
    stim[5] = 12'h5d5;
    stim[6] = 12'h63e;
    stim[7] = 12'h119;
    stim[8] = 12'h571;
    stim[9] = 12'h3cd;
    stim[10] = 12'h4cd;
    stim[11] = 12'h498;
    stim[12] = 12'h6db;
    stim[13] = 12'h157;
    stim[14] = 12'h2dc;
    stim[15] = 12'h202;
    stim[16] = 12'h62c;
    stim[17] = 12'h558;
    stim[18] = 12'h5a6;
    stim[19] = 12'h2a8;
    stim[20] = 12'h2b5;
    stim[21] = 12'h4a1;
    stim[22] = 12'h03d;
    stim[23] = 12'h21e;
    stim[24] = 12'h4b9;
    stim[25] = 12'h265;
    stim[26] = 12'h6b6;
    stim[27] = 12'h73c;
    stim[28] = 12'h0cb;
    stim[29] = 12'h54b;
    stim[30] = 12'h1db;
    stim[31] = 12'h55a;
    stim[32] = 12'h2d8;
    stim[33] = 12'h527;
    stim[34] = 12'h2f2;
    stim[35] = 12'h783;
    stim[36] = 12'h5e8;
    stim[37] = 12'h1e2;
    stim[38] = 12'h157;
    stim[39] = 12'h418;
    stim[40] = 12'h410;
    stim[41] = 12'h0e7;
    stim[42] = 12'h67e;
    stim[43] = 12'h287;
    stim[44] = 12'h761;
    stim[45] = 12'h2d0;
    stim[46] = 12'h416;
    stim[47] = 12'h3b7;
    stim[48] = 12'h0e9;
    stim[49] = 12'h2fa;
    stim[50] = 12'h374;
    stim[51] = 12'hd91;
    stim[52] = 12'h1db;
    stim[53] = 12'h5ea;
    stim[54] = 12'h6a6;
    stim[55] = 12'h6af;
    stim[56] = 12'h60f;
    stim[57] = 12'h56b;
    stim[58] = 12'h4f3;
    stim[59] = 12'h7e2;
    stim[60] = 12'h4a2;
    stim[61] = 12'h617;
    stim[62] = 12'h2bb;
    stim[63] = 12'h61c;
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
      expv[0] = 10'hxxx;
      expv[1] = 10'h100;
      expv[2] = 10'h100;
      expv[3] = 10'h1xx;
      expv[4] = 10'h1xx;
      expv[5] = 10'h1xx;
      expv[6] = 10'h33a;
      expv[7] = 10'h3d5;
      expv[8] = 10'h3d5;
      expv[9] = 10'h3d5;
      expv[10] = 10'h3d5;
      expv[11] = 10'h3d5;
      expv[12] = 10'h3d5;
      expv[13] = 10'h371;
      expv[14] = 10'h371;
      expv[15] = 10'h371;
      expv[16] = 10'h371;
      expv[17] = 10'h171;
      expv[18] = 10'h171;
      expv[19] = 10'h358;
      expv[20] = 10'h358;
      expv[21] = 10'h358;
      expv[22] = 10'h358;
      expv[23] = 10'h358;
      expv[24] = 10'h358;
      expv[25] = 10'h358;
      expv[26] = 10'h358;
      expv[27] = 10'h3a6;
      expv[28] = 10'h1a6;
      expv[29] = 10'h1a6;
      expv[30] = 10'h33c;
      expv[31] = 10'h33c;
      expv[32] = 10'h33c;
      expv[33] = 10'h33c;
      expv[34] = 10'h33c;
      expv[35] = 10'h33c;
      expv[36] = 10'h34b;
      expv[37] = 10'h34b;
      expv[38] = 10'h34b;
      expv[39] = 10'h34b;
      expv[40] = 10'h34b;
      expv[41] = 10'h34b;
      expv[42] = 10'h34b;
      expv[43] = 10'h35a;
      expv[44] = 10'h35a;
      expv[45] = 10'h327;
      expv[46] = 10'h327;
      expv[47] = 10'h327;
      expv[48] = 10'h327;
      expv[49] = 10'h327;
      expv[50] = 10'h327;
      expv[51] = 10'h327;
      expv[52] = 10'h100;
      expv[53] = 10'h100;
      expv[54] = 10'h191;
      expv[55] = 10'h3ea;
      expv[56] = 10'h1ea;
      expv[57] = 10'h1ea;
      expv[58] = 10'h1ea;
      expv[59] = 10'h36b;
      expv[60] = 10'h16b;
      expv[61] = 10'h3e2;
      expv[62] = 10'h1e2;
      expv[63] = 10'h1e2;
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
