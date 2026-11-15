// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 4;
  localparam OW = 7;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_02591 dut (
    .bcd(in_vec[3:0]),
    .seg(out_vec[6:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 4'h8;
    stim[1] = 4'hb;
    stim[2] = 4'he;
    stim[3] = 4'hd;
    stim[4] = 4'h2;
    stim[5] = 4'h1;
    stim[6] = 4'ha;
    stim[7] = 4'h5;
    stim[8] = 4'h1;
    stim[9] = 4'h1;
    stim[10] = 4'h4;
    stim[11] = 4'h7;
    stim[12] = 4'h0;
    stim[13] = 4'h6;
    stim[14] = 4'he;
    stim[15] = 4'hd;
    stim[16] = 4'hd;
    stim[17] = 4'h5;
    stim[18] = 4'h8;
    stim[19] = 4'hf;
    stim[20] = 4'hf;
    stim[21] = 4'h5;
    stim[22] = 4'ha;
    stim[23] = 4'h0;
    stim[24] = 4'hc;
    stim[25] = 4'h7;
    stim[26] = 4'h7;
    stim[27] = 4'hf;
    stim[28] = 4'hd;
    stim[29] = 4'h6;
    stim[30] = 4'hf;
    stim[31] = 4'he;
    stim[32] = 4'h0;
    stim[33] = 4'hf;
    stim[34] = 4'ha;
    stim[35] = 4'hc;
    stim[36] = 4'h6;
    stim[37] = 4'h3;
    stim[38] = 4'hc;
    stim[39] = 4'h9;
    stim[40] = 4'h9;
    stim[41] = 4'h9;
    stim[42] = 4'h8;
    stim[43] = 4'h5;
    stim[44] = 4'he;
    stim[45] = 4'h6;
    stim[46] = 4'h3;
    stim[47] = 4'h6;
    stim[48] = 4'hc;
    stim[49] = 4'hd;
    stim[50] = 4'ha;
    stim[51] = 4'h3;
    stim[52] = 4'ha;
    stim[53] = 4'hd;
    stim[54] = 4'h9;
    stim[55] = 4'h6;
    stim[56] = 4'h9;
    stim[57] = 4'h2;
    stim[58] = 4'h2;
    stim[59] = 4'h1;
    stim[60] = 4'h9;
    stim[61] = 4'h3;
    stim[62] = 4'h4;
    stim[63] = 4'h2;
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
      expv[0] = 7'h7f;
      expv[1] = 7'h1f;
      expv[2] = 7'h4f;
      expv[3] = 7'h3d;
      expv[4] = 7'h6d;
      expv[5] = 7'h30;
      expv[6] = 7'h77;
      expv[7] = 7'h5b;
      expv[8] = 7'h30;
      expv[9] = 7'h30;
      expv[10] = 7'h33;
      expv[11] = 7'h70;
      expv[12] = 7'h7e;
      expv[13] = 7'h5f;
      expv[14] = 7'h4f;
      expv[15] = 7'h3d;
      expv[16] = 7'h3d;
      expv[17] = 7'h5b;
      expv[18] = 7'h7f;
      expv[19] = 7'h47;
      expv[20] = 7'h47;
      expv[21] = 7'h5b;
      expv[22] = 7'h77;
      expv[23] = 7'h7e;
      expv[24] = 7'h4e;
      expv[25] = 7'h70;
      expv[26] = 7'h70;
      expv[27] = 7'h47;
      expv[28] = 7'h3d;
      expv[29] = 7'h5f;
      expv[30] = 7'h47;
      expv[31] = 7'h4f;
      expv[32] = 7'h7e;
      expv[33] = 7'h47;
      expv[34] = 7'h77;
      expv[35] = 7'h4e;
      expv[36] = 7'h5f;
      expv[37] = 7'h79;
      expv[38] = 7'h4e;
      expv[39] = 7'h7b;
      expv[40] = 7'h7b;
      expv[41] = 7'h7b;
      expv[42] = 7'h7f;
      expv[43] = 7'h5b;
      expv[44] = 7'h4f;
      expv[45] = 7'h5f;
      expv[46] = 7'h79;
      expv[47] = 7'h5f;
      expv[48] = 7'h4e;
      expv[49] = 7'h3d;
      expv[50] = 7'h77;
      expv[51] = 7'h79;
      expv[52] = 7'h77;
      expv[53] = 7'h3d;
      expv[54] = 7'h7b;
      expv[55] = 7'h5f;
      expv[56] = 7'h7b;
      expv[57] = 7'h6d;
      expv[58] = 7'h6d;
      expv[59] = 7'h30;
      expv[60] = 7'h7b;
      expv[61] = 7'h79;
      expv[62] = 7'h33;
      expv[63] = 7'h6d;
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
