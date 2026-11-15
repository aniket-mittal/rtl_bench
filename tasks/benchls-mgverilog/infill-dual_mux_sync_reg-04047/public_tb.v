// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04047 dut (
    .clk(clk),
    .in0(in_vec[8:8]),
    .in1(in_vec[7:7]),
    .in2(in_vec[6:6]),
    .in3(in_vec[5:5]),
    .d0(in_vec[4:4]),
    .d1(in_vec[3:3]),
    .d2(in_vec[2:2]),
    .d3(in_vec[1:1]),
    .reset(in_vec[0:0]),
    .out0(out_vec[3:3]),
    .out1(out_vec[2:2]),
    .out2(out_vec[1:1]),
    .out3(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h089;
    stim[1] = 9'h041;
    stim[2] = 9'h0be;
    stim[3] = 9'h1d6;
    stim[4] = 9'h09c;
    stim[5] = 9'h02e;
    stim[6] = 9'h064;
    stim[7] = 9'h03e;
    stim[8] = 9'h160;
    stim[9] = 9'h0ae;
    stim[10] = 9'h0a4;
    stim[11] = 9'h158;
    stim[12] = 9'h12a;
    stim[13] = 9'h0be;
    stim[14] = 9'h16e;
    stim[15] = 9'h024;
    stim[16] = 9'h142;
    stim[17] = 9'h056;
    stim[18] = 9'h0e8;
    stim[19] = 9'h1a0;
    stim[20] = 9'h11a;
    stim[21] = 9'h04e;
    stim[22] = 9'h108;
    stim[23] = 9'h1ec;
    stim[24] = 9'h020;
    stim[25] = 9'h118;
    stim[26] = 9'h1c6;
    stim[27] = 9'h176;
    stim[28] = 9'h132;
    stim[29] = 9'h0d2;
    stim[30] = 9'h052;
    stim[31] = 9'h050;
    stim[32] = 9'h096;
    stim[33] = 9'h0c8;
    stim[34] = 9'h1dc;
    stim[35] = 9'h168;
    stim[36] = 9'h052;
    stim[37] = 9'h050;
    stim[38] = 9'h114;
    stim[39] = 9'h122;
    stim[40] = 9'h142;
    stim[41] = 9'h026;
    stim[42] = 9'h0a0;
    stim[43] = 9'h088;
    stim[44] = 9'h00a;
    stim[45] = 9'h120;
    stim[46] = 9'h14e;
    stim[47] = 9'h104;
    stim[48] = 9'h108;
    stim[49] = 9'h0c0;
    stim[50] = 9'h1dc;
    stim[51] = 9'h118;
    stim[52] = 9'h1d4;
    stim[53] = 9'h040;
    stim[54] = 9'h058;
    stim[55] = 9'h01a;
    stim[56] = 9'h120;
    stim[57] = 9'h12c;
    stim[58] = 9'h1c0;
    stim[59] = 9'h0ec;
    stim[60] = 9'h1fa;
    stim[61] = 9'h11c;
    stim[62] = 9'h090;
    stim[63] = 9'h080;
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
      expv[0] = 4'hx;
      expv[1] = 4'h0;
      expv[2] = 4'h0;
      expv[3] = 4'hf;
      expv[4] = 4'he;
      expv[5] = 4'ha;
      expv[6] = 4'h5;
      expv[7] = 4'h5;
      expv[8] = 4'h5;
      expv[9] = 4'hf;
      expv[10] = 4'h7;
      expv[11] = 4'h2;
      expv[12] = 4'h3;
      expv[13] = 4'hf;
      expv[14] = 4'hf;
      expv[15] = 4'hd;
      expv[16] = 4'h0;
      expv[17] = 4'he;
      expv[18] = 4'h4;
      expv[19] = 4'h5;
      expv[20] = 4'ha;
      expv[21] = 4'h2;
      expv[22] = 4'h0;
      expv[23] = 4'ha;
      expv[24] = 4'hf;
      expv[25] = 4'h0;
      expv[26] = 4'h2;
      expv[27] = 4'he;
      expv[28] = 4'h5;
      expv[29] = 4'h3;
      expv[30] = 4'hc;
      expv[31] = 4'h4;
      expv[32] = 4'h5;
      expv[33] = 4'ha;
      expv[34] = 4'h1;
      expv[35] = 4'hb;
      expv[36] = 4'hf;
      expv[37] = 4'h4;
      expv[38] = 4'h5;
      expv[39] = 4'h0;
      expv[40] = 4'hb;
      expv[41] = 4'he;
      expv[42] = 4'h1;
      expv[43] = 4'h0;
      expv[44] = 4'h0;
      expv[45] = 4'h0;
      expv[46] = 4'ha;
      expv[47] = 4'h8;
      expv[48] = 4'h8;
      expv[49] = 4'ha;
      expv[50] = 4'h5;
      expv[51] = 4'hb;
      expv[52] = 4'h2;
      expv[53] = 4'hf;
      expv[54] = 4'h5;
      expv[55] = 4'h1;
      expv[56] = 4'h0;
      expv[57] = 4'ha;
      expv[58] = 4'hc;
      expv[59] = 4'hf;
      expv[60] = 4'h7;
      expv[61] = 4'hf;
      expv[62] = 4'h0;
      expv[63] = 4'h8;
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
