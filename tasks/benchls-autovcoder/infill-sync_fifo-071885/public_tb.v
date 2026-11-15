// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_071885 dut (
    .sclk(clk),
    .reset(in_vec[11:11]),
    .sclk_en(in_vec[10:10]),
    .rdreq(in_vec[9:9]),
    .wrreq(in_vec[8:8]),
    .data(in_vec[7:0]),
    .empty_n(out_vec[9:9]),
    .full_n(out_vec[8:8]),
    .q(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h935;
    stim[1] = 12'h981;
    stim[2] = 12'h421;
    stim[3] = 12'h2cf;
    stim[4] = 12'h4a7;
    stim[5] = 12'h7ce;
    stim[6] = 12'h0ec;
    stim[7] = 12'h737;
    stim[8] = 12'hcac;
    stim[9] = 12'h168;
    stim[10] = 12'h31a;
    stim[11] = 12'h2fb;
    stim[12] = 12'h641;
    stim[13] = 12'h661;
    stim[14] = 12'h1e1;
    stim[15] = 12'h22a;
    stim[16] = 12'h284;
    stim[17] = 12'h163;
    stim[18] = 12'h221;
    stim[19] = 12'h720;
    stim[20] = 12'h3f8;
    stim[21] = 12'h1c5;
    stim[22] = 12'h07d;
    stim[23] = 12'h1f0;
    stim[24] = 12'h711;
    stim[25] = 12'h735;
    stim[26] = 12'h228;
    stim[27] = 12'h083;
    stim[28] = 12'h660;
    stim[29] = 12'h5fa;
    stim[30] = 12'h313;
    stim[31] = 12'h21f;
    stim[32] = 12'h5ab;
    stim[33] = 12'h53b;
    stim[34] = 12'h4d5;
    stim[35] = 12'h3be;
    stim[36] = 12'h610;
    stim[37] = 12'h33a;
    stim[38] = 12'h364;
    stim[39] = 12'h4e2;
    stim[40] = 12'h57a;
    stim[41] = 12'h2b1;
    stim[42] = 12'h62e;
    stim[43] = 12'h4b5;
    stim[44] = 12'h745;
    stim[45] = 12'h2cb;
    stim[46] = 12'h5ed;
    stim[47] = 12'h615;
    stim[48] = 12'h3b7;
    stim[49] = 12'h46f;
    stim[50] = 12'h7ca;
    stim[51] = 12'h7c2;
    stim[52] = 12'h369;
    stim[53] = 12'h40c;
    stim[54] = 12'h653;
    stim[55] = 12'h6b1;
    stim[56] = 12'h786;
    stim[57] = 12'h19f;
    stim[58] = 12'h624;
    stim[59] = 12'h1f4;
    stim[60] = 12'h6ac;
    stim[61] = 12'h10c;
    stim[62] = 12'h310;
    stim[63] = 12'h3f1;
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
      expv[0] = 10'hxxx;
      expv[1] = 10'h100;
      expv[2] = 10'h100;
      expv[3] = 10'h1xx;
      expv[4] = 10'h1xx;
      expv[5] = 10'h1xx;
      expv[6] = 10'h1xx;
      expv[7] = 10'h1xx;
      expv[8] = 10'h3ce;
      expv[9] = 10'h100;
      expv[10] = 10'h100;
      expv[11] = 10'h100;
      expv[12] = 10'h100;
      expv[13] = 10'h137;
      expv[14] = 10'h137;
      expv[15] = 10'h137;
      expv[16] = 10'h137;
      expv[17] = 10'h137;
      expv[18] = 10'h137;
      expv[19] = 10'h137;
      expv[20] = 10'h137;
      expv[21] = 10'h137;
      expv[22] = 10'h137;
      expv[23] = 10'h137;
      expv[24] = 10'h137;
      expv[25] = 10'h320;
      expv[26] = 10'h311;
      expv[27] = 10'h311;
      expv[28] = 10'h311;
      expv[29] = 10'h335;
      expv[30] = 10'h335;
      expv[31] = 10'h335;
      expv[32] = 10'h335;
      expv[33] = 10'h335;
      expv[34] = 10'h335;
      expv[35] = 10'h335;
      expv[36] = 10'h335;
      expv[37] = 10'h3fa;
      expv[38] = 10'h3fa;
      expv[39] = 10'h3fa;
      expv[40] = 10'h3fa;
      expv[41] = 10'h3fa;
      expv[42] = 10'h3fa;
      expv[43] = 10'h3ab;
      expv[44] = 10'h3ab;
      expv[45] = 10'h33b;
      expv[46] = 10'h33b;
      expv[47] = 10'h33b;
      expv[48] = 10'h37a;
      expv[49] = 10'h37a;
      expv[50] = 10'h37a;
      expv[51] = 10'h345;
      expv[52] = 10'h3ed;
      expv[53] = 10'h3ed;
      expv[54] = 10'h3ed;
      expv[55] = 10'h3ca;
      expv[56] = 10'h3c2;
      expv[57] = 10'h1c2;
      expv[58] = 10'h1c2;
      expv[59] = 10'h386;
      expv[60] = 10'h386;
      expv[61] = 10'h186;
      expv[62] = 10'h186;
      expv[63] = 10'h186;
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
