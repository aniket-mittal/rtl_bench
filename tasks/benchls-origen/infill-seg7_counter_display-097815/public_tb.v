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

  origen_097815 dut (
    .clk(clk),
    .SW(in_vec[15:0]),
    .CA(out_vec[15:15]),
    .CB(out_vec[14:14]),
    .CC(out_vec[13:13]),
    .CD(out_vec[12:12]),
    .CE(out_vec[11:11]),
    .CF(out_vec[10:10]),
    .CG(out_vec[9:9]),
    .DP(out_vec[8:8]),
    .AN(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 16'h8af1;
    stim[1] = 16'hc8f8;
    stim[2] = 16'hf7e5;
    stim[3] = 16'hafab;
    stim[4] = 16'h92a6;
    stim[5] = 16'ha1ec;
    stim[6] = 16'h3e67;
    stim[7] = 16'hf77f;
    stim[8] = 16'h34b9;
    stim[9] = 16'ha952;
    stim[10] = 16'h8dc4;
    stim[11] = 16'hae32;
    stim[12] = 16'hd2d1;
    stim[13] = 16'h768b;
    stim[14] = 16'ha9bd;
    stim[15] = 16'h929c;
    stim[16] = 16'h7977;
    stim[17] = 16'h7e46;
    stim[18] = 16'h70c5;
    stim[19] = 16'h29ba;
    stim[20] = 16'heb52;
    stim[21] = 16'hae11;
    stim[22] = 16'h6a0f;
    stim[23] = 16'he083;
    stim[24] = 16'hc216;
    stim[25] = 16'h7460;
    stim[26] = 16'h3c21;
    stim[27] = 16'haf71;
    stim[28] = 16'hd111;
    stim[29] = 16'h7870;
    stim[30] = 16'he3a6;
    stim[31] = 16'h0eae;
    stim[32] = 16'he522;
    stim[33] = 16'h7e6e;
    stim[34] = 16'h8996;
    stim[35] = 16'h2f4e;
    stim[36] = 16'h614c;
    stim[37] = 16'h8645;
    stim[38] = 16'h1da9;
    stim[39] = 16'h9665;
    stim[40] = 16'hf2ca;
    stim[41] = 16'h5051;
    stim[42] = 16'h80a7;
    stim[43] = 16'hbf39;
    stim[44] = 16'h01f1;
    stim[45] = 16'h51fd;
    stim[46] = 16'hc4d9;
    stim[47] = 16'h134d;
    stim[48] = 16'h0cd4;
    stim[49] = 16'hcd3b;
    stim[50] = 16'h43c1;
    stim[51] = 16'h3494;
    stim[52] = 16'h2fbb;
    stim[53] = 16'h4f53;
    stim[54] = 16'h4777;
    stim[55] = 16'hd882;
    stim[56] = 16'hfdf0;
    stim[57] = 16'haac1;
    stim[58] = 16'h5648;
    stim[59] = 16'hf556;
    stim[60] = 16'hbf6a;
    stim[61] = 16'h46ff;
    stim[62] = 16'h200a;
    stim[63] = 16'h37f9;
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
      expv[0] = 16'hxxxx;
      expv[1] = 16'hffxx;
      expv[2] = 16'hffxx;
      expv[3] = 16'hffxx;
      expv[4] = 16'hffxx;
      expv[5] = 16'hffxx;
      expv[6] = 16'hffxx;
      expv[7] = 16'hffxx;
      expv[8] = 16'hffxx;
      expv[9] = 16'hffxx;
      expv[10] = 16'hffxx;
      expv[11] = 16'hffxx;
      expv[12] = 16'hffxx;
      expv[13] = 16'hffxx;
      expv[14] = 16'hffxx;
      expv[15] = 16'hffxx;
      expv[16] = 16'hffxx;
      expv[17] = 16'hffxx;
      expv[18] = 16'hffxx;
      expv[19] = 16'hffxx;
      expv[20] = 16'hffxx;
      expv[21] = 16'hffxx;
      expv[22] = 16'hffxx;
      expv[23] = 16'hffxx;
      expv[24] = 16'hffxx;
      expv[25] = 16'hffxx;
      expv[26] = 16'hffxx;
      expv[27] = 16'hffxx;
      expv[28] = 16'hffxx;
      expv[29] = 16'hffxx;
      expv[30] = 16'hffxx;
      expv[31] = 16'hffxx;
      expv[32] = 16'hffxx;
      expv[33] = 16'hffxx;
      expv[34] = 16'hffxx;
      expv[35] = 16'hffxx;
      expv[36] = 16'hffxx;
      expv[37] = 16'hffxx;
      expv[38] = 16'hffxx;
      expv[39] = 16'hffxx;
      expv[40] = 16'hffxx;
      expv[41] = 16'hffxx;
      expv[42] = 16'hffxx;
      expv[43] = 16'hffxx;
      expv[44] = 16'hffxx;
      expv[45] = 16'hffxx;
      expv[46] = 16'hffxx;
      expv[47] = 16'hffxx;
      expv[48] = 16'hffxx;
      expv[49] = 16'hffxx;
      expv[50] = 16'hffxx;
      expv[51] = 16'hffxx;
      expv[52] = 16'hffxx;
      expv[53] = 16'hffxx;
      expv[54] = 16'hffxx;
      expv[55] = 16'hffxx;
      expv[56] = 16'hffxx;
      expv[57] = 16'hffxx;
      expv[58] = 16'hffxx;
      expv[59] = 16'hffxx;
      expv[60] = 16'hffxx;
      expv[61] = 16'hffxx;
      expv[62] = 16'hffxx;
      expv[63] = 16'hffxx;
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
