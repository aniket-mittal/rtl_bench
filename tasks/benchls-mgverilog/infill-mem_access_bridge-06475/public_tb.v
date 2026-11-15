// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 23;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_06475 dut (
    .clk_i(clk),
    .areset_i(in_vec[22:22]),
    .q_i(in_vec[21:14]),
    .A_i(in_vec[13:10]),
    .D_i(in_vec[9:2]),
    .rd_i(in_vec[1:1]),
    .wr_i(in_vec[0:0]),
    .address_o(out_vec[32:17]),
    .data_o(out_vec[16:9]),
    .wren_o(out_vec[8:8]),
    .D_o(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 23'h78ddce;
    stim[1] = 23'h46f27d;
    stim[2] = 23'h3adb7e;
    stim[3] = 23'h28112f;
    stim[4] = 23'h25f46a;
    stim[5] = 23'h23ba24;
    stim[6] = 23'h027fa7;
    stim[7] = 23'h60f8af;
    stim[8] = 23'h17901e;
    stim[9] = 23'h2ed5e6;
    stim[10] = 23'h08d0b3;
    stim[11] = 23'h277fd8;
    stim[12] = 23'h3ab74a;
    stim[13] = 23'h3b8a84;
    stim[14] = 23'h24a378;
    stim[15] = 23'h2b0d43;
    stim[16] = 23'h0eaef4;
    stim[17] = 23'h042532;
    stim[18] = 23'h3f57f0;
    stim[19] = 23'h19e6d7;
    stim[20] = 23'h2ed39f;
    stim[21] = 23'h33d4f5;
    stim[22] = 23'h10c0fb;
    stim[23] = 23'h3b2519;
    stim[24] = 23'h231781;
    stim[25] = 23'h33c12f;
    stim[26] = 23'h325d0f;
    stim[27] = 23'h395bb3;
    stim[28] = 23'h39102f;
    stim[29] = 23'h1a8e3e;
    stim[30] = 23'h2a9615;
    stim[31] = 23'h1b6187;
    stim[32] = 23'h2ff483;
    stim[33] = 23'h0f2def;
    stim[34] = 23'h2bb5c2;
    stim[35] = 23'h0295a1;
    stim[36] = 23'h2f831e;
    stim[37] = 23'h17876b;
    stim[38] = 23'h30bf10;
    stim[39] = 23'h3bd5af;
    stim[40] = 23'h154abe;
    stim[41] = 23'h31d3c3;
    stim[42] = 23'h376887;
    stim[43] = 23'h38dcdf;
    stim[44] = 23'h2913d0;
    stim[45] = 23'h2e3119;
    stim[46] = 23'h1cb738;
    stim[47] = 23'h062ec1;
    stim[48] = 23'h120e50;
    stim[49] = 23'h22e1d7;
    stim[50] = 23'h3303dd;
    stim[51] = 23'h25eafe;
    stim[52] = 23'h2ec87a;
    stim[53] = 23'h031554;
    stim[54] = 23'h1df33f;
    stim[55] = 23'h1ed20a;
    stim[56] = 23'h33374b;
    stim[57] = 23'h25242d;
    stim[58] = 23'h281c20;
    stim[59] = 23'h00718d;
    stim[60] = 23'h23603e;
    stim[61] = 23'h2f34ee;
    stim[62] = 23'h07702c;
    stim[63] = 23'h1c9e26;
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
      expv[0] = 33'h000000000;
      expv[1] = 33'h000000000;
      expv[2] = 33'h000000000;
      expv[3] = 33'hxxxxx0000;
      expv[4] = 33'hxxxxx0000;
      expv[5] = 33'hxxxxx0000;
      expv[6] = 33'hxxxxx0000;
      expv[7] = 33'h000000000;
      expv[8] = 33'h000000000;
      expv[9] = 33'hxxxxx0000;
      expv[10] = 33'hxxxxx0000;
      expv[11] = 33'hxxxxx0000;
      expv[12] = 33'hxxxxx0000;
      expv[13] = 33'hxxxxx0000;
      expv[14] = 33'hxxxxx0000;
      expv[15] = 33'hxxxxx0000;
      expv[16] = 33'hxxxxx0000;
      expv[17] = 33'hxxxxx0000;
      expv[18] = 33'hxxxxx0000;
      expv[19] = 33'hxxxxx0000;
      expv[20] = 33'hxxxxx0000;
      expv[21] = 33'hxxxxx0000;
      expv[22] = 33'hxxxxx0000;
      expv[23] = 33'hxxxxx0000;
      expv[24] = 33'hxxx7c0000;
      expv[25] = 33'hxxx7c0000;
      expv[26] = 33'hxxx7c0000;
      expv[27] = 33'hxxx960000;
      expv[28] = 33'hxxx960000;
      expv[29] = 33'hxxx960000;
      expv[30] = 33'hxxx960000;
      expv[31] = 33'hxxx960000;
      expv[32] = 33'hxxx9600xx;
      expv[33] = 33'hxxx9600xx;
      expv[34] = 33'hxxx9600xx;
      expv[35] = 33'hxxx9600xx;
      expv[36] = 33'hxxx9600xx;
      expv[37] = 33'hxxx96004b;
      expv[38] = 33'hxxx96004b;
      expv[39] = 33'h1b496004b;
      expv[40] = 33'h1b496004b;
      expv[41] = 33'h1b496004b;
      expv[42] = 33'h1b496004b;
      expv[43] = 33'h1b496004b;
      expv[44] = 33'h1b496004b;
      expv[45] = 33'h1b496004b;
      expv[46] = 33'h1b496004b;
      expv[47] = 33'h1b496004b;
      expv[48] = 33'h1b496004b;
      expv[49] = 33'h1b496004b;
      expv[50] = 33'h1b49600xx;
      expv[51] = 33'h1b49600xx;
      expv[52] = 33'h1b5ee00xx;
      expv[53] = 33'h1b5ee00xx;
      expv[54] = 33'h1b5ee00xx;
      expv[55] = 33'h1b5ee00xx;
      expv[56] = 33'h1b5ee00xx;
      expv[57] = 33'h1b5ee00xx;
      expv[58] = 33'h1b5ee00xx;
      expv[59] = 33'h1b5ee00xx;
      expv[60] = 33'h1b5ee00xx;
      expv[61] = 33'h1b5ee00xx;
      expv[62] = 33'h1b5ee00xx;
      expv[63] = 33'h1b5ee00xx;
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
