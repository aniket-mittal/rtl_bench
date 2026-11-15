// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 4;
  localparam OW = 7;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_120742 dut (
    .clk(clk),
    .reset(in_vec[3:3]),
    .run(in_vec[2:2]),
    .clearA_loadB(in_vec[1:1]),
    .M(in_vec[0:0]),
    .clr_A(out_vec[6:6]),
    .clr_X(out_vec[5:5]),
    .ld_A(out_vec[4:4]),
    .ld_B(out_vec[3:3]),
    .shift(out_vec[2:2]),
    .ld_X(out_vec[1:1]),
    .fn(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 4'hf;
    stim[1] = 4'h8;
    stim[2] = 4'h0;
    stim[3] = 4'h0;
    stim[4] = 4'h4;
    stim[5] = 4'h2;
    stim[6] = 4'h7;
    stim[7] = 4'h2;
    stim[8] = 4'h5;
    stim[9] = 4'h0;
    stim[10] = 4'h3;
    stim[11] = 4'h6;
    stim[12] = 4'h7;
    stim[13] = 4'h4;
    stim[14] = 4'h1;
    stim[15] = 4'h4;
    stim[16] = 4'h3;
    stim[17] = 4'h6;
    stim[18] = 4'h2;
    stim[19] = 4'h7;
    stim[20] = 4'h0;
    stim[21] = 4'h0;
    stim[22] = 4'h4;
    stim[23] = 4'h3;
    stim[24] = 4'h2;
    stim[25] = 4'h0;
    stim[26] = 4'h6;
    stim[27] = 4'h4;
    stim[28] = 4'h7;
    stim[29] = 4'h6;
    stim[30] = 4'h7;
    stim[31] = 4'h0;
    stim[32] = 4'h6;
    stim[33] = 4'h3;
    stim[34] = 4'h0;
    stim[35] = 4'h5;
    stim[36] = 4'h6;
    stim[37] = 4'h1;
    stim[38] = 4'h1;
    stim[39] = 4'h3;
    stim[40] = 4'h3;
    stim[41] = 4'h1;
    stim[42] = 4'h4;
    stim[43] = 4'h0;
    stim[44] = 4'h4;
    stim[45] = 4'h1;
    stim[46] = 4'h2;
    stim[47] = 4'h5;
    stim[48] = 4'h5;
    stim[49] = 4'h7;
    stim[50] = 4'h6;
    stim[51] = 4'h4;
    stim[52] = 4'h5;
    stim[53] = 4'h7;
    stim[54] = 4'h1;
    stim[55] = 4'h4;
    stim[56] = 4'h5;
    stim[57] = 4'h5;
    stim[58] = 4'h0;
    stim[59] = 4'h7;
    stim[60] = 4'h3;
    stim[61] = 4'h4;
    stim[62] = 4'h5;
    stim[63] = 4'h1;
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
      expv[0] = 7'h68;
      expv[1] = 7'h60;
      expv[2] = 7'h60;
      expv[3] = 7'h60;
      expv[4] = 7'h60;
      expv[5] = 7'h00;
      expv[6] = 7'h04;
      expv[7] = 7'h00;
      expv[8] = 7'h04;
      expv[9] = 7'h00;
      expv[10] = 7'h04;
      expv[11] = 7'h00;
      expv[12] = 7'h04;
      expv[13] = 7'h00;
      expv[14] = 7'h04;
      expv[15] = 7'h00;
      expv[16] = 7'h04;
      expv[17] = 7'h00;
      expv[18] = 7'h04;
      expv[19] = 7'h13;
      expv[20] = 7'h04;
      expv[21] = 7'h20;
      expv[22] = 7'h60;
      expv[23] = 7'h12;
      expv[24] = 7'h04;
      expv[25] = 7'h00;
      expv[26] = 7'h04;
      expv[27] = 7'h00;
      expv[28] = 7'h04;
      expv[29] = 7'h00;
      expv[30] = 7'h04;
      expv[31] = 7'h00;
      expv[32] = 7'h04;
      expv[33] = 7'h12;
      expv[34] = 7'h04;
      expv[35] = 7'h12;
      expv[36] = 7'h04;
      expv[37] = 7'h13;
      expv[38] = 7'h04;
      expv[39] = 7'h20;
      expv[40] = 7'h68;
      expv[41] = 7'h60;
      expv[42] = 7'h60;
      expv[43] = 7'h00;
      expv[44] = 7'h04;
      expv[45] = 7'h12;
      expv[46] = 7'h04;
      expv[47] = 7'h12;
      expv[48] = 7'h04;
      expv[49] = 7'h12;
      expv[50] = 7'h04;
      expv[51] = 7'h00;
      expv[52] = 7'h04;
      expv[53] = 7'h12;
      expv[54] = 7'h04;
      expv[55] = 7'h00;
      expv[56] = 7'h04;
      expv[57] = 7'h13;
      expv[58] = 7'h04;
      expv[59] = 7'h20;
      expv[60] = 7'h20;
      expv[61] = 7'h60;
      expv[62] = 7'h12;
      expv[63] = 7'h04;
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
