// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 27;
  localparam OW = 25;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_09840 dut (
    .clock(clk),
    .reset(in_vec[26:26]),
    .strobe_in(in_vec[25:25]),
    .enable(in_vec[24:24]),
    .rate(in_vec[23:0]),
    .strobe_out(out_vec[24:24]),
    .count(out_vec[23:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 27'h58c29f8;
    stim[1] = 27'h581ccb0;
    stim[2] = 27'h3c11d56;
    stim[3] = 27'h26f9849;
    stim[4] = 27'h0863fa2;
    stim[5] = 27'h368644e;
    stim[6] = 27'h46af840;
    stim[7] = 27'h1b89089;
    stim[8] = 27'h0c78699;
    stim[9] = 27'h153d31f;
    stim[10] = 27'h3515d60;
    stim[11] = 27'h03e96a7;
    stim[12] = 27'h3aee6b5;
    stim[13] = 27'h2ce34ea;
    stim[14] = 27'h29ba9c4;
    stim[15] = 27'h085853e;
    stim[16] = 27'h23d0e0b;
    stim[17] = 27'h3c9b41b;
    stim[18] = 27'h3af4014;
    stim[19] = 27'h099d2bf;
    stim[20] = 27'h3e16d28;
    stim[21] = 27'h0ed89b4;
    stim[22] = 27'h0e8a80e;
    stim[23] = 27'h3a84c77;
    stim[24] = 27'h271ec83;
    stim[25] = 27'h163da81;
    stim[26] = 27'h00d0ce8;
    stim[27] = 27'h0c6ed26;
    stim[28] = 27'h140847b;
    stim[29] = 27'h0b6af9e;
    stim[30] = 27'h33ec397;
    stim[31] = 27'h1afbbc6;
    stim[32] = 27'h23e20f1;
    stim[33] = 27'h2c2528f;
    stim[34] = 27'h119c8a4;
    stim[35] = 27'h1d692c9;
    stim[36] = 27'h2167ddb;
    stim[37] = 27'h3b2221c;
    stim[38] = 27'h02a0638;
    stim[39] = 27'h36e1dec;
    stim[40] = 27'h1d67ff4;
    stim[41] = 27'h3544ae8;
    stim[42] = 27'h348f8fe;
    stim[43] = 27'h0cccd26;
    stim[44] = 27'h310f0eb;
    stim[45] = 27'h3e4b1a6;
    stim[46] = 27'h0251006;
    stim[47] = 27'h3af1027;
    stim[48] = 27'h28ede79;
    stim[49] = 27'h094a949;
    stim[50] = 27'h28646ef;
    stim[51] = 27'h4ef519c;
    stim[52] = 27'h1527b2d;
    stim[53] = 27'h1f1f52b;
    stim[54] = 27'h7d2de78;
    stim[55] = 27'h02bc585;
    stim[56] = 27'h1ee8009;
    stim[57] = 27'h2de2146;
    stim[58] = 27'h0508403;
    stim[59] = 27'h0e37510;
    stim[60] = 27'h2bb5db4;
    stim[61] = 27'h2539dde;
    stim[62] = 27'h1bc827f;
    stim[63] = 27'h10307d3;
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
      expv[0] = 25'hxxxxxxx;
      expv[1] = 25'h0000000;
      expv[2] = 25'h0000000;
      expv[3] = 25'h0000001;
      expv[4] = 25'h0000000;
      expv[5] = 25'h0000000;
      expv[6] = 25'h0000001;
      expv[7] = 25'h0000000;
      expv[8] = 25'h0000000;
      expv[9] = 25'h0000000;
      expv[10] = 25'h0000000;
      expv[11] = 25'h0000001;
      expv[12] = 25'h0000000;
      expv[13] = 25'h0000001;
      expv[14] = 25'h0000000;
      expv[15] = 25'h0000000;
      expv[16] = 25'h0000000;
      expv[17] = 25'h0000000;
      expv[18] = 25'h0000001;
      expv[19] = 25'h0000002;
      expv[20] = 25'h0000000;
      expv[21] = 25'h0000001;
      expv[22] = 25'h0000000;
      expv[23] = 25'h0000000;
      expv[24] = 25'h0000001;
      expv[25] = 25'h0000000;
      expv[26] = 25'h0000000;
      expv[27] = 25'h0000000;
      expv[28] = 25'h0000000;
      expv[29] = 25'h0000000;
      expv[30] = 25'h0000000;
      expv[31] = 25'h0000001;
      expv[32] = 25'h0000001;
      expv[33] = 25'h0000000;
      expv[34] = 25'h0000000;
      expv[35] = 25'h0000000;
      expv[36] = 25'h0000000;
      expv[37] = 25'h0000000;
      expv[38] = 25'h0000001;
      expv[39] = 25'h0000000;
      expv[40] = 25'h0000001;
      expv[41] = 25'h0000001;
      expv[42] = 25'h0000002;
      expv[43] = 25'h0000003;
      expv[44] = 25'h0000000;
      expv[45] = 25'h0000001;
      expv[46] = 25'h0000002;
      expv[47] = 25'h0000000;
      expv[48] = 25'h0000001;
      expv[49] = 25'h0000000;
      expv[50] = 25'h0000000;
      expv[51] = 25'h0000000;
      expv[52] = 25'h0000000;
      expv[53] = 25'h0000000;
      expv[54] = 25'h0000000;
      expv[55] = 25'h0000000;
      expv[56] = 25'h0000000;
      expv[57] = 25'h0000000;
      expv[58] = 25'h0000000;
      expv[59] = 25'h0000000;
      expv[60] = 25'h0000000;
      expv[61] = 25'h0000000;
      expv[62] = 25'h0000000;
      expv[63] = 25'h0000000;
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
