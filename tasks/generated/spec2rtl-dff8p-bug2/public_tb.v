// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .clk(clk),
    .d(in_vec[8:1]),
    .reset(in_vec[0:0]),
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
    stim[0] = 9'h10b;
    stim[1] = 9'h0d1;
    stim[2] = 9'h1a8;
    stim[3] = 9'h0cc;
    stim[4] = 9'h0c6;
    stim[5] = 9'h00c;
    stim[6] = 9'h1e8;
    stim[7] = 9'h0b0;
    stim[8] = 9'h14a;
    stim[9] = 9'h16e;
    stim[10] = 9'h166;
    stim[11] = 9'h046;
    stim[12] = 9'h15b;
    stim[13] = 9'h120;
    stim[14] = 9'h1d8;
    stim[15] = 9'h080;
    stim[16] = 9'h04c;
    stim[17] = 9'h03e;
    stim[18] = 9'h040;
    stim[19] = 9'h1fc;
    stim[20] = 9'h108;
    stim[21] = 9'h022;
    stim[22] = 9'h190;
    stim[23] = 9'h070;
    stim[24] = 9'h0cc;
    stim[25] = 9'h1d4;
    stim[26] = 9'h1a8;
    stim[27] = 9'h1a6;
    stim[28] = 9'h064;
    stim[29] = 9'h07a;
    stim[30] = 9'h0b2;
    stim[31] = 9'h12a;
    stim[32] = 9'h19c;
    stim[33] = 9'h0da;
    stim[34] = 9'h198;
    stim[35] = 9'h160;
    stim[36] = 9'h162;
    stim[37] = 9'h1e0;
    stim[38] = 9'h0a0;
    stim[39] = 9'h06e;
    stim[40] = 9'h036;
    stim[41] = 9'h102;
    stim[42] = 9'h066;
    stim[43] = 9'h084;
    stim[44] = 9'h082;
    stim[45] = 9'h0b7;
    stim[46] = 9'h0c8;
    stim[47] = 9'h0f4;
    stim[48] = 9'h132;
    stim[49] = 9'h074;
    stim[50] = 9'h050;
    stim[51] = 9'h1ec;
    stim[52] = 9'h1ba;
    stim[53] = 9'h1ee;
    stim[54] = 9'h142;
    stim[55] = 9'h094;
    stim[56] = 9'h05e;
    stim[57] = 9'h036;
    stim[58] = 9'h13a;
    stim[59] = 9'h1ca;
    stim[60] = 9'h098;
    stim[61] = 9'h0e6;
    stim[62] = 9'h02a;
    stim[63] = 9'h1b6;
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
      expv[0] = 8'hxx;
      expv[1] = 8'h34;
      expv[2] = 8'h34;
      expv[3] = 8'hd4;
      expv[4] = 8'h66;
      expv[5] = 8'h63;
      expv[6] = 8'h06;
      expv[7] = 8'hf4;
      expv[8] = 8'h58;
      expv[9] = 8'ha5;
      expv[10] = 8'hb7;
      expv[11] = 8'hb3;
      expv[12] = 8'h23;
      expv[13] = 8'h34;
      expv[14] = 8'h90;
      expv[15] = 8'hec;
      expv[16] = 8'h40;
      expv[17] = 8'h26;
      expv[18] = 8'h1f;
      expv[19] = 8'h20;
      expv[20] = 8'hfe;
      expv[21] = 8'h84;
      expv[22] = 8'h11;
      expv[23] = 8'hc8;
      expv[24] = 8'h38;
      expv[25] = 8'h66;
      expv[26] = 8'hea;
      expv[27] = 8'hd4;
      expv[28] = 8'hd3;
      expv[29] = 8'h32;
      expv[30] = 8'h3d;
      expv[31] = 8'h59;
      expv[32] = 8'h95;
      expv[33] = 8'hce;
      expv[34] = 8'h6d;
      expv[35] = 8'hcc;
      expv[36] = 8'hb0;
      expv[37] = 8'hb1;
      expv[38] = 8'hf0;
      expv[39] = 8'h50;
      expv[40] = 8'h37;
      expv[41] = 8'h1b;
      expv[42] = 8'h81;
      expv[43] = 8'h33;
      expv[44] = 8'h42;
      expv[45] = 8'h41;
      expv[46] = 8'h34;
      expv[47] = 8'h64;
      expv[48] = 8'h7a;
      expv[49] = 8'h99;
      expv[50] = 8'h3a;
      expv[51] = 8'h28;
      expv[52] = 8'hf6;
      expv[53] = 8'hdd;
      expv[54] = 8'hf7;
      expv[55] = 8'ha1;
      expv[56] = 8'h4a;
      expv[57] = 8'h2f;
      expv[58] = 8'h1b;
      expv[59] = 8'h9d;
      expv[60] = 8'he5;
      expv[61] = 8'h4c;
      expv[62] = 8'h73;
      expv[63] = 8'h15;
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
