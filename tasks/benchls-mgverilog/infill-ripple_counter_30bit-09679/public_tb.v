// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 1;
  localparam OW = 30;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_09679 dut (
    .clk(clk),
    .count(out_vec[29:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 1'h0;
    stim[1] = 1'h0;
    stim[2] = 1'h0;
    stim[3] = 1'h0;
    stim[4] = 1'h0;
    stim[5] = 1'h0;
    stim[6] = 1'h0;
    stim[7] = 1'h0;
    stim[8] = 1'h0;
    stim[9] = 1'h0;
    stim[10] = 1'h0;
    stim[11] = 1'h0;
    stim[12] = 1'h0;
    stim[13] = 1'h0;
    stim[14] = 1'h0;
    stim[15] = 1'h0;
    stim[16] = 1'h0;
    stim[17] = 1'h0;
    stim[18] = 1'h0;
    stim[19] = 1'h0;
    stim[20] = 1'h0;
    stim[21] = 1'h0;
    stim[22] = 1'h0;
    stim[23] = 1'h0;
    stim[24] = 1'h0;
    stim[25] = 1'h0;
    stim[26] = 1'h0;
    stim[27] = 1'h0;
    stim[28] = 1'h0;
    stim[29] = 1'h0;
    stim[30] = 1'h0;
    stim[31] = 1'h0;
    stim[32] = 1'h0;
    stim[33] = 1'h0;
    stim[34] = 1'h0;
    stim[35] = 1'h0;
    stim[36] = 1'h0;
    stim[37] = 1'h0;
    stim[38] = 1'h0;
    stim[39] = 1'h0;
    stim[40] = 1'h0;
    stim[41] = 1'h0;
    stim[42] = 1'h0;
    stim[43] = 1'h0;
    stim[44] = 1'h0;
    stim[45] = 1'h0;
    stim[46] = 1'h0;
    stim[47] = 1'h0;
    stim[48] = 1'h0;
    stim[49] = 1'h0;
    stim[50] = 1'h0;
    stim[51] = 1'h0;
    stim[52] = 1'h0;
    stim[53] = 1'h0;
    stim[54] = 1'h0;
    stim[55] = 1'h0;
    stim[56] = 1'h0;
    stim[57] = 1'h0;
    stim[58] = 1'h0;
    stim[59] = 1'h0;
    stim[60] = 1'h0;
    stim[61] = 1'h0;
    stim[62] = 1'h0;
    stim[63] = 1'h0;
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
      expv[0] = 30'h00008001;
      expv[1] = 30'h00008002;
      expv[2] = 30'h00008003;
      expv[3] = 30'h00008004;
      expv[4] = 30'h00008005;
      expv[5] = 30'h00008006;
      expv[6] = 30'h00008007;
      expv[7] = 30'h00008008;
      expv[8] = 30'h00008009;
      expv[9] = 30'h0000800a;
      expv[10] = 30'h0000800b;
      expv[11] = 30'h0000800c;
      expv[12] = 30'h0000800d;
      expv[13] = 30'h0000800e;
      expv[14] = 30'h0000800f;
      expv[15] = 30'h00008010;
      expv[16] = 30'h00008011;
      expv[17] = 30'h00008012;
      expv[18] = 30'h00008013;
      expv[19] = 30'h00008014;
      expv[20] = 30'h00008015;
      expv[21] = 30'h00008016;
      expv[22] = 30'h00008017;
      expv[23] = 30'h00008018;
      expv[24] = 30'h00008019;
      expv[25] = 30'h0000801a;
      expv[26] = 30'h0000801b;
      expv[27] = 30'h0000801c;
      expv[28] = 30'h0000801d;
      expv[29] = 30'h0000801e;
      expv[30] = 30'h0000801f;
      expv[31] = 30'h00008020;
      expv[32] = 30'h00008021;
      expv[33] = 30'h00008022;
      expv[34] = 30'h00008023;
      expv[35] = 30'h00008024;
      expv[36] = 30'h00008025;
      expv[37] = 30'h00008026;
      expv[38] = 30'h00008027;
      expv[39] = 30'h00008028;
      expv[40] = 30'h00008029;
      expv[41] = 30'h0000802a;
      expv[42] = 30'h0000802b;
      expv[43] = 30'h0000802c;
      expv[44] = 30'h0000802d;
      expv[45] = 30'h0000802e;
      expv[46] = 30'h0000802f;
      expv[47] = 30'h00008030;
      expv[48] = 30'h00008031;
      expv[49] = 30'h00008032;
      expv[50] = 30'h00008033;
      expv[51] = 30'h00008034;
      expv[52] = 30'h00008035;
      expv[53] = 30'h00008036;
      expv[54] = 30'h00008037;
      expv[55] = 30'h00008038;
      expv[56] = 30'h00008039;
      expv[57] = 30'h0000803a;
      expv[58] = 30'h0000803b;
      expv[59] = 30'h0000803c;
      expv[60] = 30'h0000803d;
      expv[61] = 30'h0000803e;
      expv[62] = 30'h0000803f;
      expv[63] = 30'h00008040;
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
