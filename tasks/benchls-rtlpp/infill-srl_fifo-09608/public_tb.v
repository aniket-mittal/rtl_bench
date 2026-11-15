// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 19;
  localparam OW = 23;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_09608 dut (
    .clock(clk),
    .reset(in_vec[18:18]),
    .i_d(in_vec[17:2]),
    .i_v(in_vec[1:1]),
    .o_b(in_vec[0:0]),
    .i_b(out_vec[22:22]),
    .o_d(out_vec[21:6]),
    .o_v(out_vec[5:5]),
    .count(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 19'h77836;
    stim[1] = 19'h50080;
    stim[2] = 19'h13a51;
    stim[3] = 19'h07390;
    stim[4] = 19'h11d49;
    stim[5] = 19'h3d9ec;
    stim[6] = 19'h2ad4c;
    stim[7] = 19'h30069;
    stim[8] = 19'h1945f;
    stim[9] = 19'h2c982;
    stim[10] = 19'h274bf;
    stim[11] = 19'h26ab0;
    stim[12] = 19'h3484c;
    stim[13] = 19'h105a9;
    stim[14] = 19'h23fcc;
    stim[15] = 19'h06abd;
    stim[16] = 19'h05a9a;
    stim[17] = 19'h37942;
    stim[18] = 19'h1bbf5;
    stim[19] = 19'h32d97;
    stim[20] = 19'h3dbb8;
    stim[21] = 19'h3b113;
    stim[22] = 19'h04855;
    stim[23] = 19'h31ca0;
    stim[24] = 19'h3213d;
    stim[25] = 19'h097b4;
    stim[26] = 19'h15b60;
    stim[27] = 19'h0c036;
    stim[28] = 19'h08916;
    stim[29] = 19'h3dde4;
    stim[30] = 19'h13df1;
    stim[31] = 19'h2cb51;
    stim[32] = 19'h030ed;
    stim[33] = 19'h17000;
    stim[34] = 19'h3e855;
    stim[35] = 19'h1cdd8;
    stim[36] = 19'h15c9e;
    stim[37] = 19'h2159c;
    stim[38] = 19'h0942f;
    stim[39] = 19'h097af;
    stim[40] = 19'h0b874;
    stim[41] = 19'h01dfd;
    stim[42] = 19'h2227b;
    stim[43] = 19'h2ce56;
    stim[44] = 19'h09dc0;
    stim[45] = 19'h3314a;
    stim[46] = 19'h23827;
    stim[47] = 19'h2832c;
    stim[48] = 19'h0b843;
    stim[49] = 19'h0b744;
    stim[50] = 19'h1d59a;
    stim[51] = 19'h336ba;
    stim[52] = 19'h52587;
    stim[53] = 19'h05b67;
    stim[54] = 19'h2be4d;
    stim[55] = 19'h0183d;
    stim[56] = 19'h3c73c;
    stim[57] = 19'h05ca8;
    stim[58] = 19'h00ae1;
    stim[59] = 19'h38163;
    stim[60] = 19'h3fa36;
    stim[61] = 19'h2d7fa;
    stim[62] = 19'h3c023;
    stim[63] = 19'h1cf09;
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
      expv[0] = 23'hxxxxxx;
      expv[1] = 23'h400000;
      expv[2] = 23'h400000;
      expv[3] = 23'h000000;
      expv[4] = 23'h000000;
      expv[5] = 23'h000000;
      expv[6] = 23'h000000;
      expv[7] = 23'h000000;
      expv[8] = 23'h000000;
      expv[9] = 23'h1945e1;
      expv[10] = 23'h2c9821;
      expv[11] = 23'h2c9822;
      expv[12] = 23'h274be1;
      expv[13] = 23'h274bc0;
      expv[14] = 23'h274bc0;
      expv[15] = 23'h274bc0;
      expv[16] = 23'h274bc0;
      expv[17] = 23'h05a9a1;
      expv[18] = 23'h379421;
      expv[19] = 23'h379421;
      expv[20] = 23'h379422;
      expv[21] = 23'h32d961;
      expv[22] = 23'h32d962;
      expv[23] = 23'h32d962;
      expv[24] = 23'h3b1121;
      expv[25] = 23'h3b1121;
      expv[26] = 23'h3b1100;
      expv[27] = 23'h3b1100;
      expv[28] = 23'h0c0361;
      expv[29] = 23'h089161;
      expv[30] = 23'h089140;
      expv[31] = 23'h089140;
      expv[32] = 23'h089140;
      expv[33] = 23'h089140;
      expv[34] = 23'h089140;
      expv[35] = 23'h089140;
      expv[36] = 23'h089140;
      expv[37] = 23'h15c9e1;
      expv[38] = 23'h15c9c0;
      expv[39] = 23'h0942e1;
      expv[40] = 23'h0942e2;
      expv[41] = 23'h097ae1;
      expv[42] = 23'h097ae1;
      expv[43] = 23'h097ae2;
      expv[44] = 23'h2227a2;
      expv[45] = 23'h2ce561;
      expv[46] = 23'h3314a1;
      expv[47] = 23'h3314a2;
      expv[48] = 23'h238261;
      expv[49] = 23'h238262;
      expv[50] = 23'h0b8421;
      expv[51] = 23'h1d59a1;
      expv[52] = 23'h336ba1;
      expv[53] = 23'h400000;
      expv[54] = 23'h05b661;
      expv[55] = 23'h05b661;
      expv[56] = 23'h05b661;
      expv[57] = 23'h05b640;
      expv[58] = 23'h05b640;
      expv[59] = 23'h05b640;
      expv[60] = 23'h381621;
      expv[61] = 23'h3fa361;
      expv[62] = 23'h2d7fa1;
      expv[63] = 23'h2d7fa2;
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
