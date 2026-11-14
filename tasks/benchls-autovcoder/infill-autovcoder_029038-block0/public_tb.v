// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 5;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_029038 dut (
    .clk(clk),
    .addr(in_vec[4:0]),
    .out(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 5'h01;
    stim[1] = 5'h0c;
    stim[2] = 5'h0e;
    stim[3] = 5'h05;
    stim[4] = 5'h13;
    stim[5] = 5'h10;
    stim[6] = 5'h1b;
    stim[7] = 5'h07;
    stim[8] = 5'h06;
    stim[9] = 5'h06;
    stim[10] = 5'h0e;
    stim[11] = 5'h0a;
    stim[12] = 5'h0c;
    stim[13] = 5'h10;
    stim[14] = 5'h1e;
    stim[15] = 5'h12;
    stim[16] = 5'h19;
    stim[17] = 5'h0b;
    stim[18] = 5'h00;
    stim[19] = 5'h0d;
    stim[20] = 5'h0c;
    stim[21] = 5'h05;
    stim[22] = 5'h12;
    stim[23] = 5'h0e;
    stim[24] = 5'h11;
    stim[25] = 5'h18;
    stim[26] = 5'h0f;
    stim[27] = 5'h1a;
    stim[28] = 5'h19;
    stim[29] = 5'h01;
    stim[30] = 5'h12;
    stim[31] = 5'h1b;
    stim[32] = 5'h08;
    stim[33] = 5'h09;
    stim[34] = 5'h0b;
    stim[35] = 5'h18;
    stim[36] = 5'h1f;
    stim[37] = 5'h05;
    stim[38] = 5'h14;
    stim[39] = 5'h06;
    stim[40] = 5'h13;
    stim[41] = 5'h16;
    stim[42] = 5'h1f;
    stim[43] = 5'h17;
    stim[44] = 5'h00;
    stim[45] = 5'h15;
    stim[46] = 5'h16;
    stim[47] = 5'h0d;
    stim[48] = 5'h04;
    stim[49] = 5'h18;
    stim[50] = 5'h16;
    stim[51] = 5'h13;
    stim[52] = 5'h07;
    stim[53] = 5'h1d;
    stim[54] = 5'h14;
    stim[55] = 5'h0f;
    stim[56] = 5'h10;
    stim[57] = 5'h13;
    stim[58] = 5'h18;
    stim[59] = 5'h04;
    stim[60] = 5'h17;
    stim[61] = 5'h02;
    stim[62] = 5'h0a;
    stim[63] = 5'h00;
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
      expv[0] = 16'hxxxx;
      expv[1] = 16'hxxxx;
      expv[2] = 16'hxxxx;
      expv[3] = 16'hf9ba;
      expv[4] = 16'hc4df;
      expv[5] = 16'hc13b;
      expv[6] = 16'he1d5;
      expv[7] = 16'hc2c1;
      expv[8] = 16'hc000;
      expv[9] = 16'he1d5;
      expv[10] = 16'hd766;
      expv[11] = 16'hdc72;
      expv[12] = 16'hdc72;
      expv[13] = 16'hc13b;
      expv[14] = 16'hcac9;
      expv[15] = 16'hc4df;
      expv[16] = 16'hc000;
      expv[17] = 16'hf384;
      expv[18] = 16'hc13b;
      expv[19] = 16'hd766;
      expv[20] = 16'hc78f;
      expv[21] = 16'h0000;
      expv[22] = 16'hc2c1;
      expv[23] = 16'hc4df;
      expv[24] = 16'he1d5;
      expv[25] = 16'hc13b;
      expv[26] = 16'hc13b;
      expv[27] = 16'hc04f;
      expv[28] = 16'hd2bf;
      expv[29] = 16'hc04f;
      expv[30] = 16'hdc72;
      expv[31] = 16'hd766;
      expv[32] = 16'hf9ba;
      expv[33] = 16'hc13b;
      expv[34] = 16'he1d5;
      expv[35] = 16'hd2bf;
      expv[36] = 16'hce87;
      expv[37] = 16'hc78f;
      expv[38] = 16'hd2bf;
      expv[39] = 16'hf9ba;
      expv[40] = 16'he1d5;
      expv[41] = 16'hc4df;
      expv[42] = 16'hdc72;
      expv[43] = 16'hc2c1;
      expv[44] = 16'hcac9;
      expv[45] = 16'hf9ba;
      expv[46] = 16'hce87;
      expv[47] = 16'h0000;
      expv[48] = 16'hc78f;
      expv[49] = 16'hcac9;
      expv[50] = 16'hc2c1;
      expv[51] = 16'he782;
      expv[52] = 16'hd2bf;
      expv[53] = 16'hcac9;
      expv[54] = 16'hc2c1;
      expv[55] = 16'hd766;
      expv[56] = 16'hed6c;
      expv[57] = 16'hc4df;
      expv[58] = 16'hc04f;
      expv[59] = 16'hc000;
      expv[60] = 16'hc2c1;
      expv[61] = 16'hd2bf;
      expv[62] = 16'he782;
      expv[63] = 16'hce87;
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
