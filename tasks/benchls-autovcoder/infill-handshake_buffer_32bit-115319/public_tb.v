// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 35;
  localparam OW = 35;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_115319 dut (
    .ap_clk(clk),
    .ap_rst(in_vec[34:34]),
    .data_in(in_vec[33:2]),
    .vld_in(in_vec[1:1]),
    .ack_out(in_vec[0:0]),
    .ack_in(out_vec[34:34]),
    .data_out(out_vec[33:2]),
    .vld_out(out_vec[1:1]),
    .apdone_blk(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 35'h78d772c4f;
    stim[1] = 35'h5e10bb1ab;
    stim[2] = 35'h08e9c6d27;
    stim[3] = 35'h076f9eb74;
    stim[4] = 35'h215bdf2e9;
    stim[5] = 35'h0e2596adb;
    stim[6] = 35'h138891fc3;
    stim[7] = 35'h2d1958d86;
    stim[8] = 35'h1a6a68f33;
    stim[9] = 35'h3cf0ff944;
    stim[10] = 35'h0900ce053;
    stim[11] = 35'h39619e391;
    stim[12] = 35'h159ad4a65;
    stim[13] = 35'h066bec106;
    stim[14] = 35'h20a4cb65f;
    stim[15] = 35'h246673f1d;
    stim[16] = 35'h1a9a19b82;
    stim[17] = 35'h3b8429ccb;
    stim[18] = 35'h1a6bc0af0;
    stim[19] = 35'h15f297c9e;
    stim[20] = 35'h21af78562;
    stim[21] = 35'h0ecb40495;
    stim[22] = 35'h12b28da49;
    stim[23] = 35'h31c8ad96f;
    stim[24] = 35'h3b560a00d;
    stim[25] = 35'h32aa0dcad;
    stim[26] = 35'h0ee8c4fc0;
    stim[27] = 35'h353c428d5;
    stim[28] = 35'h03bcf7372;
    stim[29] = 35'h302c80795;
    stim[30] = 35'h073d564ee;
    stim[31] = 35'h103c097bd;
    stim[32] = 35'h0b99765dd;
    stim[33] = 35'h35e81eb26;
    stim[34] = 35'h044540082;
    stim[35] = 35'h1f484d70e;
    stim[36] = 35'h3b32618bc;
    stim[37] = 35'h0ad174ef1;
    stim[38] = 35'h176a07144;
    stim[39] = 35'h0f3fc640e;
    stim[40] = 35'h0edc4258c;
    stim[41] = 35'h08f7dd67d;
    stim[42] = 35'h3f2237e19;
    stim[43] = 35'h0b0d7fbd4;
    stim[44] = 35'h311cd6fa4;
    stim[45] = 35'h060711134;
    stim[46] = 35'h2ff5891a8;
    stim[47] = 35'h39767f3a1;
    stim[48] = 35'h19eb9aec1;
    stim[49] = 35'h1a03978a3;
    stim[50] = 35'h2cf53445f;
    stim[51] = 35'h3945801c9;
    stim[52] = 35'h28fb78d6b;
    stim[53] = 35'h07e58ef77;
    stim[54] = 35'h0377919fa;
    stim[55] = 35'h13c01e004;
    stim[56] = 35'h12d8161a7;
    stim[57] = 35'h2f614ba09;
    stim[58] = 35'h12c6f0585;
    stim[59] = 35'h0c4766ee0;
    stim[60] = 35'h0fa08f86a;
    stim[61] = 35'h148903bfd;
    stim[62] = 35'h0d4bc80f5;
    stim[63] = 35'h02520616f;
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
      expv[0] = 35'hxxxxxxxxx;
      expv[1] = 35'hxxxxxxxxx;
      expv[2] = 35'h1e10bb1a8;
      expv[3] = 35'h48e9c6d24;
      expv[4] = 35'h476f9eb74;
      expv[5] = 35'h615bdf2e8;
      expv[6] = 35'h4e2596ada;
      expv[7] = 35'h538891fc3;
      expv[8] = 35'h138891fc3;
      expv[9] = 35'h6d1958d87;
      expv[10] = 35'h6d1958d86;
      expv[11] = 35'h4900ce052;
      expv[12] = 35'h79619e390;
      expv[13] = 35'h559ad4a64;
      expv[14] = 35'h466bec106;
      expv[15] = 35'h60a4cb65e;
      expv[16] = 35'h646673f1c;
      expv[17] = 35'h5a9a19b82;
      expv[18] = 35'h7b8429ccb;
      expv[19] = 35'h7b8429ccb;
      expv[20] = 35'h3b8429ccb;
      expv[21] = 35'h3b8429ccb;
      expv[22] = 35'h55f297c9e;
      expv[23] = 35'h52b28da48;
      expv[24] = 35'h71c8ad96e;
      expv[25] = 35'h7b560a00c;
      expv[26] = 35'h72aa0dcac;
      expv[27] = 35'h4ee8c4fc0;
      expv[28] = 35'h753c428d4;
      expv[29] = 35'h43bcf7372;
      expv[30] = 35'h702c80794;
      expv[31] = 35'h473d564ee;
      expv[32] = 35'h503c097bc;
      expv[33] = 35'h4b99765dc;
      expv[34] = 35'h75e81eb27;
      expv[35] = 35'h35e81eb27;
      expv[36] = 35'h35e81eb27;
      expv[37] = 35'h35e81eb27;
      expv[38] = 35'h444540083;
      expv[39] = 35'h444540083;
      expv[40] = 35'h044540083;
      expv[41] = 35'h044540083;
      expv[42] = 35'h4f3fc640e;
      expv[43] = 35'h7f2237e18;
      expv[44] = 35'h4b0d7fbd4;
      expv[45] = 35'h711cd6fa4;
      expv[46] = 35'h460711134;
      expv[47] = 35'h6ff5891a8;
      expv[48] = 35'h79767f3a0;
      expv[49] = 35'h59eb9aec0;
      expv[50] = 35'h5a03978a2;
      expv[51] = 35'h6cf53445e;
      expv[52] = 35'h7945801c8;
      expv[53] = 35'h68fb78d6a;
      expv[54] = 35'h47e58ef77;
      expv[55] = 35'h07e58ef77;
      expv[56] = 35'h07e58ef77;
      expv[57] = 35'h4377919fa;
      expv[58] = 35'h6f614ba08;
      expv[59] = 35'h52c6f0584;
      expv[60] = 35'h4c4766ee0;
      expv[61] = 35'h4fa08f86a;
      expv[62] = 35'h548903bfc;
      expv[63] = 35'h4d4bc80f4;
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
