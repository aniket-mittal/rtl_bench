// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 20;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_09041 dut (
    .clk(clk),
    .num(in_vec[19:4]),
    .flash(in_vec[3:0]),
    .display(out_vec[11:4]),
    .an(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 20'h59cd6;
    stim[1] = 20'hc2eb5;
    stim[2] = 20'h0296b;
    stim[3] = 20'hb4b4a;
    stim[4] = 20'hfefd0;
    stim[5] = 20'h8deb7;
    stim[6] = 20'h61059;
    stim[7] = 20'h87134;
    stim[8] = 20'h29286;
    stim[9] = 20'he3d31;
    stim[10] = 20'hb3d7d;
    stim[11] = 20'h65302;
    stim[12] = 20'hc2c0a;
    stim[13] = 20'h0e019;
    stim[14] = 20'h77e81;
    stim[15] = 20'hf206c;
    stim[16] = 20'hc11d3;
    stim[17] = 20'h1f51e;
    stim[18] = 20'hb3189;
    stim[19] = 20'h57592;
    stim[20] = 20'hafad4;
    stim[21] = 20'h77630;
    stim[22] = 20'h15c09;
    stim[23] = 20'h363eb;
    stim[24] = 20'haba98;
    stim[25] = 20'h1d69b;
    stim[26] = 20'h819b1;
    stim[27] = 20'h8500c;
    stim[28] = 20'h5bab3;
    stim[29] = 20'h0b59b;
    stim[30] = 20'h256e6;
    stim[31] = 20'h91169;
    stim[32] = 20'h9391a;
    stim[33] = 20'hdc185;
    stim[34] = 20'h3d0ef;
    stim[35] = 20'hcbd2e;
    stim[36] = 20'hd117e;
    stim[37] = 20'hdcb57;
    stim[38] = 20'h8ce08;
    stim[39] = 20'h77362;
    stim[40] = 20'h48e4f;
    stim[41] = 20'he254d;
    stim[42] = 20'h0a72d;
    stim[43] = 20'h86d75;
    stim[44] = 20'h63ada;
    stim[45] = 20'h24cf3;
    stim[46] = 20'h5890f;
    stim[47] = 20'h73f4b;
    stim[48] = 20'h14286;
    stim[49] = 20'h348d4;
    stim[50] = 20'h3cc17;
    stim[51] = 20'ha0d21;
    stim[52] = 20'h1584a;
    stim[53] = 20'haefea;
    stim[54] = 20'h2f396;
    stim[55] = 20'h0f9d7;
    stim[56] = 20'h50a5c;
    stim[57] = 20'h988bb;
    stim[58] = 20'h0994e;
    stim[59] = 20'he03c1;
    stim[60] = 20'h9731f;
    stim[61] = 20'h8d1d5;
    stim[62] = 20'hd23a6;
    stim[63] = 20'h52bf7;
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
      expv[0] = 12'hxxx;
      expv[1] = 12'hxx7;
      expv[2] = 12'hxx7;
      expv[3] = 12'hxx7;
      expv[4] = 12'hxx7;
      expv[5] = 12'hxx7;
      expv[6] = 12'hxx7;
      expv[7] = 12'hxx7;
      expv[8] = 12'hxx7;
      expv[9] = 12'hxx7;
      expv[10] = 12'hxx7;
      expv[11] = 12'hxx7;
      expv[12] = 12'hxx7;
      expv[13] = 12'hxx7;
      expv[14] = 12'hxx7;
      expv[15] = 12'hxx7;
      expv[16] = 12'hxx7;
      expv[17] = 12'hxx7;
      expv[18] = 12'hxx7;
      expv[19] = 12'hxx7;
      expv[20] = 12'hxx7;
      expv[21] = 12'hxx7;
      expv[22] = 12'hxx7;
      expv[23] = 12'hxx7;
      expv[24] = 12'hxx7;
      expv[25] = 12'hxx7;
      expv[26] = 12'hxx7;
      expv[27] = 12'hxx7;
      expv[28] = 12'hxx7;
      expv[29] = 12'hxx7;
      expv[30] = 12'hxx7;
      expv[31] = 12'hxx7;
      expv[32] = 12'hxx7;
      expv[33] = 12'hxx7;
      expv[34] = 12'hxx7;
      expv[35] = 12'hxx7;
      expv[36] = 12'hxx7;
      expv[37] = 12'hxx7;
      expv[38] = 12'hxx7;
      expv[39] = 12'hxx7;
      expv[40] = 12'hxx7;
      expv[41] = 12'hxx7;
      expv[42] = 12'hxx7;
      expv[43] = 12'hxx7;
      expv[44] = 12'hxx7;
      expv[45] = 12'hxx7;
      expv[46] = 12'hxx7;
      expv[47] = 12'hxx7;
      expv[48] = 12'hxx7;
      expv[49] = 12'hxx7;
      expv[50] = 12'hxx7;
      expv[51] = 12'hxx7;
      expv[52] = 12'hxx7;
      expv[53] = 12'hxx7;
      expv[54] = 12'hxx7;
      expv[55] = 12'hxx7;
      expv[56] = 12'hxx7;
      expv[57] = 12'hxx7;
      expv[58] = 12'hxx7;
      expv[59] = 12'hxx7;
      expv[60] = 12'hxx7;
      expv[61] = 12'hxx7;
      expv[62] = 12'hxx7;
      expv[63] = 12'hxx7;
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
