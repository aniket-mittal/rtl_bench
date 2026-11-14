// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 16;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .in(in_vec[15:0]),
    .out_hi(out_vec[15:8]),
    .out_lo(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 16'hc1fa;
    stim[1] = 16'hb47e;
    stim[2] = 16'h3d94;
    stim[3] = 16'hfbc9;
    stim[4] = 16'h1100;
    stim[5] = 16'h4836;
    stim[6] = 16'h023a;
    stim[7] = 16'ha0d8;
    stim[8] = 16'he3c7;
    stim[9] = 16'h3b29;
    stim[10] = 16'h86f8;
    stim[11] = 16'h6ddc;
    stim[12] = 16'hd674;
    stim[13] = 16'h431b;
    stim[14] = 16'hd3bc;
    stim[15] = 16'h903d;
    stim[16] = 16'hc84a;
    stim[17] = 16'h214b;
    stim[18] = 16'h8829;
    stim[19] = 16'h1109;
    stim[20] = 16'he09d;
    stim[21] = 16'he888;
    stim[22] = 16'h1e1b;
    stim[23] = 16'h3cc1;
    stim[24] = 16'ha480;
    stim[25] = 16'h02a1;
    stim[26] = 16'hc0e4;
    stim[27] = 16'h4e13;
    stim[28] = 16'h91a7;
    stim[29] = 16'h68c6;
    stim[30] = 16'h24ba;
    stim[31] = 16'h431f;
    stim[32] = 16'hf663;
    stim[33] = 16'hf752;
    stim[34] = 16'ha704;
    stim[35] = 16'h713e;
    stim[36] = 16'h4570;
    stim[37] = 16'h88ae;
    stim[38] = 16'he2b4;
    stim[39] = 16'h9e81;
    stim[40] = 16'h52d1;
    stim[41] = 16'hc04a;
    stim[42] = 16'h5851;
    stim[43] = 16'h697d;
    stim[44] = 16'hecaf;
    stim[45] = 16'h6ef1;
    stim[46] = 16'hc041;
    stim[47] = 16'hd94f;
    stim[48] = 16'h90bb;
    stim[49] = 16'h1094;
    stim[50] = 16'hbb1a;
    stim[51] = 16'hd4ee;
    stim[52] = 16'h56e4;
    stim[53] = 16'h22a8;
    stim[54] = 16'h798a;
    stim[55] = 16'hd9e6;
    stim[56] = 16'hef79;
    stim[57] = 16'h5324;
    stim[58] = 16'h7521;
    stim[59] = 16'h6d90;
    stim[60] = 16'h5bad;
    stim[61] = 16'h6aa0;
    stim[62] = 16'h1a35;
    stim[63] = 16'h8e58;
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
      expv[0] = 16'hc13b;
      expv[1] = 16'hb4ca;
      expv[2] = 16'h3da9;
      expv[3] = 16'hfb32;
      expv[4] = 16'h1111;
      expv[5] = 16'h487e;
      expv[6] = 16'h0238;
      expv[7] = 16'ha078;
      expv[8] = 16'he324;
      expv[9] = 16'h3b12;
      expv[10] = 16'h867e;
      expv[11] = 16'h6db1;
      expv[12] = 16'hd6a2;
      expv[13] = 16'h4358;
      expv[14] = 16'hd36f;
      expv[15] = 16'h90ad;
      expv[16] = 16'hc882;
      expv[17] = 16'h216a;
      expv[18] = 16'h88a1;
      expv[19] = 16'h1118;
      expv[20] = 16'he07d;
      expv[21] = 16'he860;
      expv[22] = 16'h1e05;
      expv[23] = 16'h3cfd;
      expv[24] = 16'ha424;
      expv[25] = 16'h02a3;
      expv[26] = 16'hc024;
      expv[27] = 16'h4e5d;
      expv[28] = 16'h9136;
      expv[29] = 16'h68ae;
      expv[30] = 16'h249e;
      expv[31] = 16'h435c;
      expv[32] = 16'hf695;
      expv[33] = 16'hf7a5;
      expv[34] = 16'ha7a3;
      expv[35] = 16'h714f;
      expv[36] = 16'h4535;
      expv[37] = 16'h8826;
      expv[38] = 16'he256;
      expv[39] = 16'h9e1f;
      expv[40] = 16'h5283;
      expv[41] = 16'hc08a;
      expv[42] = 16'h5809;
      expv[43] = 16'h6914;
      expv[44] = 16'hec43;
      expv[45] = 16'h6e9f;
      expv[46] = 16'hc081;
      expv[47] = 16'hd996;
      expv[48] = 16'h902b;
      expv[49] = 16'h1084;
      expv[50] = 16'hbba1;
      expv[51] = 16'hd43a;
      expv[52] = 16'h56b2;
      expv[53] = 16'h228a;
      expv[54] = 16'h79f3;
      expv[55] = 16'hd93f;
      expv[56] = 16'hef96;
      expv[57] = 16'h5377;
      expv[58] = 16'h7554;
      expv[59] = 16'h6dfd;
      expv[60] = 16'h5bf6;
      expv[61] = 16'h6aca;
      expv[62] = 16'h1a2f;
      expv[63] = 16'h8ed6;
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
