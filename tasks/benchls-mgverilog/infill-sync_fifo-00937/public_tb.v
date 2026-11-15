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

  mg_00937 dut (
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
    stim[0] = 37'h1c0d926d48;
    stim[1] = 37'h1c46eaca29;
    stim[2] = 37'h0045d3bdd6;
    stim[3] = 37'h0923fc93f4;
    stim[4] = 37'h0661c802bd;
    stim[5] = 37'h0e96efbf47;
    stim[6] = 37'h02ab14f04b;
    stim[7] = 37'h0e2a300537;
    stim[8] = 37'h047ade5658;
    stim[9] = 37'h05735dff14;
    stim[10] = 37'h02e2455fba;
    stim[11] = 37'h00c06277c3;
    stim[12] = 37'h0303d072c3;
    stim[13] = 37'h045131b0d6;
    stim[14] = 37'h0c10d53ee4;
    stim[15] = 37'h1de553de2f;
    stim[16] = 37'h09d7c11d45;
    stim[17] = 37'h0eca1e3758;
    stim[18] = 37'h0a0fda99f0;
    stim[19] = 37'h060733b6d2;
    stim[20] = 37'h00de42e13f;
    stim[21] = 37'h07f13a196b;
    stim[22] = 37'h0cf316a75d;
    stim[23] = 37'h086a59b260;
    stim[24] = 37'h0264348135;
    stim[25] = 37'h0fd2c1d4e3;
    stim[26] = 37'h06d007eb21;
    stim[27] = 37'h07753f8590;
    stim[28] = 37'h049e9f891a;
    stim[29] = 37'h07e7845147;
    stim[30] = 37'h0c31d44383;
    stim[31] = 37'h0e82753982;
    stim[32] = 37'h0dd28b7de7;
    stim[33] = 37'h008549085e;
    stim[34] = 37'h03beac831f;
    stim[35] = 37'h0587ba8b93;
    stim[36] = 37'h0a57056587;
    stim[37] = 37'h032bb53ec2;
    stim[38] = 37'h0ecb12025b;
    stim[39] = 37'h0989f2f3c1;
    stim[40] = 37'h0d21b25d0a;
    stim[41] = 37'h0c9973afd6;
    stim[42] = 37'h05c8688899;
    stim[43] = 37'h08186a8992;
    stim[44] = 37'h0017eeb911;
    stim[45] = 37'h087ac78399;
    stim[46] = 37'h0880c66516;
    stim[47] = 37'h055b533adf;
    stim[48] = 37'h0e9d3578fb;
    stim[49] = 37'h00911d7bf4;
    stim[50] = 37'h0921898798;
    stim[51] = 37'h02971eff3e;
    stim[52] = 37'h0bc4dd62af;
    stim[53] = 37'h092b1ce587;
    stim[54] = 37'h07129df0b1;
    stim[55] = 37'h0847fe9b4a;
    stim[56] = 37'h0a6b9edd95;
    stim[57] = 37'h006da4e92b;
    stim[58] = 37'h022b93493f;
    stim[59] = 37'h0cde0cb6a9;
    stim[60] = 37'h0286f6bb17;
    stim[61] = 37'h05594719f2;
    stim[62] = 37'h037821f028;
    stim[63] = 37'h0be1b3cb0c;
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
      expv[14] = 34'h000000001;
      expv[15] = 34'h000000001;
      expv[16] = 34'h000000001;
      expv[17] = 34'h000000001;
      expv[18] = 34'h000000001;
      expv[19] = 34'h000000001;
      expv[20] = 34'h000000001;
      expv[21] = 34'h000000001;
      expv[22] = 34'h000000001;
      expv[23] = 34'h000000001;
      expv[24] = 34'h000000001;
      expv[25] = 34'h000000001;
      expv[26] = 34'h000000001;
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
      expv[37] = 34'h000000000;
      expv[38] = 34'h257056585;
      expv[39] = 34'h000000001;
      expv[40] = 34'h000000001;
      expv[41] = 34'h000000001;
      expv[42] = 34'h000000001;
      expv[43] = 34'h000000001;
      expv[44] = 34'h000000000;
      expv[45] = 34'h0186a8991;
      expv[46] = 34'h0186a8991;
      expv[47] = 34'h000000000;
      expv[48] = 34'h080c66515;
      expv[49] = 34'h000000001;
      expv[50] = 34'h000000001;
      expv[51] = 34'h000000001;
      expv[52] = 34'h000000001;
      expv[53] = 34'h000000000;
      expv[54] = 34'h000000000;
      expv[55] = 34'h3c4dd62ad;
      expv[56] = 34'h047fe9b48;
      expv[57] = 34'h000000001;
      expv[58] = 34'h000000001;
      expv[59] = 34'h047fe9b49;
      expv[60] = 34'h000000001;
      expv[61] = 34'h000000001;
      expv[62] = 34'h000000001;
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
