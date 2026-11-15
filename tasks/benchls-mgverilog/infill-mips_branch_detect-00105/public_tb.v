// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_00105 dut (
    .opcode(in_vec[11:6]),
    .func(in_vec[5:0]),
    .is_branch(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h811;
    stim[1] = 12'hcb0;
    stim[2] = 12'hb2a;
    stim[3] = 12'hbd3;
    stim[4] = 12'h837;
    stim[5] = 12'hfcc;
    stim[6] = 12'hcdf;
    stim[7] = 12'h560;
    stim[8] = 12'he2c;
    stim[9] = 12'hf40;
    stim[10] = 12'h162;
    stim[11] = 12'h7e6;
    stim[12] = 12'h558;
    stim[13] = 12'he36;
    stim[14] = 12'hf0b;
    stim[15] = 12'h6ec;
    stim[16] = 12'h1f4;
    stim[17] = 12'hf13;
    stim[18] = 12'h6d1;
    stim[19] = 12'h3d0;
    stim[20] = 12'hd50;
    stim[21] = 12'h9d1;
    stim[22] = 12'hb6f;
    stim[23] = 12'hb41;
    stim[24] = 12'h851;
    stim[25] = 12'hfff;
    stim[26] = 12'ha9c;
    stim[27] = 12'hc7c;
    stim[28] = 12'h44d;
    stim[29] = 12'hcb6;
    stim[30] = 12'h339;
    stim[31] = 12'h28d;
    stim[32] = 12'h96e;
    stim[33] = 12'h7f1;
    stim[34] = 12'hd04;
    stim[35] = 12'h6cf;
    stim[36] = 12'h242;
    stim[37] = 12'h7fb;
    stim[38] = 12'hb5f;
    stim[39] = 12'h7d7;
    stim[40] = 12'ha47;
    stim[41] = 12'h205;
    stim[42] = 12'h640;
    stim[43] = 12'h79b;
    stim[44] = 12'h234;
    stim[45] = 12'he04;
    stim[46] = 12'h13d;
    stim[47] = 12'hb68;
    stim[48] = 12'h143;
    stim[49] = 12'h0ce;
    stim[50] = 12'h9f0;
    stim[51] = 12'hc98;
    stim[52] = 12'h82c;
    stim[53] = 12'h4f9;
    stim[54] = 12'ha85;
    stim[55] = 12'h9bd;
    stim[56] = 12'hddf;
    stim[57] = 12'h4cd;
    stim[58] = 12'h9af;
    stim[59] = 12'h3a2;
    stim[60] = 12'h45e;
    stim[61] = 12'h77f;
    stim[62] = 12'h848;
    stim[63] = 12'h773;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 1'h0;
      expv[1] = 1'h0;
      expv[2] = 1'h0;
      expv[3] = 1'h0;
      expv[4] = 1'h0;
      expv[5] = 1'h0;
      expv[6] = 1'h0;
      expv[7] = 1'h0;
      expv[8] = 1'h0;
      expv[9] = 1'h0;
      expv[10] = 1'h1;
      expv[11] = 1'h0;
      expv[12] = 1'h0;
      expv[13] = 1'h0;
      expv[14] = 1'h0;
      expv[15] = 1'h0;
      expv[16] = 1'h1;
      expv[17] = 1'h0;
      expv[18] = 1'h0;
      expv[19] = 1'h0;
      expv[20] = 1'h0;
      expv[21] = 1'h0;
      expv[22] = 1'h0;
      expv[23] = 1'h0;
      expv[24] = 1'h0;
      expv[25] = 1'h0;
      expv[26] = 1'h0;
      expv[27] = 1'h0;
      expv[28] = 1'h0;
      expv[29] = 1'h0;
      expv[30] = 1'h0;
      expv[31] = 1'h0;
      expv[32] = 1'h0;
      expv[33] = 1'h0;
      expv[34] = 1'h0;
      expv[35] = 1'h0;
      expv[36] = 1'h0;
      expv[37] = 1'h0;
      expv[38] = 1'h0;
      expv[39] = 1'h0;
      expv[40] = 1'h0;
      expv[41] = 1'h0;
      expv[42] = 1'h0;
      expv[43] = 1'h0;
      expv[44] = 1'h0;
      expv[45] = 1'h0;
      expv[46] = 1'h1;
      expv[47] = 1'h0;
      expv[48] = 1'h1;
      expv[49] = 1'h1;
      expv[50] = 1'h0;
      expv[51] = 1'h0;
      expv[52] = 1'h0;
      expv[53] = 1'h0;
      expv[54] = 1'h0;
      expv[55] = 1'h0;
      expv[56] = 1'h0;
      expv[57] = 1'h0;
      expv[58] = 1'h0;
      expv[59] = 1'h0;
      expv[60] = 1'h0;
      expv[61] = 1'h0;
      expv[62] = 1'h0;
      expv[63] = 1'h0;
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
