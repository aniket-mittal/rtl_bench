// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_07071 dut (
    .clock(clk),
    .reset(in_vec[10:10]),
    .command(in_vec[9:1]),
    .write(in_vec[0:0]),
    .ack(out_vec[7:7]),
    .LCD_D(out_vec[6:3]),
    .LCD_E(out_vec[2:2]),
    .LCD_RS(out_vec[1:1]),
    .LCD_RW(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h633;
    stim[1] = 11'h7f1;
    stim[2] = 11'h03e;
    stim[3] = 11'h3c2;
    stim[4] = 11'h078;
    stim[5] = 11'h200;
    stim[6] = 11'h3da;
    stim[7] = 11'h283;
    stim[8] = 11'h13b;
    stim[9] = 11'h05f;
    stim[10] = 11'h2d8;
    stim[11] = 11'h354;
    stim[12] = 11'h367;
    stim[13] = 11'h2a4;
    stim[14] = 11'h08d;
    stim[15] = 11'h103;
    stim[16] = 11'h063;
    stim[17] = 11'h1ae;
    stim[18] = 11'h092;
    stim[19] = 11'h2ea;
    stim[20] = 11'h344;
    stim[21] = 11'h08a;
    stim[22] = 11'h1b8;
    stim[23] = 11'h39a;
    stim[24] = 11'h3c7;
    stim[25] = 11'h248;
    stim[26] = 11'h1eb;
    stim[27] = 11'h29a;
    stim[28] = 11'h265;
    stim[29] = 11'h2e7;
    stim[30] = 11'h36d;
    stim[31] = 11'h000;
    stim[32] = 11'h21b;
    stim[33] = 11'h132;
    stim[34] = 11'h38d;
    stim[35] = 11'h07b;
    stim[36] = 11'h0b4;
    stim[37] = 11'h159;
    stim[38] = 11'h1b8;
    stim[39] = 11'h003;
    stim[40] = 11'h2bb;
    stim[41] = 11'h0ab;
    stim[42] = 11'h021;
    stim[43] = 11'h1e8;
    stim[44] = 11'h1aa;
    stim[45] = 11'h104;
    stim[46] = 11'h3c6;
    stim[47] = 11'h1cd;
    stim[48] = 11'h1f1;
    stim[49] = 11'h15f;
    stim[50] = 11'h11b;
    stim[51] = 11'h04c;
    stim[52] = 11'h119;
    stim[53] = 11'h2ba;
    stim[54] = 11'h115;
    stim[55] = 11'h3bb;
    stim[56] = 11'h0d9;
    stim[57] = 11'h3d8;
    stim[58] = 11'h241;
    stim[59] = 11'h2d9;
    stim[60] = 11'h2df;
    stim[61] = 11'h1a8;
    stim[62] = 11'h0ac;
    stim[63] = 11'h059;
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
      expv[0] = 8'hx2;
      expv[1] = 8'h02;
      expv[2] = 8'h00;
      expv[3] = 8'h02;
      expv[4] = 8'h00;
      expv[5] = 8'h02;
      expv[6] = 8'h02;
      expv[7] = 8'h02;
      expv[8] = 8'h00;
      expv[9] = 8'h00;
      expv[10] = 8'h02;
      expv[11] = 8'h02;
      expv[12] = 8'h02;
      expv[13] = 8'h02;
      expv[14] = 8'h00;
      expv[15] = 8'h00;
      expv[16] = 8'h00;
      expv[17] = 8'h00;
      expv[18] = 8'h00;
      expv[19] = 8'h02;
      expv[20] = 8'h02;
      expv[21] = 8'h00;
      expv[22] = 8'h00;
      expv[23] = 8'h02;
      expv[24] = 8'h02;
      expv[25] = 8'h02;
      expv[26] = 8'h00;
      expv[27] = 8'h02;
      expv[28] = 8'h02;
      expv[29] = 8'h02;
      expv[30] = 8'h02;
      expv[31] = 8'h00;
      expv[32] = 8'h02;
      expv[33] = 8'h00;
      expv[34] = 8'h02;
      expv[35] = 8'h00;
      expv[36] = 8'h00;
      expv[37] = 8'h00;
      expv[38] = 8'h00;
      expv[39] = 8'h00;
      expv[40] = 8'h02;
      expv[41] = 8'h00;
      expv[42] = 8'h00;
      expv[43] = 8'h00;
      expv[44] = 8'h00;
      expv[45] = 8'h00;
      expv[46] = 8'h02;
      expv[47] = 8'h00;
      expv[48] = 8'h00;
      expv[49] = 8'h00;
      expv[50] = 8'h00;
      expv[51] = 8'h00;
      expv[52] = 8'h00;
      expv[53] = 8'h02;
      expv[54] = 8'h00;
      expv[55] = 8'h02;
      expv[56] = 8'h00;
      expv[57] = 8'h02;
      expv[58] = 8'h02;
      expv[59] = 8'h02;
      expv[60] = 8'h02;
      expv[61] = 8'h00;
      expv[62] = 8'h00;
      expv[63] = 8'h00;
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
