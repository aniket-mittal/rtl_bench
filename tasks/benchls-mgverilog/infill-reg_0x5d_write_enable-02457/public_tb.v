// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02457 dut (
    .clk(clk),
    .reset(in_vec[9:9]),
    .wenb(in_vec[8:8]),
    .in_data(in_vec[7:0]),
    .reg_0x5D(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h392;
    stim[1] = 10'h201;
    stim[2] = 10'h091;
    stim[3] = 10'h179;
    stim[4] = 10'h0a6;
    stim[5] = 10'h10d;
    stim[6] = 10'h174;
    stim[7] = 10'h034;
    stim[8] = 10'h19a;
    stim[9] = 10'h1aa;
    stim[10] = 10'h1b3;
    stim[11] = 10'h018;
    stim[12] = 10'h18e;
    stim[13] = 10'h103;
    stim[14] = 10'h1a9;
    stim[15] = 10'h1d7;
    stim[16] = 10'h1ef;
    stim[17] = 10'h171;
    stim[18] = 10'h025;
    stim[19] = 10'h059;
    stim[20] = 10'h1cb;
    stim[21] = 10'h1f2;
    stim[22] = 10'h14b;
    stim[23] = 10'h18f;
    stim[24] = 10'h05f;
    stim[25] = 10'h140;
    stim[26] = 10'h19f;
    stim[27] = 10'h0ce;
    stim[28] = 10'h090;
    stim[29] = 10'h0b5;
    stim[30] = 10'h0c5;
    stim[31] = 10'h0a5;
    stim[32] = 10'h0e8;
    stim[33] = 10'h027;
    stim[34] = 10'h14b;
    stim[35] = 10'h0e2;
    stim[36] = 10'h1b3;
    stim[37] = 10'h090;
    stim[38] = 10'h18b;
    stim[39] = 10'h197;
    stim[40] = 10'h19d;
    stim[41] = 10'h0a7;
    stim[42] = 10'h154;
    stim[43] = 10'h0e8;
    stim[44] = 10'h1a3;
    stim[45] = 10'h0f7;
    stim[46] = 10'h0f8;
    stim[47] = 10'h1f2;
    stim[48] = 10'h183;
    stim[49] = 10'h05a;
    stim[50] = 10'h027;
    stim[51] = 10'h09d;
    stim[52] = 10'h00a;
    stim[53] = 10'h074;
    stim[54] = 10'h08a;
    stim[55] = 10'h172;
    stim[56] = 10'h30f;
    stim[57] = 10'h03e;
    stim[58] = 10'h08a;
    stim[59] = 10'h183;
    stim[60] = 10'h1dd;
    stim[61] = 10'h0b7;
    stim[62] = 10'h075;
    stim[63] = 10'h077;
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
      expv[0] = 8'hxx;
      expv[1] = 8'h00;
      expv[2] = 8'h00;
      expv[3] = 8'h91;
      expv[4] = 8'h91;
      expv[5] = 8'ha6;
      expv[6] = 8'ha6;
      expv[7] = 8'ha6;
      expv[8] = 8'h34;
      expv[9] = 8'h34;
      expv[10] = 8'h34;
      expv[11] = 8'h34;
      expv[12] = 8'h18;
      expv[13] = 8'h18;
      expv[14] = 8'h18;
      expv[15] = 8'h18;
      expv[16] = 8'h18;
      expv[17] = 8'h18;
      expv[18] = 8'h18;
      expv[19] = 8'h25;
      expv[20] = 8'h59;
      expv[21] = 8'h59;
      expv[22] = 8'h59;
      expv[23] = 8'h59;
      expv[24] = 8'h59;
      expv[25] = 8'h5f;
      expv[26] = 8'h5f;
      expv[27] = 8'h5f;
      expv[28] = 8'hce;
      expv[29] = 8'h90;
      expv[30] = 8'hb5;
      expv[31] = 8'hc5;
      expv[32] = 8'ha5;
      expv[33] = 8'he8;
      expv[34] = 8'h27;
      expv[35] = 8'h27;
      expv[36] = 8'he2;
      expv[37] = 8'he2;
      expv[38] = 8'h90;
      expv[39] = 8'h90;
      expv[40] = 8'h90;
      expv[41] = 8'h90;
      expv[42] = 8'ha7;
      expv[43] = 8'ha7;
      expv[44] = 8'he8;
      expv[45] = 8'he8;
      expv[46] = 8'hf7;
      expv[47] = 8'hf8;
      expv[48] = 8'hf8;
      expv[49] = 8'hf8;
      expv[50] = 8'h5a;
      expv[51] = 8'h27;
      expv[52] = 8'h9d;
      expv[53] = 8'h0a;
      expv[54] = 8'h74;
      expv[55] = 8'h8a;
      expv[56] = 8'h8a;
      expv[57] = 8'h00;
      expv[58] = 8'h3e;
      expv[59] = 8'h8a;
      expv[60] = 8'h8a;
      expv[61] = 8'h8a;
      expv[62] = 8'hb7;
      expv[63] = 8'h75;
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
