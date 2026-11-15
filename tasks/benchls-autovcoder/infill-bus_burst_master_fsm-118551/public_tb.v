// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 41;
  localparam OW = 41;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_118551 dut (
    .clk(clk),
    .bus_in(in_vec[40:9]),
    .ack(in_vec[8:8]),
    .ctrl_in(in_vec[7:0]),
    .req(out_vec[40:40]),
    .bus_out(out_vec[39:8]),
    .ctrl_out(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 41'h169489fbdee;
    stim[1] = 41'h008fc79a1cb;
    stim[2] = 41'h130c6145beb;
    stim[3] = 41'h08fefe10524;
    stim[4] = 41'h17f755dd841;
    stim[5] = 41'h109fa4482f8;
    stim[6] = 41'h1fa23bd5bec;
    stim[7] = 41'h1e61d2b3d94;
    stim[8] = 41'h0c81f99c655;
    stim[9] = 41'h1d0be01e853;
    stim[10] = 41'h0c8ad234229;
    stim[11] = 41'h1659fb42ef0;
    stim[12] = 41'h0721de331da;
    stim[13] = 41'h11d96b750be;
    stim[14] = 41'h0ecf4e974a1;
    stim[15] = 41'h08cb0a99a95;
    stim[16] = 41'h11e7f4a4851;
    stim[17] = 41'h1c0c5d5a598;
    stim[18] = 41'h0b91170740d;
    stim[19] = 41'h0da83941252;
    stim[20] = 41'h07774211ed8;
    stim[21] = 41'h10b6aefe342;
    stim[22] = 41'h0e3b7dcf5f0;
    stim[23] = 41'h148f7226844;
    stim[24] = 41'h10aba0289ec;
    stim[25] = 41'h0e75922b000;
    stim[26] = 41'h0bde2638da2;
    stim[27] = 41'h1464740b71b;
    stim[28] = 41'h1454490b235;
    stim[29] = 41'h1c958b830ff;
    stim[30] = 41'h0eab3822873;
    stim[31] = 41'h0ec9bd32853;
    stim[32] = 41'h0b1de8661e4;
    stim[33] = 41'h1611a24b2e6;
    stim[34] = 41'h1038673b523;
    stim[35] = 41'h17adcf957ec;
    stim[36] = 41'h10edc37acc6;
    stim[37] = 41'h199dfc53850;
    stim[38] = 41'h009d3d4f593;
    stim[39] = 41'h15037b68055;
    stim[40] = 41'h13b75e7c2a2;
    stim[41] = 41'h0d84d44abf9;
    stim[42] = 41'h00408d6db4d;
    stim[43] = 41'h02fe744b02a;
    stim[44] = 41'h124f52631b0;
    stim[45] = 41'h043a7eb016e;
    stim[46] = 41'h0906c905881;
    stim[47] = 41'h0845c4bfa30;
    stim[48] = 41'h16084123f01;
    stim[49] = 41'h0b8c6303343;
    stim[50] = 41'h1b334d1514f;
    stim[51] = 41'h13ccac9cb07;
    stim[52] = 41'h0252b81617a;
    stim[53] = 41'h15e4512358f;
    stim[54] = 41'h0c8bc8cb732;
    stim[55] = 41'h0edbab5a083;
    stim[56] = 41'h0c260c8ea6d;
    stim[57] = 41'h1c4399065cd;
    stim[58] = 41'h029a69bf271;
    stim[59] = 41'h1c0ef1c65b4;
    stim[60] = 41'h144804e622e;
    stim[61] = 41'h0782ffb87b6;
    stim[62] = 41'h1c32d768707;
    stim[63] = 41'h0fd4aae777b;
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
      expv[0] = 41'h1xxxxxxxx08;
      expv[1] = 41'h1000000020a;
      expv[2] = 41'h1000000000a;
      expv[3] = 41'h1000000000a;
      expv[4] = 41'h1000000000a;
      expv[5] = 41'h1000000010a;
      expv[6] = 41'h1000000020a;
      expv[7] = 41'h1000000030a;
      expv[8] = 41'h0000000040a;
      expv[9] = 41'h0000000040a;
      expv[10] = 41'h0000000040a;
      expv[11] = 41'h0000000040a;
      expv[12] = 41'h0000000040a;
      expv[13] = 41'h0000000040a;
      expv[14] = 41'h0000000040a;
      expv[15] = 41'h0000000040a;
      expv[16] = 41'h0000000040a;
      expv[17] = 41'h0000000040a;
      expv[18] = 41'h0000000040a;
      expv[19] = 41'h0000000040a;
      expv[20] = 41'h0000000040a;
      expv[21] = 41'h0000000040a;
      expv[22] = 41'h0000000040a;
      expv[23] = 41'h0000000040a;
      expv[24] = 41'h0000000040a;
      expv[25] = 41'h0000000040a;
      expv[26] = 41'h0000000040a;
      expv[27] = 41'h0000000040a;
      expv[28] = 41'h0000000040a;
      expv[29] = 41'h0000000040a;
      expv[30] = 41'h0000000040a;
      expv[31] = 41'h0000000040a;
      expv[32] = 41'h0000000040a;
      expv[33] = 41'h0000000040a;
      expv[34] = 41'h0000000040a;
      expv[35] = 41'h0000000040a;
      expv[36] = 41'h0000000040a;
      expv[37] = 41'h0000000040a;
      expv[38] = 41'h0000000040a;
      expv[39] = 41'h0000000040a;
      expv[40] = 41'h0000000040a;
      expv[41] = 41'h0000000040a;
      expv[42] = 41'h0000000040a;
      expv[43] = 41'h0000000040a;
      expv[44] = 41'h0000000040a;
      expv[45] = 41'h0000000040a;
      expv[46] = 41'h0000000040a;
      expv[47] = 41'h0000000040a;
      expv[48] = 41'h0000000040a;
      expv[49] = 41'h0000000040a;
      expv[50] = 41'h0000000040a;
      expv[51] = 41'h0000000040a;
      expv[52] = 41'h0000000040a;
      expv[53] = 41'h0000000040a;
      expv[54] = 41'h0000000040a;
      expv[55] = 41'h0000000040a;
      expv[56] = 41'h0000000040a;
      expv[57] = 41'h0000000040a;
      expv[58] = 41'h0000000040a;
      expv[59] = 41'h0000000040a;
      expv[60] = 41'h0000000040a;
      expv[61] = 41'h0000000040a;
      expv[62] = 41'h0000000040a;
      expv[63] = 41'h0000000040a;
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
