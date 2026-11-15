// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 13;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_080734 dut (
    .iCLOCK(clk),
    .inRESET(in_vec[12:12]),
    .iRESET_SYNC(in_vec[11:11]),
    .iCMD_START(in_vec[10:10]),
    .iMMC_BUSY(in_vec[9:9]),
    .iMMC_VALID(in_vec[8:8]),
    .iMMC_DATA(in_vec[7:0]),
    .oCMD_END(out_vec[10:10]),
    .oMMC_REQ(out_vec[9:9]),
    .oMMC_CS(out_vec[8:8]),
    .oMMC_DATA(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 13'h130b;
    stim[1] = 13'h1896;
    stim[2] = 13'h0be7;
    stim[3] = 13'h00ec;
    stim[4] = 13'h0951;
    stim[5] = 13'h0ed2;
    stim[6] = 13'h0c26;
    stim[7] = 13'h08f5;
    stim[8] = 13'h0ca6;
    stim[9] = 13'h0fec;
    stim[10] = 13'h066f;
    stim[11] = 13'h069e;
    stim[12] = 13'h0fb2;
    stim[13] = 13'h07db;
    stim[14] = 13'h0f72;
    stim[15] = 13'h04eb;
    stim[16] = 13'h044e;
    stim[17] = 13'h0eac;
    stim[18] = 13'h07d3;
    stim[19] = 13'h0e08;
    stim[20] = 13'h1a2f;
    stim[21] = 13'h0e38;
    stim[22] = 13'h0534;
    stim[23] = 13'h04f2;
    stim[24] = 13'h0e2d;
    stim[25] = 13'h0de5;
    stim[26] = 13'h0d78;
    stim[27] = 13'h0c54;
    stim[28] = 13'h008b;
    stim[29] = 13'h06db;
    stim[30] = 13'h015e;
    stim[31] = 13'h052a;
    stim[32] = 13'h0865;
    stim[33] = 13'h0b3c;
    stim[34] = 13'h0ee3;
    stim[35] = 13'h04b2;
    stim[36] = 13'h04e7;
    stim[37] = 13'h033c;
    stim[38] = 13'h0e30;
    stim[39] = 13'h0d1c;
    stim[40] = 13'h0bf6;
    stim[41] = 13'h0bdf;
    stim[42] = 13'h1bd3;
    stim[43] = 13'h0e26;
    stim[44] = 13'h0db4;
    stim[45] = 13'h0417;
    stim[46] = 13'h037d;
    stim[47] = 13'h0632;
    stim[48] = 13'h0a97;
    stim[49] = 13'h0da6;
    stim[50] = 13'h0423;
    stim[51] = 13'h0a3e;
    stim[52] = 13'h033a;
    stim[53] = 13'h062c;
    stim[54] = 13'h013b;
    stim[55] = 13'h0997;
    stim[56] = 13'h0689;
    stim[57] = 13'h0f61;
    stim[58] = 13'h0bd7;
    stim[59] = 13'h069a;
    stim[60] = 13'h0e51;
    stim[61] = 13'h09ba;
    stim[62] = 13'h0fbf;
    stim[63] = 13'h0b40;
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
      expv[0] = 11'h1ff;
      expv[1] = 11'h1ff;
      expv[2] = 11'h1ff;
      expv[3] = 11'h1ff;
      expv[4] = 11'h1ff;
      expv[5] = 11'h1ff;
      expv[6] = 11'h1ff;
      expv[7] = 11'h1ff;
      expv[8] = 11'h1ff;
      expv[9] = 11'h1ff;
      expv[10] = 11'h1ff;
      expv[11] = 11'h1ff;
      expv[12] = 11'h1ff;
      expv[13] = 11'h1ff;
      expv[14] = 11'h1ff;
      expv[15] = 11'h1ff;
      expv[16] = 11'h1ff;
      expv[17] = 11'h1ff;
      expv[18] = 11'h1ff;
      expv[19] = 11'h1ff;
      expv[20] = 11'h1ff;
      expv[21] = 11'h1ff;
      expv[22] = 11'h1ff;
      expv[23] = 11'h1ff;
      expv[24] = 11'h1ff;
      expv[25] = 11'h1ff;
      expv[26] = 11'h1ff;
      expv[27] = 11'h1ff;
      expv[28] = 11'h1ff;
      expv[29] = 11'h1ff;
      expv[30] = 11'h1ff;
      expv[31] = 11'h1ff;
      expv[32] = 11'h1ff;
      expv[33] = 11'h1ff;
      expv[34] = 11'h1ff;
      expv[35] = 11'h1ff;
      expv[36] = 11'h1ff;
      expv[37] = 11'h1ff;
      expv[38] = 11'h1ff;
      expv[39] = 11'h1ff;
      expv[40] = 11'h1ff;
      expv[41] = 11'h1ff;
      expv[42] = 11'h1ff;
      expv[43] = 11'h1ff;
      expv[44] = 11'h1ff;
      expv[45] = 11'h1ff;
      expv[46] = 11'h1ff;
      expv[47] = 11'h1ff;
      expv[48] = 11'h1ff;
      expv[49] = 11'h1ff;
      expv[50] = 11'h1ff;
      expv[51] = 11'h1ff;
      expv[52] = 11'h1ff;
      expv[53] = 11'h1ff;
      expv[54] = 11'h1ff;
      expv[55] = 11'h1ff;
      expv[56] = 11'h1ff;
      expv[57] = 11'h1ff;
      expv[58] = 11'h1ff;
      expv[59] = 11'h1ff;
      expv[60] = 11'h1ff;
      expv[61] = 11'h1ff;
      expv[62] = 11'h1ff;
      expv[63] = 11'h1ff;
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
