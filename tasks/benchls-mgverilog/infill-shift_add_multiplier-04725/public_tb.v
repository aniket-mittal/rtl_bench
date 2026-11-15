// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 19;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04725 dut (
    .clock(clk),
    .reset(in_vec[18:18]),
    .multiplicand(in_vec[17:10]),
    .multiplier(in_vec[9:2]),
    .Load_regs(in_vec[1:1]),
    .Add_dec(in_vec[0:0]),
    .PR(out_vec[16:1]),
    .Zero(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 19'h4a24b;
    stim[1] = 19'h41fc2;
    stim[2] = 19'h17bdc;
    stim[3] = 19'h04b32;
    stim[4] = 19'h1be01;
    stim[5] = 19'h1c2ac;
    stim[6] = 19'h15ac5;
    stim[7] = 19'h1c87a;
    stim[8] = 19'h1a49a;
    stim[9] = 19'h007a2;
    stim[10] = 19'h2d802;
    stim[11] = 19'h109ec;
    stim[12] = 19'h1968f;
    stim[13] = 19'h37851;
    stim[14] = 19'h36aa0;
    stim[15] = 19'h2d4df;
    stim[16] = 19'h0994e;
    stim[17] = 19'h2a8a8;
    stim[18] = 19'h0e572;
    stim[19] = 19'h228a5;
    stim[20] = 19'h1baf6;
    stim[21] = 19'h33779;
    stim[22] = 19'h36748;
    stim[23] = 19'h0bd22;
    stim[24] = 19'h09bbd;
    stim[25] = 19'h3468f;
    stim[26] = 19'h3f888;
    stim[27] = 19'h2dbbe;
    stim[28] = 19'h3b2d4;
    stim[29] = 19'h0c1dd;
    stim[30] = 19'h01a36;
    stim[31] = 19'h26499;
    stim[32] = 19'h0214b;
    stim[33] = 19'h1b292;
    stim[34] = 19'h36363;
    stim[35] = 19'h18a03;
    stim[36] = 19'h3936b;
    stim[37] = 19'h23eaa;
    stim[38] = 19'h2fad8;
    stim[39] = 19'h3f3f4;
    stim[40] = 19'h1694a;
    stim[41] = 19'h2c77f;
    stim[42] = 19'h29d1b;
    stim[43] = 19'h264d5;
    stim[44] = 19'h35550;
    stim[45] = 19'h35f57;
    stim[46] = 19'h325ae;
    stim[47] = 19'h1078a;
    stim[48] = 19'h24ba8;
    stim[49] = 19'h2313b;
    stim[50] = 19'h46bf2;
    stim[51] = 19'h3c2a8;
    stim[52] = 19'h0ed1b;
    stim[53] = 19'h0753d;
    stim[54] = 19'h2bf70;
    stim[55] = 19'h3a708;
    stim[56] = 19'h10004;
    stim[57] = 19'h3c3e0;
    stim[58] = 19'h1788b;
    stim[59] = 19'h117fe;
    stim[60] = 19'h0edba;
    stim[61] = 19'h284ed;
    stim[62] = 19'h2353f;
    stim[63] = 19'h2c03b;
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
      expv[0] = 17'h00001;
      expv[1] = 17'h00001;
      expv[2] = 17'h00001;
      expv[3] = 17'h00001;
      expv[4] = 17'h00000;
      expv[5] = 17'h00024;
      expv[6] = 17'h00024;
      expv[7] = 17'h00048;
      expv[8] = 17'h00000;
      expv[9] = 17'h00000;
      expv[10] = 17'h00000;
      expv[11] = 17'h00001;
      expv[12] = 17'h00001;
      expv[13] = 17'h00000;
      expv[14] = 17'h000ca;
      expv[15] = 17'h000ca;
      expv[16] = 17'h00000;
      expv[17] = 17'h00000;
      expv[18] = 17'h00000;
      expv[19] = 17'h00000;
      expv[20] = 17'h00072;
      expv[21] = 17'h00000;
      expv[22] = 17'h000dc;
      expv[23] = 17'h000dc;
      expv[24] = 17'h00000;
      expv[25] = 17'h0005e;
      expv[26] = 17'h00000;
      expv[27] = 17'h00000;
      expv[28] = 17'h00000;
      expv[29] = 17'h00000;
      expv[30] = 17'h0016c;
      expv[31] = 17'h00000;
      expv[32] = 17'h0000c;
      expv[33] = 17'h00000;
      expv[34] = 17'h00000;
      expv[35] = 17'h00000;
      expv[36] = 17'h00000;
      expv[37] = 17'h00000;
      expv[38] = 17'h00000;
      expv[39] = 17'h00000;
      expv[40] = 17'h00000;
      expv[41] = 17'h00000;
      expv[42] = 17'h00000;
      expv[43] = 17'h00000;
      expv[44] = 17'h0014e;
      expv[45] = 17'h0014e;
      expv[46] = 17'h00000;
      expv[47] = 17'h00000;
      expv[48] = 17'h00000;
      expv[49] = 17'h00000;
      expv[50] = 17'h00001;
      expv[51] = 17'h00001;
      expv[52] = 17'h00001;
      expv[53] = 17'h00000;
      expv[54] = 17'h00076;
      expv[55] = 17'h00076;
      expv[56] = 17'h00076;
      expv[57] = 17'h00076;
      expv[58] = 17'h00076;
      expv[59] = 17'h00000;
      expv[60] = 17'h00000;
      expv[61] = 17'h00000;
      expv[62] = 17'h00076;
      expv[63] = 17'h00000;
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
