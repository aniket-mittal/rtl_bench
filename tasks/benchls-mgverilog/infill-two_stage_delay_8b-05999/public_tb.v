// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_05999 dut (
    .clk(clk),
    .din(in_vec[8:1]),
    .rdy(in_vec[0:0]),
    .dout(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h1d9;
    stim[1] = 9'h06f;
    stim[2] = 9'h00a;
    stim[3] = 9'h146;
    stim[4] = 9'h073;
    stim[5] = 9'h1e9;
    stim[6] = 9'h0e9;
    stim[7] = 9'h128;
    stim[8] = 9'h05c;
    stim[9] = 9'h1ef;
    stim[10] = 9'h142;
    stim[11] = 9'h027;
    stim[12] = 9'h179;
    stim[13] = 9'h118;
    stim[14] = 9'h0be;
    stim[15] = 9'h169;
    stim[16] = 9'h0bc;
    stim[17] = 9'h1c8;
    stim[18] = 9'h0d4;
    stim[19] = 9'h143;
    stim[20] = 9'h0c6;
    stim[21] = 9'h012;
    stim[22] = 9'h135;
    stim[23] = 9'h1a9;
    stim[24] = 9'h096;
    stim[25] = 9'h124;
    stim[26] = 9'h1a0;
    stim[27] = 9'h08d;
    stim[28] = 9'h1d1;
    stim[29] = 9'h09a;
    stim[30] = 9'h09a;
    stim[31] = 9'h012;
    stim[32] = 9'h19e;
    stim[33] = 9'h073;
    stim[34] = 9'h161;
    stim[35] = 9'h162;
    stim[36] = 9'h0ec;
    stim[37] = 9'h064;
    stim[38] = 9'h03b;
    stim[39] = 9'h007;
    stim[40] = 9'h19b;
    stim[41] = 9'h17e;
    stim[42] = 9'h028;
    stim[43] = 9'h112;
    stim[44] = 9'h13b;
    stim[45] = 9'h0e9;
    stim[46] = 9'h139;
    stim[47] = 9'h124;
    stim[48] = 9'h08c;
    stim[49] = 9'h1de;
    stim[50] = 9'h026;
    stim[51] = 9'h00c;
    stim[52] = 9'h086;
    stim[53] = 9'h159;
    stim[54] = 9'h064;
    stim[55] = 9'h141;
    stim[56] = 9'h14a;
    stim[57] = 9'h01d;
    stim[58] = 9'h098;
    stim[59] = 9'h04b;
    stim[60] = 9'h148;
    stim[61] = 9'h07e;
    stim[62] = 9'h1e3;
    stim[63] = 9'h1ea;
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
      expv[1] = 8'hxx;
      expv[2] = 8'hxx;
      expv[3] = 8'hxx;
      expv[4] = 8'hxx;
      expv[5] = 8'hec;
      expv[6] = 8'h37;
      expv[7] = 8'h39;
      expv[8] = 8'h39;
      expv[9] = 8'h39;
      expv[10] = 8'hf4;
      expv[11] = 8'hf4;
      expv[12] = 8'h74;
      expv[13] = 8'hf7;
      expv[14] = 8'hf7;
      expv[15] = 8'hf7;
      expv[16] = 8'h13;
      expv[17] = 8'h13;
      expv[18] = 8'h13;
      expv[19] = 8'h13;
      expv[20] = 8'hbc;
      expv[21] = 8'hbc;
      expv[22] = 8'hbc;
      expv[23] = 8'hb4;
      expv[24] = 8'ha1;
      expv[25] = 8'ha1;
      expv[26] = 8'ha1;
      expv[27] = 8'ha1;
      expv[28] = 8'h9a;
      expv[29] = 8'hd4;
      expv[30] = 8'hd4;
      expv[31] = 8'hd4;
      expv[32] = 8'hd4;
      expv[33] = 8'hd4;
      expv[34] = 8'h46;
      expv[35] = 8'he8;
      expv[36] = 8'he8;
      expv[37] = 8'he8;
      expv[38] = 8'he8;
      expv[39] = 8'h39;
      expv[40] = 8'hb0;
      expv[41] = 8'h1d;
      expv[42] = 8'h1d;
      expv[43] = 8'h1d;
      expv[44] = 8'h1d;
      expv[45] = 8'h03;
      expv[46] = 8'hcd;
      expv[47] = 8'h9d;
      expv[48] = 8'h9d;
      expv[49] = 8'h9d;
      expv[50] = 8'h9d;
      expv[51] = 8'h9d;
      expv[52] = 8'h9d;
      expv[53] = 8'h9d;
      expv[54] = 8'h74;
      expv[55] = 8'h74;
      expv[56] = 8'h9c;
      expv[57] = 8'h9c;
      expv[58] = 8'hac;
      expv[59] = 8'hac;
      expv[60] = 8'ha0;
      expv[61] = 8'ha0;
      expv[62] = 8'ha0;
      expv[63] = 8'h0e;
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
