// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_187920 dut (
    .address(in_vec[9:0]),
    .data_out(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h21e;
    stim[1] = 10'h011;
    stim[2] = 10'h0c5;
    stim[3] = 10'h29c;
    stim[4] = 10'h059;
    stim[5] = 10'h06b;
    stim[6] = 10'h056;
    stim[7] = 10'h322;
    stim[8] = 10'h276;
    stim[9] = 10'h09b;
    stim[10] = 10'h2bc;
    stim[11] = 10'h12b;
    stim[12] = 10'h065;
    stim[13] = 10'h34e;
    stim[14] = 10'h27a;
    stim[15] = 10'h073;
    stim[16] = 10'h1ce;
    stim[17] = 10'h0ff;
    stim[18] = 10'h0c2;
    stim[19] = 10'h2e9;
    stim[20] = 10'h15a;
    stim[21] = 10'h3a4;
    stim[22] = 10'h283;
    stim[23] = 10'h36e;
    stim[24] = 10'h352;
    stim[25] = 10'h086;
    stim[26] = 10'h07d;
    stim[27] = 10'h1c5;
    stim[28] = 10'h330;
    stim[29] = 10'h1b1;
    stim[30] = 10'h079;
    stim[31] = 10'h17c;
    stim[32] = 10'h1dc;
    stim[33] = 10'h22d;
    stim[34] = 10'h29c;
    stim[35] = 10'h3d0;
    stim[36] = 10'h2ee;
    stim[37] = 10'h0f1;
    stim[38] = 10'h3a7;
    stim[39] = 10'h17f;
    stim[40] = 10'h21f;
    stim[41] = 10'h04a;
    stim[42] = 10'h24a;
    stim[43] = 10'h159;
    stim[44] = 10'h121;
    stim[45] = 10'h1d2;
    stim[46] = 10'h1a1;
    stim[47] = 10'h36e;
    stim[48] = 10'h3c9;
    stim[49] = 10'h1b4;
    stim[50] = 10'h158;
    stim[51] = 10'h09a;
    stim[52] = 10'h299;
    stim[53] = 10'h025;
    stim[54] = 10'h27b;
    stim[55] = 10'h00a;
    stim[56] = 10'h35b;
    stim[57] = 10'h275;
    stim[58] = 10'h1e3;
    stim[59] = 10'h115;
    stim[60] = 10'h107;
    stim[61] = 10'h0aa;
    stim[62] = 10'h056;
    stim[63] = 10'h382;
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
      expv[0] = 8'hxx;
      expv[1] = 8'h12;
      expv[2] = 8'hxx;
      expv[3] = 8'hxx;
      expv[4] = 8'hxx;
      expv[5] = 8'hxx;
      expv[6] = 8'hxx;
      expv[7] = 8'hxx;
      expv[8] = 8'hxx;
      expv[9] = 8'hxx;
      expv[10] = 8'hxx;
      expv[11] = 8'hxx;
      expv[12] = 8'hxx;
      expv[13] = 8'hxx;
      expv[14] = 8'hxx;
      expv[15] = 8'hxx;
      expv[16] = 8'hxx;
      expv[17] = 8'hxx;
      expv[18] = 8'hxx;
      expv[19] = 8'hxx;
      expv[20] = 8'hxx;
      expv[21] = 8'hxx;
      expv[22] = 8'hxx;
      expv[23] = 8'hxx;
      expv[24] = 8'hxx;
      expv[25] = 8'hxx;
      expv[26] = 8'hxx;
      expv[27] = 8'hxx;
      expv[28] = 8'hxx;
      expv[29] = 8'hxx;
      expv[30] = 8'hxx;
      expv[31] = 8'hxx;
      expv[32] = 8'hxx;
      expv[33] = 8'hxx;
      expv[34] = 8'hxx;
      expv[35] = 8'hxx;
      expv[36] = 8'hxx;
      expv[37] = 8'hxx;
      expv[38] = 8'hxx;
      expv[39] = 8'hxx;
      expv[40] = 8'hxx;
      expv[41] = 8'hxx;
      expv[42] = 8'hxx;
      expv[43] = 8'hxx;
      expv[44] = 8'hxx;
      expv[45] = 8'hxx;
      expv[46] = 8'hxx;
      expv[47] = 8'hxx;
      expv[48] = 8'hxx;
      expv[49] = 8'hxx;
      expv[50] = 8'hxx;
      expv[51] = 8'hxx;
      expv[52] = 8'hxx;
      expv[53] = 8'h26;
      expv[54] = 8'hxx;
      expv[55] = 8'h0b;
      expv[56] = 8'hxx;
      expv[57] = 8'hxx;
      expv[58] = 8'hxx;
      expv[59] = 8'hxx;
      expv[60] = 8'hxx;
      expv[61] = 8'hxx;
      expv[62] = 8'hxx;
      expv[63] = 8'hxx;
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
