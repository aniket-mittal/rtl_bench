// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 19;
  localparam OW = 6;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_018436 dut (
    .i_clock(clk),
    .i_reset(in_vec[18:18]),
    .i_enable(in_vec[17:17]),
    .i_debug_pulse(in_vec[16:13]),
    .i_ndata(in_vec[12:5]),
    .i_nidle(in_vec[4:0]),
    .o_start_flag(out_vec[5:5]),
    .o_actual_state(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 19'h74af1;
    stim[1] = 19'h5929e;
    stim[2] = 19'h2d72e;
    stim[3] = 19'h2fcdd;
    stim[4] = 19'h01804;
    stim[5] = 19'h3607b;
    stim[6] = 19'h0c853;
    stim[7] = 19'h3c980;
    stim[8] = 19'h1d3f8;
    stim[9] = 19'h215e8;
    stim[10] = 19'h11a41;
    stim[11] = 19'h15f5c;
    stim[12] = 19'h30bba;
    stim[13] = 19'h1f188;
    stim[14] = 19'h3beef;
    stim[15] = 19'h27185;
    stim[16] = 19'h2a544;
    stim[17] = 19'h14641;
    stim[18] = 19'h2737c;
    stim[19] = 19'h17120;
    stim[20] = 19'h3f593;
    stim[21] = 19'h0e817;
    stim[22] = 19'h3e85b;
    stim[23] = 19'h2400f;
    stim[24] = 19'h35191;
    stim[25] = 19'h165c6;
    stim[26] = 19'h72b96;
    stim[27] = 19'h01181;
    stim[28] = 19'h05626;
    stim[29] = 19'h005e0;
    stim[30] = 19'h0fe4c;
    stim[31] = 19'h05e97;
    stim[32] = 19'h1aee2;
    stim[33] = 19'h1e9f5;
    stim[34] = 19'h214ee;
    stim[35] = 19'h0e913;
    stim[36] = 19'h1c812;
    stim[37] = 19'h23236;
    stim[38] = 19'h3cd45;
    stim[39] = 19'h20512;
    stim[40] = 19'h1b0b3;
    stim[41] = 19'h06f33;
    stim[42] = 19'h3d092;
    stim[43] = 19'h2229e;
    stim[44] = 19'h0eaca;
    stim[45] = 19'h0e054;
    stim[46] = 19'h36d15;
    stim[47] = 19'h440ea;
    stim[48] = 19'h3dc51;
    stim[49] = 19'h178db;
    stim[50] = 19'h18836;
    stim[51] = 19'h38952;
    stim[52] = 19'h0be9c;
    stim[53] = 19'h1402c;
    stim[54] = 19'h3bdf4;
    stim[55] = 19'h0d632;
    stim[56] = 19'h1e597;
    stim[57] = 19'h11fbb;
    stim[58] = 19'h16d0e;
    stim[59] = 19'h3cd4c;
    stim[60] = 19'h0cf34;
    stim[61] = 19'h3b452;
    stim[62] = 19'h37414;
    stim[63] = 19'h16ffd;
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
      expv[0] = 6'hxx;
      expv[1] = 6'hxx;
      expv[2] = 6'hxx;
      expv[3] = 6'h01;
      expv[4] = 6'h01;
      expv[5] = 6'h01;
      expv[6] = 6'h01;
      expv[7] = 6'h01;
      expv[8] = 6'h01;
      expv[9] = 6'h01;
      expv[10] = 6'h02;
      expv[11] = 6'h02;
      expv[12] = 6'h02;
      expv[13] = 6'h02;
      expv[14] = 6'h02;
      expv[15] = 6'h02;
      expv[16] = 6'h02;
      expv[17] = 6'h02;
      expv[18] = 6'h02;
      expv[19] = 6'h02;
      expv[20] = 6'h02;
      expv[21] = 6'h08;
      expv[22] = 6'h08;
      expv[23] = 6'h08;
      expv[24] = 6'h02;
      expv[25] = 6'h02;
      expv[26] = 6'h02;
      expv[27] = 6'h02;
      expv[28] = 6'h02;
      expv[29] = 6'h02;
      expv[30] = 6'h02;
      expv[31] = 6'h02;
      expv[32] = 6'h02;
      expv[33] = 6'h02;
      expv[34] = 6'h02;
      expv[35] = 6'h01;
      expv[36] = 6'h01;
      expv[37] = 6'h01;
      expv[38] = 6'h10;
      expv[39] = 6'h10;
      expv[40] = 6'h02;
      expv[41] = 6'h02;
      expv[42] = 6'h02;
      expv[43] = 6'h02;
      expv[44] = 6'h10;
      expv[45] = 6'h10;
      expv[46] = 6'h10;
      expv[47] = 6'h10;
      expv[48] = 6'h10;
      expv[49] = 6'h01;
      expv[50] = 6'h01;
      expv[51] = 6'h01;
      expv[52] = 6'h01;
      expv[53] = 6'h01;
      expv[54] = 6'h01;
      expv[55] = 6'h01;
      expv[56] = 6'h01;
      expv[57] = 6'h01;
      expv[58] = 6'h01;
      expv[59] = 6'h01;
      expv[60] = 6'h01;
      expv[61] = 6'h01;
      expv[62] = 6'h01;
      expv[63] = 6'h01;
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
