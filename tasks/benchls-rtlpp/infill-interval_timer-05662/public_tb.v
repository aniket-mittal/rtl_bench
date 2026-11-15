// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 22;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_05662 dut (
    .clk(clk),
    .address(in_vec[21:19]),
    .chipselect(in_vec[18:18]),
    .reset_n(in_vec[17:17]),
    .write_n(in_vec[16:16]),
    .writedata(in_vec[15:0]),
    .irq(out_vec[16:16]),
    .readdata(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 22'h0c6184;
    stim[1] = 22'h31cf33;
    stim[2] = 22'h0a3429;
    stim[3] = 22'h02ff0c;
    stim[4] = 22'h0fe08e;
    stim[5] = 22'h27fe1d;
    stim[6] = 22'h06ab11;
    stim[7] = 22'h37dd19;
    stim[8] = 22'h17816a;
    stim[9] = 22'h1ed7ff;
    stim[10] = 22'h065139;
    stim[11] = 22'h22301a;
    stim[12] = 22'h1b3bb8;
    stim[13] = 22'h1eee16;
    stim[14] = 22'h0e608e;
    stim[15] = 22'h0aa1fc;
    stim[16] = 22'h3af3f6;
    stim[17] = 22'h2a65b5;
    stim[18] = 22'h1f1baa;
    stim[19] = 22'h0600f3;
    stim[20] = 22'h0af0df;
    stim[21] = 22'h3efd6b;
    stim[22] = 22'h125f4e;
    stim[23] = 22'h0ac6ab;
    stim[24] = 22'h1bc94e;
    stim[25] = 22'h36019d;
    stim[26] = 22'h329c40;
    stim[27] = 22'h2643d8;
    stim[28] = 22'h166851;
    stim[29] = 22'h02a01a;
    stim[30] = 22'h37f7ca;
    stim[31] = 22'h0eb6f8;
    stim[32] = 22'h0a2b35;
    stim[33] = 22'h37a449;
    stim[34] = 22'h0ea237;
    stim[35] = 22'h373781;
    stim[36] = 22'h0e0039;
    stim[37] = 22'h075b92;
    stim[38] = 22'h229243;
    stim[39] = 22'h0fd6f1;
    stim[40] = 22'h236738;
    stim[41] = 22'h26d1a6;
    stim[42] = 22'h2ca768;
    stim[43] = 22'h3b223e;
    stim[44] = 22'h3e44c9;
    stim[45] = 22'h3e8767;
    stim[46] = 22'h279dc4;
    stim[47] = 22'h0e8f02;
    stim[48] = 22'h06abaf;
    stim[49] = 22'h3eb30e;
    stim[50] = 22'h0a5bde;
    stim[51] = 22'h3ffe5c;
    stim[52] = 22'h0fcd5e;
    stim[53] = 22'h0a3c97;
    stim[54] = 22'h32a80c;
    stim[55] = 22'h377719;
    stim[56] = 22'h274a60;
    stim[57] = 22'h2aeca0;
    stim[58] = 22'h09c21d;
    stim[59] = 22'h22841a;
    stim[60] = 22'h07e9ee;
    stim[61] = 22'h1ad962;
    stim[62] = 22'h3b3145;
    stim[63] = 22'h36d6c4;
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
      expv[0] = 17'h00000;
      expv[1] = 17'h00000;
      expv[2] = 17'h00000;
      expv[3] = 17'h00000;
      expv[4] = 17'h00000;
      expv[5] = 17'h00000;
      expv[6] = 17'h00000;
      expv[7] = 17'h00000;
      expv[8] = 17'h00000;
      expv[9] = 17'h0c34f;
      expv[10] = 17'h00000;
      expv[11] = 17'h00000;
      expv[12] = 17'h00000;
      expv[13] = 17'h0d7ff;
      expv[14] = 17'h0d7ff;
      expv[15] = 17'h00000;
      expv[16] = 17'h0000e;
      expv[17] = 17'h00000;
      expv[18] = 17'h00000;
      expv[19] = 17'h0ee16;
      expv[20] = 17'h00002;
      expv[21] = 17'h0000e;
      expv[22] = 17'h00000;
      expv[23] = 17'h0c34f;
      expv[24] = 17'h0000e;
      expv[25] = 17'h0ee16;
      expv[26] = 17'h00000;
      expv[27] = 17'h00000;
      expv[28] = 17'h00000;
      expv[29] = 17'h0c34f;
      expv[30] = 17'h00002;
      expv[31] = 17'h00000;
      expv[32] = 17'h0000e;
      expv[33] = 17'h00008;
      expv[34] = 17'h00000;
      expv[35] = 17'h00008;
      expv[36] = 17'h00000;
      expv[37] = 17'h00007;
      expv[38] = 17'h00000;
      expv[39] = 17'h0c343;
      expv[40] = 17'h00009;
      expv[41] = 17'h0c343;
      expv[42] = 17'h00000;
      expv[43] = 17'h00000;
      expv[44] = 17'h00000;
      expv[45] = 17'h00000;
      expv[46] = 17'h00000;
      expv[47] = 17'h00000;
      expv[48] = 17'h00000;
      expv[49] = 17'h00000;
      expv[50] = 17'h00000;
      expv[51] = 17'h00002;
      expv[52] = 17'h00000;
      expv[53] = 17'h00002;
      expv[54] = 17'h00002;
      expv[55] = 17'h00000;
      expv[56] = 17'h00000;
      expv[57] = 17'h00000;
      expv[58] = 17'h00000;
      expv[59] = 17'h00000;
      expv[60] = 17'h00000;
      expv[61] = 17'h00000;
      expv[62] = 17'h00000;
      expv[63] = 17'h00000;
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
