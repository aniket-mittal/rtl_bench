// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 25;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_005312 dut (
    .CLK100MHZ(clk),
    .Num1(in_vec[9:6]),
    .Num2(in_vec[5:2]),
    .Op(in_vec[1:0]),
    .LED1(out_vec[24:21]),
    .LED2(out_vec[20:17]),
    .LED_Op(out_vec[16:15]),
    .AN(out_vec[14:7]),
    .display(out_vec[6:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h396;
    stim[1] = 10'h387;
    stim[2] = 10'h34b;
    stim[3] = 10'h224;
    stim[4] = 10'h1ac;
    stim[5] = 10'h3e5;
    stim[6] = 10'h255;
    stim[7] = 10'h1f2;
    stim[8] = 10'h251;
    stim[9] = 10'h122;
    stim[10] = 10'h319;
    stim[11] = 10'h202;
    stim[12] = 10'h358;
    stim[13] = 10'h030;
    stim[14] = 10'h2af;
    stim[15] = 10'h2ff;
    stim[16] = 10'h16e;
    stim[17] = 10'h0be;
    stim[18] = 10'h361;
    stim[19] = 10'h3b8;
    stim[20] = 10'h0b6;
    stim[21] = 10'h194;
    stim[22] = 10'h078;
    stim[23] = 10'h216;
    stim[24] = 10'h132;
    stim[25] = 10'h34c;
    stim[26] = 10'h22f;
    stim[27] = 10'h202;
    stim[28] = 10'h2d4;
    stim[29] = 10'h20d;
    stim[30] = 10'h2e2;
    stim[31] = 10'h374;
    stim[32] = 10'h13d;
    stim[33] = 10'h108;
    stim[34] = 10'h1de;
    stim[35] = 10'h236;
    stim[36] = 10'h0b7;
    stim[37] = 10'h384;
    stim[38] = 10'h0f5;
    stim[39] = 10'h272;
    stim[40] = 10'h0f9;
    stim[41] = 10'h238;
    stim[42] = 10'h057;
    stim[43] = 10'h28e;
    stim[44] = 10'h008;
    stim[45] = 10'h284;
    stim[46] = 10'h099;
    stim[47] = 10'h36a;
    stim[48] = 10'h13b;
    stim[49] = 10'h328;
    stim[50] = 10'h06c;
    stim[51] = 10'h23c;
    stim[52] = 10'h169;
    stim[53] = 10'h1d2;
    stim[54] = 10'h38f;
    stim[55] = 10'h2d6;
    stim[56] = 10'h237;
    stim[57] = 10'h3a1;
    stim[58] = 10'h3c7;
    stim[59] = 10'h04d;
    stim[60] = 10'h398;
    stim[61] = 10'h2fb;
    stim[62] = 10'h019;
    stim[63] = 10'h2e8;
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
      expv[0] = 25'h1cbxxxx;
      expv[1] = 25'h1c3xxxx;
      expv[2] = 25'h1a5xxxx;
      expv[3] = 25'h112xxxx;
      expv[4] = 25'h0d6xxxx;
      expv[5] = 25'h1f2xxxx;
      expv[6] = 25'h12axxxx;
      expv[7] = 25'h0f9xxxx;
      expv[8] = 25'h128xxxx;
      expv[9] = 25'h091xxxx;
      expv[10] = 25'h18cxxxx;
      expv[11] = 25'h101xxxx;
      expv[12] = 25'h1acxxxx;
      expv[13] = 25'h018xxxx;
      expv[14] = 25'h157xxxx;
      expv[15] = 25'h17fxxxx;
      expv[16] = 25'h0b7xxxx;
      expv[17] = 25'h05fxxxx;
      expv[18] = 25'h1b0xxxx;
      expv[19] = 25'h1dcxxxx;
      expv[20] = 25'h05bxxxx;
      expv[21] = 25'h0caxxxx;
      expv[22] = 25'h03cxxxx;
      expv[23] = 25'h10bxxxx;
      expv[24] = 25'h099xxxx;
      expv[25] = 25'h1a6xxxx;
      expv[26] = 25'h117xxxx;
      expv[27] = 25'h101xxxx;
      expv[28] = 25'h16axxxx;
      expv[29] = 25'h106xxxx;
      expv[30] = 25'h171xxxx;
      expv[31] = 25'h1baxxxx;
      expv[32] = 25'h09exxxx;
      expv[33] = 25'h084xxxx;
      expv[34] = 25'h0efxxxx;
      expv[35] = 25'h11bxxxx;
      expv[36] = 25'h05bxxxx;
      expv[37] = 25'h1c2xxxx;
      expv[38] = 25'h07axxxx;
      expv[39] = 25'h139xxxx;
      expv[40] = 25'h07cxxxx;
      expv[41] = 25'h11cxxxx;
      expv[42] = 25'h02bxxxx;
      expv[43] = 25'h147xxxx;
      expv[44] = 25'h004xxxx;
      expv[45] = 25'h142xxxx;
      expv[46] = 25'h04cxxxx;
      expv[47] = 25'h1b5xxxx;
      expv[48] = 25'h09dxxxx;
      expv[49] = 25'h194xxxx;
      expv[50] = 25'h036xxxx;
      expv[51] = 25'h11exxxx;
      expv[52] = 25'h0b4xxxx;
      expv[53] = 25'h0e9xxxx;
      expv[54] = 25'h1c7xxxx;
      expv[55] = 25'h16bxxxx;
      expv[56] = 25'h11bxxxx;
      expv[57] = 25'h1d0xxxx;
      expv[58] = 25'h1e3xxxx;
      expv[59] = 25'h026xxxx;
      expv[60] = 25'h1ccxxxx;
      expv[61] = 25'h17dxxxx;
      expv[62] = 25'h00cxxxx;
      expv[63] = 25'h174xxxx;
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
