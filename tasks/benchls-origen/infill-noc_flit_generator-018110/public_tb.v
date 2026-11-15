// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 2;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_018110 dut (
    .clk(clk),
    .enable(in_vec[1:1]),
    .reset(in_vec[0:0]),
    .out(out_vec[63:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 2'h3;
    stim[1] = 2'h1;
    stim[2] = 2'h0;
    stim[3] = 2'h0;
    stim[4] = 2'h0;
    stim[5] = 2'h0;
    stim[6] = 2'h0;
    stim[7] = 2'h2;
    stim[8] = 2'h0;
    stim[9] = 2'h0;
    stim[10] = 2'h2;
    stim[11] = 2'h2;
    stim[12] = 2'h2;
    stim[13] = 2'h0;
    stim[14] = 2'h2;
    stim[15] = 2'h2;
    stim[16] = 2'h2;
    stim[17] = 2'h0;
    stim[18] = 2'h2;
    stim[19] = 2'h2;
    stim[20] = 2'h0;
    stim[21] = 2'h2;
    stim[22] = 2'h2;
    stim[23] = 2'h2;
    stim[24] = 2'h2;
    stim[25] = 2'h0;
    stim[26] = 2'h0;
    stim[27] = 2'h0;
    stim[28] = 2'h2;
    stim[29] = 2'h0;
    stim[30] = 2'h0;
    stim[31] = 2'h0;
    stim[32] = 2'h0;
    stim[33] = 2'h2;
    stim[34] = 2'h2;
    stim[35] = 2'h2;
    stim[36] = 2'h2;
    stim[37] = 2'h2;
    stim[38] = 2'h2;
    stim[39] = 2'h0;
    stim[40] = 2'h0;
    stim[41] = 2'h0;
    stim[42] = 2'h0;
    stim[43] = 2'h2;
    stim[44] = 2'h0;
    stim[45] = 2'h2;
    stim[46] = 2'h2;
    stim[47] = 2'h3;
    stim[48] = 2'h2;
    stim[49] = 2'h0;
    stim[50] = 2'h2;
    stim[51] = 2'h0;
    stim[52] = 2'h0;
    stim[53] = 2'h2;
    stim[54] = 2'h0;
    stim[55] = 2'h0;
    stim[56] = 2'h2;
    stim[57] = 2'h0;
    stim[58] = 2'h2;
    stim[59] = 2'h0;
    stim[60] = 2'h0;
    stim[61] = 2'h0;
    stim[62] = 2'h0;
    stim[63] = 2'h0;
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
      expv[0] = 64'h0000000000000000;
      expv[1] = 64'h0000000000000000;
      expv[2] = 64'h0000000000000000;
      expv[3] = 64'h0000000000000000;
      expv[4] = 64'h0000000000000000;
      expv[5] = 64'h0000000000000000;
      expv[6] = 64'h0000000000000000;
      expv[7] = 64'h0000000000000000;
      expv[8] = 64'hx040000a00000000;
      expv[9] = 64'hx040000a00000000;
      expv[10] = 64'hx040000a00000000;
      expv[11] = 64'hx040000b00000001;
      expv[12] = 64'h0040000c00000003;
      expv[13] = 64'h0040000d00000007;
      expv[14] = 64'h0040000d00000007;
      expv[15] = 64'h0040000e0000000f;
      expv[16] = 64'h0040000f0000001f;
      expv[17] = 64'h004000100000003f;
      expv[18] = 64'h004000100000003f;
      expv[19] = 64'h004000110000007f;
      expv[20] = 64'h00400012000000ff;
      expv[21] = 64'h00400012000000ff;
      expv[22] = 64'h00400013000001ff;
      expv[23] = 64'hx0400014000003ff;
      expv[24] = 64'h40400015000007ff;
      expv[25] = 64'h0040001600000fff;
      expv[26] = 64'h0040001600000fff;
      expv[27] = 64'h0040001600000fff;
      expv[28] = 64'h0040001600000fff;
      expv[29] = 64'h0040001700001fff;
      expv[30] = 64'h0040001700001fff;
      expv[31] = 64'h0040001700001fff;
      expv[32] = 64'h0040001700001fff;
      expv[33] = 64'h0040001700001fff;
      expv[34] = 64'h0040001800003fff;
      expv[35] = 64'h0040001900007fff;
      expv[36] = 64'h0040001a0000ffff;
      expv[37] = 64'h0040001b0001ffff;
      expv[38] = 64'h0040001c0003ffff;
      expv[39] = 64'h0040001d0007ffff;
      expv[40] = 64'h0040001d0007ffff;
      expv[41] = 64'h0040001d0007ffff;
      expv[42] = 64'h0040001d0007ffff;
      expv[43] = 64'h0040001d0007ffff;
      expv[44] = 64'h0040001e000fffff;
      expv[45] = 64'h0040001e000fffff;
      expv[46] = 64'h8040001f001fffff;
      expv[47] = 64'h0000000000000000;
      expv[48] = 64'h0000000000000000;
      expv[49] = 64'h4040000a00000000;
      expv[50] = 64'h4040000a00000000;
      expv[51] = 64'h0040000b00000001;
      expv[52] = 64'h0040000b00000001;
      expv[53] = 64'h0040000b00000001;
      expv[54] = 64'h0040000c00000003;
      expv[55] = 64'h0040000c00000003;
      expv[56] = 64'h0040000c00000003;
      expv[57] = 64'h0040000d00000007;
      expv[58] = 64'h0040000d00000007;
      expv[59] = 64'h0040000e0000000f;
      expv[60] = 64'h0040000e0000000f;
      expv[61] = 64'h0040000e0000000f;
      expv[62] = 64'h0040000e0000000f;
      expv[63] = 64'h0040000e0000000f;
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
