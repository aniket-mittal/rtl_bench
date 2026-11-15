// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 20;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_092160 dut (
    .WrClock(clk),
    .WrAddress(in_vec[19:15]),
    .Data(in_vec[14:7]),
    .WE(in_vec[6:6]),
    .WrClockEn(in_vec[5:5]),
    .RdAddress(in_vec[4:0]),
    .Q(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 20'h447f0;
    stim[1] = 20'h10348;
    stim[2] = 20'hcc65d;
    stim[3] = 20'h25d53;
    stim[4] = 20'h9a055;
    stim[5] = 20'h48a16;
    stim[6] = 20'hed7df;
    stim[7] = 20'h6e50b;
    stim[8] = 20'h25ea5;
    stim[9] = 20'h6173a;
    stim[10] = 20'h781b4;
    stim[11] = 20'hae0dd;
    stim[12] = 20'h0c785;
    stim[13] = 20'ha39b5;
    stim[14] = 20'ha91f2;
    stim[15] = 20'h0b2b9;
    stim[16] = 20'hd7af8;
    stim[17] = 20'h62d72;
    stim[18] = 20'hed071;
    stim[19] = 20'ha93d8;
    stim[20] = 20'h7ab04;
    stim[21] = 20'hb5774;
    stim[22] = 20'hbcfe3;
    stim[23] = 20'h108e7;
    stim[24] = 20'h24e16;
    stim[25] = 20'h303aa;
    stim[26] = 20'hdccd8;
    stim[27] = 20'hc8665;
    stim[28] = 20'hb40dd;
    stim[29] = 20'h79f1a;
    stim[30] = 20'h34d6d;
    stim[31] = 20'hd50c1;
    stim[32] = 20'h55a7e;
    stim[33] = 20'h8f7f5;
    stim[34] = 20'h8cc1e;
    stim[35] = 20'hd0fdb;
    stim[36] = 20'h163b2;
    stim[37] = 20'hc7d90;
    stim[38] = 20'h619bf;
    stim[39] = 20'hcac45;
    stim[40] = 20'h04f2b;
    stim[41] = 20'h72d03;
    stim[42] = 20'hdf05d;
    stim[43] = 20'hdf2b0;
    stim[44] = 20'h6fd73;
    stim[45] = 20'hee124;
    stim[46] = 20'he4086;
    stim[47] = 20'h35d62;
    stim[48] = 20'h208d4;
    stim[49] = 20'h4ffa8;
    stim[50] = 20'h6b3fe;
    stim[51] = 20'h274b9;
    stim[52] = 20'h9cac1;
    stim[53] = 20'h7611c;
    stim[54] = 20'h0ee1d;
    stim[55] = 20'h9e93a;
    stim[56] = 20'h17b30;
    stim[57] = 20'h4559a;
    stim[58] = 20'h0349a;
    stim[59] = 20'hebf94;
    stim[60] = 20'haa117;
    stim[61] = 20'h707b9;
    stim[62] = 20'h7427b;
    stim[63] = 20'hb3cf9;
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
      expv[1] = 8'h8f;
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
      expv[14] = 8'hxx;
      expv[15] = 8'hxx;
      expv[16] = 8'hxx;
      expv[17] = 8'hxx;
      expv[18] = 8'hxx;
      expv[19] = 8'hxx;
      expv[20] = 8'hxx;
      expv[21] = 8'hxx;
      expv[22] = 8'hxx;
      expv[23] = 8'hxx;
      expv[24] = 8'hae;
      expv[25] = 8'hxx;
      expv[26] = 8'hxx;
      expv[27] = 8'hxx;
      expv[28] = 8'ha0;
      expv[29] = 8'hf5;
      expv[30] = 8'hxx;
      expv[31] = 8'hxx;
      expv[32] = 8'hxx;
      expv[33] = 8'h23;
      expv[34] = 8'hxx;
      expv[35] = 8'hxx;
      expv[36] = 8'hxx;
      expv[37] = 8'hxx;
      expv[38] = 8'hxx;
      expv[39] = 8'hxx;
      expv[40] = 8'hxx;
      expv[41] = 8'hxx;
      expv[42] = 8'ha0;
      expv[43] = 8'hxx;
      expv[44] = 8'hxx;
      expv[45] = 8'hxx;
      expv[46] = 8'h9a;
      expv[47] = 8'h11;
      expv[48] = 8'hxx;
      expv[49] = 8'h8f;
      expv[50] = 8'hxx;
      expv[51] = 8'h0c;
      expv[52] = 8'hxx;
      expv[53] = 8'hxx;
      expv[54] = 8'ha0;
      expv[55] = 8'hf5;
      expv[56] = 8'hxx;
      expv[57] = 8'hf5;
      expv[58] = 8'hf5;
      expv[59] = 8'hxx;
      expv[60] = 8'h9f;
      expv[61] = 8'h0c;
      expv[62] = 8'hxx;
      expv[63] = 8'h0c;
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
