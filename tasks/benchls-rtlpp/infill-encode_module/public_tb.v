// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  encode_module dut (
    .clkin(clk),
    .rstin(in_vec[11:11]),
    .din(in_vec[10:3]),
    .c0(in_vec[2:2]),
    .c1(in_vec[1:1]),
    .de(in_vec[0:0]),
    .dout(out_vec[9:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h416;
    stim[1] = 12'h163;
    stim[2] = 12'hef9;
    stim[3] = 12'h940;
    stim[4] = 12'hae0;
    stim[5] = 12'ha38;
    stim[6] = 12'hadd;
    stim[7] = 12'hd37;
    stim[8] = 12'h821;
    stim[9] = 12'ha4d;
    stim[10] = 12'hd30;
    stim[11] = 12'he92;
    stim[12] = 12'ha02;
    stim[13] = 12'hde0;
    stim[14] = 12'h858;
    stim[15] = 12'h82b;
    stim[16] = 12'hd8e;
    stim[17] = 12'haf9;
    stim[18] = 12'h8c6;
    stim[19] = 12'hd5a;
    stim[20] = 12'hdd3;
    stim[21] = 12'hf88;
    stim[22] = 12'hdda;
    stim[23] = 12'hdf7;
    stim[24] = 12'h855;
    stim[25] = 12'hf6e;
    stim[26] = 12'hd50;
    stim[27] = 12'h9e6;
    stim[28] = 12'hc74;
    stim[29] = 12'ha67;
    stim[30] = 12'hfcb;
    stim[31] = 12'hcce;
    stim[32] = 12'hed0;
    stim[33] = 12'hb01;
    stim[34] = 12'hb0c;
    stim[35] = 12'h9ce;
    stim[36] = 12'h887;
    stim[37] = 12'ha5b;
    stim[38] = 12'hf75;
    stim[39] = 12'hb08;
    stim[40] = 12'h9b1;
    stim[41] = 12'h952;
    stim[42] = 12'h9e1;
    stim[43] = 12'hd99;
    stim[44] = 12'he6b;
    stim[45] = 12'h8e5;
    stim[46] = 12'h84e;
    stim[47] = 12'hee3;
    stim[48] = 12'h8d8;
    stim[49] = 12'hf10;
    stim[50] = 12'h89f;
    stim[51] = 12'hf03;
    stim[52] = 12'hfa5;
    stim[53] = 12'hbb7;
    stim[54] = 12'h924;
    stim[55] = 12'he4d;
    stim[56] = 12'h9ee;
    stim[57] = 12'h9c0;
    stim[58] = 12'hd72;
    stim[59] = 12'hd30;
    stim[60] = 12'hacc;
    stim[61] = 12'h9e7;
    stim[62] = 12'he6a;
    stim[63] = 12'hbd8;
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
      expv[0] = 10'hxxx;
      expv[1] = 10'h382;
      expv[2] = 10'h000;
      expv[3] = 10'h000;
      expv[4] = 10'h000;
      expv[5] = 10'h000;
      expv[6] = 10'h000;
      expv[7] = 10'h000;
      expv[8] = 10'h000;
      expv[9] = 10'h000;
      expv[10] = 10'h000;
      expv[11] = 10'h000;
      expv[12] = 10'h000;
      expv[13] = 10'h000;
      expv[14] = 10'h000;
      expv[15] = 10'h000;
      expv[16] = 10'h000;
      expv[17] = 10'h000;
      expv[18] = 10'h000;
      expv[19] = 10'h000;
      expv[20] = 10'h000;
      expv[21] = 10'h000;
      expv[22] = 10'h000;
      expv[23] = 10'h000;
      expv[24] = 10'h000;
      expv[25] = 10'h000;
      expv[26] = 10'h000;
      expv[27] = 10'h000;
      expv[28] = 10'h000;
      expv[29] = 10'h000;
      expv[30] = 10'h000;
      expv[31] = 10'h000;
      expv[32] = 10'h000;
      expv[33] = 10'h000;
      expv[34] = 10'h000;
      expv[35] = 10'h000;
      expv[36] = 10'h000;
      expv[37] = 10'h000;
      expv[38] = 10'h000;
      expv[39] = 10'h000;
      expv[40] = 10'h000;
      expv[41] = 10'h000;
      expv[42] = 10'h000;
      expv[43] = 10'h000;
      expv[44] = 10'h000;
      expv[45] = 10'h000;
      expv[46] = 10'h000;
      expv[47] = 10'h000;
      expv[48] = 10'h000;
      expv[49] = 10'h000;
      expv[50] = 10'h000;
      expv[51] = 10'h000;
      expv[52] = 10'h000;
      expv[53] = 10'h000;
      expv[54] = 10'h000;
      expv[55] = 10'h000;
      expv[56] = 10'h000;
      expv[57] = 10'h000;
      expv[58] = 10'h000;
      expv[59] = 10'h000;
      expv[60] = 10'h000;
      expv[61] = 10'h000;
      expv[62] = 10'h000;
      expv[63] = 10'h000;
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
