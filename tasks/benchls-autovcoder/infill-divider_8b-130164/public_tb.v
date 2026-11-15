// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 18;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_130164 dut (
    .clk(clk),
    .rst(in_vec[17:17]),
    .start(in_vec[16:16]),
    .dividend(in_vec[15:8]),
    .divisor(in_vec[7:0]),
    .quotient(out_vec[16:9]),
    .remainder(out_vec[8:1]),
    .done(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 18'h362f6;
    stim[1] = 18'h2cd39;
    stim[2] = 18'h104c3;
    stim[3] = 18'h0bea7;
    stim[4] = 18'h083e1;
    stim[5] = 18'h113c3;
    stim[6] = 18'h186e3;
    stim[7] = 18'h17b4a;
    stim[8] = 18'h0bb7a;
    stim[9] = 18'h03b55;
    stim[10] = 18'h066cf;
    stim[11] = 18'h216c4;
    stim[12] = 18'h042f1;
    stim[13] = 18'h18d8b;
    stim[14] = 18'h1c54d;
    stim[15] = 18'h0ac85;
    stim[16] = 18'h17ad4;
    stim[17] = 18'h03e3b;
    stim[18] = 18'h11ea8;
    stim[19] = 18'h076be;
    stim[20] = 18'h019f2;
    stim[21] = 18'h0e2d9;
    stim[22] = 18'h19ab2;
    stim[23] = 18'h0f585;
    stim[24] = 18'h067e4;
    stim[25] = 18'h01455;
    stim[26] = 18'h0df18;
    stim[27] = 18'h013de;
    stim[28] = 18'h17c35;
    stim[29] = 18'h0abe2;
    stim[30] = 18'h0d8bd;
    stim[31] = 18'h0a35b;
    stim[32] = 18'h05914;
    stim[33] = 18'h1d048;
    stim[34] = 18'h0bcf8;
    stim[35] = 18'h19051;
    stim[36] = 18'h055cc;
    stim[37] = 18'h09d6e;
    stim[38] = 18'h07a01;
    stim[39] = 18'h103bb;
    stim[40] = 18'h17e38;
    stim[41] = 18'h0a5af;
    stim[42] = 18'h0b9d7;
    stim[43] = 18'h0fc82;
    stim[44] = 18'h196cd;
    stim[45] = 18'h11dd0;
    stim[46] = 18'h1cec3;
    stim[47] = 18'h12a07;
    stim[48] = 18'h0b5c2;
    stim[49] = 18'h07732;
    stim[50] = 18'h07f7a;
    stim[51] = 18'h0d9d8;
    stim[52] = 18'h0c293;
    stim[53] = 18'h1532b;
    stim[54] = 18'h1d3ee;
    stim[55] = 18'h11702;
    stim[56] = 18'h08d0f;
    stim[57] = 18'h0d9a1;
    stim[58] = 18'h15ff3;
    stim[59] = 18'h0d68a;
    stim[60] = 18'h19d8c;
    stim[61] = 18'h15f40;
    stim[62] = 18'h17c4b;
    stim[63] = 18'h172e8;
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
      expv[5] = 17'h00200;
      expv[6] = 17'h00200;
      expv[7] = 17'h00200;
      expv[8] = 17'h00200;
      expv[9] = 17'h00000;
      expv[10] = 17'h00000;
      expv[11] = 17'h00000;
      expv[12] = 17'h00000;
      expv[13] = 17'h00001;
      expv[14] = 17'h00000;
      expv[15] = 17'h00000;
      expv[16] = 17'h00000;
      expv[17] = 17'h00000;
      expv[18] = 17'h00000;
      expv[19] = 17'h00000;
      expv[20] = 17'h00000;
      expv[21] = 17'h00200;
      expv[22] = 17'h00200;
      expv[23] = 17'h00200;
      expv[24] = 17'h00000;
      expv[25] = 17'h00200;
      expv[26] = 17'h00200;
      expv[27] = 17'h00e00;
      expv[28] = 17'h01e00;
      expv[29] = 17'h01e00;
      expv[30] = 17'h00000;
      expv[31] = 17'h00000;
      expv[32] = 17'h00600;
      expv[33] = 17'h00e00;
      expv[34] = 17'h00e00;
      expv[35] = 17'h00000;
      expv[36] = 17'h00000;
      expv[37] = 17'h00000;
      expv[38] = 17'h00200;
      expv[39] = 17'h00600;
      expv[40] = 17'h00600;
      expv[41] = 17'h00600;
      expv[42] = 17'h00000;
      expv[43] = 17'h00000;
      expv[44] = 17'h00200;
      expv[45] = 17'h00200;
      expv[46] = 17'h00200;
      expv[47] = 17'h00200;
      expv[48] = 17'h00200;
      expv[49] = 17'h00000;
      expv[50] = 17'h00200;
      expv[51] = 17'h00200;
      expv[52] = 17'h00e00;
      expv[53] = 17'h00e00;
      expv[54] = 17'h00e00;
      expv[55] = 17'h00e00;
      expv[56] = 17'h00e00;
      expv[57] = 17'h00000;
      expv[58] = 17'h00200;
      expv[59] = 17'h00200;
      expv[60] = 17'h00000;
      expv[61] = 17'h00000;
      expv[62] = 17'h00000;
      expv[63] = 17'h00000;
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
