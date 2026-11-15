// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 35;
  localparam OW = 35;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_008424 dut (
    .ap_clk(clk),
    .ap_rst(in_vec[34:34]),
    .data_in(in_vec[33:2]),
    .vld_in(in_vec[1:1]),
    .ack_out(in_vec[0:0]),
    .ack_in(out_vec[34:34]),
    .data_out(out_vec[33:2]),
    .vld_out(out_vec[1:1]),
    .apdone_blk(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 35'h7a4109c20;
    stim[1] = 35'h57b3a3ba9;
    stim[2] = 35'h0e9cbcd08;
    stim[3] = 35'h3a6aae2d3;
    stim[4] = 35'h044cdd5c4;
    stim[5] = 35'h2a64b7611;
    stim[6] = 35'h3aeff911c;
    stim[7] = 35'h0c41095fc;
    stim[8] = 35'h15e7ffd6e;
    stim[9] = 35'h008485a1b;
    stim[10] = 35'h202ae7dd4;
    stim[11] = 35'h19c079685;
    stim[12] = 35'h2f7ed07c5;
    stim[13] = 35'h3dd19a5e2;
    stim[14] = 35'h0aaa2dc78;
    stim[15] = 35'h183b6c516;
    stim[16] = 35'h3bf8e8c20;
    stim[17] = 35'h1f7ecca61;
    stim[18] = 35'h2daf2c2be;
    stim[19] = 35'h017b15682;
    stim[20] = 35'h2f28d3f8c;
    stim[21] = 35'h36185c947;
    stim[22] = 35'h38224142b;
    stim[23] = 35'h0ef552e52;
    stim[24] = 35'h1bdf02a9c;
    stim[25] = 35'h654936114;
    stim[26] = 35'h126796698;
    stim[27] = 35'h07a51b389;
    stim[28] = 35'h346aa7bbc;
    stim[29] = 35'h2ad237658;
    stim[30] = 35'h2cda0e106;
    stim[31] = 35'h13af3aabb;
    stim[32] = 35'h3b35ff7ca;
    stim[33] = 35'h0f9270daf;
    stim[34] = 35'h31a5fe05c;
    stim[35] = 35'h3cf7a1831;
    stim[36] = 35'h497b1b7c6;
    stim[37] = 35'h0314ea73c;
    stim[38] = 35'h34d505462;
    stim[39] = 35'h026850490;
    stim[40] = 35'h372ce8854;
    stim[41] = 35'h3088987e2;
    stim[42] = 35'h019403a91;
    stim[43] = 35'h0c25c1fe4;
    stim[44] = 35'h283c2280e;
    stim[45] = 35'h22f7d492d;
    stim[46] = 35'h36a3f7965;
    stim[47] = 35'h1619501b9;
    stim[48] = 35'h31bb157c8;
    stim[49] = 35'h16c54e1d9;
    stim[50] = 35'h1f9b84635;
    stim[51] = 35'h37e4304f0;
    stim[52] = 35'h34af8dd4f;
    stim[53] = 35'h004f9c76b;
    stim[54] = 35'h0f6e3293c;
    stim[55] = 35'h1e3d883b7;
    stim[56] = 35'h175c3631f;
    stim[57] = 35'h21d879cf2;
    stim[58] = 35'h55d5ce845;
    stim[59] = 35'h372744519;
    stim[60] = 35'h3ebebd871;
    stim[61] = 35'h1ee1df667;
    stim[62] = 35'h287f6db57;
    stim[63] = 35'h3a9ec9a9d;
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
      expv[0] = 35'hxxxxxxxxx;
      expv[1] = 35'hxxxxxxxxx;
      expv[2] = 35'h17b3a3ba8;
      expv[3] = 35'h4e9cbcd08;
      expv[4] = 35'h7a6aae2d3;
      expv[5] = 35'h7a6aae2d2;
      expv[6] = 35'h6a64b7610;
      expv[7] = 35'h7aeff911c;
      expv[8] = 35'h4c41095fc;
      expv[9] = 35'h55e7ffd6e;
      expv[10] = 35'h408485a1b;
      expv[11] = 35'h408485a1a;
      expv[12] = 35'h59c079684;
      expv[13] = 35'h6f7ed07c4;
      expv[14] = 35'h7dd19a5e3;
      expv[15] = 35'h7dd19a5e3;
      expv[16] = 35'h3dd19a5e3;
      expv[17] = 35'h3dd19a5e3;
      expv[18] = 35'h583b6c517;
      expv[19] = 35'h183b6c517;
      expv[20] = 35'h183b6c517;
      expv[21] = 35'h183b6c517;
      expv[22] = 35'h6daf2c2be;
      expv[23] = 35'h78224142b;
      expv[24] = 35'h38224142b;
      expv[25] = 35'h38224142b;
      expv[26] = 35'h382241428;
      expv[27] = 35'h526796698;
      expv[28] = 35'h47a51b388;
      expv[29] = 35'h746aa7bbc;
      expv[30] = 35'h6ad237658;
      expv[31] = 35'h6cda0e106;
      expv[32] = 35'h53af3aabb;
      expv[33] = 35'h13af3aabb;
      expv[34] = 35'h7b35ff7cb;
      expv[35] = 35'h7b35ff7ca;
      expv[36] = 35'h7cf7a1830;
      expv[37] = 35'h3b35ff7c8;
      expv[38] = 35'h4314ea73c;
      expv[39] = 35'h74d505463;
      expv[40] = 35'h74d505463;
      expv[41] = 35'h74d505463;
      expv[42] = 35'h34d505463;
      expv[43] = 35'h7088987e3;
      expv[44] = 35'h7088987e3;
      expv[45] = 35'h3088987e3;
      expv[46] = 35'h683c2280e;
      expv[47] = 35'h76a3f7964;
      expv[48] = 35'h5619501b8;
      expv[49] = 35'h71bb157c8;
      expv[50] = 35'h56c54e1d8;
      expv[51] = 35'h5f9b84634;
      expv[52] = 35'h77e4304f0;
      expv[53] = 35'h74af8dd4e;
      expv[54] = 35'h404f9c76b;
      expv[55] = 35'h404f9c76a;
      expv[56] = 35'h5e3d883b6;
      expv[57] = 35'h575c3631f;
      expv[58] = 35'h175c3631f;
      expv[59] = 35'h175c3631c;
      expv[60] = 35'h772744518;
      expv[61] = 35'h7ebebd870;
      expv[62] = 35'h5ee1df666;
      expv[63] = 35'h687f6db56;
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
