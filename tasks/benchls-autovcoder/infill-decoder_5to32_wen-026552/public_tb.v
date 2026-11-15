// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 6;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_026552 dut (
    .Waddr_rst(in_vec[5:1]),
    .Wen_rst(in_vec[0:0]),
    .Wen0_rst(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 6'h07;
    stim[1] = 6'h17;
    stim[2] = 6'h30;
    stim[3] = 6'h1e;
    stim[4] = 6'h24;
    stim[5] = 6'h14;
    stim[6] = 6'h3a;
    stim[7] = 6'h10;
    stim[8] = 6'h3a;
    stim[9] = 6'h0a;
    stim[10] = 6'h26;
    stim[11] = 6'h27;
    stim[12] = 6'h08;
    stim[13] = 6'h00;
    stim[14] = 6'h3e;
    stim[15] = 6'h22;
    stim[16] = 6'h10;
    stim[17] = 6'h10;
    stim[18] = 6'h18;
    stim[19] = 6'h38;
    stim[20] = 6'h04;
    stim[21] = 6'h32;
    stim[22] = 6'h2e;
    stim[23] = 6'h26;
    stim[24] = 6'h34;
    stim[25] = 6'h3c;
    stim[26] = 6'h06;
    stim[27] = 6'h14;
    stim[28] = 6'h08;
    stim[29] = 6'h22;
    stim[30] = 6'h32;
    stim[31] = 6'h0a;
    stim[32] = 6'h1c;
    stim[33] = 6'h12;
    stim[34] = 6'h0c;
    stim[35] = 6'h28;
    stim[36] = 6'h2e;
    stim[37] = 6'h3e;
    stim[38] = 6'h36;
    stim[39] = 6'h0a;
    stim[40] = 6'h20;
    stim[41] = 6'h0e;
    stim[42] = 6'h00;
    stim[43] = 6'h20;
    stim[44] = 6'h14;
    stim[45] = 6'h2e;
    stim[46] = 6'h12;
    stim[47] = 6'h1c;
    stim[48] = 6'h10;
    stim[49] = 6'h2a;
    stim[50] = 6'h2c;
    stim[51] = 6'h38;
    stim[52] = 6'h18;
    stim[53] = 6'h3e;
    stim[54] = 6'h3a;
    stim[55] = 6'h02;
    stim[56] = 6'h00;
    stim[57] = 6'h1c;
    stim[58] = 6'h32;
    stim[59] = 6'h1a;
    stim[60] = 6'h32;
    stim[61] = 6'h1c;
    stim[62] = 6'h36;
    stim[63] = 6'h08;
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
      expv[0] = 32'h00000008;
      expv[1] = 32'h00000800;
      expv[2] = 32'h00000000;
      expv[3] = 32'h00000000;
      expv[4] = 32'h00000000;
      expv[5] = 32'h00000000;
      expv[6] = 32'h00000000;
      expv[7] = 32'h00000000;
      expv[8] = 32'h00000000;
      expv[9] = 32'h00000000;
      expv[10] = 32'h00000000;
      expv[11] = 32'h00080000;
      expv[12] = 32'h00000000;
      expv[13] = 32'h00000000;
      expv[14] = 32'h00000000;
      expv[15] = 32'h00000000;
      expv[16] = 32'h00000000;
      expv[17] = 32'h00000000;
      expv[18] = 32'h00000000;
      expv[19] = 32'h00000000;
      expv[20] = 32'h00000000;
      expv[21] = 32'h00000000;
      expv[22] = 32'h00000000;
      expv[23] = 32'h00000000;
      expv[24] = 32'h00000000;
      expv[25] = 32'h00000000;
      expv[26] = 32'h00000000;
      expv[27] = 32'h00000000;
      expv[28] = 32'h00000000;
      expv[29] = 32'h00000000;
      expv[30] = 32'h00000000;
      expv[31] = 32'h00000000;
      expv[32] = 32'h00000000;
      expv[33] = 32'h00000000;
      expv[34] = 32'h00000000;
      expv[35] = 32'h00000000;
      expv[36] = 32'h00000000;
      expv[37] = 32'h00000000;
      expv[38] = 32'h00000000;
      expv[39] = 32'h00000000;
      expv[40] = 32'h00000000;
      expv[41] = 32'h00000000;
      expv[42] = 32'h00000000;
      expv[43] = 32'h00000000;
      expv[44] = 32'h00000000;
      expv[45] = 32'h00000000;
      expv[46] = 32'h00000000;
      expv[47] = 32'h00000000;
      expv[48] = 32'h00000000;
      expv[49] = 32'h00000000;
      expv[50] = 32'h00000000;
      expv[51] = 32'h00000000;
      expv[52] = 32'h00000000;
      expv[53] = 32'h00000000;
      expv[54] = 32'h00000000;
      expv[55] = 32'h00000000;
      expv[56] = 32'h00000000;
      expv[57] = 32'h00000000;
      expv[58] = 32'h00000000;
      expv[59] = 32'h00000000;
      expv[60] = 32'h00000000;
      expv[61] = 32'h00000000;
      expv[62] = 32'h00000000;
      expv[63] = 32'h00000000;
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
