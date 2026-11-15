// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_141789 dut (
    .clk(clk),
    .rst(in_vec[7:7]),
    .enable(in_vec[6:6]),
    .data_in(in_vec[5:2]),
    .interleave_depth(in_vec[1:0]),
    .encoded_out(out_vec[8:1]),
    .valid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'hc8;
    stim[1] = 8'hfc;
    stim[2] = 8'h7d;
    stim[3] = 8'h4c;
    stim[4] = 8'h5f;
    stim[5] = 8'h5f;
    stim[6] = 8'h66;
    stim[7] = 8'h78;
    stim[8] = 8'h1a;
    stim[9] = 8'h1c;
    stim[10] = 8'h4e;
    stim[11] = 8'h01;
    stim[12] = 8'h0c;
    stim[13] = 8'h3b;
    stim[14] = 8'h74;
    stim[15] = 8'h7c;
    stim[16] = 8'h6a;
    stim[17] = 8'h25;
    stim[18] = 8'h7b;
    stim[19] = 8'h5d;
    stim[20] = 8'h6f;
    stim[21] = 8'h7d;
    stim[22] = 8'h2c;
    stim[23] = 8'h7b;
    stim[24] = 8'h2c;
    stim[25] = 8'h34;
    stim[26] = 8'h40;
    stim[27] = 8'h45;
    stim[28] = 8'h24;
    stim[29] = 8'h47;
    stim[30] = 8'h25;
    stim[31] = 8'h5b;
    stim[32] = 8'h2a;
    stim[33] = 8'h19;
    stim[34] = 8'h1d;
    stim[35] = 8'h09;
    stim[36] = 8'h17;
    stim[37] = 8'h6f;
    stim[38] = 8'h2a;
    stim[39] = 8'h11;
    stim[40] = 8'hed;
    stim[41] = 8'h6b;
    stim[42] = 8'h34;
    stim[43] = 8'h7b;
    stim[44] = 8'h12;
    stim[45] = 8'h06;
    stim[46] = 8'h16;
    stim[47] = 8'h5d;
    stim[48] = 8'h6d;
    stim[49] = 8'h36;
    stim[50] = 8'h69;
    stim[51] = 8'h69;
    stim[52] = 8'h0f;
    stim[53] = 8'h7a;
    stim[54] = 8'h76;
    stim[55] = 8'h3d;
    stim[56] = 8'h28;
    stim[57] = 8'h6a;
    stim[58] = 8'h69;
    stim[59] = 8'h1f;
    stim[60] = 8'h4b;
    stim[61] = 8'h02;
    stim[62] = 8'h1c;
    stim[63] = 8'h4c;
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
      expv[0] = 9'h000;
      expv[1] = 9'h000;
      expv[2] = 9'h000;
      expv[3] = 9'hxxx;
      expv[4] = 9'h0xx;
      expv[5] = 9'h141;
      expv[6] = 9'h195;
      expv[7] = 9'h199;
      expv[8] = 9'h0b9;
      expv[9] = 9'h0b8;
      expv[10] = 9'h0b8;
      expv[11] = 9'h12b;
      expv[12] = 9'h12a;
      expv[13] = 9'h12a;
      expv[14] = 9'h12a;
      expv[15] = 9'h153;
      expv[16] = 9'h075;
      expv[17] = 9'h007;
      expv[18] = 9'h006;
      expv[19] = 9'h1e1;
      expv[20] = 9'h13f;
      expv[21] = 9'h193;
      expv[22] = 9'h0d3;
      expv[23] = 9'h0d2;
      expv[24] = 9'h00d;
      expv[25] = 9'h00c;
      expv[26] = 9'h00c;
      expv[27] = 9'h121;
      expv[28] = 9'h013;
      expv[29] = 9'h012;
      expv[30] = 9'h121;
      expv[31] = 9'h120;
      expv[32] = 9'h127;
      expv[33] = 9'h126;
      expv[34] = 9'h126;
      expv[35] = 9'h126;
      expv[36] = 9'h126;
      expv[37] = 9'h126;
      expv[38] = 9'h0b3;
      expv[39] = 9'h0b2;
      expv[40] = 9'h000;
      expv[41] = 9'h000;
      expv[42] = 9'h0cb;
      expv[43] = 9'h0ca;
      expv[44] = 9'h1ed;
      expv[45] = 9'h1ec;
      expv[46] = 9'h1ec;
      expv[47] = 9'h1ec;
      expv[48] = 9'h13f;
      expv[49] = 9'h193;
      expv[50] = 9'h192;
      expv[51] = 9'h0d3;
      expv[52] = 9'h1f9;
      expv[53] = 9'h1f8;
      expv[54] = 9'h1ff;
      expv[55] = 9'h13f;
      expv[56] = 9'h13e;
      expv[57] = 9'h13e;
      expv[58] = 9'h06d;
      expv[59] = 9'h1f9;
      expv[60] = 9'h1f8;
      expv[61] = 9'h1ff;
      expv[62] = 9'h1fe;
      expv[63] = 9'h1fe;
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
