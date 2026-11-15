// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 5;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_052169 dut (
    .clk(clk),
    .row_no(in_vec[4:1]),
    .input_valid(in_vec[0:0]),
    .out(out_vec[32:1]),
    .output_valid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 5'h1e;
    stim[1] = 5'h01;
    stim[2] = 5'h00;
    stim[3] = 5'h10;
    stim[4] = 5'h19;
    stim[5] = 5'h00;
    stim[6] = 5'h03;
    stim[7] = 5'h0d;
    stim[8] = 5'h00;
    stim[9] = 5'h1b;
    stim[10] = 5'h05;
    stim[11] = 5'h16;
    stim[12] = 5'h05;
    stim[13] = 5'h04;
    stim[14] = 5'h19;
    stim[15] = 5'h1e;
    stim[16] = 5'h1b;
    stim[17] = 5'h06;
    stim[18] = 5'h06;
    stim[19] = 5'h09;
    stim[20] = 5'h1d;
    stim[21] = 5'h05;
    stim[22] = 5'h0e;
    stim[23] = 5'h04;
    stim[24] = 5'h13;
    stim[25] = 5'h03;
    stim[26] = 5'h03;
    stim[27] = 5'h15;
    stim[28] = 5'h15;
    stim[29] = 5'h09;
    stim[30] = 5'h10;
    stim[31] = 5'h15;
    stim[32] = 5'h19;
    stim[33] = 5'h0c;
    stim[34] = 5'h1a;
    stim[35] = 5'h0a;
    stim[36] = 5'h17;
    stim[37] = 5'h00;
    stim[38] = 5'h11;
    stim[39] = 5'h1b;
    stim[40] = 5'h16;
    stim[41] = 5'h06;
    stim[42] = 5'h10;
    stim[43] = 5'h01;
    stim[44] = 5'h07;
    stim[45] = 5'h04;
    stim[46] = 5'h03;
    stim[47] = 5'h1c;
    stim[48] = 5'h07;
    stim[49] = 5'h1a;
    stim[50] = 5'h01;
    stim[51] = 5'h04;
    stim[52] = 5'h0c;
    stim[53] = 5'h16;
    stim[54] = 5'h0f;
    stim[55] = 5'h0f;
    stim[56] = 5'h0b;
    stim[57] = 5'h14;
    stim[58] = 5'h1b;
    stim[59] = 5'h12;
    stim[60] = 5'h19;
    stim[61] = 5'h08;
    stim[62] = 5'h1f;
    stim[63] = 5'h0a;
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
      expv[0] = 33'hxxxxxxxxx;
      expv[1] = 33'hxxxxxxxxx;
      expv[2] = 33'hxxxxxxxxx;
      expv[3] = 33'hxxxxxxxxx;
      expv[4] = 33'h000000001;
      expv[5] = 33'h000000000;
      expv[6] = 33'h000000000;
      expv[7] = 33'h000000019;
      expv[8] = 33'h000000018;
      expv[9] = 33'h000000018;
      expv[10] = 33'h00000000d;
      expv[11] = 33'h00000000c;
      expv[12] = 33'h00000000c;
      expv[13] = 33'h000000005;
      expv[14] = 33'h000000004;
      expv[15] = 33'h000000004;
      expv[16] = 33'h000000004;
      expv[17] = 33'h000000019;
      expv[18] = 33'h000000018;
      expv[19] = 33'h000000018;
      expv[20] = 33'h000000018;
      expv[21] = 33'h000000018;
      expv[22] = 33'h00000001d;
      expv[23] = 33'h00000001c;
      expv[24] = 33'h00000001c;
      expv[25] = 33'h00000001c;
      expv[26] = 33'h00000001c;
      expv[27] = 33'h000000003;
      expv[28] = 33'h000000002;
      expv[29] = 33'h000000015;
      expv[30] = 33'h000000015;
      expv[31] = 33'h000000014;
      expv[32] = 33'h000000014;
      expv[33] = 33'h000000014;
      expv[34] = 33'h000000019;
      expv[35] = 33'h000000018;
      expv[36] = 33'h000000018;
      expv[37] = 33'h000000018;
      expv[38] = 33'h000000018;
      expv[39] = 33'h000000017;
      expv[40] = 33'h000000016;
      expv[41] = 33'h000000016;
      expv[42] = 33'h00000001b;
      expv[43] = 33'h00000001a;
      expv[44] = 33'h00000001a;
      expv[45] = 33'h00000001a;
      expv[46] = 33'h000000007;
      expv[47] = 33'h000000006;
      expv[48] = 33'h000000006;
      expv[49] = 33'h000000003;
      expv[50] = 33'h000000002;
      expv[51] = 33'h000000002;
      expv[52] = 33'h000000002;
      expv[53] = 33'h000000001;
      expv[54] = 33'h000000000;
      expv[55] = 33'h000000000;
      expv[56] = 33'h00000000f;
      expv[57] = 33'h00000000f;
      expv[58] = 33'h00000000e;
      expv[59] = 33'h00000000e;
      expv[60] = 33'h00000000e;
      expv[61] = 33'h00000001b;
      expv[62] = 33'h00000001a;
      expv[63] = 33'h00000001a;
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
