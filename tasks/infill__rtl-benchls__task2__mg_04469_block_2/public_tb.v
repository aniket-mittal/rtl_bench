// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04469 dut (
    .clk(clk),
    .reset_n(in_vec[16:16]),
    .units(in_vec[15:12]),
    .tens(in_vec[11:8]),
    .hundreds(in_vec[7:4]),
    .thousands(in_vec[3:0]),
    .digit_select(out_vec[7:5]),
    .data(out_vec[4:1]),
    .decimal_point(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h0b505;
    stim[1] = 17'h03b79;
    stim[2] = 17'h1a88e;
    stim[3] = 17'h13d24;
    stim[4] = 17'h1d0bb;
    stim[5] = 17'h16c9b;
    stim[6] = 17'h18d62;
    stim[7] = 17'h17179;
    stim[8] = 17'h12f4e;
    stim[9] = 17'h1bf4a;
    stim[10] = 17'h1134a;
    stim[11] = 17'h1bce8;
    stim[12] = 17'h1272a;
    stim[13] = 17'h19493;
    stim[14] = 17'h1d379;
    stim[15] = 17'h1f049;
    stim[16] = 17'h1a53f;
    stim[17] = 17'h144f9;
    stim[18] = 17'h186e4;
    stim[19] = 17'h1d35c;
    stim[20] = 17'h18446;
    stim[21] = 17'h1ab9b;
    stim[22] = 17'h1083b;
    stim[23] = 17'h1225e;
    stim[24] = 17'h14845;
    stim[25] = 17'h110a2;
    stim[26] = 17'h11141;
    stim[27] = 17'h0a937;
    stim[28] = 17'h1508b;
    stim[29] = 17'h1a883;
    stim[30] = 17'h13b5c;
    stim[31] = 17'h1dc6f;
    stim[32] = 17'h1de7b;
    stim[33] = 17'h1fc1e;
    stim[34] = 17'h1332f;
    stim[35] = 17'h118ba;
    stim[36] = 17'h14dd1;
    stim[37] = 17'h1ae1a;
    stim[38] = 17'h135fd;
    stim[39] = 17'h1e9ca;
    stim[40] = 17'h1da95;
    stim[41] = 17'h16cd2;
    stim[42] = 17'h1dcd5;
    stim[43] = 17'h13b5d;
    stim[44] = 17'h1bd2f;
    stim[45] = 17'h1de39;
    stim[46] = 17'h18109;
    stim[47] = 17'h12c13;
    stim[48] = 17'h187a3;
    stim[49] = 17'h12854;
    stim[50] = 17'h146b7;
    stim[51] = 17'h1693d;
    stim[52] = 17'h1e46d;
    stim[53] = 17'h1ffca;
    stim[54] = 17'h1c922;
    stim[55] = 17'h16b8c;
    stim[56] = 17'h14ec8;
    stim[57] = 17'h17bf6;
    stim[58] = 17'h17439;
    stim[59] = 17'h1daae;
    stim[60] = 17'h1288a;
    stim[61] = 17'h1adc6;
    stim[62] = 17'h11e4d;
    stim[63] = 17'h1fb3f;
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
      expv[0] = 8'h17;
      expv[1] = 8'h07;
      expv[2] = 8'h15;
      expv[3] = 8'h3b;
      expv[4] = 8'h77;
      expv[5] = 8'h96;
      expv[6] = 8'h11;
      expv[7] = 8'h23;
      expv[8] = 8'h69;
      expv[9] = 8'h94;
      expv[10] = 8'h03;
      expv[11] = 8'h39;
      expv[12] = 8'h65;
      expv[13] = 8'h86;
      expv[14] = 8'h1b;
      expv[15] = 8'h21;
      expv[16] = 8'h67;
      expv[17] = 8'h92;
      expv[18] = 8'h11;
      expv[19] = 8'h27;
      expv[20] = 8'h69;
      expv[21] = 8'h96;
      expv[22] = 8'h01;
      expv[23] = 8'h25;
      expv[24] = 8'h69;
      expv[25] = 8'h84;
      expv[26] = 8'h03;
      expv[27] = 8'h15;
      expv[28] = 8'h0b;
      expv[29] = 8'h31;
      expv[30] = 8'h6b;
      expv[31] = 8'h9e;
      expv[32] = 8'h1b;
      expv[33] = 8'h39;
      expv[34] = 8'h65;
      expv[35] = 8'h94;
      expv[36] = 8'h09;
      expv[37] = 8'h3d;
      expv[38] = 8'h7f;
      expv[39] = 8'h94;
      expv[40] = 8'h1b;
      expv[41] = 8'h39;
      expv[42] = 8'h7b;
      expv[43] = 8'h9a;
      expv[44] = 8'h17;
      expv[45] = 8'h3d;
      expv[46] = 8'h61;
      expv[47] = 8'h86;
      expv[48] = 8'h11;
      expv[49] = 8'h31;
      expv[50] = 8'h77;
      expv[51] = 8'h9a;
      expv[52] = 8'h1d;
      expv[53] = 8'h3f;
      expv[54] = 8'h65;
      expv[55] = 8'h98;
      expv[56] = 8'h09;
      expv[57] = 8'h37;
      expv[58] = 8'h67;
      expv[59] = 8'h9c;
      expv[60] = 8'h05;
      expv[61] = 8'h3b;
      expv[62] = 8'h69;
      expv[63] = 8'h9e;
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
