// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 5;
  localparam OW = 18;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_079383 dut (
    .clk2(clk),
    .rst(in_vec[4:4]),
    .clk_20m(in_vec[3:3]),
    .wrmenu(in_vec[2:2]),
    .down(in_vec[1:1]),
    .up(in_vec[0:0]),
    .dbi(out_vec[17:10]),
    .wr(out_vec[9:9]),
    .dr(out_vec[8:8]),
    .direc(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 5'h1a;
    stim[1] = 5'h19;
    stim[2] = 5'h01;
    stim[3] = 5'h0b;
    stim[4] = 5'h09;
    stim[5] = 5'h00;
    stim[6] = 5'h06;
    stim[7] = 5'h02;
    stim[8] = 5'h07;
    stim[9] = 5'h0e;
    stim[10] = 5'h0c;
    stim[11] = 5'h0c;
    stim[12] = 5'h0f;
    stim[13] = 5'h0c;
    stim[14] = 5'h1e;
    stim[15] = 5'h03;
    stim[16] = 5'h09;
    stim[17] = 5'h09;
    stim[18] = 5'h09;
    stim[19] = 5'h03;
    stim[20] = 5'h0b;
    stim[21] = 5'h07;
    stim[22] = 5'h06;
    stim[23] = 5'h06;
    stim[24] = 5'h03;
    stim[25] = 5'h0b;
    stim[26] = 5'h07;
    stim[27] = 5'h0c;
    stim[28] = 5'h05;
    stim[29] = 5'h08;
    stim[30] = 5'h01;
    stim[31] = 5'h02;
    stim[32] = 5'h03;
    stim[33] = 5'h0c;
    stim[34] = 5'h13;
    stim[35] = 5'h0f;
    stim[36] = 5'h00;
    stim[37] = 5'h0b;
    stim[38] = 5'h09;
    stim[39] = 5'h06;
    stim[40] = 5'h0c;
    stim[41] = 5'h0d;
    stim[42] = 5'h03;
    stim[43] = 5'h0c;
    stim[44] = 5'h01;
    stim[45] = 5'h02;
    stim[46] = 5'h06;
    stim[47] = 5'h0c;
    stim[48] = 5'h0f;
    stim[49] = 5'h0f;
    stim[50] = 5'h0c;
    stim[51] = 5'h08;
    stim[52] = 5'h07;
    stim[53] = 5'h09;
    stim[54] = 5'h17;
    stim[55] = 5'h09;
    stim[56] = 5'h05;
    stim[57] = 5'h0a;
    stim[58] = 5'h08;
    stim[59] = 5'h0f;
    stim[60] = 5'h05;
    stim[61] = 5'h06;
    stim[62] = 5'h06;
    stim[63] = 5'h09;
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
      expv[0] = 18'hxxxxx;
      expv[1] = 18'hxxxxx;
      expv[2] = 18'hxxxxx;
      expv[3] = 18'hxxxxx;
      expv[4] = 18'hxxxxx;
      expv[5] = 18'hxxxxx;
      expv[6] = 18'hxxxxx;
      expv[7] = 18'hxxxxx;
      expv[8] = 18'hxxxxx;
      expv[9] = 18'hxxxxx;
      expv[10] = 18'hxxxxx;
      expv[11] = 18'hxxxxx;
      expv[12] = 18'hxxxxx;
      expv[13] = 18'hxxxxx;
      expv[14] = 18'hxxxxx;
      expv[15] = 18'hxxxxx;
      expv[16] = 18'hxxxxx;
      expv[17] = 18'hxxxxx;
      expv[18] = 18'hxxxxx;
      expv[19] = 18'hxxxxx;
      expv[20] = 18'hxxxxx;
      expv[21] = 18'hxxxxx;
      expv[22] = 18'hxxx01;
      expv[23] = 18'hxxx01;
      expv[24] = 18'hxxx01;
      expv[25] = 18'hxxx01;
      expv[26] = 18'hxxx01;
      expv[27] = 18'hxxx82;
      expv[28] = 18'hxxx82;
      expv[29] = 18'hxxx82;
      expv[30] = 18'hxxx82;
      expv[31] = 18'hxxx82;
      expv[32] = 18'hxxx82;
      expv[33] = 18'hxxx82;
      expv[34] = 18'hxxx82;
      expv[35] = 18'hxxx82;
      expv[36] = 18'h14a82;
      expv[37] = 18'h19682;
      expv[38] = 18'h19682;
      expv[39] = 18'h19682;
      expv[40] = 18'h19e82;
      expv[41] = 18'h19e82;
      expv[42] = 18'h19e82;
      expv[43] = 18'h1a682;
      expv[44] = 18'h1a682;
      expv[45] = 18'h1ce82;
      expv[46] = 18'h1ce82;
      expv[47] = 18'h1ce82;
      expv[48] = 18'h1ce82;
      expv[49] = 18'h1ce82;
      expv[50] = 18'h1ce82;
      expv[51] = 18'h1ce82;
      expv[52] = 18'h1ce82;
      expv[53] = 18'h1d282;
      expv[54] = 18'h1d282;
      expv[55] = 18'h1d082;
      expv[56] = 18'h1ca82;
      expv[57] = 18'h1be82;
      expv[58] = 18'h1be82;
      expv[59] = 18'h1be82;
      expv[60] = 18'h1be82;
      expv[61] = 18'h08282;
      expv[62] = 18'h08282;
      expv[63] = 18'h08282;
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
