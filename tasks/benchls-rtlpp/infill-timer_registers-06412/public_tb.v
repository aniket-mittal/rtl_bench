// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 30;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_06412 dut (
    .clk(clk),
    .ct(in_vec[29:28]),
    .rst(in_vec[27:27]),
    .a(in_vec[26:11]),
    .din(in_vec[10:3]),
    .rd(in_vec[2:2]),
    .wr(in_vec[1:1]),
    .int_tim_ack(in_vec[0:0]),
    .dout(out_vec[8:1]),
    .int_tim_req(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 30'h1d3cf9ce;
    stim[1] = 30'h1d92814c;
    stim[2] = 30'h20e653be;
    stim[3] = 30'h06ed2edb;
    stim[4] = 30'h05bd1fda;
    stim[5] = 30'h196c0e56;
    stim[6] = 30'h14153e29;
    stim[7] = 30'h055b619b;
    stim[8] = 30'h0486548e;
    stim[9] = 30'h11d07333;
    stim[10] = 30'h03cde481;
    stim[11] = 30'h102b5683;
    stim[12] = 30'h20677d31;
    stim[13] = 30'h36bf97ae;
    stim[14] = 30'h10127f67;
    stim[15] = 30'h1740615d;
    stim[16] = 30'h0134dcbb;
    stim[17] = 30'h05dbe2b1;
    stim[18] = 30'h101391da;
    stim[19] = 30'h030a68f3;
    stim[20] = 30'h002be341;
    stim[21] = 30'h0019eae0;
    stim[22] = 30'h030c9fd9;
    stim[23] = 30'h317183e0;
    stim[24] = 30'h302ead75;
    stim[25] = 30'h02bbb286;
    stim[26] = 30'h1459ec5d;
    stim[27] = 30'h1734f215;
    stim[28] = 30'h13826e4c;
    stim[29] = 30'h01e77531;
    stim[30] = 30'h217b0f00;
    stim[31] = 30'h24729d7d;
    stim[32] = 30'h059500ee;
    stim[33] = 30'h20802b2c;
    stim[34] = 30'h01886779;
    stim[35] = 30'h322acd15;
    stim[36] = 30'h002e0839;
    stim[37] = 30'h1177a414;
    stim[38] = 30'h137419a0;
    stim[39] = 30'h2400ff24;
    stim[40] = 30'h256dd18f;
    stim[41] = 30'h215b8a46;
    stim[42] = 30'h25bfb964;
    stim[43] = 30'h119099ee;
    stim[44] = 30'h053b9981;
    stim[45] = 30'h2007c67c;
    stim[46] = 30'h13e66873;
    stim[47] = 30'h1505b3ff;
    stim[48] = 30'h23628edb;
    stim[49] = 30'h251fcb48;
    stim[50] = 30'h12ccea28;
    stim[51] = 30'h252b1f5a;
    stim[52] = 30'h113b50e7;
    stim[53] = 30'h0560bcc6;
    stim[54] = 30'h213cc549;
    stim[55] = 30'h073dc495;
    stim[56] = 30'h3162f33a;
    stim[57] = 30'h07bd7408;
    stim[58] = 30'h04a6e0dd;
    stim[59] = 30'h11881865;
    stim[60] = 30'h33c26ef6;
    stim[61] = 30'h00ee0905;
    stim[62] = 30'h0726facf;
    stim[63] = 30'h0451de03;
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
      expv[0] = 9'h1fx;
      expv[1] = 9'h1fe;
      expv[2] = 9'h1fe;
      expv[3] = 9'h1fe;
      expv[4] = 9'h1fe;
      expv[5] = 9'h1fe;
      expv[6] = 9'h1fe;
      expv[7] = 9'h1fe;
      expv[8] = 9'h1fe;
      expv[9] = 9'h1fe;
      expv[10] = 9'h1fe;
      expv[11] = 9'h1fe;
      expv[12] = 9'h1fe;
      expv[13] = 9'h1fe;
      expv[14] = 9'h1fe;
      expv[15] = 9'h1fe;
      expv[16] = 9'h1fe;
      expv[17] = 9'h1fe;
      expv[18] = 9'h1fe;
      expv[19] = 9'h1fe;
      expv[20] = 9'h1fe;
      expv[21] = 9'h1fe;
      expv[22] = 9'h1fe;
      expv[23] = 9'h1fe;
      expv[24] = 9'h1fe;
      expv[25] = 9'h1fe;
      expv[26] = 9'h1fe;
      expv[27] = 9'h1fe;
      expv[28] = 9'h1fe;
      expv[29] = 9'h1fe;
      expv[30] = 9'h1fe;
      expv[31] = 9'h1fe;
      expv[32] = 9'h1fe;
      expv[33] = 9'h1fe;
      expv[34] = 9'h1fe;
      expv[35] = 9'h1fe;
      expv[36] = 9'h1fe;
      expv[37] = 9'h1fe;
      expv[38] = 9'h1fe;
      expv[39] = 9'h1fe;
      expv[40] = 9'h1fe;
      expv[41] = 9'h1fe;
      expv[42] = 9'h1fe;
      expv[43] = 9'h1fe;
      expv[44] = 9'h1fe;
      expv[45] = 9'h1fe;
      expv[46] = 9'h1fe;
      expv[47] = 9'h1fe;
      expv[48] = 9'h1fe;
      expv[49] = 9'h1fe;
      expv[50] = 9'h1fe;
      expv[51] = 9'h1fe;
      expv[52] = 9'h1fe;
      expv[53] = 9'h1fe;
      expv[54] = 9'h1fe;
      expv[55] = 9'h1fe;
      expv[56] = 9'h1fe;
      expv[57] = 9'h1fe;
      expv[58] = 9'h1fe;
      expv[59] = 9'h1fe;
      expv[60] = 9'h1fe;
      expv[61] = 9'h1fe;
      expv[62] = 9'h1fe;
      expv[63] = 9'h1fe;
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
