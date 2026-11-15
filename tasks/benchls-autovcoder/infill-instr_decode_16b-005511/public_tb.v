// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 16;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_005511 dut (
    .instr(in_vec[15:0]),
    .rd(out_vec[3:1]),
    .we_reg(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 16'h47da;
    stim[1] = 16'hb5a1;
    stim[2] = 16'h2a0d;
    stim[3] = 16'h836b;
    stim[4] = 16'hb643;
    stim[5] = 16'he4ad;
    stim[6] = 16'h0cdf;
    stim[7] = 16'h76f7;
    stim[8] = 16'hafd8;
    stim[9] = 16'h1f87;
    stim[10] = 16'h8902;
    stim[11] = 16'haaf2;
    stim[12] = 16'h532c;
    stim[13] = 16'h9b6f;
    stim[14] = 16'h9514;
    stim[15] = 16'h3d5f;
    stim[16] = 16'hd978;
    stim[17] = 16'h503c;
    stim[18] = 16'h5166;
    stim[19] = 16'h6689;
    stim[20] = 16'h62b5;
    stim[21] = 16'hab17;
    stim[22] = 16'h6543;
    stim[23] = 16'h81d7;
    stim[24] = 16'h92d4;
    stim[25] = 16'h58e8;
    stim[26] = 16'hf2a8;
    stim[27] = 16'h1ff4;
    stim[28] = 16'ha45d;
    stim[29] = 16'h69d4;
    stim[30] = 16'h4adf;
    stim[31] = 16'hfe18;
    stim[32] = 16'h22aa;
    stim[33] = 16'h266c;
    stim[34] = 16'h1baf;
    stim[35] = 16'h8631;
    stim[36] = 16'ha597;
    stim[37] = 16'h043a;
    stim[38] = 16'hfe7f;
    stim[39] = 16'h7179;
    stim[40] = 16'h22b1;
    stim[41] = 16'h44c0;
    stim[42] = 16'ha96e;
    stim[43] = 16'hf36f;
    stim[44] = 16'h27b2;
    stim[45] = 16'hfaec;
    stim[46] = 16'h38ee;
    stim[47] = 16'h2ad9;
    stim[48] = 16'h4ef2;
    stim[49] = 16'hf294;
    stim[50] = 16'h6c33;
    stim[51] = 16'h292f;
    stim[52] = 16'h0e3b;
    stim[53] = 16'h490b;
    stim[54] = 16'h003f;
    stim[55] = 16'ha6a7;
    stim[56] = 16'hd85a;
    stim[57] = 16'h4df2;
    stim[58] = 16'hbeae;
    stim[59] = 16'hd9d8;
    stim[60] = 16'h73b8;
    stim[61] = 16'h2b56;
    stim[62] = 16'h3054;
    stim[63] = 16'h3e85;
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
      expv[0] = 4'hd;
      expv[1] = 4'hb;
      expv[2] = 4'h0;
      expv[3] = 4'h0;
      expv[4] = 4'h5;
      expv[5] = 4'h7;
      expv[6] = 4'h0;
      expv[7] = 4'h0;
      expv[8] = 4'hd;
      expv[9] = 4'h0;
      expv[10] = 4'h1;
      expv[11] = 4'hf;
      expv[12] = 4'h3;
      expv[13] = 4'h7;
      expv[14] = 4'hb;
      expv[15] = 4'hf;
      expv[16] = 4'hd;
      expv[17] = 4'h3;
      expv[18] = 4'h7;
      expv[19] = 4'h0;
      expv[20] = 4'h0;
      expv[21] = 4'h1;
      expv[22] = 4'h0;
      expv[23] = 4'h0;
      expv[24] = 4'h5;
      expv[25] = 4'hf;
      expv[26] = 4'h5;
      expv[27] = 4'h0;
      expv[28] = 4'h5;
      expv[29] = 4'h0;
      expv[30] = 4'hd;
      expv[31] = 4'hd;
      expv[32] = 4'h0;
      expv[33] = 4'h0;
      expv[34] = 4'h0;
      expv[35] = 4'h0;
      expv[36] = 4'h9;
      expv[37] = 4'h0;
      expv[38] = 4'hf;
      expv[39] = 4'h0;
      expv[40] = 4'h0;
      expv[41] = 4'hd;
      expv[42] = 4'h7;
      expv[43] = 4'h7;
      expv[44] = 4'h0;
      expv[45] = 4'h7;
      expv[46] = 4'hf;
      expv[47] = 4'h0;
      expv[48] = 4'hf;
      expv[49] = 4'hb;
      expv[50] = 4'h0;
      expv[51] = 4'h0;
      expv[52] = 4'h0;
      expv[53] = 4'h1;
      expv[54] = 4'h0;
      expv[55] = 4'hb;
      expv[56] = 4'hd;
      expv[57] = 4'hf;
      expv[58] = 4'hb;
      expv[59] = 4'hd;
      expv[60] = 4'h0;
      expv[61] = 4'h0;
      expv[62] = 4'hf;
      expv[63] = 4'hf;
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
