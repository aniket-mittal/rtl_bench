// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 7;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_05644 dut (
    .CLK2(clk),
    .NSA(in_vec[6:6]),
    .Keypad(in_vec[5:1]),
    .Keyready(in_vec[0:0]),
    .INP_BUS(out_vec[16:1]),
    .KeyStrobe(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 7'h6b;
    stim[1] = 7'h0c;
    stim[2] = 7'h31;
    stim[3] = 7'h5a;
    stim[4] = 7'h56;
    stim[5] = 7'h5b;
    stim[6] = 7'h5f;
    stim[7] = 7'h5b;
    stim[8] = 7'h71;
    stim[9] = 7'h67;
    stim[10] = 7'h0c;
    stim[11] = 7'h5b;
    stim[12] = 7'h20;
    stim[13] = 7'h7f;
    stim[14] = 7'h3a;
    stim[15] = 7'h33;
    stim[16] = 7'h1b;
    stim[17] = 7'h30;
    stim[18] = 7'h31;
    stim[19] = 7'h1c;
    stim[20] = 7'h21;
    stim[21] = 7'h46;
    stim[22] = 7'h08;
    stim[23] = 7'h2f;
    stim[24] = 7'h22;
    stim[25] = 7'h47;
    stim[26] = 7'h4d;
    stim[27] = 7'h71;
    stim[28] = 7'h5c;
    stim[29] = 7'h30;
    stim[30] = 7'h4f;
    stim[31] = 7'h62;
    stim[32] = 7'h08;
    stim[33] = 7'h3c;
    stim[34] = 7'h5b;
    stim[35] = 7'h30;
    stim[36] = 7'h75;
    stim[37] = 7'h30;
    stim[38] = 7'h5b;
    stim[39] = 7'h69;
    stim[40] = 7'h7f;
    stim[41] = 7'h6a;
    stim[42] = 7'h22;
    stim[43] = 7'h54;
    stim[44] = 7'h34;
    stim[45] = 7'h1f;
    stim[46] = 7'h33;
    stim[47] = 7'h14;
    stim[48] = 7'h3a;
    stim[49] = 7'h41;
    stim[50] = 7'h43;
    stim[51] = 7'h63;
    stim[52] = 7'h08;
    stim[53] = 7'h68;
    stim[54] = 7'h29;
    stim[55] = 7'h10;
    stim[56] = 7'h3f;
    stim[57] = 7'h58;
    stim[58] = 7'h2e;
    stim[59] = 7'h00;
    stim[60] = 7'h5a;
    stim[61] = 7'h46;
    stim[62] = 7'h18;
    stim[63] = 7'h23;
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
      expv[0] = 17'h0002x;
      expv[1] = 17'h0400x;
      expv[2] = 17'h0403x;
      expv[3] = 17'h0001a;
      expv[4] = 17'h00017;
      expv[5] = 17'h0001a;
      expv[6] = 17'h0001e;
      expv[7] = 17'h0001b;
      expv[8] = 17'h00030;
      expv[9] = 17'h00026;
      expv[10] = 17'h0400c;
      expv[11] = 17'h0001a;
      expv[12] = 17'h04020;
      expv[13] = 17'h0003f;
      expv[14] = 17'h0403a;
      expv[15] = 17'h04033;
      expv[16] = 17'h0401a;
      expv[17] = 17'h04031;
      expv[18] = 17'h04030;
      expv[19] = 17'h0401c;
      expv[20] = 17'h04021;
      expv[21] = 17'h00006;
      expv[22] = 17'h04009;
      expv[23] = 17'h0402e;
      expv[24] = 17'h04022;
      expv[25] = 17'h00007;
      expv[26] = 17'h0000c;
      expv[27] = 17'h00031;
      expv[28] = 17'h0001c;
      expv[29] = 17'h04030;
      expv[30] = 17'h0000e;
      expv[31] = 17'h00022;
      expv[32] = 17'h04009;
      expv[33] = 17'h0403c;
      expv[34] = 17'h0001a;
      expv[35] = 17'h04030;
      expv[36] = 17'h00035;
      expv[37] = 17'h04030;
      expv[38] = 17'h0001b;
      expv[39] = 17'h00028;
      expv[40] = 17'h0003f;
      expv[41] = 17'h0002a;
      expv[42] = 17'h04022;
      expv[43] = 17'h00014;
      expv[44] = 17'h04034;
      expv[45] = 17'h0401e;
      expv[46] = 17'h04032;
      expv[47] = 17'h04015;
      expv[48] = 17'h0403a;
      expv[49] = 17'h00000;
      expv[50] = 17'h00002;
      expv[51] = 17'h00023;
      expv[52] = 17'h04008;
      expv[53] = 17'h00028;
      expv[54] = 17'h04028;
      expv[55] = 17'h04010;
      expv[56] = 17'h0403f;
      expv[57] = 17'h00018;
      expv[58] = 17'h0402f;
      expv[59] = 17'h04000;
      expv[60] = 17'h0001a;
      expv[61] = 17'h00006;
      expv[62] = 17'h04018;
      expv[63] = 17'h04022;
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
