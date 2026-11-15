// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_137050 dut (
    .clk(clk),
    .rst(in_vec[16:16]),
    .x(in_vec[15:0]),
    .y(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h123da;
    stim[1] = 17'h128c4;
    stim[2] = 17'h03acc;
    stim[3] = 17'h0f823;
    stim[4] = 17'h0b254;
    stim[5] = 17'h0f6d5;
    stim[6] = 17'h0bc89;
    stim[7] = 17'h0a2bd;
    stim[8] = 17'h0bc79;
    stim[9] = 17'h0041a;
    stim[10] = 17'h0db61;
    stim[11] = 17'h0e089;
    stim[12] = 17'h067df;
    stim[13] = 17'h0ba4b;
    stim[14] = 17'h0e96a;
    stim[15] = 17'h0aeb5;
    stim[16] = 17'h098ce;
    stim[17] = 17'h0bba6;
    stim[18] = 17'h0f716;
    stim[19] = 17'h0b5c2;
    stim[20] = 17'h02eba;
    stim[21] = 17'h01e62;
    stim[22] = 17'h0ffe7;
    stim[23] = 17'h02668;
    stim[24] = 17'h0487f;
    stim[25] = 17'h02f47;
    stim[26] = 17'h099e0;
    stim[27] = 17'h0abb4;
    stim[28] = 17'h0e086;
    stim[29] = 17'h09efe;
    stim[30] = 17'h0e9a4;
    stim[31] = 17'h02600;
    stim[32] = 17'h06b89;
    stim[33] = 17'h0cf36;
    stim[34] = 17'h0fbc6;
    stim[35] = 17'h080d1;
    stim[36] = 17'h019eb;
    stim[37] = 17'h02928;
    stim[38] = 17'h09372;
    stim[39] = 17'h08bb6;
    stim[40] = 17'h0d72d;
    stim[41] = 17'h0da10;
    stim[42] = 17'h0dc21;
    stim[43] = 17'h0da65;
    stim[44] = 17'h09c54;
    stim[45] = 17'h05bd2;
    stim[46] = 17'h04556;
    stim[47] = 17'h083d4;
    stim[48] = 17'h03848;
    stim[49] = 17'h06c56;
    stim[50] = 17'h055dd;
    stim[51] = 17'h11265;
    stim[52] = 17'h0f90f;
    stim[53] = 17'h035ad;
    stim[54] = 17'h03f80;
    stim[55] = 17'h0f747;
    stim[56] = 17'h07638;
    stim[57] = 17'h025e4;
    stim[58] = 17'h0d25e;
    stim[59] = 17'h0be6b;
    stim[60] = 17'h05dd4;
    stim[61] = 17'h0c6c8;
    stim[62] = 17'h0f228;
    stim[63] = 17'h05016;
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
      expv[0] = 16'h0000;
      expv[1] = 16'h0000;
      expv[2] = 16'h0000;
      expv[3] = 16'h0000;
      expv[4] = 16'h0002;
      expv[5] = 16'h000d;
      expv[6] = 16'h0006;
      expv[7] = 16'h0003;
      expv[8] = 16'h000f;
      expv[9] = 16'h0005;
      expv[10] = 16'h0006;
      expv[11] = 16'h0006;
      expv[12] = 16'h000f;
      expv[13] = 16'h000a;
      expv[14] = 16'h0004;
      expv[15] = 16'h0000;
      expv[16] = 16'h000e;
      expv[17] = 16'h0005;
      expv[18] = 16'h000d;
      expv[19] = 16'h000c;
      expv[20] = 16'h0000;
      expv[21] = 16'h0009;
      expv[22] = 16'h000a;
      expv[23] = 16'h000b;
      expv[24] = 16'h000f;
      expv[25] = 16'h000e;
      expv[26] = 16'h000b;
      expv[27] = 16'h000a;
      expv[28] = 16'h0008;
      expv[29] = 16'h0001;
      expv[30] = 16'h0001;
      expv[31] = 16'h0009;
      expv[32] = 16'h0005;
      expv[33] = 16'h000e;
      expv[34] = 16'h0002;
      expv[35] = 16'h0003;
      expv[36] = 16'h0005;
      expv[37] = 16'h0009;
      expv[38] = 16'h0003;
      expv[39] = 16'h000c;
      expv[40] = 16'h0007;
      expv[41] = 16'h0000;
      expv[42] = 16'h000e;
      expv[43] = 16'h0008;
      expv[44] = 16'h000c;
      expv[45] = 16'h0009;
      expv[46] = 16'h000b;
      expv[47] = 16'h0007;
      expv[48] = 16'h000b;
      expv[49] = 16'h000f;
      expv[50] = 16'h0008;
      expv[51] = 16'h0000;
      expv[52] = 16'h0000;
      expv[53] = 16'h0000;
      expv[54] = 16'h000d;
      expv[55] = 16'h0005;
      expv[56] = 16'h0001;
      expv[57] = 16'h000a;
      expv[58] = 16'h000f;
      expv[59] = 16'h000d;
      expv[60] = 16'h0000;
      expv[61] = 16'h0004;
      expv[62] = 16'h0004;
      expv[63] = 16'h0000;
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
