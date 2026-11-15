// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_04829 dut (
    .clk(clk),
    .baudX7(in_vec[11:11]),
    .txData(in_vec[10:3]),
    .txStb(in_vec[2:2]),
    .rx(in_vec[1:1]),
    .rxAck(in_vec[0:0]),
    .tx(out_vec[10:10]),
    .txRdy(out_vec[9:9]),
    .rxData(out_vec[8:1]),
    .rxRdy(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h814;
    stim[1] = 12'hca8;
    stim[2] = 12'hba8;
    stim[3] = 12'h832;
    stim[4] = 12'h813;
    stim[5] = 12'hb85;
    stim[6] = 12'h28a;
    stim[7] = 12'h980;
    stim[8] = 12'h916;
    stim[9] = 12'h8bf;
    stim[10] = 12'hd86;
    stim[11] = 12'h60f;
    stim[12] = 12'h5c9;
    stim[13] = 12'h1d5;
    stim[14] = 12'he4a;
    stim[15] = 12'h187;
    stim[16] = 12'h221;
    stim[17] = 12'h9a7;
    stim[18] = 12'h21e;
    stim[19] = 12'h741;
    stim[20] = 12'h912;
    stim[21] = 12'hdc4;
    stim[22] = 12'hcb9;
    stim[23] = 12'h3b8;
    stim[24] = 12'hc5d;
    stim[25] = 12'h15e;
    stim[26] = 12'hc36;
    stim[27] = 12'h87a;
    stim[28] = 12'hdfd;
    stim[29] = 12'h097;
    stim[30] = 12'h04f;
    stim[31] = 12'h41a;
    stim[32] = 12'h83b;
    stim[33] = 12'hd89;
    stim[34] = 12'h124;
    stim[35] = 12'h04e;
    stim[36] = 12'hc8e;
    stim[37] = 12'h9dd;
    stim[38] = 12'hcc3;
    stim[39] = 12'h0cf;
    stim[40] = 12'ha7f;
    stim[41] = 12'h082;
    stim[42] = 12'hbd3;
    stim[43] = 12'hcc0;
    stim[44] = 12'h078;
    stim[45] = 12'h83e;
    stim[46] = 12'h43b;
    stim[47] = 12'h7c1;
    stim[48] = 12'h2d4;
    stim[49] = 12'he5c;
    stim[50] = 12'h4a4;
    stim[51] = 12'h4be;
    stim[52] = 12'he6a;
    stim[53] = 12'h8cb;
    stim[54] = 12'hdd5;
    stim[55] = 12'h6c7;
    stim[56] = 12'h04b;
    stim[57] = 12'hc69;
    stim[58] = 12'hb6a;
    stim[59] = 12'h89a;
    stim[60] = 12'hff5;
    stim[61] = 12'hbe0;
    stim[62] = 12'h549;
    stim[63] = 12'he16;
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
      expv[0] = 11'h600;
      expv[1] = 11'h400;
      expv[2] = 11'h400;
      expv[3] = 11'h400;
      expv[4] = 11'h400;
      expv[5] = 11'h400;
      expv[6] = 11'h400;
      expv[7] = 11'h400;
      expv[8] = 11'h400;
      expv[9] = 11'h400;
      expv[10] = 11'h400;
      expv[11] = 11'h400;
      expv[12] = 11'h400;
      expv[13] = 11'h400;
      expv[14] = 11'h400;
      expv[15] = 11'h400;
      expv[16] = 11'h400;
      expv[17] = 11'h400;
      expv[18] = 11'h400;
      expv[19] = 11'h400;
      expv[20] = 11'h400;
      expv[21] = 11'h400;
      expv[22] = 11'h400;
      expv[23] = 11'h400;
      expv[24] = 11'h400;
      expv[25] = 11'h400;
      expv[26] = 11'h400;
      expv[27] = 11'h500;
      expv[28] = 11'h500;
      expv[29] = 11'h500;
      expv[30] = 11'h500;
      expv[31] = 11'h500;
      expv[32] = 11'h500;
      expv[33] = 11'h500;
      expv[34] = 11'h500;
      expv[35] = 11'h500;
      expv[36] = 11'h500;
      expv[37] = 11'h500;
      expv[38] = 11'h500;
      expv[39] = 11'h180;
      expv[40] = 11'h580;
      expv[41] = 11'h580;
      expv[42] = 11'h580;
      expv[43] = 11'h580;
      expv[44] = 11'h580;
      expv[45] = 11'h580;
      expv[46] = 11'h580;
      expv[47] = 11'h580;
      expv[48] = 11'h580;
      expv[49] = 11'h580;
      expv[50] = 11'h580;
      expv[51] = 11'h580;
      expv[52] = 11'h580;
      expv[53] = 11'h580;
      expv[54] = 11'h5c0;
      expv[55] = 11'h5c0;
      expv[56] = 11'h5c0;
      expv[57] = 11'h5c0;
      expv[58] = 11'h5c0;
      expv[59] = 11'h5c0;
      expv[60] = 11'h5c0;
      expv[61] = 11'h5c0;
      expv[62] = 11'h5c0;
      expv[63] = 11'h5c0;
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
