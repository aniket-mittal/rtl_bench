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

  autovcoder_072289 dut (
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
    stim[0] = 12'hf7e;
    stim[1] = 12'hfab;
    stim[2] = 12'h13b;
    stim[3] = 12'h34e;
    stim[4] = 12'h003;
    stim[5] = 12'h3c2;
    stim[6] = 12'h1b6;
    stim[7] = 12'h431;
    stim[8] = 12'h385;
    stim[9] = 12'h058;
    stim[10] = 12'h132;
    stim[11] = 12'h7ba;
    stim[12] = 12'h79c;
    stim[13] = 12'h102;
    stim[14] = 12'h172;
    stim[15] = 12'h408;
    stim[16] = 12'h533;
    stim[17] = 12'h170;
    stim[18] = 12'h99b;
    stim[19] = 12'h213;
    stim[20] = 12'h7c4;
    stim[21] = 12'h321;
    stim[22] = 12'h6db;
    stim[23] = 12'h2c7;
    stim[24] = 12'h4d7;
    stim[25] = 12'h24b;
    stim[26] = 12'h1eb;
    stim[27] = 12'h744;
    stim[28] = 12'h42e;
    stim[29] = 12'h4dd;
    stim[30] = 12'h662;
    stim[31] = 12'h0e7;
    stim[32] = 12'h759;
    stim[33] = 12'h2aa;
    stim[34] = 12'h6f8;
    stim[35] = 12'h1a1;
    stim[36] = 12'h6e1;
    stim[37] = 12'h57c;
    stim[38] = 12'h242;
    stim[39] = 12'h3b0;
    stim[40] = 12'h472;
    stim[41] = 12'h578;
    stim[42] = 12'h1db;
    stim[43] = 12'h3ab;
    stim[44] = 12'h1bc;
    stim[45] = 12'h1a4;
    stim[46] = 12'h81b;
    stim[47] = 12'h569;
    stim[48] = 12'h6aa;
    stim[49] = 12'h38d;
    stim[50] = 12'h591;
    stim[51] = 12'h09c;
    stim[52] = 12'h31e;
    stim[53] = 12'h204;
    stim[54] = 12'h3bf;
    stim[55] = 12'h47e;
    stim[56] = 12'h73b;
    stim[57] = 12'h385;
    stim[58] = 12'h16b;
    stim[59] = 12'h136;
    stim[60] = 12'h78f;
    stim[61] = 12'h602;
    stim[62] = 12'h475;
    stim[63] = 12'h2c3;
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
      expv[3] = 10'h100;
      expv[4] = 10'h100;
      expv[5] = 10'h100;
      expv[6] = 10'h100;
      expv[7] = 10'h100;
      expv[8] = 10'h1ab;
      expv[9] = 10'h1ab;
      expv[10] = 10'h1ab;
      expv[11] = 10'h1ab;
      expv[12] = 10'h1ab;
      expv[13] = 10'h3ba;
      expv[14] = 10'h3ba;
      expv[15] = 10'h3ba;
      expv[16] = 10'h3ba;
      expv[17] = 10'h3ba;
      expv[18] = 10'h3ba;
      expv[19] = 10'h100;
      expv[20] = 10'h100;
      expv[21] = 10'h133;
      expv[22] = 10'h133;
      expv[23] = 10'h3c4;
      expv[24] = 10'h3c4;
      expv[25] = 10'h3c4;
      expv[26] = 10'h3c4;
      expv[27] = 10'h3c4;
      expv[28] = 10'h1c4;
      expv[29] = 10'h344;
      expv[30] = 10'h344;
      expv[31] = 10'h144;
      expv[32] = 10'h144;
      expv[33] = 10'h144;
      expv[34] = 10'h144;
      expv[35] = 10'h359;
      expv[36] = 10'h359;
      expv[37] = 10'h159;
      expv[38] = 10'h159;
      expv[39] = 10'h159;
      expv[40] = 10'h159;
      expv[41] = 10'h37c;
      expv[42] = 10'h37c;
      expv[43] = 10'h37c;
      expv[44] = 10'h37c;
      expv[45] = 10'h37c;
      expv[46] = 10'h37c;
      expv[47] = 10'h100;
      expv[48] = 10'h178;
      expv[49] = 10'h369;
      expv[50] = 10'h369;
      expv[51] = 10'h369;
      expv[52] = 10'h369;
      expv[53] = 10'h369;
      expv[54] = 10'h369;
      expv[55] = 10'h369;
      expv[56] = 10'h369;
      expv[57] = 10'h391;
      expv[58] = 10'h391;
      expv[59] = 10'h391;
      expv[60] = 10'h391;
      expv[61] = 10'h33b;
      expv[62] = 10'h38f;
      expv[63] = 10'h38f;
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
