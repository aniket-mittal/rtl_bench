// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_07961 dut (
    .CLK(clk),
    .RESETn(in_vec[10:10]),
    .DATA_IN(in_vec[9:2]),
    .PUSH(in_vec[1:1]),
    .POP(in_vec[0:0]),
    .DATA_OUT(out_vec[9:2]),
    .FULL(out_vec[1:1]),
    .EMPTY(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h069;
    stim[1] = 11'h1f5;
    stim[2] = 11'h464;
    stim[3] = 11'h6ea;
    stim[4] = 11'h5cc;
    stim[5] = 11'h5ca;
    stim[6] = 11'h748;
    stim[7] = 11'h6d4;
    stim[8] = 11'h4ea;
    stim[9] = 11'h4e7;
    stim[10] = 11'h62b;
    stim[11] = 11'h51c;
    stim[12] = 11'h609;
    stim[13] = 11'h6ad;
    stim[14] = 11'h406;
    stim[15] = 11'h403;
    stim[16] = 11'h73c;
    stim[17] = 11'h510;
    stim[18] = 11'h546;
    stim[19] = 11'h490;
    stim[20] = 11'h6cb;
    stim[21] = 11'h488;
    stim[22] = 11'h6c9;
    stim[23] = 11'h6d1;
    stim[24] = 11'h67f;
    stim[25] = 11'h45d;
    stim[26] = 11'h61c;
    stim[27] = 11'h459;
    stim[28] = 11'h53e;
    stim[29] = 11'h791;
    stim[30] = 11'h454;
    stim[31] = 11'h63e;
    stim[32] = 11'h561;
    stim[33] = 11'h73e;
    stim[34] = 11'h5fc;
    stim[35] = 11'h7bf;
    stim[36] = 11'h546;
    stim[37] = 11'h590;
    stim[38] = 11'h746;
    stim[39] = 11'h72b;
    stim[40] = 11'h40d;
    stim[41] = 11'h788;
    stim[42] = 11'h61e;
    stim[43] = 11'h773;
    stim[44] = 11'h511;
    stim[45] = 11'h70e;
    stim[46] = 11'h639;
    stim[47] = 11'h477;
    stim[48] = 11'h6be;
    stim[49] = 11'h692;
    stim[50] = 11'h7f0;
    stim[51] = 11'h40e;
    stim[52] = 11'h457;
    stim[53] = 11'h729;
    stim[54] = 11'h672;
    stim[55] = 11'h617;
    stim[56] = 11'h79e;
    stim[57] = 11'h6a8;
    stim[58] = 11'h52e;
    stim[59] = 11'h70e;
    stim[60] = 11'h5de;
    stim[61] = 11'h4d6;
    stim[62] = 11'h5df;
    stim[63] = 11'h4b4;
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
      expv[0] = 10'hxxx;
      expv[1] = 10'hxxx;
      expv[2] = 10'hxxx;
      expv[3] = 10'hxxx;
      expv[4] = 10'hxxx;
      expv[5] = 10'h2e8;
      expv[6] = 10'h2e8;
      expv[7] = 10'h2e8;
      expv[8] = 10'h2e8;
      expv[9] = 10'h2e8;
      expv[10] = 10'h2e8;
      expv[11] = 10'h1c8;
      expv[12] = 10'h1c8;
      expv[13] = 10'h1c8;
      expv[14] = 10'h0e8;
      expv[15] = 10'h0e8;
      expv[16] = 10'h0e8;
      expv[17] = 10'h228;
      expv[18] = 10'h228;
      expv[19] = 10'h228;
      expv[20] = 10'h228;
      expv[21] = 10'h228;
      expv[22] = 10'h004;
      expv[23] = 10'h004;
      expv[24] = 10'h144;
      expv[25] = 10'h144;
      expv[26] = 10'h2c8;
      expv[27] = 10'h2c8;
      expv[28] = 10'h2c8;
      expv[29] = 10'h27c;
      expv[30] = 10'h27c;
      expv[31] = 10'h13c;
      expv[32] = 10'h13c;
      expv[33] = 10'h13c;
      expv[34] = 10'h23c;
      expv[35] = 10'h23c;
      expv[36] = 10'h23c;
      expv[37] = 10'h33c;
      expv[38] = 10'h33c;
      expv[39] = 10'h33c;
      expv[40] = 10'h33c;
      expv[41] = 10'h3bc;
      expv[42] = 10'h3bc;
      expv[43] = 10'h3bc;
      expv[44] = 10'h3bc;
      expv[45] = 10'h344;
      expv[46] = 10'h344;
      expv[47] = 10'h344;
      expv[48] = 10'h21c;
      expv[49] = 10'h21c;
      expv[50] = 10'h21c;
      expv[51] = 10'h21c;
      expv[52] = 10'h21c;
      expv[53] = 10'h21c;
      expv[54] = 10'h30c;
      expv[55] = 10'h30c;
      expv[56] = 10'h30c;
      expv[57] = 10'h074;
      expv[58] = 10'h074;
      expv[59] = 10'h074;
      expv[60] = 10'h074;
      expv[61] = 10'h074;
      expv[62] = 10'h074;
      expv[63] = 10'h074;
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
