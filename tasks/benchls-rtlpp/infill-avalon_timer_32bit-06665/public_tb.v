// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 22;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_06665 dut (
    .clk(clk),
    .address(in_vec[21:19]),
    .chipselect(in_vec[18:18]),
    .reset_n(in_vec[17:17]),
    .write_n(in_vec[16:16]),
    .writedata(in_vec[15:0]),
    .irq(out_vec[16:16]),
    .readdata(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 22'h395f70;
    stim[1] = 22'h3dea6c;
    stim[2] = 22'h3bef08;
    stim[3] = 22'h374bfa;
    stim[4] = 22'h233b22;
    stim[5] = 22'h075339;
    stim[6] = 22'h0a3c38;
    stim[7] = 22'h26925e;
    stim[8] = 22'h3ac4e2;
    stim[9] = 22'h0fc7e3;
    stim[10] = 22'h320c7c;
    stim[11] = 22'h3239db;
    stim[12] = 22'h2f4619;
    stim[13] = 22'h1ecc2d;
    stim[14] = 22'h0b32f1;
    stim[15] = 22'h0f7143;
    stim[16] = 22'h1b2ef1;
    stim[17] = 22'h1afbf4;
    stim[18] = 22'h37b754;
    stim[19] = 22'h32bf68;
    stim[20] = 22'h262576;
    stim[21] = 22'h064125;
    stim[22] = 22'h37be27;
    stim[23] = 22'h33eb3c;
    stim[24] = 22'h3b285d;
    stim[25] = 22'h3fcac5;
    stim[26] = 22'h1b4611;
    stim[27] = 22'h02bf47;
    stim[28] = 22'h125714;
    stim[29] = 22'h0af25e;
    stim[30] = 22'h1ab116;
    stim[31] = 22'h2f547f;
    stim[32] = 22'h06f444;
    stim[33] = 22'h1f795c;
    stim[34] = 22'h02781b;
    stim[35] = 22'h27d19c;
    stim[36] = 22'h3f7fd2;
    stim[37] = 22'h0fcaf2;
    stim[38] = 22'h031f28;
    stim[39] = 22'h1f1829;
    stim[40] = 22'h274bbf;
    stim[41] = 22'h33be43;
    stim[42] = 22'h1b6ea5;
    stim[43] = 22'h3e4047;
    stim[44] = 22'h2f94ab;
    stim[45] = 22'h237b3c;
    stim[46] = 22'h3f445a;
    stim[47] = 22'h32c2f0;
    stim[48] = 22'h1f01cd;
    stim[49] = 22'h3bcd04;
    stim[50] = 22'h0eb518;
    stim[51] = 22'h1e8b83;
    stim[52] = 22'h1a1bf7;
    stim[53] = 22'h0f944b;
    stim[54] = 22'h1a32bf;
    stim[55] = 22'h239b67;
    stim[56] = 22'h36a4ec;
    stim[57] = 22'h06378e;
    stim[58] = 22'h379d93;
    stim[59] = 22'h321b28;
    stim[60] = 22'h13a671;
    stim[61] = 22'h1ad00d;
    stim[62] = 22'h02a62c;
    stim[63] = 22'h2b02f2;
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
      expv[5] = 17'h00000;
      expv[6] = 17'h00000;
      expv[7] = 17'h00000;
      expv[8] = 17'h00000;
      expv[9] = 17'h00000;
      expv[10] = 17'h00000;
      expv[11] = 17'h00000;
      expv[12] = 17'h00000;
      expv[13] = 17'h00000;
      expv[14] = 17'h00000;
      expv[15] = 17'h00000;
      expv[16] = 17'h00000;
      expv[17] = 17'h0cc2d;
      expv[18] = 17'h0cc2d;
      expv[19] = 17'h00000;
      expv[20] = 17'h00000;
      expv[21] = 17'h0c34f;
      expv[22] = 17'h00000;
      expv[23] = 17'h00000;
      expv[24] = 17'h00000;
      expv[25] = 17'h00000;
      expv[26] = 17'h00000;
      expv[27] = 17'h0cc2d;
      expv[28] = 17'h00000;
      expv[29] = 17'h0c34f;
      expv[30] = 17'h00000;
      expv[31] = 17'h0cc2d;
      expv[32] = 17'h0cc2d;
      expv[33] = 17'h00000;
      expv[34] = 17'h0cc2d;
      expv[35] = 17'h00000;
      expv[36] = 17'h0c34f;
      expv[37] = 17'h00000;
      expv[38] = 17'h00000;
      expv[39] = 17'h00000;
      expv[40] = 17'h0cc2d;
      expv[41] = 17'h0c34f;
      expv[42] = 17'h00000;
      expv[43] = 17'h0cc2d;
      expv[44] = 17'h00000;
      expv[45] = 17'h0cc2d;
      expv[46] = 17'h0c34f;
      expv[47] = 17'h00000;
      expv[48] = 17'h00000;
      expv[49] = 17'h0cc2d;
      expv[50] = 17'h00000;
      expv[51] = 17'h00000;
      expv[52] = 17'h0cc2d;
      expv[53] = 17'h08b83;
      expv[54] = 17'h00008;
      expv[55] = 17'h08b83;
      expv[56] = 17'h0c34f;
      expv[57] = 17'h00000;
      expv[58] = 17'h00000;
      expv[59] = 17'h00000;
      expv[60] = 17'h00000;
      expv[61] = 17'h0c34f;
      expv[62] = 17'h08b83;
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
