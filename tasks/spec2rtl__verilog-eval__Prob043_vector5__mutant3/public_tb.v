// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 5;
  localparam OW = 25;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .a(in_vec[4:4]),
    .b(in_vec[3:3]),
    .c(in_vec[2:2]),
    .d(in_vec[1:1]),
    .e(in_vec[0:0]),
    .out(out_vec[24:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 5'h19;
    stim[1] = 5'h11;
    stim[2] = 5'h12;
    stim[3] = 5'h10;
    stim[4] = 5'h15;
    stim[5] = 5'h1c;
    stim[6] = 5'h1f;
    stim[7] = 5'h19;
    stim[8] = 5'h0b;
    stim[9] = 5'h00;
    stim[10] = 5'h1c;
    stim[11] = 5'h13;
    stim[12] = 5'h0e;
    stim[13] = 5'h18;
    stim[14] = 5'h1c;
    stim[15] = 5'h1d;
    stim[16] = 5'h11;
    stim[17] = 5'h09;
    stim[18] = 5'h0e;
    stim[19] = 5'h0e;
    stim[20] = 5'h17;
    stim[21] = 5'h17;
    stim[22] = 5'h0a;
    stim[23] = 5'h1b;
    stim[24] = 5'h11;
    stim[25] = 5'h0d;
    stim[26] = 5'h1c;
    stim[27] = 5'h14;
    stim[28] = 5'h1d;
    stim[29] = 5'h16;
    stim[30] = 5'h05;
    stim[31] = 5'h14;
    stim[32] = 5'h03;
    stim[33] = 5'h04;
    stim[34] = 5'h08;
    stim[35] = 5'h04;
    stim[36] = 5'h02;
    stim[37] = 5'h00;
    stim[38] = 5'h0e;
    stim[39] = 5'h05;
    stim[40] = 5'h1a;
    stim[41] = 5'h14;
    stim[42] = 5'h03;
    stim[43] = 5'h1d;
    stim[44] = 5'h13;
    stim[45] = 5'h13;
    stim[46] = 5'h12;
    stim[47] = 5'h1c;
    stim[48] = 5'h15;
    stim[49] = 5'h03;
    stim[50] = 5'h08;
    stim[51] = 5'h14;
    stim[52] = 5'h13;
    stim[53] = 5'h0f;
    stim[54] = 5'h1c;
    stim[55] = 5'h18;
    stim[56] = 5'h17;
    stim[57] = 5'h08;
    stim[58] = 5'h05;
    stim[59] = 5'h04;
    stim[60] = 5'h1e;
    stim[61] = 5'h19;
    stim[62] = 5'h0b;
    stim[63] = 5'h1f;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 25'h1936726;
      expv[1] = 25'h118c62e;
      expv[2] = 25'h12949b2;
      expv[3] = 25'h1084210;
      expv[4] = 25'h15aaaaa;
      expv[5] = 25'h1c18f9c;
      expv[6] = 25'h1f00000;
      expv[7] = 25'h1936726;
      expv[8] = 25'h14a2e94;
      expv[9] = 25'h1f00000;
      expv[10] = 25'h1c18f9c;
      expv[11] = 25'h139cd8c;
      expv[12] = 25'h118c62e;
      expv[13] = 25'h183e318;
      expv[14] = 25'h1c18f9c;
      expv[15] = 25'h1d10ba2;
      expv[16] = 25'h118c62e;
      expv[17] = 25'h16b2536;
      expv[18] = 25'h118c62e;
      expv[19] = 25'h118c62e;
      expv[20] = 25'h17ba108;
      expv[21] = 25'h17ba108;
      expv[22] = 25'h15aaaaa;
      expv[23] = 25'h1b26c84;
      expv[24] = 25'h118c62e;
      expv[25] = 25'h12949b2;
      expv[26] = 25'h1c18f9c;
      expv[27] = 25'h14a2e94;
      expv[28] = 25'h1d10ba2;
      expv[29] = 25'h16b2536;
      expv[30] = 25'h1a2e8ba;
      expv[31] = 25'h14a2e94;
      expv[32] = 25'h1c18f9c;
      expv[33] = 25'h1b26c84;
      expv[34] = 25'h17ba108;
      expv[35] = 25'h1b26c84;
      expv[36] = 25'h1d10ba2;
      expv[37] = 25'h1f00000;
      expv[38] = 25'h118c62e;
      expv[39] = 25'h1a2e8ba;
      expv[40] = 25'h1a2e8ba;
      expv[41] = 25'h14a2e94;
      expv[42] = 25'h1c18f9c;
      expv[43] = 25'h1d10ba2;
      expv[44] = 25'h139cd8c;
      expv[45] = 25'h139cd8c;
      expv[46] = 25'h12949b2;
      expv[47] = 25'h1c18f9c;
      expv[48] = 25'h15aaaaa;
      expv[49] = 25'h1c18f9c;
      expv[50] = 25'h17ba108;
      expv[51] = 25'h14a2e94;
      expv[52] = 25'h139cd8c;
      expv[53] = 25'h1084210;
      expv[54] = 25'h1c18f9c;
      expv[55] = 25'h183e318;
      expv[56] = 25'h17ba108;
      expv[57] = 25'h17ba108;
      expv[58] = 25'h1a2e8ba;
      expv[59] = 25'h1b26c84;
      expv[60] = 25'h1e0843e;
      expv[61] = 25'h1936726;
      expv[62] = 25'h14a2e94;
      expv[63] = 25'h1f00000;
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
