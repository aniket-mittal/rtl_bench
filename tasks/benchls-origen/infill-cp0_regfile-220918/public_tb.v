// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 41;
  localparam OW = 65;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_220918 dut (
    .clk(clk),
    .rst(in_vec[40:40]),
    .Sel(in_vec[39:35]),
    .CPIn(in_vec[34:3]),
    .HWInt(in_vec[2:2]),
    .EXLSet(in_vec[1:1]),
    .EXLClr(in_vec[0:0]),
    .CPOut(out_vec[64:33]),
    .IntReq(out_vec[32:32]),
    .EPC(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 41'h1d076f720c1;
    stim[1] = 41'h100b026b924;
    stim[2] = 41'h0c9dbf1be20;
    stim[3] = 41'h07fcc107fd9;
    stim[4] = 41'h0126d2d3d36;
    stim[5] = 41'h069bbbba0af;
    stim[6] = 41'h0e432bbf9d3;
    stim[7] = 41'h016b0f24372;
    stim[8] = 41'h0c3bef47cce;
    stim[9] = 41'h02df800737a;
    stim[10] = 41'h1fac54e7857;
    stim[11] = 41'h08ab8e5b485;
    stim[12] = 41'h05d8477f76e;
    stim[13] = 41'h017c3a97354;
    stim[14] = 41'h0e956e367a8;
    stim[15] = 41'h1eca51f93b1;
    stim[16] = 41'h06b36cbf1cb;
    stim[17] = 41'h0699df1d92a;
    stim[18] = 41'h081254262c9;
    stim[19] = 41'h09049f8577b;
    stim[20] = 41'h0c736e0ad21;
    stim[21] = 41'h02b6f3289bb;
    stim[22] = 41'h0cf6e65a9c6;
    stim[23] = 41'h0f6381a2d45;
    stim[24] = 41'h0132ea99a58;
    stim[25] = 41'h00ee231d070;
    stim[26] = 41'h0c8ce3205d0;
    stim[27] = 41'h0de2ee19546;
    stim[28] = 41'h0f578b7db19;
    stim[29] = 41'h0ce5191c429;
    stim[30] = 41'h0343bd84a94;
    stim[31] = 41'h0b47a4e57ea;
    stim[32] = 41'h0ac40407004;
    stim[33] = 41'h0986095f0f4;
    stim[34] = 41'h0d8065d7800;
    stim[35] = 41'h07ceeba68da;
    stim[36] = 41'h07337f04a46;
    stim[37] = 41'h019664a6810;
    stim[38] = 41'h0991887a198;
    stim[39] = 41'h0fd1525f15a;
    stim[40] = 41'h01b469ef426;
    stim[41] = 41'h0d29b09df9b;
    stim[42] = 41'h07b4b12bade;
    stim[43] = 41'h08f40c3c4ab;
    stim[44] = 41'h16cd1c8053b;
    stim[45] = 41'h0e1c1d5d419;
    stim[46] = 41'h0315c329e09;
    stim[47] = 41'h035e5cb574a;
    stim[48] = 41'h0242a3478d1;
    stim[49] = 41'h09154a6ff71;
    stim[50] = 41'h1989d7d2c51;
    stim[51] = 41'h090544b8572;
    stim[52] = 41'h0c2287a9b2d;
    stim[53] = 41'h024b104e076;
    stim[54] = 41'h0c3a0ebe0e8;
    stim[55] = 41'h03059f109eb;
    stim[56] = 41'h0fc782cf172;
    stim[57] = 41'h0994280234d;
    stim[58] = 41'h0a0f00012a9;
    stim[59] = 41'h061c20d5a02;
    stim[60] = 41'h0253abfab21;
    stim[61] = 41'h00acd113eed;
    stim[62] = 41'h15bae52ebf9;
    stim[63] = 41'h0a26a871322;
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
      expv[0] = 65'hxxxxxxxxx00000000;
      expv[1] = 65'h00000000000000000;
      expv[2] = 65'hxxxxxxxxx00000000;
      expv[3] = 65'hxxxxxxxxx00000000;
      expv[4] = 65'hxxxxxxxxx00000000;
      expv[5] = 65'hxxxxxxxxxxxxxxxxx;
      expv[6] = 65'hxxxxxxxxxxxxxxxxx;
      expv[7] = 65'h09b4b4f4cxxxxxxxx;
      expv[8] = 65'hxxxxxxxxxxxxxxxxx;
      expv[9] = 65'hxxxxxxxxxxxxxxxxx;
      expv[10] = 65'h00000000000000000;
      expv[11] = 65'hxxxxxxxxx00000000;
      expv[12] = 65'hxxxxxxxxx00000000;
      expv[13] = 65'h1ac3c90dcxxxxxxxx;
      expv[14] = 65'hxxxxxxxxxxxxxxxxx;
      expv[15] = 65'h055b8d9ea00000000;
      expv[16] = 65'h06eeee82a00000000;
      expv[17] = 65'h0cdb2fc72xxxxxxxx;
      expv[18] = 65'hxxxxxxxxxxxxxxxxx;
      expv[19] = 65'hxxxxxxxxxxxxxxxxx;
      expv[20] = 65'h0efbd1f32xxxxxxxx;
      expv[21] = 65'h17e001cdexxxxxxxx;
      expv[22] = 65'h076fc6f88xxxxxxxx;
      expv[23] = 65'hxxxxxxxxxxxxxxxxx;
      expv[24] = 65'h1f0ea5cd4xxxxxxxx;
      expv[25] = 65'h000000000xxxxxxxx;
      expv[26] = 65'h1db996a70xxxxxxxx;
      expv[27] = 65'hxxxxxxxxxxxxxxxxx;
      expv[28] = 65'h18e068b50xxxxxxxx;
      expv[29] = 65'h0338c8174xxxxxxxx;
      expv[30] = 65'hxxxxxxxxxxxxxxxxx;
      expv[31] = 65'hxxxxxxxxxxxxxxxxx;
      expv[32] = 65'hxxxxxxxxxxxxxxxxx;
      expv[33] = 65'hxxxxxxxxxxxxxxxxx;
      expv[34] = 65'h18bb86550xxxxxxxx;
      expv[35] = 65'h1f3041ff6xxxxxxxx;
      expv[36] = 65'hxxxxxxxxxxxxxxxxx;
      expv[37] = 65'hxxxxxxxxxxxxxxxxx;
      expv[38] = 65'h018257c3cxxxxxxxx;
      expv[39] = 65'h000000000xxxxxxxx;
      expv[40] = 65'h059929a0466fe0948;
      expv[41] = 65'hxxxxxxxxx66fe0948;
      expv[42] = 65'h13bae9a3666fe0948;
      expv[43] = 65'h0ae396d2066fe0948;
      expv[44] = 65'h0677c764a00000000;
      expv[45] = 65'h10caefe7400000000;
      expv[46] = 65'h10ef612a400000000;
      expv[47] = 65'h0570ca78200000000;
      expv[48] = 65'hxxxxxxxxx66fe0948;
      expv[49] = 65'h0127e15de66fe0948;
      expv[50] = 65'h04621e86600000000;
      expv[51] = 65'h05529bfdc00000000;
      expv[52] = 65'h1cdb82b4866fe0948;
      expv[53] = 65'h10a8d1e3466fe0948;
      expv[54] = 65'h08a1ea6ca66fe0948;
      expv[55] = 65'h17972d5d266fe0948;
      expv[56] = 65'h00000000066fe0948;
      expv[57] = 65'h04621e86666fe0948;
      expv[58] = 65'hxxxxxxxxx66fe0948;
      expv[59] = 65'hxxxxxxxxx66fe0948;
      expv[60] = 65'h12c41381c66fe0948;
      expv[61] = 65'h00000000066fe0948;
      expv[62] = 65'h1611dfdda00000000;
      expv[63] = 65'h03c0004aa00000000;
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
