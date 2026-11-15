// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 5;
  localparam OW = 48;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_176761 dut (
    .clk(clk),
    .ingplaca(in_vec[4:4]),
    .teclado(in_vec[3:0]),
    .placa(out_vec[47:24]),
    .placafake(out_vec[23:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 5'h0b;
    stim[1] = 5'h1f;
    stim[2] = 5'h08;
    stim[3] = 5'h13;
    stim[4] = 5'h1c;
    stim[5] = 5'h06;
    stim[6] = 5'h19;
    stim[7] = 5'h08;
    stim[8] = 5'h1e;
    stim[9] = 5'h02;
    stim[10] = 5'h1b;
    stim[11] = 5'h02;
    stim[12] = 5'h02;
    stim[13] = 5'h09;
    stim[14] = 5'h04;
    stim[15] = 5'h02;
    stim[16] = 5'h09;
    stim[17] = 5'h1d;
    stim[18] = 5'h05;
    stim[19] = 5'h14;
    stim[20] = 5'h0b;
    stim[21] = 5'h04;
    stim[22] = 5'h02;
    stim[23] = 5'h13;
    stim[24] = 5'h0a;
    stim[25] = 5'h0d;
    stim[26] = 5'h04;
    stim[27] = 5'h10;
    stim[28] = 5'h1a;
    stim[29] = 5'h14;
    stim[30] = 5'h0a;
    stim[31] = 5'h08;
    stim[32] = 5'h03;
    stim[33] = 5'h10;
    stim[34] = 5'h0a;
    stim[35] = 5'h10;
    stim[36] = 5'h02;
    stim[37] = 5'h18;
    stim[38] = 5'h1c;
    stim[39] = 5'h14;
    stim[40] = 5'h19;
    stim[41] = 5'h04;
    stim[42] = 5'h1c;
    stim[43] = 5'h13;
    stim[44] = 5'h16;
    stim[45] = 5'h0b;
    stim[46] = 5'h0c;
    stim[47] = 5'h19;
    stim[48] = 5'h04;
    stim[49] = 5'h1e;
    stim[50] = 5'h17;
    stim[51] = 5'h0e;
    stim[52] = 5'h07;
    stim[53] = 5'h1f;
    stim[54] = 5'h16;
    stim[55] = 5'h1b;
    stim[56] = 5'h13;
    stim[57] = 5'h07;
    stim[58] = 5'h12;
    stim[59] = 5'h1f;
    stim[60] = 5'h06;
    stim[61] = 5'h09;
    stim[62] = 5'h02;
    stim[63] = 5'h1f;
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
      expv[0] = 48'hxxxxxxxxxxxx;
      expv[1] = 48'h000000000000;
      expv[2] = 48'h000000f00000;
      expv[3] = 48'h000000000000;
      expv[4] = 48'h000000300000;
      expv[5] = 48'h0000003c0000;
      expv[6] = 48'h000000000000;
      expv[7] = 48'h000000900000;
      expv[8] = 48'h000000000000;
      expv[9] = 48'h000000e00000;
      expv[10] = 48'h000000000000;
      expv[11] = 48'h000000b00000;
      expv[12] = 48'h000000000000;
      expv[13] = 48'h000000000000;
      expv[14] = 48'h000000000000;
      expv[15] = 48'h000000000000;
      expv[16] = 48'h000000000000;
      expv[17] = 48'h000000000000;
      expv[18] = 48'h000000d00000;
      expv[19] = 48'h000000000000;
      expv[20] = 48'h000000400000;
      expv[21] = 48'h000000000000;
      expv[22] = 48'h000000000000;
      expv[23] = 48'h000000000000;
      expv[24] = 48'h000000300000;
      expv[25] = 48'h000000000000;
      expv[26] = 48'h000000000000;
      expv[27] = 48'h000000000000;
      expv[28] = 48'h000000000000;
      expv[29] = 48'h000000a00000;
      expv[30] = 48'h000000a40000;
      expv[31] = 48'h000000000000;
      expv[32] = 48'h000000000000;
      expv[33] = 48'h000000000000;
      expv[34] = 48'h000000000000;
      expv[35] = 48'h000000000000;
      expv[36] = 48'h000000000000;
      expv[37] = 48'h000000000000;
      expv[38] = 48'h000000800000;
      expv[39] = 48'h0000008c0000;
      expv[40] = 48'h0000008c4000;
      expv[41] = 48'h0000008c4900;
      expv[42] = 48'h000000000000;
      expv[43] = 48'h000000c00000;
      expv[44] = 48'h000000c30000;
      expv[45] = 48'h000000c36000;
      expv[46] = 48'h000000000000;
      expv[47] = 48'h000000000000;
      expv[48] = 48'h000000900000;
      expv[49] = 48'h000000000000;
      expv[50] = 48'h000000e00000;
      expv[51] = 48'h000000e70000;
      expv[52] = 48'h000000000000;
      expv[53] = 48'h000000000000;
      expv[54] = 48'h000000f00000;
      expv[55] = 48'h000000f60000;
      expv[56] = 48'h000000f6b000;
      expv[57] = 48'h000000f6b300;
      expv[58] = 48'h000000000000;
      expv[59] = 48'h000000200000;
      expv[60] = 48'h0000002f0000;
      expv[61] = 48'h000000000000;
      expv[62] = 48'h000000000000;
      expv[63] = 48'h000000000000;
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
