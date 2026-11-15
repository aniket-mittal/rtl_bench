// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 5;
  localparam OW = 90;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_075055 dut (
    .clk(clk),
    .rst_n(in_vec[4:4]),
    .keyboard_val(in_vec[3:0]),
    .fword(out_vec[89:58]),
    .pword(out_vec[57:26]),
    .aword(out_vec[25:14]),
    .wave_select(out_vec[13:10]),
    .LED(out_vec[9:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 5'h0f;
    stim[1] = 5'h0a;
    stim[2] = 5'h10;
    stim[3] = 5'h12;
    stim[4] = 5'h1f;
    stim[5] = 5'h16;
    stim[6] = 5'h16;
    stim[7] = 5'h17;
    stim[8] = 5'h18;
    stim[9] = 5'h1e;
    stim[10] = 5'h1e;
    stim[11] = 5'h16;
    stim[12] = 5'h14;
    stim[13] = 5'h16;
    stim[14] = 5'h14;
    stim[15] = 5'h12;
    stim[16] = 5'h19;
    stim[17] = 5'h17;
    stim[18] = 5'h1c;
    stim[19] = 5'h14;
    stim[20] = 5'h1b;
    stim[21] = 5'h1a;
    stim[22] = 5'h16;
    stim[23] = 5'h12;
    stim[24] = 5'h16;
    stim[25] = 5'h15;
    stim[26] = 5'h14;
    stim[27] = 5'h1e;
    stim[28] = 5'h1c;
    stim[29] = 5'h15;
    stim[30] = 5'h14;
    stim[31] = 5'h1d;
    stim[32] = 5'h17;
    stim[33] = 5'h1d;
    stim[34] = 5'h11;
    stim[35] = 5'h14;
    stim[36] = 5'h15;
    stim[37] = 5'h13;
    stim[38] = 5'h1d;
    stim[39] = 5'h18;
    stim[40] = 5'h1b;
    stim[41] = 5'h1f;
    stim[42] = 5'h15;
    stim[43] = 5'h15;
    stim[44] = 5'h17;
    stim[45] = 5'h13;
    stim[46] = 5'h1b;
    stim[47] = 5'h08;
    stim[48] = 5'h14;
    stim[49] = 5'h16;
    stim[50] = 5'h18;
    stim[51] = 5'h13;
    stim[52] = 5'h15;
    stim[53] = 5'h18;
    stim[54] = 5'h17;
    stim[55] = 5'h1b;
    stim[56] = 5'h13;
    stim[57] = 5'h12;
    stim[58] = 5'h1a;
    stim[59] = 5'h11;
    stim[60] = 5'h1a;
    stim[61] = 5'h11;
    stim[62] = 5'h10;
    stim[63] = 5'h1b;
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
      expv[0] = 90'h00040000000000002000000;
      expv[1] = 90'h00040000000000002000000;
      expv[2] = 90'h00040000000000002000000;
      expv[3] = 90'h00040000000000002000000;
      expv[4] = 90'h00040000000000002000000;
      expv[5] = 90'h00040000000000002000200;
      expv[6] = 90'h00040000000000001fc0201;
      expv[7] = 90'h00040000000000001f80200;
      expv[8] = 90'h00040000000000001fc0202;
      expv[9] = 90'h000400003fffc0001fc0206;
      expv[10] = 90'h000400003fffc0001fc0706;
      expv[11] = 90'h000400003fffc0001fc0606;
      expv[12] = 90'h000400003fffc0001f80607;
      expv[13] = 90'h000400003fffc0001f80607;
      expv[14] = 90'h000400003fffc0001f40606;
      expv[15] = 90'h000400003fffc0001f40606;
      expv[16] = 90'h000400003fffc0001f40606;
      expv[17] = 90'h00040000000000001f4060e;
      expv[18] = 90'h00040000000000001f8060c;
      expv[19] = 90'h00040000000000001f80e4c;
      expv[20] = 90'h00040000000000001f80e4c;
      expv[21] = 90'h00044000000000001f80e6c;
      expv[22] = 90'h00040000000000001f80e7c;
      expv[23] = 90'h00040000000000001f40e7d;
      expv[24] = 90'h00040000000000001f40e7d;
      expv[25] = 90'h00040000000000001f00e7c;
      expv[26] = 90'h00040000000000001f00e7c;
      expv[27] = 90'h00040000000000001f00e7c;
      expv[28] = 90'h00040000000000001f0077c;
      expv[29] = 90'h00040000000000001f00f3c;
      expv[30] = 90'h00040000000000001f00f3c;
      expv[31] = 90'h00040000000000001f00f3c;
      expv[32] = 90'h00040000000000001f00bbc;
      expv[33] = 90'h00040000000000001f40bbe;
      expv[34] = 90'h00040000000000001f40b3e;
      expv[35] = 90'h00040000000000001f40b3e;
      expv[36] = 90'h00040000000000001f40b3e;
      expv[37] = 90'h00040000000000001f40b3e;
      expv[38] = 90'h00040000000000001f40b3e;
      expv[39] = 90'h00040000000000001f40bbe;
      expv[40] = 90'h000400003fffc0001f40bba;
      expv[41] = 90'h000440003fffc0001f40b9a;
      expv[42] = 90'h000440003fffc0001f4019a;
      expv[43] = 90'h000440003fffc0001f4019a;
      expv[44] = 90'h000440003fffc0001f4019a;
      expv[45] = 90'h000440003fffc0001f80198;
      expv[46] = 90'h000440003fffc0001f80198;
      expv[47] = 90'h00040000000000002000000;
      expv[48] = 90'h00040000000000002000000;
      expv[49] = 90'h00040000000000002000000;
      expv[50] = 90'h00040000000000001fc0001;
      expv[51] = 90'h000400003fffc0001fc0005;
      expv[52] = 90'h000400003fffc0001fc0005;
      expv[53] = 90'h000400003fffc0001fc0005;
      expv[54] = 90'h000400003fff80001fc0001;
      expv[55] = 90'h000400003fff80002000003;
      expv[56] = 90'h000440003fff80002000023;
      expv[57] = 90'h000440003fff80002000023;
      expv[58] = 90'h000440003fff80002000023;
      expv[59] = 90'h000400003fff80002000033;
      expv[60] = 90'h000400003fff80002000033;
      expv[61] = 90'h0003c0003fff80002000023;
      expv[62] = 90'h0003c0003fff80002000023;
      expv[63] = 90'h0003c0003fff80002000023;
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
