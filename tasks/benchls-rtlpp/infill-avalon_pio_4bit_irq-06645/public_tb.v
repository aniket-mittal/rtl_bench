// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 13;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_06645 dut (
    .clk(clk),
    .address(in_vec[12:11]),
    .chipselect(in_vec[10:10]),
    .in_port(in_vec[9:6]),
    .reset_n(in_vec[5:5]),
    .write_n(in_vec[4:4]),
    .writedata(in_vec[3:0]),
    .irq(out_vec[4:4]),
    .readdata(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 13'h05cc;
    stim[1] = 13'h0d01;
    stim[2] = 13'h0ee3;
    stim[3] = 13'h0fe8;
    stim[4] = 13'h1a3e;
    stim[5] = 13'h14f9;
    stim[6] = 13'h1261;
    stim[7] = 13'h1f2b;
    stim[8] = 13'h0fe4;
    stim[9] = 13'h0ab6;
    stim[10] = 13'h15f4;
    stim[11] = 13'h0534;
    stim[12] = 13'h1875;
    stim[13] = 13'h053b;
    stim[14] = 13'h1ea2;
    stim[15] = 13'h19fc;
    stim[16] = 13'h0533;
    stim[17] = 13'h057b;
    stim[18] = 13'h1d7a;
    stim[19] = 13'h1528;
    stim[20] = 13'h0664;
    stim[21] = 13'h0a2b;
    stim[22] = 13'h1f6e;
    stim[23] = 13'h15e0;
    stim[24] = 13'h08ee;
    stim[25] = 13'h076a;
    stim[26] = 13'h1da6;
    stim[27] = 13'h1fa0;
    stim[28] = 13'h1aec;
    stim[29] = 13'h17f7;
    stim[30] = 13'h1530;
    stim[31] = 13'h12ef;
    stim[32] = 13'h136d;
    stim[33] = 13'h0968;
    stim[34] = 13'h017f;
    stim[35] = 13'h1a6a;
    stim[36] = 13'h0af6;
    stim[37] = 13'h06ae;
    stim[38] = 13'h0ef8;
    stim[39] = 13'h1a3b;
    stim[40] = 13'h062c;
    stim[41] = 13'h06a4;
    stim[42] = 13'h1af5;
    stim[43] = 13'h1a28;
    stim[44] = 13'h14b2;
    stim[45] = 13'h11e1;
    stim[46] = 13'h1971;
    stim[47] = 13'h13af;
    stim[48] = 13'h097e;
    stim[49] = 13'h1667;
    stim[50] = 13'h0761;
    stim[51] = 13'h0e6b;
    stim[52] = 13'h18f4;
    stim[53] = 13'h12be;
    stim[54] = 13'h04f4;
    stim[55] = 13'h116f;
    stim[56] = 13'h0ffb;
    stim[57] = 13'h03ee;
    stim[58] = 13'h1d30;
    stim[59] = 13'h00bd;
    stim[60] = 13'h1870;
    stim[61] = 13'h1a31;
    stim[62] = 13'h0a7b;
    stim[63] = 13'h0d24;
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
      expv[0] = 5'h00;
      expv[1] = 5'h00;
      expv[2] = 5'h00;
      expv[3] = 5'h00;
      expv[4] = 5'h00;
      expv[5] = 5'h00;
      expv[6] = 5'h00;
      expv[7] = 5'h00;
      expv[8] = 5'h0f;
      expv[9] = 5'h00;
      expv[10] = 5'h00;
      expv[11] = 5'h00;
      expv[12] = 5'h04;
      expv[13] = 5'h0d;
      expv[14] = 5'h04;
      expv[15] = 5'h0f;
      expv[16] = 5'h00;
      expv[17] = 5'h04;
      expv[18] = 5'h05;
      expv[19] = 5'h0f;
      expv[20] = 5'h10;
      expv[21] = 5'h19;
      expv[22] = 5'h10;
      expv[23] = 5'h0f;
      expv[24] = 5'h08;
      expv[25] = 5'h00;
      expv[26] = 5'h0d;
      expv[27] = 5'h0c;
      expv[28] = 5'h00;
      expv[29] = 5'h00;
      expv[30] = 5'h00;
      expv[31] = 5'h00;
      expv[32] = 5'h00;
      expv[33] = 5'h00;
      expv[34] = 5'h00;
      expv[35] = 5'h05;
      expv[36] = 5'h0f;
      expv[37] = 5'h00;
      expv[38] = 5'h0a;
      expv[39] = 5'h00;
      expv[40] = 5'h0f;
      expv[41] = 5'h08;
      expv[42] = 5'h0a;
      expv[43] = 5'h0f;
      expv[44] = 5'h0f;
      expv[45] = 5'h00;
      expv[46] = 5'h00;
      expv[47] = 5'h0f;
      expv[48] = 5'h00;
      expv[49] = 5'h00;
      expv[50] = 5'h10;
      expv[51] = 5'h1d;
      expv[52] = 5'h10;
      expv[53] = 5'h1f;
      expv[54] = 5'h17;
      expv[55] = 5'h13;
      expv[56] = 5'h17;
      expv[57] = 5'h10;
      expv[58] = 5'h1f;
      expv[59] = 5'h1f;
      expv[60] = 5'h12;
      expv[61] = 5'h1f;
      expv[62] = 5'h1f;
      expv[63] = 5'h10;
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
