// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 1;
  localparam OW = 96;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_08121 dut (
    .clk(clk),
    .reset_n(in_vec[0:0]),
    .Data_A(out_vec[95:84]),
    .Data_B(out_vec[83:72]),
    .Data_C(out_vec[71:60]),
    .Data_D(out_vec[59:48]),
    .Data_E(out_vec[47:36]),
    .Data_F(out_vec[35:24]),
    .Data_G(out_vec[23:12]),
    .Data_H(out_vec[11:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 1'h0;
    stim[1] = 1'h0;
    stim[2] = 1'h1;
    stim[3] = 1'h1;
    stim[4] = 1'h1;
    stim[5] = 1'h1;
    stim[6] = 1'h1;
    stim[7] = 1'h1;
    stim[8] = 1'h1;
    stim[9] = 1'h1;
    stim[10] = 1'h1;
    stim[11] = 1'h1;
    stim[12] = 1'h1;
    stim[13] = 1'h1;
    stim[14] = 1'h1;
    stim[15] = 1'h1;
    stim[16] = 1'h1;
    stim[17] = 1'h1;
    stim[18] = 1'h1;
    stim[19] = 1'h1;
    stim[20] = 1'h1;
    stim[21] = 1'h1;
    stim[22] = 1'h1;
    stim[23] = 1'h1;
    stim[24] = 1'h1;
    stim[25] = 1'h1;
    stim[26] = 1'h1;
    stim[27] = 1'h1;
    stim[28] = 1'h0;
    stim[29] = 1'h1;
    stim[30] = 1'h1;
    stim[31] = 1'h1;
    stim[32] = 1'h1;
    stim[33] = 1'h1;
    stim[34] = 1'h1;
    stim[35] = 1'h1;
    stim[36] = 1'h1;
    stim[37] = 1'h1;
    stim[38] = 1'h1;
    stim[39] = 1'h1;
    stim[40] = 1'h1;
    stim[41] = 1'h1;
    stim[42] = 1'h1;
    stim[43] = 1'h1;
    stim[44] = 1'h1;
    stim[45] = 1'h1;
    stim[46] = 1'h1;
    stim[47] = 1'h0;
    stim[48] = 1'h1;
    stim[49] = 1'h1;
    stim[50] = 1'h1;
    stim[51] = 1'h1;
    stim[52] = 1'h1;
    stim[53] = 1'h1;
    stim[54] = 1'h1;
    stim[55] = 1'h1;
    stim[56] = 1'h1;
    stim[57] = 1'h1;
    stim[58] = 1'h1;
    stim[59] = 1'h1;
    stim[60] = 1'h1;
    stim[61] = 1'h1;
    stim[62] = 1'h1;
    stim[63] = 1'h1;
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
      expv[0] = 96'h000001002003000001002003;
      expv[1] = 96'h000001002003000001002003;
      expv[2] = 96'h000001002003000001002003;
      expv[3] = 96'h001002003004001002003004;
      expv[4] = 96'h002003004005002003004005;
      expv[5] = 96'h003004005006003004005006;
      expv[6] = 96'h004005006007004005006007;
      expv[7] = 96'h005006007008005006007008;
      expv[8] = 96'h006007008009006007008009;
      expv[9] = 96'h00700800900a00700800900a;
      expv[10] = 96'h00800900a00b00800900a00b;
      expv[11] = 96'h00900a00b00c00900a00b00c;
      expv[12] = 96'h00a00b00c00d00a00b00c00d;
      expv[13] = 96'h00b00c00d00e00b00c00d00e;
      expv[14] = 96'h00c00d00e00f00c00d00e00f;
      expv[15] = 96'h00d00e00f01000d00e00f010;
      expv[16] = 96'h00e00f01001100e00f010011;
      expv[17] = 96'h00f01001101200f010011012;
      expv[18] = 96'h010011012013010011012013;
      expv[19] = 96'h011012013014011012013014;
      expv[20] = 96'h012013014015012013014015;
      expv[21] = 96'h013014015016013014015016;
      expv[22] = 96'h014015016017014015016017;
      expv[23] = 96'h015016017018015016017018;
      expv[24] = 96'h016017018019016017018019;
      expv[25] = 96'h01701801901a01701801901a;
      expv[26] = 96'h01801901a01b01801901a01b;
      expv[27] = 96'h01901a01b01c01901a01b01c;
      expv[28] = 96'h000001002003000001002003;
      expv[29] = 96'h000001002003000001002003;
      expv[30] = 96'h001002003004001002003004;
      expv[31] = 96'h002003004005002003004005;
      expv[32] = 96'h003004005006003004005006;
      expv[33] = 96'h004005006007004005006007;
      expv[34] = 96'h005006007008005006007008;
      expv[35] = 96'h006007008009006007008009;
      expv[36] = 96'h00700800900a00700800900a;
      expv[37] = 96'h00800900a00b00800900a00b;
      expv[38] = 96'h00900a00b00c00900a00b00c;
      expv[39] = 96'h00a00b00c00d00a00b00c00d;
      expv[40] = 96'h00b00c00d00e00b00c00d00e;
      expv[41] = 96'h00c00d00e00f00c00d00e00f;
      expv[42] = 96'h00d00e00f01000d00e00f010;
      expv[43] = 96'h00e00f01001100e00f010011;
      expv[44] = 96'h00f01001101200f010011012;
      expv[45] = 96'h010011012013010011012013;
      expv[46] = 96'h011012013014011012013014;
      expv[47] = 96'h000001002003000001002003;
      expv[48] = 96'h000001002003000001002003;
      expv[49] = 96'h001002003004001002003004;
      expv[50] = 96'h002003004005002003004005;
      expv[51] = 96'h003004005006003004005006;
      expv[52] = 96'h004005006007004005006007;
      expv[53] = 96'h005006007008005006007008;
      expv[54] = 96'h006007008009006007008009;
      expv[55] = 96'h00700800900a00700800900a;
      expv[56] = 96'h00800900a00b00800900a00b;
      expv[57] = 96'h00900a00b00c00900a00b00c;
      expv[58] = 96'h00a00b00c00d00a00b00c00d;
      expv[59] = 96'h00b00c00d00e00b00c00d00e;
      expv[60] = 96'h00c00d00e00f00c00d00e00f;
      expv[61] = 96'h00d00e00f01000d00e00f010;
      expv[62] = 96'h00e00f01001100e00f010011;
      expv[63] = 96'h00f01001101200f010011012;
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
