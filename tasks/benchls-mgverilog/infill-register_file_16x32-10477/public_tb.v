// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 37;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_10477 dut (
    .clk(clk),
    .addr(in_vec[36:33]),
    .wrenb(in_vec[32:32]),
    .wrdata(in_vec[31:0]),
    .rddata(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 37'h1fa380f847;
    stim[1] = 37'h1dc6b1552d;
    stim[2] = 37'h00d0fd85cc;
    stim[3] = 37'h025a87b4ad;
    stim[4] = 37'h0826322c2b;
    stim[5] = 37'h0a92a1ee30;
    stim[6] = 37'h18e5a4226a;
    stim[7] = 37'h0629c28448;
    stim[8] = 37'h1e298cd7f6;
    stim[9] = 37'h09afc016fc;
    stim[10] = 37'h0abab7a6ca;
    stim[11] = 37'h1f5a174059;
    stim[12] = 37'h17de493880;
    stim[13] = 37'h07da07e4d6;
    stim[14] = 37'h0a45011a9d;
    stim[15] = 37'h015db05e32;
    stim[16] = 37'h06b2bcecdb;
    stim[17] = 37'h1e7ba27433;
    stim[18] = 37'h1141a2b7ae;
    stim[19] = 37'h1e0be3af55;
    stim[20] = 37'h0184b6cda8;
    stim[21] = 37'h0f14471509;
    stim[22] = 37'h06f3ab580e;
    stim[23] = 37'h1a546da54f;
    stim[24] = 37'h1c394d3e28;
    stim[25] = 37'h07ac788535;
    stim[26] = 37'h1c579f0058;
    stim[27] = 37'h110c6512e3;
    stim[28] = 37'h193220504f;
    stim[29] = 37'h0869a6432d;
    stim[30] = 37'h1acd28b267;
    stim[31] = 37'h0454e7974d;
    stim[32] = 37'h0f939cf3e9;
    stim[33] = 37'h1b2b620157;
    stim[34] = 37'h126e6f667a;
    stim[35] = 37'h13e27db107;
    stim[36] = 37'h15a159d075;
    stim[37] = 37'h0bc896fff5;
    stim[38] = 37'h0e18521c1d;
    stim[39] = 37'h0893bdf0f5;
    stim[40] = 37'h0ba6031bf9;
    stim[41] = 37'h12c0c55a47;
    stim[42] = 37'h128e6b003b;
    stim[43] = 37'h1b4733d757;
    stim[44] = 37'h1591df3573;
    stim[45] = 37'h02b755f997;
    stim[46] = 37'h151589499e;
    stim[47] = 37'h06cd853109;
    stim[48] = 37'h04036008ef;
    stim[49] = 37'h0e1843352f;
    stim[50] = 37'h1aec537e11;
    stim[51] = 37'h01950b71cf;
    stim[52] = 37'h1926b21ea9;
    stim[53] = 37'h1838ec35b7;
    stim[54] = 37'h099d496d27;
    stim[55] = 37'h1b984a5d21;
    stim[56] = 37'h0a187cf1f6;
    stim[57] = 37'h1f566b3a6c;
    stim[58] = 37'h18223437e8;
    stim[59] = 37'h0ec7f1e89e;
    stim[60] = 37'h12d9cebfd3;
    stim[61] = 37'h10ad7a0824;
    stim[62] = 37'h1f6445a8bc;
    stim[63] = 37'h08bc6a4693;
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
      expv[0] = 32'hxxxxxxxx;
      expv[1] = 32'hxxxxxxxx;
      expv[2] = 32'hxxxxxxxx;
      expv[3] = 32'hxxxxxxxx;
      expv[4] = 32'hxxxxxxxx;
      expv[5] = 32'hxxxxxxxx;
      expv[6] = 32'hxxxxxxxx;
      expv[7] = 32'hxxxxxxxx;
      expv[8] = 32'hxxxxxxxx;
      expv[9] = 32'ha380f847;
      expv[10] = 32'hxxxxxxxx;
      expv[11] = 32'hxxxxxxxx;
      expv[12] = 32'ha380f847;
      expv[13] = 32'hxxxxxxxx;
      expv[14] = 32'hxxxxxxxx;
      expv[15] = 32'hxxxxxxxx;
      expv[16] = 32'hxxxxxxxx;
      expv[17] = 32'hda07e4d6;
      expv[18] = 32'h5a174059;
      expv[19] = 32'hxxxxxxxx;
      expv[20] = 32'h5a174059;
      expv[21] = 32'h5db05e32;
      expv[22] = 32'hxxxxxxxx;
      expv[23] = 32'hda07e4d6;
      expv[24] = 32'hxxxxxxxx;
      expv[25] = 32'hc6b1552d;
      expv[26] = 32'hda07e4d6;
      expv[27] = 32'hc6b1552d;
      expv[28] = 32'h41a2b7ae;
      expv[29] = 32'hxxxxxxxx;
      expv[30] = 32'hafc016fc;
      expv[31] = 32'hxxxxxxxx;
      expv[32] = 32'hxxxxxxxx;
      expv[33] = 32'h14471509;
      expv[34] = 32'hxxxxxxxx;
      expv[35] = 32'hxxxxxxxx;
      expv[36] = 32'hxxxxxxxx;
      expv[37] = 32'hxxxxxxxx;
      expv[38] = 32'hxxxxxxxx;
      expv[39] = 32'h939cf3e9;
      expv[40] = 32'hafc016fc;
      expv[41] = 32'hc896fff5;
      expv[42] = 32'he27db107;
      expv[43] = 32'he27db107;
      expv[44] = 32'h2b620157;
      expv[45] = 32'ha159d075;
      expv[46] = 32'hxxxxxxxx;
      expv[47] = 32'h91df3573;
      expv[48] = 32'hac788535;
      expv[49] = 32'hxxxxxxxx;
      expv[50] = 32'h939cf3e9;
      expv[51] = 32'h4733d757;
      expv[52] = 32'h84b6cda8;
      expv[53] = 32'h3220504f;
      expv[54] = 32'h26b21ea9;
      expv[55] = 32'hafc016fc;
      expv[56] = 32'h4733d757;
      expv[57] = 32'ha6031bf9;
      expv[58] = 32'h5a174059;
      expv[59] = 32'h26b21ea9;
      expv[60] = 32'h939cf3e9;
      expv[61] = 32'he27db107;
      expv[62] = 32'h0c6512e3;
      expv[63] = 32'h566b3a6c;
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
