// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_136478 dut (
    .A(in_vec[8:5]),
    .B(in_vec[4:1]),
    .Select(in_vec[0:0]),
    .Result(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h0d1;
    stim[1] = 9'h000;
    stim[2] = 9'h010;
    stim[3] = 9'h096;
    stim[4] = 9'h185;
    stim[5] = 9'h023;
    stim[6] = 9'h00a;
    stim[7] = 9'h0e8;
    stim[8] = 9'h14e;
    stim[9] = 9'h0d5;
    stim[10] = 9'h01e;
    stim[11] = 9'h0ae;
    stim[12] = 9'h121;
    stim[13] = 9'h054;
    stim[14] = 9'h1bb;
    stim[15] = 9'h114;
    stim[16] = 9'h16f;
    stim[17] = 9'h16a;
    stim[18] = 9'h1f9;
    stim[19] = 9'h063;
    stim[20] = 9'h1e7;
    stim[21] = 9'h19c;
    stim[22] = 9'h094;
    stim[23] = 9'h18f;
    stim[24] = 9'h084;
    stim[25] = 9'h025;
    stim[26] = 9'h0c0;
    stim[27] = 9'h1bd;
    stim[28] = 9'h1b6;
    stim[29] = 9'h096;
    stim[30] = 9'h08e;
    stim[31] = 9'h163;
    stim[32] = 9'h17a;
    stim[33] = 9'h0f8;
    stim[34] = 9'h067;
    stim[35] = 9'h03f;
    stim[36] = 9'h1f3;
    stim[37] = 9'h0fe;
    stim[38] = 9'h0f4;
    stim[39] = 9'h18b;
    stim[40] = 9'h100;
    stim[41] = 9'h111;
    stim[42] = 9'h045;
    stim[43] = 9'h0c0;
    stim[44] = 9'h1db;
    stim[45] = 9'h0b7;
    stim[46] = 9'h0a4;
    stim[47] = 9'h122;
    stim[48] = 9'h0c9;
    stim[49] = 9'h1ee;
    stim[50] = 9'h1bc;
    stim[51] = 9'h0fd;
    stim[52] = 9'h1f0;
    stim[53] = 9'h06c;
    stim[54] = 9'h0a3;
    stim[55] = 9'h001;
    stim[56] = 9'h09a;
    stim[57] = 9'h106;
    stim[58] = 9'h030;
    stim[59] = 9'h190;
    stim[60] = 9'h15e;
    stim[61] = 9'h164;
    stim[62] = 9'h03e;
    stim[63] = 9'h0a8;
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
      expv[0] = 32'hfffffffe;
      expv[1] = 32'h00000000;
      expv[2] = 32'hfffffffx;
      expv[3] = 32'hxxxxxxxx;
      expv[4] = 32'h00000001;
      expv[5] = 32'h0000000x;
      expv[6] = 32'h00000005;
      expv[7] = 32'hfffffffx;
      expv[8] = 32'h00000001;
      expv[9] = 32'hxxxxxxxx;
      expv[10] = 32'hffffffff;
      expv[11] = 32'hxxxxxxxx;
      expv[12] = 32'h00000000;
      expv[13] = 32'hfffffffx;
      expv[14] = 32'hfffffffd;
      expv[15] = 32'h0000000x;
      expv[16] = 32'h0000000x;
      expv[17] = 32'h00000000;
      expv[18] = 32'hffffffff;
      expv[19] = 32'hxxxxxxxx;
      expv[20] = 32'h0000000x;
      expv[21] = 32'hfffffffx;
      expv[22] = 32'hxxxxxxxx;
      expv[23] = 32'h0000000x;
      expv[24] = 32'h00000006;
      expv[25] = 32'h0000000x;
      expv[26] = 32'h00000006;
      expv[27] = 32'h00000000;
      expv[28] = 32'hfffffffx;
      expv[29] = 32'hxxxxxxxx;
      expv[30] = 32'hfffffffx;
      expv[31] = 32'h00000001;
      expv[32] = 32'hfffffffx;
      expv[33] = 32'h00000003;
      expv[34] = 32'hxxxxxxxx;
      expv[35] = 32'hxxxxxxxx;
      expv[36] = 32'hffffffff;
      expv[37] = 32'h00000006;
      expv[38] = 32'h00000001;
      expv[39] = 32'h0000000x;
      expv[40] = 32'hxxxxxxxx;
      expv[41] = 32'h00000001;
      expv[42] = 32'h0000000x;
      expv[43] = 32'h00000006;
      expv[44] = 32'hfffffffd;
      expv[45] = 32'h00000001;
      expv[46] = 32'h00000007;
      expv[47] = 32'hfffffffx;
      expv[48] = 32'hfffffffe;
      expv[49] = 32'h00000006;
      expv[50] = 32'hxxxxxxxx;
      expv[51] = 32'hxxxxxxxx;
      expv[52] = 32'h00000007;
      expv[53] = 32'hfffffffx;
      expv[54] = 32'h0000000x;
      expv[55] = 32'h00000000;
      expv[56] = 32'h00000001;
      expv[57] = 32'hxxxxxxxx;
      expv[58] = 32'hfffffffx;
      expv[59] = 32'h00000004;
      expv[60] = 32'hfffffffx;
      expv[61] = 32'hxxxxxxxx;
      expv[62] = 32'h00000000;
      expv[63] = 32'hfffffffx;
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
