// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 19;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .clk(clk),
    .resetn(in_vec[18:18]),
    .byteena(in_vec[17:16]),
    .d(in_vec[15:0]),
    .q(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 19'h200a3;
    stim[1] = 19'h284b9;
    stim[2] = 19'h52831;
    stim[3] = 19'h71ac7;
    stim[4] = 19'h56b4a;
    stim[5] = 19'h477ee;
    stim[6] = 19'h57c3e;
    stim[7] = 19'h6f4eb;
    stim[8] = 19'h76647;
    stim[9] = 19'h63382;
    stim[10] = 19'h7efec;
    stim[11] = 19'h59920;
    stim[12] = 19'h5de4b;
    stim[13] = 19'h41f72;
    stim[14] = 19'h51524;
    stim[15] = 19'h4c7fe;
    stim[16] = 19'h654bd;
    stim[17] = 19'h6be2d;
    stim[18] = 19'h74cba;
    stim[19] = 19'h71953;
    stim[20] = 19'h5e515;
    stim[21] = 19'h6c121;
    stim[22] = 19'h4b0e2;
    stim[23] = 19'h61d2d;
    stim[24] = 19'h5586d;
    stim[25] = 19'h5ef88;
    stim[26] = 19'h719bd;
    stim[27] = 19'h52e31;
    stim[28] = 19'h5f904;
    stim[29] = 19'h5db5e;
    stim[30] = 19'h53f5b;
    stim[31] = 19'h65f3d;
    stim[32] = 19'h2c62b;
    stim[33] = 19'h7b7a4;
    stim[34] = 19'h4857b;
    stim[35] = 19'h43319;
    stim[36] = 19'h53f68;
    stim[37] = 19'h31e47;
    stim[38] = 19'h675f0;
    stim[39] = 19'h2fabf;
    stim[40] = 19'h774b9;
    stim[41] = 19'h639a4;
    stim[42] = 19'h65ca6;
    stim[43] = 19'h7f9be;
    stim[44] = 19'h5b307;
    stim[45] = 19'h59e91;
    stim[46] = 19'h488ce;
    stim[47] = 19'h64373;
    stim[48] = 19'h5555d;
    stim[49] = 19'h682af;
    stim[50] = 19'h5c8e8;
    stim[51] = 19'h5766e;
    stim[52] = 19'h7cdd6;
    stim[53] = 19'h50bde;
    stim[54] = 19'h6b028;
    stim[55] = 19'h5e7ad;
    stim[56] = 19'h4cfb8;
    stim[57] = 19'h60a45;
    stim[58] = 19'h571ef;
    stim[59] = 19'h66666;
    stim[60] = 19'h4991c;
    stim[61] = 19'h5be91;
    stim[62] = 19'h5fc5f;
    stim[63] = 19'h5f021;
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
      expv[0] = 16'h0000;
      expv[1] = 16'h0000;
      expv[2] = 16'h0000;
      expv[3] = 16'h0031;
      expv[4] = 16'h1ac7;
      expv[5] = 16'h1a4a;
      expv[6] = 16'h1a4a;
      expv[7] = 16'h1a3e;
      expv[8] = 16'hf43e;
      expv[9] = 16'h6647;
      expv[10] = 16'h3347;
      expv[11] = 16'hefec;
      expv[12] = 16'hef20;
      expv[13] = 16'hef4b;
      expv[14] = 16'hef4b;
      expv[15] = 16'hef24;
      expv[16] = 16'hef24;
      expv[17] = 16'h5424;
      expv[18] = 16'hbe24;
      expv[19] = 16'h4cba;
      expv[20] = 16'h1953;
      expv[21] = 16'h1915;
      expv[22] = 16'hc115;
      expv[23] = 16'hc115;
      expv[24] = 16'h1d15;
      expv[25] = 16'h1d6d;
      expv[26] = 16'h1d88;
      expv[27] = 16'h19bd;
      expv[28] = 16'h1931;
      expv[29] = 16'h1904;
      expv[30] = 16'h195e;
      expv[31] = 16'h195b;
      expv[32] = 16'h0000;
      expv[33] = 16'h0000;
      expv[34] = 16'hb7a4;
      expv[35] = 16'hb7a4;
      expv[36] = 16'hb7a4;
      expv[37] = 16'h0000;
      expv[38] = 16'h0000;
      expv[39] = 16'h0000;
      expv[40] = 16'h0000;
      expv[41] = 16'h74b9;
      expv[42] = 16'h39b9;
      expv[43] = 16'h5cb9;
      expv[44] = 16'hf9be;
      expv[45] = 16'hf907;
      expv[46] = 16'hf991;
      expv[47] = 16'hf991;
      expv[48] = 16'h4391;
      expv[49] = 16'h435d;
      expv[50] = 16'h825d;
      expv[51] = 16'h82e8;
      expv[52] = 16'h826e;
      expv[53] = 16'hcdd6;
      expv[54] = 16'hcdde;
      expv[55] = 16'hb0de;
      expv[56] = 16'hb0ad;
      expv[57] = 16'hb0ad;
      expv[58] = 16'h0aad;
      expv[59] = 16'h0aef;
      expv[60] = 16'h66ef;
      expv[61] = 16'h66ef;
      expv[62] = 16'h6691;
      expv[63] = 16'h665f;
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
