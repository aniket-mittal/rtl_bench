// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  sirv_gnrl_dffr dut (
    .clk(clk),
    .dnxt(in_vec[32:1]),
    .rst_n(in_vec[0:0]),
    .qout(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h16047fd82;
    stim[1] = 33'h1108684e6;
    stim[2] = 33'h1648298f9;
    stim[3] = 33'h0ee54c2e7;
    stim[4] = 33'h07bc6a6a7;
    stim[5] = 33'h0a957f143;
    stim[6] = 33'h040110487;
    stim[7] = 33'h16ae2e867;
    stim[8] = 33'h1e1ae400b;
    stim[9] = 33'h075c68f93;
    stim[10] = 33'h096569209;
    stim[11] = 33'h14893565c;
    stim[12] = 33'h079cdbe81;
    stim[13] = 33'h0949156e3;
    stim[14] = 33'h0e9c01d39;
    stim[15] = 33'h19468682f;
    stim[16] = 33'h13e1e9817;
    stim[17] = 33'h15e2664cd;
    stim[18] = 33'h097a9fb21;
    stim[19] = 33'h1a15a4283;
    stim[20] = 33'h161292ad5;
    stim[21] = 33'h13b2dbb5b;
    stim[22] = 33'h1570b75b1;
    stim[23] = 33'h1c7abebf4;
    stim[24] = 33'h143f1e339;
    stim[25] = 33'h0d8742f0b;
    stim[26] = 33'h1f3688d77;
    stim[27] = 33'h18825fc91;
    stim[28] = 33'h0efd5757b;
    stim[29] = 33'h1de3e6243;
    stim[30] = 33'h1bd71c127;
    stim[31] = 33'h148acdc7f;
    stim[32] = 33'h068ffa2ab;
    stim[33] = 33'h15b7bb9d9;
    stim[34] = 33'h0d0866549;
    stim[35] = 33'h00bfcd439;
    stim[36] = 33'h1ec4e8dbf;
    stim[37] = 33'h1581cb343;
    stim[38] = 33'h16d51eecf;
    stim[39] = 33'h0b1daff23;
    stim[40] = 33'h04902c677;
    stim[41] = 33'h085c42abb;
    stim[42] = 33'h04fe678eb;
    stim[43] = 33'h0afc5e3ed;
    stim[44] = 33'h1f7a91627;
    stim[45] = 33'h12cf25dcb;
    stim[46] = 33'h17c2126b1;
    stim[47] = 33'h0d512183b;
    stim[48] = 33'h1cda722ab;
    stim[49] = 33'h11695363b;
    stim[50] = 33'h16bdd3e03;
    stim[51] = 33'h1e6572049;
    stim[52] = 33'h063074397;
    stim[53] = 33'h1c78462c1;
    stim[54] = 33'h168c0993d;
    stim[55] = 33'h033ddc8f5;
    stim[56] = 33'h05d4c1c7b;
    stim[57] = 33'h1797f3dd1;
    stim[58] = 33'h0754831cf;
    stim[59] = 33'h15066e321;
    stim[60] = 33'h1df123e09;
    stim[61] = 33'h136500cd0;
    stim[62] = 33'h03a55b567;
    stim[63] = 33'h0b256e287;
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
      expv[0] = 32'h00000000;
      expv[1] = 32'h00000000;
      expv[2] = 32'h00000000;
      expv[3] = 32'hb2414c7c;
      expv[4] = 32'h772a6173;
      expv[5] = 32'h3de35353;
      expv[6] = 32'h54abf8a1;
      expv[7] = 32'h20088243;
      expv[8] = 32'hb5717433;
      expv[9] = 32'hf0d72005;
      expv[10] = 32'h3ae347c9;
      expv[11] = 32'h00000000;
      expv[12] = 32'h00000000;
      expv[13] = 32'h3ce6df40;
      expv[14] = 32'h4a48ab71;
      expv[15] = 32'h74e00e9c;
      expv[16] = 32'hca343417;
      expv[17] = 32'h9f0f4c0b;
      expv[18] = 32'haf133266;
      expv[19] = 32'h4bd4fd90;
      expv[20] = 32'hd0ad2141;
      expv[21] = 32'hb094956a;
      expv[22] = 32'h9d96ddad;
      expv[23] = 32'h00000000;
      expv[24] = 32'h00000000;
      expv[25] = 32'ha1f8f19c;
      expv[26] = 32'h6c3a1785;
      expv[27] = 32'hf9b446bb;
      expv[28] = 32'hc412fe48;
      expv[29] = 32'h77eababd;
      expv[30] = 32'hef1f3121;
      expv[31] = 32'hdeb8e093;
      expv[32] = 32'ha4566e3f;
      expv[33] = 32'h347fd155;
      expv[34] = 32'hadbddcec;
      expv[35] = 32'h684332a4;
      expv[36] = 32'h05fe6a1c;
      expv[37] = 32'hf62746df;
      expv[38] = 32'hac0e59a1;
      expv[39] = 32'hb6a8f767;
      expv[40] = 32'h58ed7f91;
      expv[41] = 32'h2481633b;
      expv[42] = 32'h42e2155d;
      expv[43] = 32'h27f33c75;
      expv[44] = 32'h57e2f1f6;
      expv[45] = 32'hfbd48b13;
      expv[46] = 32'h96792ee5;
      expv[47] = 32'hbe109358;
      expv[48] = 32'h6a890c1d;
      expv[49] = 32'he6d39155;
      expv[50] = 32'h8b4a9b1d;
      expv[51] = 32'hb5ee9f01;
      expv[52] = 32'hf32b9024;
      expv[53] = 32'h3183a1cb;
      expv[54] = 32'he3c23160;
      expv[55] = 32'hb4604c9e;
      expv[56] = 32'h19eee47a;
      expv[57] = 32'h2ea60e3d;
      expv[58] = 32'hbcbf9ee8;
      expv[59] = 32'h3aa418e7;
      expv[60] = 32'ha8337190;
      expv[61] = 32'h00000000;
      expv[62] = 32'h00000000;
      expv[63] = 32'h1d2adab3;
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
