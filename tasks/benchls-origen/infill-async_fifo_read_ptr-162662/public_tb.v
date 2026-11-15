// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 6;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_162662 dut (
    .rclk(clk),
    .rwptr2(in_vec[5:2]),
    .rinc(in_vec[1:1]),
    .rrst(in_vec[0:0]),
    .raddr(out_vec[8:5]),
    .rptr(out_vec[4:1]),
    .rempty(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 6'h2b;
    stim[1] = 6'h0f;
    stim[2] = 6'h0c;
    stim[3] = 6'h30;
    stim[4] = 6'h05;
    stim[5] = 6'h38;
    stim[6] = 6'h10;
    stim[7] = 6'h22;
    stim[8] = 6'h1e;
    stim[9] = 6'h26;
    stim[10] = 6'h00;
    stim[11] = 6'h16;
    stim[12] = 6'h14;
    stim[13] = 6'h2a;
    stim[14] = 6'h14;
    stim[15] = 6'h1e;
    stim[16] = 6'h14;
    stim[17] = 6'h2e;
    stim[18] = 6'h16;
    stim[19] = 6'h26;
    stim[20] = 6'h12;
    stim[21] = 6'h1e;
    stim[22] = 6'h10;
    stim[23] = 6'h1c;
    stim[24] = 6'h28;
    stim[25] = 6'h22;
    stim[26] = 6'h2c;
    stim[27] = 6'h06;
    stim[28] = 6'h0c;
    stim[29] = 6'h28;
    stim[30] = 6'h16;
    stim[31] = 6'h34;
    stim[32] = 6'h25;
    stim[33] = 6'h04;
    stim[34] = 6'h22;
    stim[35] = 6'h0d;
    stim[36] = 6'h2a;
    stim[37] = 6'h13;
    stim[38] = 6'h32;
    stim[39] = 6'h28;
    stim[40] = 6'h12;
    stim[41] = 6'h38;
    stim[42] = 6'h00;
    stim[43] = 6'h38;
    stim[44] = 6'h16;
    stim[45] = 6'h1c;
    stim[46] = 6'h37;
    stim[47] = 6'h24;
    stim[48] = 6'h30;
    stim[49] = 6'h08;
    stim[50] = 6'h12;
    stim[51] = 6'h2e;
    stim[52] = 6'h38;
    stim[53] = 6'h00;
    stim[54] = 6'h12;
    stim[55] = 6'h3c;
    stim[56] = 6'h3e;
    stim[57] = 6'h00;
    stim[58] = 6'h16;
    stim[59] = 6'h3a;
    stim[60] = 6'h1c;
    stim[61] = 6'h24;
    stim[62] = 6'h08;
    stim[63] = 6'h0e;
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
      expv[0] = 9'h001;
      expv[1] = 9'h001;
      expv[2] = 9'h001;
      expv[3] = 9'h000;
      expv[4] = 9'h001;
      expv[5] = 9'h001;
      expv[6] = 9'h000;
      expv[7] = 9'h000;
      expv[8] = 9'h024;
      expv[9] = 9'h048;
      expv[10] = 9'h06c;
      expv[11] = 9'h066;
      expv[12] = 9'h092;
      expv[13] = 9'h088;
      expv[14] = 9'h0b6;
      expv[15] = 9'h0ab;
      expv[16] = 9'h0aa;
      expv[17] = 9'h0ab;
      expv[18] = 9'h0aa;
      expv[19] = 9'h0da;
      expv[20] = 9'h0fe;
      expv[21] = 9'h102;
      expv[22] = 9'h126;
      expv[23] = 9'h132;
      expv[24] = 9'h132;
      expv[25] = 9'h132;
      expv[26] = 9'h14a;
      expv[27] = 9'h154;
      expv[28] = 9'h16e;
      expv[29] = 9'h176;
      expv[30] = 9'h176;
      expv[31] = 9'h190;
      expv[32] = 9'h001;
      expv[33] = 9'h001;
      expv[34] = 9'h000;
      expv[35] = 9'h001;
      expv[36] = 9'h001;
      expv[37] = 9'h001;
      expv[38] = 9'h001;
      expv[39] = 9'h000;
      expv[40] = 9'h000;
      expv[41] = 9'h024;
      expv[42] = 9'h022;
      expv[43] = 9'h022;
      expv[44] = 9'h022;
      expv[45] = 9'h048;
      expv[46] = 9'h001;
      expv[47] = 9'h001;
      expv[48] = 9'h000;
      expv[49] = 9'h000;
      expv[50] = 9'h000;
      expv[51] = 9'h024;
      expv[52] = 9'h048;
      expv[53] = 9'h044;
      expv[54] = 9'h044;
      expv[55] = 9'h06c;
      expv[56] = 9'h066;
      expv[57] = 9'h092;
      expv[58] = 9'h088;
      expv[59] = 9'h0b6;
      expv[60] = 9'h0da;
      expv[61] = 9'h0cc;
      expv[62] = 9'h0cc;
      expv[63] = 9'h0cc;
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
