// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 22;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_06031 dut (
    .clk(clk),
    .address(in_vec[21:19]),
    .chipselect(in_vec[18:18]),
    .reset_n(in_vec[17:17]),
    .write_n(in_vec[16:16]),
    .writedata(in_vec[15:0]),
    .irq(out_vec[16:16]),
    .readdata(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 22'h2c7168;
    stim[1] = 22'h3cd2d5;
    stim[2] = 22'h264816;
    stim[3] = 22'h0684f2;
    stim[4] = 22'h3f3091;
    stim[5] = 22'h2b4ede;
    stim[6] = 22'h3fcbaa;
    stim[7] = 22'h0ea92d;
    stim[8] = 22'h3bd293;
    stim[9] = 22'h1734f4;
    stim[10] = 22'h2399a7;
    stim[11] = 22'h2a9321;
    stim[12] = 22'h1657ec;
    stim[13] = 22'h0aba8c;
    stim[14] = 22'h1eb556;
    stim[15] = 22'h3bbe3f;
    stim[16] = 22'h272e96;
    stim[17] = 22'h2ee4c4;
    stim[18] = 22'h0a283e;
    stim[19] = 22'h3fbe40;
    stim[20] = 22'h0b8930;
    stim[21] = 22'h3a6130;
    stim[22] = 22'h369048;
    stim[23] = 22'h07931c;
    stim[24] = 22'h0a4ab5;
    stim[25] = 22'h17044d;
    stim[26] = 22'h07e08c;
    stim[27] = 22'h0f3a4c;
    stim[28] = 22'h27744d;
    stim[29] = 22'h3a0563;
    stim[30] = 22'h0f3abb;
    stim[31] = 22'h26ac2e;
    stim[32] = 22'h37164f;
    stim[33] = 22'h3e19d7;
    stim[34] = 22'h2f6ada;
    stim[35] = 22'h27bc0a;
    stim[36] = 22'h1ef8fb;
    stim[37] = 22'h0bb01d;
    stim[38] = 22'h1ee03f;
    stim[39] = 22'h0bbfa0;
    stim[40] = 22'h0e53d3;
    stim[41] = 22'h32beaa;
    stim[42] = 22'h234b05;
    stim[43] = 22'h3a0a8d;
    stim[44] = 22'h07355c;
    stim[45] = 22'h1f78a7;
    stim[46] = 22'h0f44f0;
    stim[47] = 22'h2aba79;
    stim[48] = 22'h121d04;
    stim[49] = 22'h0e23f9;
    stim[50] = 22'h0634fe;
    stim[51] = 22'h035fc8;
    stim[52] = 22'h026d36;
    stim[53] = 22'h0f5bd1;
    stim[54] = 22'h0f6ff4;
    stim[55] = 22'h26ca49;
    stim[56] = 22'h33f073;
    stim[57] = 22'h2b137d;
    stim[58] = 22'h3ac6f6;
    stim[59] = 22'h3e5839;
    stim[60] = 22'h3aba69;
    stim[61] = 22'h2a6ea0;
    stim[62] = 22'h1207b8;
    stim[63] = 22'h0adf21;
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
      expv[0] = 17'h00000;
      expv[1] = 17'h00000;
      expv[2] = 17'h00000;
      expv[3] = 17'h00000;
      expv[4] = 17'h00000;
      expv[5] = 17'h00000;
      expv[6] = 17'h00000;
      expv[7] = 17'h00000;
      expv[8] = 17'h00000;
      expv[9] = 17'h00000;
      expv[10] = 17'h00031;
      expv[11] = 17'h00031;
      expv[12] = 17'h00000;
      expv[13] = 17'h00031;
      expv[14] = 17'h0000d;
      expv[15] = 17'h00000;
      expv[16] = 17'h00000;
      expv[17] = 17'h00031;
      expv[18] = 17'h00000;
      expv[19] = 17'h0000d;
      expv[20] = 17'h00000;
      expv[21] = 17'h0000d;
      expv[22] = 17'h00000;
      expv[23] = 17'h00000;
      expv[24] = 17'h00000;
      expv[25] = 17'h0000d;
      expv[26] = 17'h057ec;
      expv[27] = 17'h00000;
      expv[28] = 17'h0000d;
      expv[29] = 17'h057ec;
      expv[30] = 17'h00000;
      expv[31] = 17'h0000d;
      expv[32] = 17'h057ec;
      expv[33] = 17'h00000;
      expv[34] = 17'h00000;
      expv[35] = 17'h0b556;
      expv[36] = 17'h057ec;
      expv[37] = 17'h0b556;
      expv[38] = 17'h0000d;
      expv[39] = 17'h0f8fb;
      expv[40] = 17'h0000d;
      expv[41] = 17'h0000d;
      expv[42] = 17'h00000;
      expv[43] = 17'h057ec;
      expv[44] = 17'h00000;
      expv[45] = 17'h00000;
      expv[46] = 17'h0e03f;
      expv[47] = 17'h00003;
      expv[48] = 17'h0b556;
      expv[49] = 17'h057ec;
      expv[50] = 17'h00003;
      expv[51] = 17'h00000;
      expv[52] = 17'h00000;
      expv[53] = 17'h00000;
      expv[54] = 17'h00009;
      expv[55] = 17'h00009;
      expv[56] = 17'h057ec;
      expv[57] = 17'h00000;
      expv[58] = 17'h0e03f;
      expv[59] = 17'h00000;
      expv[60] = 17'h00000;
      expv[61] = 17'h00000;
      expv[62] = 17'h0e03f;
      expv[63] = 17'h057ec;
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
