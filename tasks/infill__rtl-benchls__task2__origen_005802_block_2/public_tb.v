// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 20;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_005802 dut (
    .clk(clk),
    .start(in_vec[19:19]),
    .done(in_vec[18:18]),
    .d_in(in_vec[17:2]),
    .op_code(in_vec[1:0]),
    .finish(out_vec[3:3]),
    .ldA(out_vec[2:2]),
    .ldB(out_vec[1:1]),
    .ldO(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 20'h8571e;
    stim[1] = 20'h49aed;
    stim[2] = 20'hd4d0d;
    stim[3] = 20'h76da6;
    stim[4] = 20'h4d3bf;
    stim[5] = 20'h0f6ce;
    stim[6] = 20'h15339;
    stim[7] = 20'hc9478;
    stim[8] = 20'hc767d;
    stim[9] = 20'ha4207;
    stim[10] = 20'h444a0;
    stim[11] = 20'hb43a9;
    stim[12] = 20'h4c0a7;
    stim[13] = 20'h0fd8a;
    stim[14] = 20'h177b5;
    stim[15] = 20'h2ad9a;
    stim[16] = 20'h5ee6d;
    stim[17] = 20'h8c416;
    stim[18] = 20'h0e2f9;
    stim[19] = 20'ha63e6;
    stim[20] = 20'h93700;
    stim[21] = 20'h99773;
    stim[22] = 20'h6a628;
    stim[23] = 20'he4590;
    stim[24] = 20'h344d1;
    stim[25] = 20'h51f28;
    stim[26] = 20'hdf7f2;
    stim[27] = 20'hb8f16;
    stim[28] = 20'he6a2f;
    stim[29] = 20'h24184;
    stim[30] = 20'h25f5c;
    stim[31] = 20'hb7f44;
    stim[32] = 20'h7b5c5;
    stim[33] = 20'hf954b;
    stim[34] = 20'h62a74;
    stim[35] = 20'h65ab6;
    stim[36] = 20'h3fff4;
    stim[37] = 20'hf35ee;
    stim[38] = 20'hb86f0;
    stim[39] = 20'hba18d;
    stim[40] = 20'hdee16;
    stim[41] = 20'hdd7ba;
    stim[42] = 20'h715e6;
    stim[43] = 20'h77670;
    stim[44] = 20'h9af60;
    stim[45] = 20'ha8861;
    stim[46] = 20'h048d9;
    stim[47] = 20'h8226f;
    stim[48] = 20'h73d6f;
    stim[49] = 20'h8564b;
    stim[50] = 20'h920a3;
    stim[51] = 20'hb3ab9;
    stim[52] = 20'h2e010;
    stim[53] = 20'h0b051;
    stim[54] = 20'h98944;
    stim[55] = 20'h8dcb0;
    stim[56] = 20'h2052c;
    stim[57] = 20'h68498;
    stim[58] = 20'hd2dc2;
    stim[59] = 20'hd5952;
    stim[60] = 20'hb2fea;
    stim[61] = 20'h41723;
    stim[62] = 20'hcce00;
    stim[63] = 20'h2135c;
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
      expv[3] = 4'h0;
      expv[4] = 4'h4;
      expv[5] = 4'h2;
      expv[6] = 4'h1;
      expv[7] = 4'h4;
      expv[8] = 4'h8;
      expv[9] = 4'h0;
      expv[10] = 4'h4;
      expv[11] = 4'h2;
      expv[12] = 4'h1;
      expv[13] = 4'h4;
      expv[14] = 4'h0;
      expv[15] = 4'h0;
      expv[16] = 4'h0;
      expv[17] = 4'h0;
      expv[18] = 4'h0;
      expv[19] = 4'h4;
      expv[20] = 4'h2;
      expv[21] = 4'h1;
      expv[22] = 4'h4;
      expv[23] = 4'h8;
      expv[24] = 4'h0;
      expv[25] = 4'h4;
      expv[26] = 4'h2;
      expv[27] = 4'h1;
      expv[28] = 4'h4;
      expv[29] = 4'h8;
      expv[30] = 4'h0;
      expv[31] = 4'h0;
      expv[32] = 4'h0;
      expv[33] = 4'h4;
      expv[34] = 4'h2;
      expv[35] = 4'h1;
      expv[36] = 4'h4;
      expv[37] = 4'h0;
      expv[38] = 4'h0;
      expv[39] = 4'h4;
      expv[40] = 4'h2;
      expv[41] = 4'h1;
      expv[42] = 4'h4;
      expv[43] = 4'h8;
      expv[44] = 4'h0;
      expv[45] = 4'h0;
      expv[46] = 4'h4;
      expv[47] = 4'h2;
      expv[48] = 4'h1;
      expv[49] = 4'h4;
      expv[50] = 4'h0;
      expv[51] = 4'h0;
      expv[52] = 4'h4;
      expv[53] = 4'h2;
      expv[54] = 4'h1;
      expv[55] = 4'h4;
      expv[56] = 4'h0;
      expv[57] = 4'h0;
      expv[58] = 4'h0;
      expv[59] = 4'h0;
      expv[60] = 4'h4;
      expv[61] = 4'h2;
      expv[62] = 4'h1;
      expv[63] = 4'h4;
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
