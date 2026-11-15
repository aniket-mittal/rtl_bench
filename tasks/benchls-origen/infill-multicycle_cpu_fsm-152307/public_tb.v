// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 7;
  localparam OW = 14;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_152307 dut (
    .clock(clk),
    .reset(in_vec[6:6]),
    .Aeq0(in_vec[5:5]),
    .Apos(in_vec[4:4]),
    .enter(in_vec[3:3]),
    .ir(in_vec[2:0]),
    .IRload(out_vec[13:13]),
    .JMPmux(out_vec[12:12]),
    .PCload(out_vec[11:11]),
    .Meminst(out_vec[10:10]),
    .MemWr(out_vec[9:9]),
    .Asel(out_vec[8:7]),
    .Aload(out_vec[6:6]),
    .Sub(out_vec[5:5]),
    .Halt(out_vec[4:4]),
    .showstate(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 7'h73;
    stim[1] = 7'h49;
    stim[2] = 7'h15;
    stim[3] = 7'h06;
    stim[4] = 7'h2e;
    stim[5] = 7'h0a;
    stim[6] = 7'h1c;
    stim[7] = 7'h32;
    stim[8] = 7'h15;
    stim[9] = 7'h3f;
    stim[10] = 7'h39;
    stim[11] = 7'h38;
    stim[12] = 7'h31;
    stim[13] = 7'h2b;
    stim[14] = 7'h37;
    stim[15] = 7'h00;
    stim[16] = 7'h3c;
    stim[17] = 7'h09;
    stim[18] = 7'h2d;
    stim[19] = 7'h20;
    stim[20] = 7'h34;
    stim[21] = 7'h05;
    stim[22] = 7'h26;
    stim[23] = 7'h2b;
    stim[24] = 7'h38;
    stim[25] = 7'h3a;
    stim[26] = 7'h2b;
    stim[27] = 7'h14;
    stim[28] = 7'h11;
    stim[29] = 7'h32;
    stim[30] = 7'h3f;
    stim[31] = 7'h09;
    stim[32] = 7'h3b;
    stim[33] = 7'h02;
    stim[34] = 7'h3f;
    stim[35] = 7'h1c;
    stim[36] = 7'h32;
    stim[37] = 7'h12;
    stim[38] = 7'h38;
    stim[39] = 7'h05;
    stim[40] = 7'h13;
    stim[41] = 7'h1b;
    stim[42] = 7'h08;
    stim[43] = 7'h17;
    stim[44] = 7'h37;
    stim[45] = 7'h31;
    stim[46] = 7'h05;
    stim[47] = 7'h06;
    stim[48] = 7'h22;
    stim[49] = 7'h17;
    stim[50] = 7'h02;
    stim[51] = 7'h3a;
    stim[52] = 7'h35;
    stim[53] = 7'h2c;
    stim[54] = 7'h16;
    stim[55] = 7'h39;
    stim[56] = 7'h1e;
    stim[57] = 7'h00;
    stim[58] = 7'h07;
    stim[59] = 7'h3e;
    stim[60] = 7'h3f;
    stim[61] = 7'h34;
    stim[62] = 7'h07;
    stim[63] = 7'h3f;
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
      expv[0] = 14'hxxx0;
      expv[1] = 14'hxxx0;
      expv[2] = 14'hxxx0;
      expv[3] = 14'hxxx0;
      expv[4] = 14'hxxx0;
      expv[5] = 14'hxxx1;
      expv[6] = 14'hxxx2;
      expv[7] = 14'hxxx3;
      expv[8] = 14'hxxx4;
      expv[9] = 14'hxxxa;
      expv[10] = 14'hxxx0;
      expv[11] = 14'hxxx1;
      expv[12] = 14'hxxx2;
      expv[13] = 14'hxxx3;
      expv[14] = 14'hxxx4;
      expv[15] = 14'hxxx0;
      expv[16] = 14'hxxx0;
      expv[17] = 14'hxxx1;
      expv[18] = 14'hxxx2;
      expv[19] = 14'hxxx3;
      expv[20] = 14'hxxx4;
      expv[21] = 14'hxxx9;
      expv[22] = 14'hxxx0;
      expv[23] = 14'hxxx0;
      expv[24] = 14'hxxx1;
      expv[25] = 14'hxxx2;
      expv[26] = 14'hxxx3;
      expv[27] = 14'hxxx4;
      expv[28] = 14'hxxx9;
      expv[29] = 14'hxxx0;
      expv[30] = 14'hxxx0;
      expv[31] = 14'hxxx1;
      expv[32] = 14'hxxx2;
      expv[33] = 14'hxxx3;
      expv[34] = 14'hxxx4;
      expv[35] = 14'hxxx0;
      expv[36] = 14'hxxx1;
      expv[37] = 14'hxxx2;
      expv[38] = 14'hxxx3;
      expv[39] = 14'hxxx4;
      expv[40] = 14'hxxxa;
      expv[41] = 14'hxxx0;
      expv[42] = 14'hxxx1;
      expv[43] = 14'hxxx2;
      expv[44] = 14'hxxx3;
      expv[45] = 14'hxxx4;
      expv[46] = 14'hxxx6;
      expv[47] = 14'hxxx0;
      expv[48] = 14'hxxx0;
      expv[49] = 14'hxxx0;
      expv[50] = 14'hxxx0;
      expv[51] = 14'hxxx0;
      expv[52] = 14'hxxx1;
      expv[53] = 14'hxxx2;
      expv[54] = 14'hxxx3;
      expv[55] = 14'hxxx4;
      expv[56] = 14'hxxx6;
      expv[57] = 14'hxxx0;
      expv[58] = 14'hxxx0;
      expv[59] = 14'hxxx0;
      expv[60] = 14'hxxx1;
      expv[61] = 14'hxxx2;
      expv[62] = 14'hxxx3;
      expv[63] = 14'hxxx4;
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
