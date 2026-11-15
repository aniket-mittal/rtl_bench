// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 37;
  localparam OW = 42;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_05146 dut (
    .clk(clk),
    .address(in_vec[36:35]),
    .chipselect(in_vec[34:34]),
    .reset_n(in_vec[33:33]),
    .write_n(in_vec[32:32]),
    .writedata(in_vec[31:0]),
    .out_port(out_vec[41:32]),
    .readdata(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 37'h006a32a69d;
    stim[1] = 37'h11ae871f79;
    stim[2] = 37'h1a3eb4d689;
    stim[3] = 37'h1c28033b7c;
    stim[4] = 37'h0283c95bf0;
    stim[5] = 37'h07d2e85a59;
    stim[6] = 37'h076b7396a3;
    stim[7] = 37'h1bab3d08b9;
    stim[8] = 37'h069b10c7d9;
    stim[9] = 37'h0efcdc449c;
    stim[10] = 37'h1604a765e5;
    stim[11] = 37'h1e619a2cd0;
    stim[12] = 37'h1ed3a69269;
    stim[13] = 37'h07362c9795;
    stim[14] = 37'h124d578b3b;
    stim[15] = 37'h16738b3968;
    stim[16] = 37'h1fb2084e54;
    stim[17] = 37'h0bdadaf146;
    stim[18] = 37'h0a5b571fc5;
    stim[19] = 37'h12a72085c8;
    stim[20] = 37'h14a0e2e8fe;
    stim[21] = 37'h1a42e3351a;
    stim[22] = 37'h0344817a0b;
    stim[23] = 37'h07a3a81760;
    stim[24] = 37'h0609af3223;
    stim[25] = 37'h0af2a2d037;
    stim[26] = 37'h1e01beaf13;
    stim[27] = 37'h1f29f1abb7;
    stim[28] = 37'h16f96ac947;
    stim[29] = 37'h1fd2620a3f;
    stim[30] = 37'h1255aaeadf;
    stim[31] = 37'h1a88983b0c;
    stim[32] = 37'h079750871b;
    stim[33] = 37'h032104bd50;
    stim[34] = 37'h1f4c3ae99d;
    stim[35] = 37'h024d4f58d0;
    stim[36] = 37'h1a792408e9;
    stim[37] = 37'h0e0c88d7c4;
    stim[38] = 37'h0ba39ff524;
    stim[39] = 37'h1b1b896eb0;
    stim[40] = 37'h1b3457afbb;
    stim[41] = 37'h1ee57ebcfd;
    stim[42] = 37'h064615fd90;
    stim[43] = 37'h03af150441;
    stim[44] = 37'h139c4a37bb;
    stim[45] = 37'h1e00bc5d7e;
    stim[46] = 37'h17a5f14e74;
    stim[47] = 37'h17d173aceb;
    stim[48] = 37'h0fcb0cf0bc;
    stim[49] = 37'h0313f4835d;
    stim[50] = 37'h0f4f00a036;
    stim[51] = 37'h177b2e1556;
    stim[52] = 37'h137ddc0655;
    stim[53] = 37'h0f05eee40d;
    stim[54] = 37'h0aab5c0591;
    stim[55] = 37'h1a92dd9415;
    stim[56] = 37'h17a3b91701;
    stim[57] = 37'h035d0b9b63;
    stim[58] = 37'h0eb0d2318d;
    stim[59] = 37'h0f1ee86974;
    stim[60] = 37'h1b8955a151;
    stim[61] = 37'h1b4867def7;
    stim[62] = 37'h0b8bdbc9d5;
    stim[63] = 37'h125122aaa7;
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
      expv[0] = 42'h00000000000;
      expv[1] = 42'h00000000000;
      expv[2] = 42'h00000000000;
      expv[3] = 42'h00000000000;
      expv[4] = 42'h00000000000;
      expv[5] = 42'h00000000000;
      expv[6] = 42'h00000000000;
      expv[7] = 42'h00000000000;
      expv[8] = 42'h00000000000;
      expv[9] = 42'h3d900000000;
      expv[10] = 42'h3d900000000;
      expv[11] = 42'h3d900000000;
      expv[12] = 42'h3d900000000;
      expv[13] = 42'h3d9000003d9;
      expv[14] = 42'h3d900000000;
      expv[15] = 42'h3d900000000;
      expv[16] = 42'h3d900000000;
      expv[17] = 42'h3d900000000;
      expv[18] = 42'h3d900000000;
      expv[19] = 42'h3d900000000;
      expv[20] = 42'h00000000000;
      expv[21] = 42'h00000000000;
      expv[22] = 42'h00000000000;
      expv[23] = 42'h00000000000;
      expv[24] = 42'h00000000000;
      expv[25] = 42'h22300000000;
      expv[26] = 42'h22300000000;
      expv[27] = 42'h22300000000;
      expv[28] = 42'h22300000000;
      expv[29] = 42'h22300000000;
      expv[30] = 42'h22300000000;
      expv[31] = 42'h22300000000;
      expv[32] = 42'h22300000223;
      expv[33] = 42'h22300000223;
      expv[34] = 42'h22300000000;
      expv[35] = 42'h22300000223;
      expv[36] = 42'h22300000000;
      expv[37] = 42'h22300000000;
      expv[38] = 42'h22300000000;
      expv[39] = 42'h22300000000;
      expv[40] = 42'h22300000000;
      expv[41] = 42'h22300000000;
      expv[42] = 42'h22300000223;
      expv[43] = 42'h19000000190;
      expv[44] = 42'h19000000000;
      expv[45] = 42'h19000000000;
      expv[46] = 42'h19000000000;
      expv[47] = 42'h19000000000;
      expv[48] = 42'h19000000000;
      expv[49] = 42'h19000000190;
      expv[50] = 42'h19000000000;
      expv[51] = 42'h19000000000;
      expv[52] = 42'h19000000000;
      expv[53] = 42'h19000000000;
      expv[54] = 42'h19000000000;
      expv[55] = 42'h19000000000;
      expv[56] = 42'h19000000000;
      expv[57] = 42'h19000000190;
      expv[58] = 42'h19000000000;
      expv[59] = 42'h19000000000;
      expv[60] = 42'h19000000000;
      expv[61] = 42'h19000000000;
      expv[62] = 42'h19000000000;
      expv[63] = 42'h19000000000;
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
