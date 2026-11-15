// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_09543 dut (
    .clk(clk),
    .reset(in_vec[16:16]),
    .x_in(in_vec[15:0]),
    .y_out(out_vec[63:60]),
    .p_out(out_vec[59:44]),
    .p_underflow(out_vec[43:43]),
    .p_overflow(out_vec[42:42]),
    .i_out(out_vec[41:34]),
    .i_underflow(out_vec[33:33]),
    .i_overflow(out_vec[32:32]),
    .err(out_vec[31:16]),
    .sz_out(out_vec[15:1]),
    .s_out(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h11c9c;
    stim[1] = 17'h12225;
    stim[2] = 17'h06799;
    stim[3] = 17'h0116f;
    stim[4] = 17'h07626;
    stim[5] = 17'h0a848;
    stim[6] = 17'h0ff63;
    stim[7] = 17'h00fad;
    stim[8] = 17'h007f6;
    stim[9] = 17'h0e302;
    stim[10] = 17'h03292;
    stim[11] = 17'h02864;
    stim[12] = 17'h080c1;
    stim[13] = 17'h014d8;
    stim[14] = 17'h074d4;
    stim[15] = 17'h0959b;
    stim[16] = 17'h04c89;
    stim[17] = 17'h023a6;
    stim[18] = 17'h081fa;
    stim[19] = 17'h04484;
    stim[20] = 17'h0243d;
    stim[21] = 17'h08349;
    stim[22] = 17'h0fd69;
    stim[23] = 17'h0c67e;
    stim[24] = 17'h0d03a;
    stim[25] = 17'h07f71;
    stim[26] = 17'h0da95;
    stim[27] = 17'h07ae3;
    stim[28] = 17'h07300;
    stim[29] = 17'h017fd;
    stim[30] = 17'h03842;
    stim[31] = 17'h01a4a;
    stim[32] = 17'h082bd;
    stim[33] = 17'h0fe7b;
    stim[34] = 17'h0310f;
    stim[35] = 17'h078f0;
    stim[36] = 17'h0152e;
    stim[37] = 17'h0517f;
    stim[38] = 17'h0c312;
    stim[39] = 17'h03f88;
    stim[40] = 17'h0a9dc;
    stim[41] = 17'h05606;
    stim[42] = 17'h0940c;
    stim[43] = 17'h0d92d;
    stim[44] = 17'h0c80b;
    stim[45] = 17'h08322;
    stim[46] = 17'h03470;
    stim[47] = 17'h0750f;
    stim[48] = 17'h0adff;
    stim[49] = 17'h0e12e;
    stim[50] = 17'h06262;
    stim[51] = 17'h08c91;
    stim[52] = 17'h0e58e;
    stim[53] = 17'h03300;
    stim[54] = 17'h074de;
    stim[55] = 17'h0f5e6;
    stim[56] = 17'h0b13a;
    stim[57] = 17'h00a88;
    stim[58] = 17'h033e1;
    stim[59] = 17'h0f105;
    stim[60] = 17'h0d3d4;
    stim[61] = 17'h08b29;
    stim[62] = 17'h0749f;
    stim[63] = 17'h030db;
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
      expv[0] = 64'h7000000000000000;
      expv[1] = 64'h7000000000000000;
      expv[2] = 64'h7000000000000000;
      expv[3] = 64'h7000002000000020;
      expv[4] = 64'h7001e040677b0044;
      expv[5] = 64'h7005d06011120092;
      expv[6] = 64'hf00e50807541013b;
      expv[7] = 64'h9ffc00a0a88802a3;
      expv[8] = 64'h7ff4209c00210266;
      expv[9] = 64'h701800bc0e2d0524;
      expv[10] = 64'hf06510dc01a50b07;
      expv[11] = 64'h7fbfd0fce70517a0;
      expv[12] = 64'h3122311c206f32a8;
      expv[13] = 64'hf284c11800182e0d;
      expv[14] = 64'h1fd22138839f62b6;
      expv[15] = 64'h70fa3134053559be;
      expv[16] = 64'hf63c35551111c05f;
      expv[17] = 64'h97fff160159cffff;
      expv[18] = 64'h9500115cfc88e8c5;
      expv[19] = 64'he245d159ff49d39d;
      expv[20] = 64'h9786f160098bffff;
      expv[21] = 64'h9487115cfc13e8c5;
      expv[22] = 64'hd1ccd5590770d39d;
      expv[23] = 64'hc7fff561034affff;
      expv[24] = 64'hd7fff5617d6affff;
      expv[25] = 64'hd7fff561467fffff;
      expv[26] = 64'h87fff160503bffff;
      expv[27] = 64'hd700055d0f71e8c5;
      expv[28] = 64'h87fff1605a96ffff;
      expv[29] = 64'h0700015c0ae3e8c4;
      expv[30] = 64'hb7e8c158f474d39d;
      expv[31] = 64'h021f9154f604c05e;
      expv[32] = 64'h82dfe1500a44aee3;
      expv[33] = 64'hf231054df73a9efd;
      expv[34] = 64'hc7fff56102beffff;
      expv[35] = 64'ha7fff1607e7cffff;
      expv[36] = 64'h2300115c010ee8c4;
      expv[37] = 64'hb78be1580032d39d;
      expv[38] = 64'h21c2b154f903c05e;
      expv[39] = 64'he5847551f938aee3;
      expv[40] = 64'ha7fff1604313ffff;
      expv[41] = 64'hc300155d0f87e8c5;
      expv[42] = 64'h97fff16029ddffff;
      expv[43] = 64'he500155d0605e8c5;
      expv[44] = 64'hd7fff561140dffff;
      expv[45] = 64'hd7fff561592effff;
      expv[46] = 64'hf7fff561480cffff;
      expv[47] = 64'ha7fff1600323ffff;
      expv[48] = 64'h2300115c046fe8c4;
      expv[49] = 64'hf78be559fc51d39d;
      expv[50] = 64'hc7fff5612e00ffff;
      expv[51] = 64'h87fff160612fffff;
      expv[52] = 64'hf700055df262e8c5;
      expv[53] = 64'hc7fff5610c92ffff;
      expv[54] = 64'ha7fff160658fffff;
      expv[55] = 64'h2300115c02ffe8c4;
      expv[56] = 64'hc78be158fc20d39d;
      expv[57] = 64'ha01b7160f42fffff;
      expv[58] = 64'h3b1b915cff81e8c4;
      expv[59] = 64'h1178e158f2fad39c;
      expv[60] = 64'hb3f3a154f4a7c05f;
      expv[61] = 64'h9eb1315005f2aee3;
      expv[62] = 64'hbca4914c098b9efd;
      expv[63] = 64'h784bc949066d9088;
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
