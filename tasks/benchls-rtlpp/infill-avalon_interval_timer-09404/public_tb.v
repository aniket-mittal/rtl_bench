// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 22;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_09404 dut (
    .clk(clk),
    .address(in_vec[21:19]),
    .chipselect(in_vec[18:18]),
    .reset_n(in_vec[17:17]),
    .write_n(in_vec[16:16]),
    .writedata(in_vec[15:0]),
    .irq(out_vec[16:16]),
    .readdata(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 22'h206ee3;
    stim[1] = 22'h29ca07;
    stim[2] = 22'h36bcbe;
    stim[3] = 22'h2a9566;
    stim[4] = 22'h1faab6;
    stim[5] = 22'h12fc79;
    stim[6] = 22'h263da8;
    stim[7] = 22'h161637;
    stim[8] = 22'h22126c;
    stim[9] = 22'h324f2c;
    stim[10] = 22'h16effd;
    stim[11] = 22'h1bbe10;
    stim[12] = 22'h3e620e;
    stim[13] = 22'h3ac09e;
    stim[14] = 22'h2339be;
    stim[15] = 22'h1f5f1f;
    stim[16] = 22'h1b0181;
    stim[17] = 22'h3e2a20;
    stim[18] = 22'h07df5e;
    stim[19] = 22'h23aaf8;
    stim[20] = 22'h33fe13;
    stim[21] = 22'h26fb79;
    stim[22] = 22'h3fe467;
    stim[23] = 22'h371e5d;
    stim[24] = 22'h22c819;
    stim[25] = 22'h12f69a;
    stim[26] = 22'h12f478;
    stim[27] = 22'h02dcae;
    stim[28] = 22'h039d2a;
    stim[29] = 22'h3aa1ac;
    stim[30] = 22'h3b7911;
    stim[31] = 22'h224bf9;
    stim[32] = 22'h12d8e5;
    stim[33] = 22'h0fd2b1;
    stim[34] = 22'h3205fe;
    stim[35] = 22'h324da6;
    stim[36] = 22'h2b6e0a;
    stim[37] = 22'h0edcff;
    stim[38] = 22'h2beb8a;
    stim[39] = 22'h370971;
    stim[40] = 22'h1be440;
    stim[41] = 22'h22b3c8;
    stim[42] = 22'h2acc13;
    stim[43] = 22'h237da1;
    stim[44] = 22'h3ee6c9;
    stim[45] = 22'h3bc6e3;
    stim[46] = 22'h26288a;
    stim[47] = 22'h063f5b;
    stim[48] = 22'h0bd7a5;
    stim[49] = 22'h1233be;
    stim[50] = 22'h1b8023;
    stim[51] = 22'h16aeac;
    stim[52] = 22'h0eb8e2;
    stim[53] = 22'h36afbe;
    stim[54] = 22'h2ed5bf;
    stim[55] = 22'h3e17f9;
    stim[56] = 22'h0e87d0;
    stim[57] = 22'h0ad821;
    stim[58] = 22'h026131;
    stim[59] = 22'h222569;
    stim[60] = 22'h17bddb;
    stim[61] = 22'h2f5234;
    stim[62] = 22'h2f1376;
    stim[63] = 22'h131712;
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
      expv[0] = 17'h00000;
      expv[1] = 17'h00000;
      expv[2] = 17'h00000;
      expv[3] = 17'h00000;
      expv[4] = 17'h00000;
      expv[5] = 17'h00000;
      expv[6] = 17'h0c34f;
      expv[7] = 17'h00000;
      expv[8] = 17'h0c34f;
      expv[9] = 17'h0c34f;
      expv[10] = 17'h00000;
      expv[11] = 17'h01637;
      expv[12] = 17'h00000;
      expv[13] = 17'h00000;
      expv[14] = 17'h00000;
      expv[15] = 17'h0c34f;
      expv[16] = 17'h00000;
      expv[17] = 17'h00000;
      expv[18] = 17'h00000;
      expv[19] = 17'h00000;
      expv[20] = 17'h0c34f;
      expv[21] = 17'h00000;
      expv[22] = 17'h0c34f;
      expv[23] = 17'h00000;
      expv[24] = 17'h00000;
      expv[25] = 17'h0effd;
      expv[26] = 17'h0effd;
      expv[27] = 17'h0effd;
      expv[28] = 17'h00000;
      expv[29] = 17'h00000;
      expv[30] = 17'h00000;
      expv[31] = 17'h00000;
      expv[32] = 17'h0effd;
      expv[33] = 17'h0effd;
      expv[34] = 17'h00000;
      expv[35] = 17'h00000;
      expv[36] = 17'h00000;
      expv[37] = 17'h00000;
      expv[38] = 17'h00000;
      expv[39] = 17'h00000;
      expv[40] = 17'h00000;
      expv[41] = 17'h00000;
      expv[42] = 17'h0effd;
      expv[43] = 17'h00000;
      expv[44] = 17'h0effd;
      expv[45] = 17'h00000;
      expv[46] = 17'h00000;
      expv[47] = 17'h0effd;
      expv[48] = 17'h00002;
      expv[49] = 17'h0000f;
      expv[50] = 17'h0effd;
      expv[51] = 17'h00000;
      expv[52] = 17'h0effd;
      expv[53] = 17'h0000f;
      expv[54] = 17'h00000;
      expv[55] = 17'h00000;
      expv[56] = 17'h00000;
      expv[57] = 17'h00002;
      expv[58] = 17'h00000;
      expv[59] = 17'h00000;
      expv[60] = 17'h0aeac;
      expv[61] = 17'h0aeac;
      expv[62] = 17'h00000;
      expv[63] = 17'h00000;
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
