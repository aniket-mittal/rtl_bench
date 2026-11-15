// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 13;
  localparam OW = 35;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_040346 dut (
    .clk(clk),
    .rst(in_vec[12:12]),
    .nvga_r(in_vec[11:8]),
    .nvga_g(in_vec[7:4]),
    .nvga_b(in_vec[3:0]),
    .hsync(out_vec[34:34]),
    .vsync(out_vec[33:33]),
    .valid(out_vec[32:32]),
    .x_dis(out_vec[31:22]),
    .y_dis(out_vec[21:12]),
    .vga_r(out_vec[11:8]),
    .vga_g(out_vec[7:4]),
    .vga_b(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 13'h1fe4;
    stim[1] = 13'h1328;
    stim[2] = 13'h0e19;
    stim[3] = 13'h11d0;
    stim[4] = 13'h0c16;
    stim[5] = 13'h0ae1;
    stim[6] = 13'h03cc;
    stim[7] = 13'h0ea8;
    stim[8] = 13'h0b7c;
    stim[9] = 13'h0c49;
    stim[10] = 13'h08a5;
    stim[11] = 13'h0ed3;
    stim[12] = 13'h0d79;
    stim[13] = 13'h02dd;
    stim[14] = 13'h08cc;
    stim[15] = 13'h0aeb;
    stim[16] = 13'h0512;
    stim[17] = 13'h0c32;
    stim[18] = 13'h07b7;
    stim[19] = 13'h0d00;
    stim[20] = 13'h09eb;
    stim[21] = 13'h0ac1;
    stim[22] = 13'h0f7c;
    stim[23] = 13'h0ad2;
    stim[24] = 13'h07ee;
    stim[25] = 13'h0480;
    stim[26] = 13'h069e;
    stim[27] = 13'h0dc9;
    stim[28] = 13'h0547;
    stim[29] = 13'h0486;
    stim[30] = 13'h0491;
    stim[31] = 13'h054d;
    stim[32] = 13'h08b2;
    stim[33] = 13'h0d6e;
    stim[34] = 13'h07f5;
    stim[35] = 13'h011b;
    stim[36] = 13'h065a;
    stim[37] = 13'h03ee;
    stim[38] = 13'h0854;
    stim[39] = 13'h03bc;
    stim[40] = 13'h0580;
    stim[41] = 13'h097e;
    stim[42] = 13'h082c;
    stim[43] = 13'h0f56;
    stim[44] = 13'h02d3;
    stim[45] = 13'h06ea;
    stim[46] = 13'h047e;
    stim[47] = 13'h0d00;
    stim[48] = 13'h0bc1;
    stim[49] = 13'h0c82;
    stim[50] = 13'h0e14;
    stim[51] = 13'h0aa9;
    stim[52] = 13'h03b2;
    stim[53] = 13'h0371;
    stim[54] = 13'h0e3c;
    stim[55] = 13'h087e;
    stim[56] = 13'h09b7;
    stim[57] = 13'h0b2e;
    stim[58] = 13'h033f;
    stim[59] = 13'h04a8;
    stim[60] = 13'h081d;
    stim[61] = 13'h089f;
    stim[62] = 13'h0f39;
    stim[63] = 13'h0563;
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
      expv[0] = 35'h600000fe4;
      expv[1] = 35'h600000328;
      expv[2] = 35'h600000e19;
      expv[3] = 35'h6000001d0;
      expv[4] = 35'h600000c16;
      expv[5] = 35'h000000ae1;
      expv[6] = 35'h0000003cc;
      expv[7] = 35'h000000ea8;
      expv[8] = 35'h000000b7c;
      expv[9] = 35'h000000c49;
      expv[10] = 35'h0000008a5;
      expv[11] = 35'h000000ed3;
      expv[12] = 35'h000000d79;
      expv[13] = 35'h0000002dd;
      expv[14] = 35'h0000008cc;
      expv[15] = 35'h000000aeb;
      expv[16] = 35'h000000512;
      expv[17] = 35'h000000c32;
      expv[18] = 35'h0000007b7;
      expv[19] = 35'h000000d00;
      expv[20] = 35'h0000009eb;
      expv[21] = 35'h000000ac1;
      expv[22] = 35'h000000f7c;
      expv[23] = 35'h000000ad2;
      expv[24] = 35'h0000007ee;
      expv[25] = 35'h000000480;
      expv[26] = 35'h00000069e;
      expv[27] = 35'h000000dc9;
      expv[28] = 35'h000000547;
      expv[29] = 35'h000000486;
      expv[30] = 35'h000000491;
      expv[31] = 35'h00000054d;
      expv[32] = 35'h0000008b2;
      expv[33] = 35'h000000d6e;
      expv[34] = 35'h0000007f5;
      expv[35] = 35'h00000011b;
      expv[36] = 35'h00000065a;
      expv[37] = 35'h0000003ee;
      expv[38] = 35'h000000854;
      expv[39] = 35'h0000003bc;
      expv[40] = 35'h000000580;
      expv[41] = 35'h00000097e;
      expv[42] = 35'h00000082c;
      expv[43] = 35'h000000f56;
      expv[44] = 35'h0000002d3;
      expv[45] = 35'h0000006ea;
      expv[46] = 35'h00000047e;
      expv[47] = 35'h000000d00;
      expv[48] = 35'h000000bc1;
      expv[49] = 35'h000000c82;
      expv[50] = 35'h000000e14;
      expv[51] = 35'h000000aa9;
      expv[52] = 35'h0000003b2;
      expv[53] = 35'h000000371;
      expv[54] = 35'h000000e3c;
      expv[55] = 35'h00000087e;
      expv[56] = 35'h0000009b7;
      expv[57] = 35'h000000b2e;
      expv[58] = 35'h00000033f;
      expv[59] = 35'h0000004a8;
      expv[60] = 35'h00000081d;
      expv[61] = 35'h00000089f;
      expv[62] = 35'h000000f39;
      expv[63] = 35'h000000563;
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
