// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_142186 dut (
    .clk(clk),
    .rst(in_vec[10:10]),
    .data_in(in_vec[9:2]),
    .send(in_vec[1:1]),
    .ack(in_vec[0:0]),
    .data_out(out_vec[9:2]),
    .error(out_vec[1:1]),
    .request(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h6d0;
    stim[1] = 11'h6ac;
    stim[2] = 11'h368;
    stim[3] = 11'h394;
    stim[4] = 11'h152;
    stim[5] = 11'h158;
    stim[6] = 11'h00a;
    stim[7] = 11'h06d;
    stim[8] = 11'h350;
    stim[9] = 11'h2e4;
    stim[10] = 11'h1fc;
    stim[11] = 11'h34a;
    stim[12] = 11'h383;
    stim[13] = 11'h38c;
    stim[14] = 11'h011;
    stim[15] = 11'h217;
    stim[16] = 11'h342;
    stim[17] = 11'h2a0;
    stim[18] = 11'h29f;
    stim[19] = 11'h591;
    stim[20] = 11'h2e8;
    stim[21] = 11'h2fd;
    stim[22] = 11'h3c7;
    stim[23] = 11'h2e4;
    stim[24] = 11'h0d5;
    stim[25] = 11'h076;
    stim[26] = 11'h349;
    stim[27] = 11'h339;
    stim[28] = 11'h2ad;
    stim[29] = 11'h10e;
    stim[30] = 11'h22c;
    stim[31] = 11'h15c;
    stim[32] = 11'h300;
    stim[33] = 11'h1d9;
    stim[34] = 11'h3a5;
    stim[35] = 11'h36b;
    stim[36] = 11'h244;
    stim[37] = 11'h08b;
    stim[38] = 11'h3b8;
    stim[39] = 11'h0c4;
    stim[40] = 11'h2b3;
    stim[41] = 11'h0d9;
    stim[42] = 11'h333;
    stim[43] = 11'h2f9;
    stim[44] = 11'h347;
    stim[45] = 11'h211;
    stim[46] = 11'h250;
    stim[47] = 11'h3c9;
    stim[48] = 11'h215;
    stim[49] = 11'h0ed;
    stim[50] = 11'h2e5;
    stim[51] = 11'h2c3;
    stim[52] = 11'h39b;
    stim[53] = 11'h347;
    stim[54] = 11'h263;
    stim[55] = 11'h109;
    stim[56] = 11'h23d;
    stim[57] = 11'h3ed;
    stim[58] = 11'h216;
    stim[59] = 11'h105;
    stim[60] = 11'h39d;
    stim[61] = 11'h12f;
    stim[62] = 11'h083;
    stim[63] = 11'h20f;
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
      expv[0] = 10'h000;
      expv[1] = 10'h000;
      expv[2] = 10'h000;
      expv[3] = 10'h000;
      expv[4] = 10'h000;
      expv[5] = 10'hxxx;
      expv[6] = 10'hxxx;
      expv[7] = 10'h2ax;
      expv[8] = 10'h2ax;
      expv[9] = 10'h2ax;
      expv[10] = 10'h2ax;
      expv[11] = 10'h2ax;
      expv[12] = 10'h014;
      expv[13] = 10'h294;
      expv[14] = 10'h294;
      expv[15] = 10'h297;
      expv[16] = 10'h303;
      expv[17] = 10'h02e;
      expv[18] = 10'h02e;
      expv[19] = 10'h000;
      expv[20] = 10'h000;
      expv[21] = 10'h000;
      expv[22] = 10'h000;
      expv[23] = 10'h13c;
      expv[24] = 10'h13c;
      expv[25] = 10'h13c;
      expv[26] = 10'h38c;
      expv[27] = 10'h38c;
      expv[28] = 10'h38c;
      expv[29] = 10'h38c;
      expv[30] = 10'h0ec;
      expv[31] = 10'h0ec;
      expv[32] = 10'h0ec;
      expv[33] = 10'h0ec;
      expv[34] = 10'h0ef;
      expv[35] = 10'h0ef;
      expv[36] = 10'h21b;
      expv[37] = 10'h21b;
      expv[38] = 10'h2d6;
      expv[39] = 10'h2d6;
      expv[40] = 10'h2d6;
      expv[41] = 10'h116;
      expv[42] = 10'h117;
      expv[43] = 10'h163;
      expv[44] = 10'h163;
      expv[45] = 10'h263;
      expv[46] = 10'h263;
      expv[47] = 10'h263;
      expv[48] = 10'h263;
      expv[49] = 10'h263;
      expv[50] = 10'h263;
      expv[51] = 10'h263;
      expv[52] = 10'h28b;
      expv[53] = 10'h182;
      expv[54] = 10'h336;
      expv[55] = 10'h28e;
      expv[56] = 10'h28f;
      expv[57] = 10'h28f;
      expv[58] = 10'h28f;
      expv[59] = 10'h0c2;
      expv[60] = 10'h0c2;
      expv[61] = 10'h0c2;
      expv[62] = 10'h02e;
      expv[63] = 10'h25e;
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
