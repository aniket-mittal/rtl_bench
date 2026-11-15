// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_04843 dut (
    .clk(clk),
    .we(in_vec[16:16]),
    .a(in_vec[15:12]),
    .dpra(in_vec[11:8]),
    .di(in_vec[7:0]),
    .dpo(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h1a318;
    stim[1] = 17'h0a080;
    stim[2] = 17'h0d161;
    stim[3] = 17'h1f606;
    stim[4] = 17'h1a072;
    stim[5] = 17'h0d4ad;
    stim[6] = 17'h1db56;
    stim[7] = 17'h0367c;
    stim[8] = 17'h14427;
    stim[9] = 17'h0bc24;
    stim[10] = 17'h108d1;
    stim[11] = 17'h1a74b;
    stim[12] = 17'h1a6a0;
    stim[13] = 17'h0aa7c;
    stim[14] = 17'h11b71;
    stim[15] = 17'h1728e;
    stim[16] = 17'h09c0d;
    stim[17] = 17'h16815;
    stim[18] = 17'h0fb43;
    stim[19] = 17'h02d93;
    stim[20] = 17'h1a4ea;
    stim[21] = 17'h1c42d;
    stim[22] = 17'h000de;
    stim[23] = 17'h1dc9c;
    stim[24] = 17'h0948b;
    stim[25] = 17'h076cf;
    stim[26] = 17'h053c2;
    stim[27] = 17'h148fe;
    stim[28] = 17'h17d91;
    stim[29] = 17'h1e4a4;
    stim[30] = 17'h09cd2;
    stim[31] = 17'h14846;
    stim[32] = 17'h1ed57;
    stim[33] = 17'h1ca16;
    stim[34] = 17'h12844;
    stim[35] = 17'h1f621;
    stim[36] = 17'h0a532;
    stim[37] = 17'h0d355;
    stim[38] = 17'h0fae8;
    stim[39] = 17'h130af;
    stim[40] = 17'h07c60;
    stim[41] = 17'h1317f;
    stim[42] = 17'h1ade8;
    stim[43] = 17'h0d578;
    stim[44] = 17'h03176;
    stim[45] = 17'h1424e;
    stim[46] = 17'h1e642;
    stim[47] = 17'h015dd;
    stim[48] = 17'h09769;
    stim[49] = 17'h1ae1d;
    stim[50] = 17'h1b8f5;
    stim[51] = 17'h10d07;
    stim[52] = 17'h1c5ed;
    stim[53] = 17'h0e63f;
    stim[54] = 17'h14de7;
    stim[55] = 17'h08c5b;
    stim[56] = 17'h0d317;
    stim[57] = 17'h0f8c6;
    stim[58] = 17'h0f492;
    stim[59] = 17'h1b84a;
    stim[60] = 17'h11bf7;
    stim[61] = 17'h10f86;
    stim[62] = 17'h16f60;
    stim[63] = 17'h1c643;
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
      expv[5] = 8'hxx;
      expv[6] = 8'hxx;
      expv[7] = 8'hxx;
      expv[8] = 8'hxx;
      expv[9] = 8'hxx;
      expv[10] = 8'hxx;
      expv[11] = 8'hxx;
      expv[12] = 8'hxx;
      expv[13] = 8'hxx;
      expv[14] = 8'ha0;
      expv[15] = 8'hxx;
      expv[16] = 8'hxx;
      expv[17] = 8'hxx;
      expv[18] = 8'hxx;
      expv[19] = 8'hxx;
      expv[20] = 8'h56;
      expv[21] = 8'h27;
      expv[22] = 8'h27;
      expv[23] = 8'hd1;
      expv[24] = 8'h2d;
      expv[25] = 8'h27;
      expv[26] = 8'h15;
      expv[27] = 8'hxx;
      expv[28] = 8'hxx;
      expv[29] = 8'h9c;
      expv[30] = 8'hfe;
      expv[31] = 8'h2d;
      expv[32] = 8'hxx;
      expv[33] = 8'h9c;
      expv[34] = 8'hea;
      expv[35] = 8'hxx;
      expv[36] = 8'h15;
      expv[37] = 8'hxx;
      expv[38] = 8'hxx;
      expv[39] = 8'hea;
      expv[40] = 8'hd1;
      expv[41] = 8'h16;
      expv[42] = 8'h71;
      expv[43] = 8'h9c;
      expv[44] = 8'hxx;
      expv[45] = 8'h71;
      expv[46] = 8'h44;
      expv[47] = 8'h15;
      expv[48] = 8'hxx;
      expv[49] = 8'h91;
      expv[50] = 8'h42;
      expv[51] = 8'hxx;
      expv[52] = 8'h9c;
      expv[53] = 8'hxx;
      expv[54] = 8'h15;
      expv[55] = 8'h9c;
      expv[56] = 8'hed;
      expv[57] = 8'h7f;
      expv[58] = 8'hxx;
      expv[59] = 8'he7;
      expv[60] = 8'hxx;
      expv[61] = 8'h4a;
      expv[62] = 8'h21;
      expv[63] = 8'h21;
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
