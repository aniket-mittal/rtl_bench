// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 37;
  localparam OW = 37;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_05622 dut (
    .clk(clk),
    .d(in_vec[36:0]),
    .q(out_vec[36:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 37'h0d1666eecb;
    stim[1] = 37'h1a760b4d96;
    stim[2] = 37'h04edc4b7fe;
    stim[3] = 37'h19f300dc77;
    stim[4] = 37'h0b046f3545;
    stim[5] = 37'h13065717fe;
    stim[6] = 37'h0c65f3dc3e;
    stim[7] = 37'h0f0e6141d8;
    stim[8] = 37'h1f34546b59;
    stim[9] = 37'h1d71245c80;
    stim[10] = 37'h19a992efea;
    stim[11] = 37'h022c7845a5;
    stim[12] = 37'h098f80e72a;
    stim[13] = 37'h19ad600905;
    stim[14] = 37'h04b3e9e9cb;
    stim[15] = 37'h0ee31c90ab;
    stim[16] = 37'h00ae9f98cc;
    stim[17] = 37'h0b51be63b3;
    stim[18] = 37'h0a8b9f3555;
    stim[19] = 37'h143e9d7895;
    stim[20] = 37'h10f029ec35;
    stim[21] = 37'h0073b7e4c7;
    stim[22] = 37'h01e38276ec;
    stim[23] = 37'h18ca3c8ca0;
    stim[24] = 37'h011bf14fa0;
    stim[25] = 37'h0140a819ec;
    stim[26] = 37'h176df74215;
    stim[27] = 37'h14e02d34fa;
    stim[28] = 37'h0f473ee1c2;
    stim[29] = 37'h04ccfde51a;
    stim[30] = 37'h05fef029ee;
    stim[31] = 37'h1ffdc86d8d;
    stim[32] = 37'h0dfa60859e;
    stim[33] = 37'h032317eab3;
    stim[34] = 37'h02a725d5f5;
    stim[35] = 37'h1885453a4e;
    stim[36] = 37'h05f45f761e;
    stim[37] = 37'h02d073f3bf;
    stim[38] = 37'h08362c6912;
    stim[39] = 37'h1f41c14943;
    stim[40] = 37'h00ed6585d1;
    stim[41] = 37'h04d845e9c5;
    stim[42] = 37'h1731b3dc0c;
    stim[43] = 37'h03866978df;
    stim[44] = 37'h1c88858251;
    stim[45] = 37'h167b0cee3d;
    stim[46] = 37'h0ed363ed21;
    stim[47] = 37'h045a11deb4;
    stim[48] = 37'h091b7e4e3e;
    stim[49] = 37'h013fb7aa55;
    stim[50] = 37'h08ec5cd601;
    stim[51] = 37'h03c89d6e0c;
    stim[52] = 37'h0c072fde21;
    stim[53] = 37'h0a98e46350;
    stim[54] = 37'h046578be27;
    stim[55] = 37'h1fdf3c0bd9;
    stim[56] = 37'h1ae0dd9e81;
    stim[57] = 37'h1e2790821f;
    stim[58] = 37'h1265e9eba5;
    stim[59] = 37'h071d08c264;
    stim[60] = 37'h0743353925;
    stim[61] = 37'h0ab583ebc4;
    stim[62] = 37'h0e5574b2fe;
    stim[63] = 37'h1a59ad3883;
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
      expv[0] = 37'hxxxxxxxxxx;
      expv[1] = 37'h0d1666eecb;
      expv[2] = 37'h1a760b4d96;
      expv[3] = 37'h04edc4b7fe;
      expv[4] = 37'h19f300dc77;
      expv[5] = 37'h0b046f3545;
      expv[6] = 37'h13065717fe;
      expv[7] = 37'h0c65f3dc3e;
      expv[8] = 37'h0f0e6141d8;
      expv[9] = 37'h1f34546b59;
      expv[10] = 37'h1d71245c80;
      expv[11] = 37'h19a992efea;
      expv[12] = 37'h022c7845a5;
      expv[13] = 37'h098f80e72a;
      expv[14] = 37'h19ad600905;
      expv[15] = 37'h04b3e9e9cb;
      expv[16] = 37'h0ee31c90ab;
      expv[17] = 37'h00ae9f98cc;
      expv[18] = 37'h0b51be63b3;
      expv[19] = 37'h0a8b9f3555;
      expv[20] = 37'h143e9d7895;
      expv[21] = 37'h10f029ec35;
      expv[22] = 37'h0073b7e4c7;
      expv[23] = 37'h01e38276ec;
      expv[24] = 37'h18ca3c8ca0;
      expv[25] = 37'h011bf14fa0;
      expv[26] = 37'h0140a819ec;
      expv[27] = 37'h176df74215;
      expv[28] = 37'h14e02d34fa;
      expv[29] = 37'h0f473ee1c2;
      expv[30] = 37'h04ccfde51a;
      expv[31] = 37'h05fef029ee;
      expv[32] = 37'h1ffdc86d8d;
      expv[33] = 37'h0dfa60859e;
      expv[34] = 37'h032317eab3;
      expv[35] = 37'h02a725d5f5;
      expv[36] = 37'h1885453a4e;
      expv[37] = 37'h05f45f761e;
      expv[38] = 37'h02d073f3bf;
      expv[39] = 37'h08362c6912;
      expv[40] = 37'h1f41c14943;
      expv[41] = 37'h00ed6585d1;
      expv[42] = 37'h04d845e9c5;
      expv[43] = 37'h1731b3dc0c;
      expv[44] = 37'h03866978df;
      expv[45] = 37'h1c88858251;
      expv[46] = 37'h167b0cee3d;
      expv[47] = 37'h0ed363ed21;
      expv[48] = 37'h045a11deb4;
      expv[49] = 37'h091b7e4e3e;
      expv[50] = 37'h013fb7aa55;
      expv[51] = 37'h08ec5cd601;
      expv[52] = 37'h03c89d6e0c;
      expv[53] = 37'h0c072fde21;
      expv[54] = 37'h0a98e46350;
      expv[55] = 37'h046578be27;
      expv[56] = 37'h1fdf3c0bd9;
      expv[57] = 37'h1ae0dd9e81;
      expv[58] = 37'h1e2790821f;
      expv[59] = 37'h1265e9eba5;
      expv[60] = 37'h071d08c264;
      expv[61] = 37'h0743353925;
      expv[62] = 37'h0ab583ebc4;
      expv[63] = 37'h0e5574b2fe;
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
