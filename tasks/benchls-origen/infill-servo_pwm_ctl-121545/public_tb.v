// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 18;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_121545 dut (
    .clk(clk),
    .resetn(in_vec[17:17]),
    .position(in_vec[16:9]),
    .trim(in_vec[8:1]),
    .enable(in_vec[0:0]),
    .servo_ctl(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 18'h1bafe;
    stim[1] = 18'h024bd;
    stim[2] = 18'h356f3;
    stim[3] = 18'h3e3a5;
    stim[4] = 18'h2f099;
    stim[5] = 18'h347e3;
    stim[6] = 18'h2c4ff;
    stim[7] = 18'h26154;
    stim[8] = 18'h201d7;
    stim[9] = 18'h2966c;
    stim[10] = 18'h3f9b9;
    stim[11] = 18'h23abf;
    stim[12] = 18'h3ec14;
    stim[13] = 18'h2ab56;
    stim[14] = 18'h3ab1e;
    stim[15] = 18'h3c8fd;
    stim[16] = 18'h2433a;
    stim[17] = 18'h2aae2;
    stim[18] = 18'h23332;
    stim[19] = 18'h37eaf;
    stim[20] = 18'h2a997;
    stim[21] = 18'h203c2;
    stim[22] = 18'h2ac57;
    stim[23] = 18'h2d523;
    stim[24] = 18'h3b67a;
    stim[25] = 18'h2bfe6;
    stim[26] = 18'h3ee30;
    stim[27] = 18'h2cd7c;
    stim[28] = 18'h37d07;
    stim[29] = 18'h2ef44;
    stim[30] = 18'h37f36;
    stim[31] = 18'h2eacd;
    stim[32] = 18'h3c047;
    stim[33] = 18'h38577;
    stim[34] = 18'h26f57;
    stim[35] = 18'h2307d;
    stim[36] = 18'h3d3a4;
    stim[37] = 18'h27886;
    stim[38] = 18'h3b4fd;
    stim[39] = 18'h2d5f4;
    stim[40] = 18'h362ec;
    stim[41] = 18'h3e431;
    stim[42] = 18'h3e629;
    stim[43] = 18'h26707;
    stim[44] = 18'h27788;
    stim[45] = 18'h3f58a;
    stim[46] = 18'h3b97e;
    stim[47] = 18'h3388e;
    stim[48] = 18'h2d41d;
    stim[49] = 18'h384d2;
    stim[50] = 18'h3cc53;
    stim[51] = 18'h3b5f5;
    stim[52] = 18'h06ed7;
    stim[53] = 18'h2c0ba;
    stim[54] = 18'h3388d;
    stim[55] = 18'h22c55;
    stim[56] = 18'h2120d;
    stim[57] = 18'h24746;
    stim[58] = 18'h2c53b;
    stim[59] = 18'h2f560;
    stim[60] = 18'h3aef3;
    stim[61] = 18'h3eded;
    stim[62] = 18'h213d6;
    stim[63] = 18'h2147b;
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
      expv[0] = 1'h0;
      expv[1] = 1'h0;
      expv[2] = 1'h0;
      expv[3] = 1'h1;
      expv[4] = 1'h1;
      expv[5] = 1'h1;
      expv[6] = 1'h1;
      expv[7] = 1'h1;
      expv[8] = 1'h0;
      expv[9] = 1'h1;
      expv[10] = 1'h0;
      expv[11] = 1'h1;
      expv[12] = 1'h1;
      expv[13] = 1'h0;
      expv[14] = 1'h0;
      expv[15] = 1'h0;
      expv[16] = 1'h1;
      expv[17] = 1'h0;
      expv[18] = 1'h0;
      expv[19] = 1'h0;
      expv[20] = 1'h1;
      expv[21] = 1'h1;
      expv[22] = 1'h0;
      expv[23] = 1'h1;
      expv[24] = 1'h1;
      expv[25] = 1'h0;
      expv[26] = 1'h0;
      expv[27] = 1'h0;
      expv[28] = 1'h0;
      expv[29] = 1'h1;
      expv[30] = 1'h0;
      expv[31] = 1'h0;
      expv[32] = 1'h1;
      expv[33] = 1'h1;
      expv[34] = 1'h1;
      expv[35] = 1'h1;
      expv[36] = 1'h1;
      expv[37] = 1'h0;
      expv[38] = 1'h0;
      expv[39] = 1'h1;
      expv[40] = 1'h0;
      expv[41] = 1'h0;
      expv[42] = 1'h1;
      expv[43] = 1'h1;
      expv[44] = 1'h1;
      expv[45] = 1'h0;
      expv[46] = 1'h0;
      expv[47] = 1'h0;
      expv[48] = 1'h0;
      expv[49] = 1'h1;
      expv[50] = 1'h0;
      expv[51] = 1'h1;
      expv[52] = 1'h0;
      expv[53] = 1'h0;
      expv[54] = 1'h0;
      expv[55] = 1'h1;
      expv[56] = 1'h1;
      expv[57] = 1'h1;
      expv[58] = 1'h0;
      expv[59] = 1'h1;
      expv[60] = 1'h0;
      expv[61] = 1'h1;
      expv[62] = 1'h1;
      expv[63] = 1'h0;
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
