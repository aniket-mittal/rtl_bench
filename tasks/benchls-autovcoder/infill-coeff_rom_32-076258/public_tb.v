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

  autovcoder_076258 dut (
    .CLK(clk),
    .EN_ROM1(in_vec[5:5]),
    .ADRS(in_vec[4:0]),
    .O_D(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 6'h35;
    stim[1] = 6'h2d;
    stim[2] = 6'h36;
    stim[3] = 6'h39;
    stim[4] = 6'h13;
    stim[5] = 6'h1b;
    stim[6] = 6'h0b;
    stim[7] = 6'h1d;
    stim[8] = 6'h1e;
    stim[9] = 6'h1b;
    stim[10] = 6'h0c;
    stim[11] = 6'h37;
    stim[12] = 6'h0d;
    stim[13] = 6'h2e;
    stim[14] = 6'h3e;
    stim[15] = 6'h3a;
    stim[16] = 6'h31;
    stim[17] = 6'h0e;
    stim[18] = 6'h09;
    stim[19] = 6'h02;
    stim[20] = 6'h2b;
    stim[21] = 6'h14;
    stim[22] = 6'h24;
    stim[23] = 6'h24;
    stim[24] = 6'h35;
    stim[25] = 6'h10;
    stim[26] = 6'h0d;
    stim[27] = 6'h01;
    stim[28] = 6'h2b;
    stim[29] = 6'h30;
    stim[30] = 6'h35;
    stim[31] = 6'h17;
    stim[32] = 6'h00;
    stim[33] = 6'h15;
    stim[34] = 6'h00;
    stim[35] = 6'h27;
    stim[36] = 6'h0f;
    stim[37] = 6'h06;
    stim[38] = 6'h16;
    stim[39] = 6'h37;
    stim[40] = 6'h17;
    stim[41] = 6'h2b;
    stim[42] = 6'h0b;
    stim[43] = 6'h23;
    stim[44] = 6'h3d;
    stim[45] = 6'h08;
    stim[46] = 6'h2f;
    stim[47] = 6'h03;
    stim[48] = 6'h1c;
    stim[49] = 6'h0d;
    stim[50] = 6'h29;
    stim[51] = 6'h37;
    stim[52] = 6'h3e;
    stim[53] = 6'h1e;
    stim[54] = 6'h23;
    stim[55] = 6'h3f;
    stim[56] = 6'h27;
    stim[57] = 6'h1b;
    stim[58] = 6'h24;
    stim[59] = 6'h23;
    stim[60] = 6'h38;
    stim[61] = 6'h0a;
    stim[62] = 6'h0f;
    stim[63] = 6'h22;
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
      expv[0] = 32'hxxxxxxxx;
      expv[1] = 32'hb6000000;
      expv[2] = 32'hb9800000;
      expv[3] = 32'hb5800000;
      expv[4] = 32'hb4000000;
      expv[5] = 32'h00000000;
      expv[6] = 32'h00000000;
      expv[7] = 32'h00000000;
      expv[8] = 32'h00000000;
      expv[9] = 32'h00000000;
      expv[10] = 32'h00000000;
      expv[11] = 32'h00000000;
      expv[12] = 32'hb5000000;
      expv[13] = 32'h00000000;
      expv[14] = 32'hb9800000;
      expv[15] = 32'hb1800000;
      expv[16] = 32'hb3800000;
      expv[17] = 32'hb8000000;
      expv[18] = 32'h00000000;
      expv[19] = 32'h00000000;
      expv[20] = 32'h00000000;
      expv[21] = 32'hba800001;
      expv[22] = 32'h00000000;
      expv[23] = 32'hbe002ac4;
      expv[24] = 32'hbe002ac4;
      expv[25] = 32'hb6000000;
      expv[26] = 32'h00000000;
      expv[27] = 32'h00000000;
      expv[28] = 32'h00000000;
      expv[29] = 32'hba800001;
      expv[30] = 32'hb8800000;
      expv[31] = 32'hb6000000;
      expv[32] = 32'h00000000;
      expv[33] = 32'h00000000;
      expv[34] = 32'h00000000;
      expv[35] = 32'h00000000;
      expv[36] = 32'hbc8000ab;
      expv[37] = 32'h00000000;
      expv[38] = 32'h00000000;
      expv[39] = 32'h00000000;
      expv[40] = 32'hb5000000;
      expv[41] = 32'h00000000;
      expv[42] = 32'hba800001;
      expv[43] = 32'h00000000;
      expv[44] = 32'hbe002ac4;
      expv[45] = 32'hb2000000;
      expv[46] = 32'h00000000;
      expv[47] = 32'hb9000000;
      expv[48] = 32'h00000000;
      expv[49] = 32'h00000000;
      expv[50] = 32'h00000000;
      expv[51] = 32'hbb5e3542;
      expv[52] = 32'hb5000000;
      expv[53] = 32'hb1800000;
      expv[54] = 32'h00000000;
      expv[55] = 32'hbe002ac4;
      expv[56] = 32'hb1000000;
      expv[57] = 32'hbc8000ab;
      expv[58] = 32'h00000000;
      expv[59] = 32'hbe002ac4;
      expv[60] = 32'hbe002ac4;
      expv[61] = 32'hb4800000;
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
