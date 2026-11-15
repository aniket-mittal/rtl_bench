// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 27;
  localparam OW = 65;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_003883 dut (
    .CLK(clk),
    .RST(in_vec[26:26]),
    .CFG_EN(in_vec[25:25]),
    .LO_SET(in_vec[24:24]),
    .FREQ(in_vec[23:0]),
    .ADF_R0(out_vec[64:33]),
    .ADF_R4(out_vec[32:1]),
    .DONE(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 27'h7f4b8b5;
    stim[1] = 27'h572a641;
    stim[2] = 27'h3317edb;
    stim[3] = 27'h051c7c0;
    stim[4] = 27'h1f29b9d;
    stim[5] = 27'h2fe3839;
    stim[6] = 27'h3356c3e;
    stim[7] = 27'h1fa8f55;
    stim[8] = 27'h1a8a789;
    stim[9] = 27'h2cf365c;
    stim[10] = 27'h2bf109c;
    stim[11] = 27'h1fd5c12;
    stim[12] = 27'h21e6d55;
    stim[13] = 27'h3377e86;
    stim[14] = 27'h1c30e81;
    stim[15] = 27'h2540856;
    stim[16] = 27'h0c2d8d2;
    stim[17] = 27'h19488d0;
    stim[18] = 27'h046a4f2;
    stim[19] = 27'h1922ec9;
    stim[20] = 27'h2d4fefc;
    stim[21] = 27'h170e276;
    stim[22] = 27'h139334c;
    stim[23] = 27'h031c4b3;
    stim[24] = 27'h1e2f6e8;
    stim[25] = 27'h323bda3;
    stim[26] = 27'h3fdf878;
    stim[27] = 27'h01e8d35;
    stim[28] = 27'h3e804f9;
    stim[29] = 27'h2d15b52;
    stim[30] = 27'h27f5e8b;
    stim[31] = 27'h1879ce8;
    stim[32] = 27'h0c828b6;
    stim[33] = 27'h11e4125;
    stim[34] = 27'h320b7d5;
    stim[35] = 27'h07c4412;
    stim[36] = 27'h1bc2e06;
    stim[37] = 27'h3c37765;
    stim[38] = 27'h04c5d9a;
    stim[39] = 27'h2066ec6;
    stim[40] = 27'h21986bd;
    stim[41] = 27'h2a53691;
    stim[42] = 27'h1e5998e;
    stim[43] = 27'h1afef4f;
    stim[44] = 27'h01022a7;
    stim[45] = 27'h16159ce;
    stim[46] = 27'h1035a74;
    stim[47] = 27'h2134cee;
    stim[48] = 27'h1b477b8;
    stim[49] = 27'h3ba71f4;
    stim[50] = 27'h107cad4;
    stim[51] = 27'h0b56ade;
    stim[52] = 27'h2d8558f;
    stim[53] = 27'h2a62b84;
    stim[54] = 27'h3153685;
    stim[55] = 27'h694720c;
    stim[56] = 27'h2e920e1;
    stim[57] = 27'h0e623a4;
    stim[58] = 27'h35c9640;
    stim[59] = 27'h0441e09;
    stim[60] = 27'h3c78849;
    stim[61] = 27'h0b4801a;
    stim[62] = 27'h30bac43;
    stim[63] = 27'h1201904;
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
      expv[0] = 65'h000a03e800159007x;
      expv[1] = 65'h000a03e800159007x;
      expv[2] = 65'h000a03e800159007x;
      expv[3] = 65'h000a03e800159007x;
      expv[4] = 65'h000a03e800159007x;
      expv[5] = 65'h000a03e800159007x;
      expv[6] = 65'h000a03e800159007x;
      expv[7] = 65'h000a03e800159007x;
      expv[8] = 65'h000a03e800159007x;
      expv[9] = 65'h000a03e800159007x;
      expv[10] = 65'h000a03e800159007x;
      expv[11] = 65'h000a03e800159007x;
      expv[12] = 65'h000a03e800159007x;
      expv[13] = 65'h000a03e800159007x;
      expv[14] = 65'h000a03e800159007x;
      expv[15] = 65'h000a03e800159007x;
      expv[16] = 65'h000a03e800159007x;
      expv[17] = 65'h000a03e800159007x;
      expv[18] = 65'h000a03e800159007x;
      expv[19] = 65'h000a03e800159007x;
      expv[20] = 65'h000a03e800159007x;
      expv[21] = 65'h000a03e800159007x;
      expv[22] = 65'h000a03e800159007x;
      expv[23] = 65'h000a03e800159007x;
      expv[24] = 65'h000a03e800159007x;
      expv[25] = 65'h000a03e800159007x;
      expv[26] = 65'h000a03e800159007x;
      expv[27] = 65'h000a03e800159007x;
      expv[28] = 65'h000a03e800159007x;
      expv[29] = 65'h000a03e800159007x;
      expv[30] = 65'h000a03e800159007x;
      expv[31] = 65'h000a03e800159007x;
      expv[32] = 65'h000a03e800159007x;
      expv[33] = 65'h000a03e800159007x;
      expv[34] = 65'h000a03e800159007x;
      expv[35] = 65'h000a03e800159007x;
      expv[36] = 65'h000a03e800159007x;
      expv[37] = 65'h000a03e800159007x;
      expv[38] = 65'h000a03e800159007x;
      expv[39] = 65'h000a03e800159007x;
      expv[40] = 65'h000a03e800159007x;
      expv[41] = 65'h000a03e800159007x;
      expv[42] = 65'h000a03e800159007x;
      expv[43] = 65'h000a03e800159007x;
      expv[44] = 65'h000a03e800159007x;
      expv[45] = 65'h000a03e800159007x;
      expv[46] = 65'h000a03e800159007x;
      expv[47] = 65'h000a03e800159007x;
      expv[48] = 65'h000a03e800159007x;
      expv[49] = 65'h000a03e800159007x;
      expv[50] = 65'h000a03e800159007x;
      expv[51] = 65'h000a03e800159007x;
      expv[52] = 65'h000a03e800159007x;
      expv[53] = 65'h000a03e800159007x;
      expv[54] = 65'h000a03e800159007x;
      expv[55] = 65'h000a03e800159007x;
      expv[56] = 65'h000a03e800159007x;
      expv[57] = 65'h000a03e800159007x;
      expv[58] = 65'h000a03e800159007x;
      expv[59] = 65'h000a03e800159007x;
      expv[60] = 65'h000a03e800159007x;
      expv[61] = 65'h000a03e800159007x;
      expv[62] = 65'h000a03e800159007x;
      expv[63] = 65'h000a03e800159007x;
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
