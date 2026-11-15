// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 13;
  localparam OW = 3;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_05208 dut (
    .clk(clk),
    .reset_b(in_vec[12:12]),
    .dac_par_in(in_vec[11:0]),
    .dac_cs(out_vec[2:2]),
    .dac_sclk(out_vec[1:1]),
    .dac_mosi(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 13'h0e72;
    stim[1] = 13'h0e13;
    stim[2] = 13'h18e0;
    stim[3] = 13'h14f5;
    stim[4] = 13'h16df;
    stim[5] = 13'h1e6f;
    stim[6] = 13'h13cb;
    stim[7] = 13'h028a;
    stim[8] = 13'h1029;
    stim[9] = 13'h1429;
    stim[10] = 13'h194f;
    stim[11] = 13'h1018;
    stim[12] = 13'h15e0;
    stim[13] = 13'h1912;
    stim[14] = 13'h1fb0;
    stim[15] = 13'h1565;
    stim[16] = 13'h183f;
    stim[17] = 13'h1113;
    stim[18] = 13'h19b8;
    stim[19] = 13'h0b12;
    stim[20] = 13'h18d9;
    stim[21] = 13'h0daa;
    stim[22] = 13'h1ef6;
    stim[23] = 13'h197e;
    stim[24] = 13'h1ac8;
    stim[25] = 13'h1c84;
    stim[26] = 13'h168c;
    stim[27] = 13'h1eb4;
    stim[28] = 13'h1a43;
    stim[29] = 13'h1b2a;
    stim[30] = 13'h17fc;
    stim[31] = 13'h1f11;
    stim[32] = 13'h1707;
    stim[33] = 13'h17bb;
    stim[34] = 13'h1c62;
    stim[35] = 13'h1529;
    stim[36] = 13'h1a57;
    stim[37] = 13'h0b60;
    stim[38] = 13'h17c7;
    stim[39] = 13'h166e;
    stim[40] = 13'h1bad;
    stim[41] = 13'h1fae;
    stim[42] = 13'h100f;
    stim[43] = 13'h10a9;
    stim[44] = 13'h1ddf;
    stim[45] = 13'h1696;
    stim[46] = 13'h1280;
    stim[47] = 13'h11ba;
    stim[48] = 13'h1489;
    stim[49] = 13'h1c4e;
    stim[50] = 13'h1cfe;
    stim[51] = 13'h19ad;
    stim[52] = 13'h194a;
    stim[53] = 13'h15f9;
    stim[54] = 13'h1519;
    stim[55] = 13'h127f;
    stim[56] = 13'h17fd;
    stim[57] = 13'h1b93;
    stim[58] = 13'h1475;
    stim[59] = 13'h1876;
    stim[60] = 13'h1c67;
    stim[61] = 13'h111b;
    stim[62] = 13'h17f1;
    stim[63] = 13'h1246;
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
      expv[0] = 3'hx;
      expv[1] = 3'hx;
      expv[2] = 3'hx;
      expv[3] = 3'hx;
      expv[4] = 3'hx;
      expv[5] = 3'hx;
      expv[6] = 3'hx;
      expv[7] = 3'hx;
      expv[8] = 3'hx;
      expv[9] = 3'hx;
      expv[10] = 3'hx;
      expv[11] = 3'h6;
      expv[12] = 3'h2;
      expv[13] = 3'h2;
      expv[14] = 3'h2;
      expv[15] = 3'h2;
      expv[16] = 3'h2;
      expv[17] = 3'h2;
      expv[18] = 3'h2;
      expv[19] = 3'h2;
      expv[20] = 3'h0;
      expv[21] = 3'h0;
      expv[22] = 3'h0;
      expv[23] = 3'h0;
      expv[24] = 3'h2;
      expv[25] = 3'h2;
      expv[26] = 3'h2;
      expv[27] = 3'h2;
      expv[28] = 3'h2;
      expv[29] = 3'h2;
      expv[30] = 3'h2;
      expv[31] = 3'h2;
      expv[32] = 3'h2;
      expv[33] = 3'h2;
      expv[34] = 3'h2;
      expv[35] = 3'h2;
      expv[36] = 3'h2;
      expv[37] = 3'h2;
      expv[38] = 3'h0;
      expv[39] = 3'h0;
      expv[40] = 3'h2;
      expv[41] = 3'h2;
      expv[42] = 3'h2;
      expv[43] = 3'h2;
      expv[44] = 3'h2;
      expv[45] = 3'h2;
      expv[46] = 3'h2;
      expv[47] = 3'h2;
      expv[48] = 3'h2;
      expv[49] = 3'h2;
      expv[50] = 3'h2;
      expv[51] = 3'h2;
      expv[52] = 3'h2;
      expv[53] = 3'h2;
      expv[54] = 3'h2;
      expv[55] = 3'h2;
      expv[56] = 3'h2;
      expv[57] = 3'h2;
      expv[58] = 3'h2;
      expv[59] = 3'h2;
      expv[60] = 3'h2;
      expv[61] = 3'h2;
      expv[62] = 3'h2;
      expv[63] = 3'h2;
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
