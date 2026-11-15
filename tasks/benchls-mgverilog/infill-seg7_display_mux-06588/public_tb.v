// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 28;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_06588 dut (
    .clk(clk),
    .HEX0(in_vec[27:21]),
    .HEX1(in_vec[20:14]),
    .HEX2(in_vec[13:7]),
    .HEX3(in_vec[6:0]),
    .DISPn(out_vec[10:7]),
    .HEX(out_vec[6:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 28'h74af78c;
    stim[1] = 28'h82a3b06;
    stim[2] = 28'h83a0a3f;
    stim[3] = 28'hedaeb02;
    stim[4] = 28'hd6e8fe4;
    stim[5] = 28'h6939c7a;
    stim[6] = 28'hdc64e8e;
    stim[7] = 28'h2953582;
    stim[8] = 28'h60cc4a1;
    stim[9] = 28'hd1b828d;
    stim[10] = 28'h7935215;
    stim[11] = 28'ha403648;
    stim[12] = 28'h44acb9f;
    stim[13] = 28'h768843f;
    stim[14] = 28'h59046fc;
    stim[15] = 28'h2c0a50c;
    stim[16] = 28'h9a60219;
    stim[17] = 28'h66f1e36;
    stim[18] = 28'hd4e6c7f;
    stim[19] = 28'hcece8ce;
    stim[20] = 28'hcc9ba46;
    stim[21] = 28'h629249d;
    stim[22] = 28'hfb5f218;
    stim[23] = 28'h54fc47d;
    stim[24] = 28'h38a37e4;
    stim[25] = 28'h1edc18e;
    stim[26] = 28'hd94c1a6;
    stim[27] = 28'he51fb33;
    stim[28] = 28'h9ea70e3;
    stim[29] = 28'hd23325f;
    stim[30] = 28'ha479416;
    stim[31] = 28'hd5dcc93;
    stim[32] = 28'h1c92f79;
    stim[33] = 28'h982288d;
    stim[34] = 28'hc0da66b;
    stim[35] = 28'h6f88d6a;
    stim[36] = 28'h037b95b;
    stim[37] = 28'he2ae9df;
    stim[38] = 28'h8ba3823;
    stim[39] = 28'h6ce3a1f;
    stim[40] = 28'h285cdb3;
    stim[41] = 28'hff517f1;
    stim[42] = 28'h36feaf7;
    stim[43] = 28'hc4f10ed;
    stim[44] = 28'h44c4188;
    stim[45] = 28'h7e887b8;
    stim[46] = 28'h7e9346e;
    stim[47] = 28'h9ffefe6;
    stim[48] = 28'hd7dd9e2;
    stim[49] = 28'hd8011ee;
    stim[50] = 28'h6bcc1b9;
    stim[51] = 28'hd5f63d1;
    stim[52] = 28'hd9c431a;
    stim[53] = 28'h1a78a0d;
    stim[54] = 28'h187461e;
    stim[55] = 28'hd389bcc;
    stim[56] = 28'hcc40822;
    stim[57] = 28'h000b384;
    stim[58] = 28'hd3de2e6;
    stim[59] = 28'h3697f3a;
    stim[60] = 28'hab3111e;
    stim[61] = 28'h5ea23f2;
    stim[62] = 28'hdf58d7b;
    stim[63] = 28'h9667c64;
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
      expv[0] = 11'hxxx;
      expv[1] = 11'h0b1;
      expv[2] = 11'h0b1;
      expv[3] = 11'h0b1;
      expv[4] = 11'h0b1;
      expv[5] = 11'h0b1;
      expv[6] = 11'h0b1;
      expv[7] = 11'h0b1;
      expv[8] = 11'h0b1;
      expv[9] = 11'h0b1;
      expv[10] = 11'h0b1;
      expv[11] = 11'h0b1;
      expv[12] = 11'h0b1;
      expv[13] = 11'h0b1;
      expv[14] = 11'h0b1;
      expv[15] = 11'h0b1;
      expv[16] = 11'h0b1;
      expv[17] = 11'h0b1;
      expv[18] = 11'h0b1;
      expv[19] = 11'h0b1;
      expv[20] = 11'h0b1;
      expv[21] = 11'h0b1;
      expv[22] = 11'h0b1;
      expv[23] = 11'h0b1;
      expv[24] = 11'h0b1;
      expv[25] = 11'h0b1;
      expv[26] = 11'h0b1;
      expv[27] = 11'h0b1;
      expv[28] = 11'h0b1;
      expv[29] = 11'h0b1;
      expv[30] = 11'h0b1;
      expv[31] = 11'h0b1;
      expv[32] = 11'h0b1;
      expv[33] = 11'h0b1;
      expv[34] = 11'h0b1;
      expv[35] = 11'h0b1;
      expv[36] = 11'h0b1;
      expv[37] = 11'h0b1;
      expv[38] = 11'h0b1;
      expv[39] = 11'h0b1;
      expv[40] = 11'h0b1;
      expv[41] = 11'h0b1;
      expv[42] = 11'h0b1;
      expv[43] = 11'h0b1;
      expv[44] = 11'h0b1;
      expv[45] = 11'h0b1;
      expv[46] = 11'h0b1;
      expv[47] = 11'h0b1;
      expv[48] = 11'h0b1;
      expv[49] = 11'h0b1;
      expv[50] = 11'h0b1;
      expv[51] = 11'h0b1;
      expv[52] = 11'h0b1;
      expv[53] = 11'h0b1;
      expv[54] = 11'h0b1;
      expv[55] = 11'h0b1;
      expv[56] = 11'h0b1;
      expv[57] = 11'h0b1;
      expv[58] = 11'h0b1;
      expv[59] = 11'h0b1;
      expv[60] = 11'h0b1;
      expv[61] = 11'h0b1;
      expv[62] = 11'h0b1;
      expv[63] = 11'h0b1;
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
