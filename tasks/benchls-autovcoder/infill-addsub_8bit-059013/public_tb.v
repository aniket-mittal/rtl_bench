// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 18;
  localparam OW = 18;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_059013 dut (
    .clk(clk),
    .rstn(in_vec[17:17]),
    .valid(in_vec[16:16]),
    .a(in_vec[15:8]),
    .b(in_vec[7:0]),
    .c(out_vec[17:9]),
    .d(out_vec[8:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 18'h16c7d;
    stim[1] = 18'h19a79;
    stim[2] = 18'h24063;
    stim[3] = 18'h3b98b;
    stim[4] = 18'h22e65;
    stim[5] = 18'h3e7cd;
    stim[6] = 18'h249a4;
    stim[7] = 18'h24690;
    stim[8] = 18'h38157;
    stim[9] = 18'h380c8;
    stim[10] = 18'h398f0;
    stim[11] = 18'h21f2c;
    stim[12] = 18'h24aff;
    stim[13] = 18'h3960f;
    stim[14] = 18'h336b4;
    stim[15] = 18'h3cafb;
    stim[16] = 18'h31398;
    stim[17] = 18'h385d2;
    stim[18] = 18'h375c8;
    stim[19] = 18'h3774b;
    stim[20] = 18'h3f4d3;
    stim[21] = 18'h2c03e;
    stim[22] = 18'h229c9;
    stim[23] = 18'h322f8;
    stim[24] = 18'h2838c;
    stim[25] = 18'h26294;
    stim[26] = 18'h3a7a6;
    stim[27] = 18'h3c330;
    stim[28] = 18'h284ed;
    stim[29] = 18'h3f8d3;
    stim[30] = 18'h2978d;
    stim[31] = 18'h36006;
    stim[32] = 18'h2fb6b;
    stim[33] = 18'h37106;
    stim[34] = 18'h2c352;
    stim[35] = 18'h3d034;
    stim[36] = 18'h32695;
    stim[37] = 18'h2f750;
    stim[38] = 18'h3675f;
    stim[39] = 18'h242ea;
    stim[40] = 18'h28120;
    stim[41] = 18'h2022e;
    stim[42] = 18'h2548c;
    stim[43] = 18'h30b22;
    stim[44] = 18'h361f6;
    stim[45] = 18'h21d61;
    stim[46] = 18'h31dcb;
    stim[47] = 18'h3bcee;
    stim[48] = 18'h2b2a3;
    stim[49] = 18'h3fe5b;
    stim[50] = 18'h3f3be;
    stim[51] = 18'h34e23;
    stim[52] = 18'h3a01f;
    stim[53] = 18'h2e067;
    stim[54] = 18'h2a5cf;
    stim[55] = 18'h34885;
    stim[56] = 18'h3c3db;
    stim[57] = 18'h3b36e;
    stim[58] = 18'h20d04;
    stim[59] = 18'h3f928;
    stim[60] = 18'h2f81b;
    stim[61] = 18'h2324c;
    stim[62] = 18'h264e0;
    stim[63] = 18'h35d9e;
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
      expv[0] = 18'hxxxxx;
      expv[1] = 18'h00000;
      expv[2] = 18'h00000;
      expv[3] = 18'h00000;
      expv[4] = 18'h2882e;
      expv[5] = 18'h2882e;
      expv[6] = 18'h3681a;
      expv[7] = 18'h3681a;
      expv[8] = 18'h3681a;
      expv[9] = 18'h3b12a;
      expv[10] = 18'h291b8;
      expv[11] = 18'h311a8;
      expv[12] = 18'h311a8;
      expv[13] = 18'h311a8;
      expv[14] = 18'h34b87;
      expv[15] = 18'h3d482;
      expv[16] = 18'h38bcf;
      expv[17] = 18'h3567b;
      expv[18] = 18'h2afb3;
      expv[19] = 18'h07aad;
      expv[20] = 18'h1842c;
      expv[21] = 18'h38e21;
      expv[22] = 18'h38e21;
      expv[23] = 18'h38e21;
      expv[24] = 18'h0342a;
      expv[25] = 18'h0342a;
      expv[26] = 18'h0342a;
      expv[27] = 18'h29a01;
      expv[28] = 18'h3e793;
      expv[29] = 18'h3e793;
      expv[30] = 18'h39625;
      expv[31] = 18'h39625;
      expv[32] = 18'h0cc5a;
      expv[33] = 18'h0cc5a;
      expv[34] = 18'h0ee6b;
      expv[35] = 18'h0ee6b;
      expv[36] = 18'h0099c;
      expv[37] = 18'h37691;
      expv[38] = 18'h37691;
      expv[39] = 18'h18c08;
      expv[40] = 18'h18c08;
      expv[41] = 18'h18c08;
      expv[42] = 18'h18c08;
      expv[43] = 18'h18c08;
      expv[44] = 18'h05be9;
      expv[45] = 18'h0ae6b;
      expv[46] = 18'h0ae6b;
      expv[47] = 18'h3d052;
      expv[48] = 18'h355ce;
      expv[49] = 18'h355ce;
      expv[50] = 18'h0b3a3;
      expv[51] = 18'h36235;
      expv[52] = 18'h0e22b;
      expv[53] = 18'h37f81;
      expv[54] = 18'h37f81;
      expv[55] = 18'h37f81;
      expv[56] = 18'h39ac3;
      expv[57] = 18'h33de8;
      expv[58] = 18'h04345;
      expv[59] = 18'h04345;
      expv[60] = 18'h043d1;
      expv[61] = 18'h043d1;
      expv[62] = 18'h043d1;
      expv[63] = 18'h043d1;
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
