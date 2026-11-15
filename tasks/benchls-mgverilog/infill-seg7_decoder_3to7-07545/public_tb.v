// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 3;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_07545 dut (
    .i(in_vec[2:0]),
    .o1(out_vec[10:10]),
    .o2(out_vec[9:9]),
    .o3(out_vec[8:8]),
    .o4(out_vec[7:7]),
    .o5(out_vec[6:6]),
    .o6(out_vec[5:5]),
    .o7(out_vec[4:4]),
    .an1(out_vec[3:3]),
    .an2(out_vec[2:2]),
    .an3(out_vec[1:1]),
    .an4(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 3'h0;
    stim[1] = 3'h6;
    stim[2] = 3'h4;
    stim[3] = 3'h7;
    stim[4] = 3'h3;
    stim[5] = 3'h4;
    stim[6] = 3'h1;
    stim[7] = 3'h2;
    stim[8] = 3'h7;
    stim[9] = 3'h2;
    stim[10] = 3'h5;
    stim[11] = 3'h1;
    stim[12] = 3'h7;
    stim[13] = 3'h4;
    stim[14] = 3'h2;
    stim[15] = 3'h2;
    stim[16] = 3'h1;
    stim[17] = 3'h7;
    stim[18] = 3'h1;
    stim[19] = 3'h7;
    stim[20] = 3'h1;
    stim[21] = 3'h4;
    stim[22] = 3'h7;
    stim[23] = 3'h1;
    stim[24] = 3'h6;
    stim[25] = 3'h7;
    stim[26] = 3'h5;
    stim[27] = 3'h0;
    stim[28] = 3'h3;
    stim[29] = 3'h0;
    stim[30] = 3'h0;
    stim[31] = 3'h7;
    stim[32] = 3'h4;
    stim[33] = 3'h6;
    stim[34] = 3'h7;
    stim[35] = 3'h5;
    stim[36] = 3'h0;
    stim[37] = 3'h1;
    stim[38] = 3'h3;
    stim[39] = 3'h0;
    stim[40] = 3'h3;
    stim[41] = 3'h7;
    stim[42] = 3'h0;
    stim[43] = 3'h1;
    stim[44] = 3'h3;
    stim[45] = 3'h4;
    stim[46] = 3'h2;
    stim[47] = 3'h7;
    stim[48] = 3'h3;
    stim[49] = 3'h5;
    stim[50] = 3'h5;
    stim[51] = 3'h3;
    stim[52] = 3'h6;
    stim[53] = 3'h0;
    stim[54] = 3'h5;
    stim[55] = 3'h0;
    stim[56] = 3'h6;
    stim[57] = 3'h0;
    stim[58] = 3'h4;
    stim[59] = 3'h0;
    stim[60] = 3'h2;
    stim[61] = 3'h7;
    stim[62] = 3'h1;
    stim[63] = 3'h5;
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
      expv[0] = 11'h010;
      expv[1] = 11'h160;
      expv[2] = 11'h4c0;
      expv[3] = 11'h060;
      expv[4] = 11'h060;
      expv[5] = 11'h4c0;
      expv[6] = 11'h4f0;
      expv[7] = 11'h120;
      expv[8] = 11'h060;
      expv[9] = 11'h120;
      expv[10] = 11'h4e0;
      expv[11] = 11'h4f0;
      expv[12] = 11'h060;
      expv[13] = 11'h4c0;
      expv[14] = 11'h120;
      expv[15] = 11'h120;
      expv[16] = 11'h4f0;
      expv[17] = 11'h060;
      expv[18] = 11'h4f0;
      expv[19] = 11'h060;
      expv[20] = 11'h4f0;
      expv[21] = 11'h4c0;
      expv[22] = 11'h060;
      expv[23] = 11'h4f0;
      expv[24] = 11'h160;
      expv[25] = 11'h060;
      expv[26] = 11'h4e0;
      expv[27] = 11'h010;
      expv[28] = 11'h060;
      expv[29] = 11'h010;
      expv[30] = 11'h010;
      expv[31] = 11'h060;
      expv[32] = 11'h4c0;
      expv[33] = 11'h160;
      expv[34] = 11'h060;
      expv[35] = 11'h4e0;
      expv[36] = 11'h010;
      expv[37] = 11'h4f0;
      expv[38] = 11'h060;
      expv[39] = 11'h010;
      expv[40] = 11'h060;
      expv[41] = 11'h060;
      expv[42] = 11'h010;
      expv[43] = 11'h4f0;
      expv[44] = 11'h060;
      expv[45] = 11'h4c0;
      expv[46] = 11'h120;
      expv[47] = 11'h060;
      expv[48] = 11'h060;
      expv[49] = 11'h4e0;
      expv[50] = 11'h4e0;
      expv[51] = 11'h060;
      expv[52] = 11'h160;
      expv[53] = 11'h010;
      expv[54] = 11'h4e0;
      expv[55] = 11'h010;
      expv[56] = 11'h160;
      expv[57] = 11'h010;
      expv[58] = 11'h4c0;
      expv[59] = 11'h010;
      expv[60] = 11'h120;
      expv[61] = 11'h060;
      expv[62] = 11'h4f0;
      expv[63] = 11'h4e0;
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
