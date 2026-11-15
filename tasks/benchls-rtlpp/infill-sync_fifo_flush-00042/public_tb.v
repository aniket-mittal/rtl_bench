// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 37;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00042 dut (
    .CLK(clk),
    .RESET(in_vec[36:36]),
    .ENABLE(in_vec[35:35]),
    .FLUSH(in_vec[34:34]),
    .DATA_IN(in_vec[33:2]),
    .PUSH(in_vec[1:1]),
    .POP(in_vec[0:0]),
    .DATA_OUT(out_vec[33:2]),
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
    stim[0] = 37'h1fd68c6e6f;
    stim[1] = 37'h1d3b33538f;
    stim[2] = 37'h006db790f5;
    stim[3] = 37'h081e4826fd;
    stim[4] = 37'h0eba1df582;
    stim[5] = 37'h069017c51e;
    stim[6] = 37'h0bdefd7479;
    stim[7] = 37'h0dc7b174f7;
    stim[8] = 37'h0c7515de8a;
    stim[9] = 37'h06eae906b6;
    stim[10] = 37'h0590caa7f5;
    stim[11] = 37'h074fa2fcdf;
    stim[12] = 37'h014de9fa03;
    stim[13] = 37'h0a0ee98a53;
    stim[14] = 37'h0a94baf24d;
    stim[15] = 37'h0531a56a85;
    stim[16] = 37'h0113b2eb86;
    stim[17] = 37'h02f3789e5f;
    stim[18] = 37'h0350bced5e;
    stim[19] = 37'h06a96edf54;
    stim[20] = 37'h07f5b387a2;
    stim[21] = 37'h03625893e8;
    stim[22] = 37'h061b753c4c;
    stim[23] = 37'h06861688bb;
    stim[24] = 37'h00353f88af;
    stim[25] = 37'h09013b5963;
    stim[26] = 37'h0dda6f182d;
    stim[27] = 37'h0ea52d47fd;
    stim[28] = 37'h08655aca78;
    stim[29] = 37'h0ab2243f55;
    stim[30] = 37'h095bf2b49d;
    stim[31] = 37'h0e0803e3d4;
    stim[32] = 37'h01f1101d2e;
    stim[33] = 37'h0aee757338;
    stim[34] = 37'h0e87e8d244;
    stim[35] = 37'h045bcf3b10;
    stim[36] = 37'h0e90bb5260;
    stim[37] = 37'h093810417c;
    stim[38] = 37'h00d5507607;
    stim[39] = 37'h00409fa328;
    stim[40] = 37'h06235a6fb7;
    stim[41] = 37'h0ff624f812;
    stim[42] = 37'h08d293d418;
    stim[43] = 37'h07674a3ad5;
    stim[44] = 37'h05e605b5a8;
    stim[45] = 37'h0b552617de;
    stim[46] = 37'h04f86d8769;
    stim[47] = 37'h0589fa7001;
    stim[48] = 37'h0dbcb523bc;
    stim[49] = 37'h040661fe3e;
    stim[50] = 37'h0022212016;
    stim[51] = 37'h0655487046;
    stim[52] = 37'h0665fe835e;
    stim[53] = 37'h030a95e370;
    stim[54] = 37'h000496eccc;
    stim[55] = 37'h0d7532dc41;
    stim[56] = 37'h0f12e5f3dc;
    stim[57] = 37'h0ca4b983dc;
    stim[58] = 37'h04808ef040;
    stim[59] = 37'h15228ba7dd;
    stim[60] = 37'h08e8c75883;
    stim[61] = 37'h0aa9d595a3;
    stim[62] = 37'h053e217cc1;
    stim[63] = 37'h02e6b8e124;
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
      expv[0] = 34'hxxxxxxxxx;
      expv[1] = 34'h000000001;
      expv[2] = 34'h000000001;
      expv[3] = 34'h000000001;
      expv[4] = 34'h000000001;
      expv[5] = 34'h000000001;
      expv[6] = 34'h000000001;
      expv[7] = 34'h000000001;
      expv[8] = 34'h000000001;
      expv[9] = 34'h000000001;
      expv[10] = 34'h000000001;
      expv[11] = 34'h000000001;
      expv[12] = 34'h000000001;
      expv[13] = 34'h000000001;
      expv[14] = 34'h000000000;
      expv[15] = 34'h000000000;
      expv[16] = 34'h000000001;
      expv[17] = 34'h000000001;
      expv[18] = 34'h000000001;
      expv[19] = 34'h000000001;
      expv[20] = 34'h000000001;
      expv[21] = 34'h000000001;
      expv[22] = 34'h000000001;
      expv[23] = 34'h000000001;
      expv[24] = 34'h000000001;
      expv[25] = 34'h20ee98a51;
      expv[26] = 34'h000000000;
      expv[27] = 34'h000000001;
      expv[28] = 34'h000000001;
      expv[29] = 34'h000000001;
      expv[30] = 34'h000000001;
      expv[31] = 34'h000000001;
      expv[32] = 34'h000000001;
      expv[33] = 34'h000000001;
      expv[34] = 34'h000000001;
      expv[35] = 34'h000000001;
      expv[36] = 34'h000000001;
      expv[37] = 34'h000000001;
      expv[38] = 34'h000000001;
      expv[39] = 34'h000000001;
      expv[40] = 34'h000000001;
      expv[41] = 34'h000000001;
      expv[42] = 34'h000000001;
      expv[43] = 34'h000000001;
      expv[44] = 34'h000000001;
      expv[45] = 34'h000000001;
      expv[46] = 34'h000000000;
      expv[47] = 34'h000000001;
      expv[48] = 34'h3552617dd;
      expv[49] = 34'h000000001;
      expv[50] = 34'h000000001;
      expv[51] = 34'h000000001;
      expv[52] = 34'h000000001;
      expv[53] = 34'h000000001;
      expv[54] = 34'h000000001;
      expv[55] = 34'h000000001;
      expv[56] = 34'h000000001;
      expv[57] = 34'h000000001;
      expv[58] = 34'h000000001;
      expv[59] = 34'h000000001;
      expv[60] = 34'h000000001;
      expv[61] = 34'h000000000;
      expv[62] = 34'h000000000;
      expv[63] = 34'h000000001;
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
