// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_097116 dut (
    .CLK(clk),
    .RST(in_vec[8:8]),
    .in(in_vec[7:0]),
    .HEXHigh(out_vec[15:8]),
    .HEXLow(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h1d8;
    stim[1] = 9'h14d;
    stim[2] = 9'h011;
    stim[3] = 9'h07c;
    stim[4] = 9'h056;
    stim[5] = 9'h00c;
    stim[6] = 9'h03d;
    stim[7] = 9'h0d0;
    stim[8] = 9'h0e4;
    stim[9] = 9'h062;
    stim[10] = 9'h085;
    stim[11] = 9'h05c;
    stim[12] = 9'h0e9;
    stim[13] = 9'h0a0;
    stim[14] = 9'h00e;
    stim[15] = 9'h06c;
    stim[16] = 9'h083;
    stim[17] = 9'h01d;
    stim[18] = 9'h070;
    stim[19] = 9'h082;
    stim[20] = 9'h0f9;
    stim[21] = 9'h015;
    stim[22] = 9'h066;
    stim[23] = 9'h04d;
    stim[24] = 9'h008;
    stim[25] = 9'h07d;
    stim[26] = 9'h0c9;
    stim[27] = 9'h093;
    stim[28] = 9'h0e4;
    stim[29] = 9'h0ef;
    stim[30] = 9'h0d6;
    stim[31] = 9'h06f;
    stim[32] = 9'h07c;
    stim[33] = 9'h06b;
    stim[34] = 9'h051;
    stim[35] = 9'h046;
    stim[36] = 9'h08c;
    stim[37] = 9'h0f3;
    stim[38] = 9'h002;
    stim[39] = 9'h06f;
    stim[40] = 9'h003;
    stim[41] = 9'h009;
    stim[42] = 9'h097;
    stim[43] = 9'h03c;
    stim[44] = 9'h02b;
    stim[45] = 9'h0de;
    stim[46] = 9'h0ee;
    stim[47] = 9'h0af;
    stim[48] = 9'h044;
    stim[49] = 9'h06f;
    stim[50] = 9'h06f;
    stim[51] = 9'h098;
    stim[52] = 9'h06d;
    stim[53] = 9'h050;
    stim[54] = 9'h08f;
    stim[55] = 9'h031;
    stim[56] = 9'h005;
    stim[57] = 9'h0e0;
    stim[58] = 9'h040;
    stim[59] = 9'h010;
    stim[60] = 9'h0e7;
    stim[61] = 9'h057;
    stim[62] = 9'h057;
    stim[63] = 9'h071;
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
      expv[0] = 16'ha180;
      expv[1] = 16'h99a1;
      expv[2] = 16'hf9f9;
      expv[3] = 16'hf8c6;
      expv[4] = 16'h9282;
      expv[5] = 16'hc0c6;
      expv[6] = 16'hb0a1;
      expv[7] = 16'ha1c0;
      expv[8] = 16'h8699;
      expv[9] = 16'h82a4;
      expv[10] = 16'h8092;
      expv[11] = 16'h92c6;
      expv[12] = 16'h8690;
      expv[13] = 16'h88c0;
      expv[14] = 16'hc086;
      expv[15] = 16'h82c6;
      expv[16] = 16'h80b0;
      expv[17] = 16'hf9a1;
      expv[18] = 16'hf8c0;
      expv[19] = 16'h80a4;
      expv[20] = 16'h8e90;
      expv[21] = 16'hf992;
      expv[22] = 16'h8282;
      expv[23] = 16'h99a1;
      expv[24] = 16'hc080;
      expv[25] = 16'hf8a1;
      expv[26] = 16'hc690;
      expv[27] = 16'h90b0;
      expv[28] = 16'h8699;
      expv[29] = 16'h868e;
      expv[30] = 16'ha182;
      expv[31] = 16'h828e;
      expv[32] = 16'hf8c6;
      expv[33] = 16'h8283;
      expv[34] = 16'h92f9;
      expv[35] = 16'h9982;
      expv[36] = 16'h80c6;
      expv[37] = 16'h8eb0;
      expv[38] = 16'hc0a4;
      expv[39] = 16'h828e;
      expv[40] = 16'hc0b0;
      expv[41] = 16'hc090;
      expv[42] = 16'h90f8;
      expv[43] = 16'hb0c6;
      expv[44] = 16'ha483;
      expv[45] = 16'ha186;
      expv[46] = 16'h8686;
      expv[47] = 16'h888e;
      expv[48] = 16'h9999;
      expv[49] = 16'h828e;
      expv[50] = 16'h828e;
      expv[51] = 16'h9080;
      expv[52] = 16'h82a1;
      expv[53] = 16'h92c0;
      expv[54] = 16'h808e;
      expv[55] = 16'hb0f9;
      expv[56] = 16'hc092;
      expv[57] = 16'h86c0;
      expv[58] = 16'h99c0;
      expv[59] = 16'hf9c0;
      expv[60] = 16'h86f8;
      expv[61] = 16'h92f8;
      expv[62] = 16'h92f8;
      expv[63] = 16'hf8f9;
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
