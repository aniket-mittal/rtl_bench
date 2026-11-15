// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_027962 dut (
    .clk(clk),
    .reset(in_vec[16:16]),
    .digit0(in_vec[15:12]),
    .digit1(in_vec[11:8]),
    .digit2(in_vec[7:4]),
    .digit3(in_vec[3:0]),
    .seg(out_vec[11:5]),
    .dp(out_vec[4:4]),
    .an(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h106ca;
    stim[1] = 17'h17aa5;
    stim[2] = 17'h0ca97;
    stim[3] = 17'h0743b;
    stim[4] = 17'h00c3b;
    stim[5] = 17'h05496;
    stim[6] = 17'h0d606;
    stim[7] = 17'h03db8;
    stim[8] = 17'h08e11;
    stim[9] = 17'h0dcd4;
    stim[10] = 17'h17dd1;
    stim[11] = 17'h06605;
    stim[12] = 17'h034b4;
    stim[13] = 17'h0a857;
    stim[14] = 17'h0fc09;
    stim[15] = 17'h00ecf;
    stim[16] = 17'h0ce24;
    stim[17] = 17'h03d23;
    stim[18] = 17'h0ec1c;
    stim[19] = 17'h0f8ce;
    stim[20] = 17'h0e11b;
    stim[21] = 17'h01cb8;
    stim[22] = 17'h0e6d0;
    stim[23] = 17'h064ca;
    stim[24] = 17'h0615f;
    stim[25] = 17'h02d3c;
    stim[26] = 17'h0bc1d;
    stim[27] = 17'h068ce;
    stim[28] = 17'h0d94e;
    stim[29] = 17'h0c019;
    stim[30] = 17'h0b1cd;
    stim[31] = 17'h0039f;
    stim[32] = 17'h0e2a0;
    stim[33] = 17'h0f1d6;
    stim[34] = 17'h09565;
    stim[35] = 17'h0a91c;
    stim[36] = 17'h07ebb;
    stim[37] = 17'h0629e;
    stim[38] = 17'h082f6;
    stim[39] = 17'h05209;
    stim[40] = 17'h08cd0;
    stim[41] = 17'h0eea9;
    stim[42] = 17'h016e1;
    stim[43] = 17'h06ef4;
    stim[44] = 17'h0240c;
    stim[45] = 17'h04b95;
    stim[46] = 17'h07489;
    stim[47] = 17'h0bd3d;
    stim[48] = 17'h0e16a;
    stim[49] = 17'h07475;
    stim[50] = 17'h012c9;
    stim[51] = 17'h02aa4;
    stim[52] = 17'h09b4f;
    stim[53] = 17'h0f911;
    stim[54] = 17'h0beb4;
    stim[55] = 17'h08925;
    stim[56] = 17'h03e99;
    stim[57] = 17'h056c9;
    stim[58] = 17'h0ea6c;
    stim[59] = 17'h08e4e;
    stim[60] = 17'h07087;
    stim[61] = 17'h083a1;
    stim[62] = 17'h0df88;
    stim[63] = 17'h0b65b;
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
      expv[0] = 12'h81e;
      expv[1] = 12'hf1e;
      expv[2] = 12'hffe;
      expv[3] = 12'hf1e;
      expv[4] = 12'h81e;
      expv[5] = 12'h25e;
      expv[6] = 12'hffe;
      expv[7] = 12'h61e;
      expv[8] = 12'h01e;
      expv[9] = 12'hffe;
      expv[10] = 12'hf1e;
      expv[11] = 12'h05e;
      expv[12] = 12'h61e;
      expv[13] = 12'hffe;
      expv[14] = 12'hffe;
      expv[15] = 12'h81e;
      expv[16] = 12'hffe;
      expv[17] = 12'h61e;
      expv[18] = 12'hffe;
      expv[19] = 12'hffe;
      expv[20] = 12'hffe;
      expv[21] = 12'hf3e;
      expv[22] = 12'hffe;
      expv[23] = 12'h05e;
      expv[24] = 12'h05e;
      expv[25] = 12'h49e;
      expv[26] = 12'hffe;
      expv[27] = 12'h05e;
      expv[28] = 12'hffe;
      expv[29] = 12'hffe;
      expv[30] = 12'hffe;
      expv[31] = 12'h81e;
      expv[32] = 12'hffe;
      expv[33] = 12'hffe;
      expv[34] = 12'h21e;
      expv[35] = 12'hffe;
      expv[36] = 12'hf1e;
      expv[37] = 12'h05e;
      expv[38] = 12'h01e;
      expv[39] = 12'h25e;
      expv[40] = 12'h01e;
      expv[41] = 12'hffe;
      expv[42] = 12'hf3e;
      expv[43] = 12'h05e;
      expv[44] = 12'h49e;
      expv[45] = 12'h33e;
      expv[46] = 12'hf1e;
      expv[47] = 12'hffe;
      expv[48] = 12'hffe;
      expv[49] = 12'hf1e;
      expv[50] = 12'hf3e;
      expv[51] = 12'h49e;
      expv[52] = 12'h21e;
      expv[53] = 12'hffe;
      expv[54] = 12'hffe;
      expv[55] = 12'h01e;
      expv[56] = 12'h61e;
      expv[57] = 12'h25e;
      expv[58] = 12'hffe;
      expv[59] = 12'h01e;
      expv[60] = 12'hf1e;
      expv[61] = 12'h01e;
      expv[62] = 12'hffe;
      expv[63] = 12'hffe;
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
