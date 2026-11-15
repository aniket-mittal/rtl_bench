// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 28;
  localparam OW = 27;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_098969 dut (
    .clk(clk),
    .rst(in_vec[27:27]),
    .median_hs(in_vec[26:26]),
    .median_vs(in_vec[25:25]),
    .median_de(in_vec[24:24]),
    .median(in_vec[23:0]),
    .hsv_hs(out_vec[26:26]),
    .hsv_vs(out_vec[25:25]),
    .hsv_de(out_vec[24:24]),
    .hsv(out_vec[23:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 28'h80da76d;
    stim[1] = 28'h9c374f7;
    stim[2] = 28'h2e897c8;
    stim[3] = 28'h7dfcb8a;
    stim[4] = 28'h6950337;
    stim[5] = 28'h3b01eb9;
    stim[6] = 28'h3961ee8;
    stim[7] = 28'h0c15ef9;
    stim[8] = 28'h5e8b652;
    stim[9] = 28'h3bd993d;
    stim[10] = 28'h0a6cc4b;
    stim[11] = 28'h5882b5e;
    stim[12] = 28'h263342e;
    stim[13] = 28'h04faee4;
    stim[14] = 28'h3878152;
    stim[15] = 28'h345eabf;
    stim[16] = 28'h011c89f;
    stim[17] = 28'h001096a;
    stim[18] = 28'h1c32eb1;
    stim[19] = 28'h3ce95ac;
    stim[20] = 28'h50d3268;
    stim[21] = 28'h2dec510;
    stim[22] = 28'h19e2a2d;
    stim[23] = 28'h0ba517e;
    stim[24] = 28'h72c2011;
    stim[25] = 28'h1995f4d;
    stim[26] = 28'h2ddcad1;
    stim[27] = 28'h4a0410a;
    stim[28] = 28'h1592126;
    stim[29] = 28'h72b6ee1;
    stim[30] = 28'h48143ad;
    stim[31] = 28'h7250f4c;
    stim[32] = 28'h53b43fa;
    stim[33] = 28'h6fcaed5;
    stim[34] = 28'h1519447;
    stim[35] = 28'h54513d9;
    stim[36] = 28'h301a87f;
    stim[37] = 28'h0b8a2d9;
    stim[38] = 28'h77f80ae;
    stim[39] = 28'h6b9fb52;
    stim[40] = 28'h46a0670;
    stim[41] = 28'h07cb842;
    stim[42] = 28'h2a534a5;
    stim[43] = 28'h7f83fe7;
    stim[44] = 28'h41c26f8;
    stim[45] = 28'h1ad0647;
    stim[46] = 28'h635b966;
    stim[47] = 28'h74bceee;
    stim[48] = 28'h2e3d585;
    stim[49] = 28'h76d08ae;
    stim[50] = 28'h343f3cb;
    stim[51] = 28'h2cfa91f;
    stim[52] = 28'h09891a8;
    stim[53] = 28'h49be7af;
    stim[54] = 28'h7b4d222;
    stim[55] = 28'h0c8e2f1;
    stim[56] = 28'h0f02937;
    stim[57] = 28'h7541948;
    stim[58] = 28'h7760fff;
    stim[59] = 28'h07ec223;
    stim[60] = 28'h76eb56e;
    stim[61] = 28'h756d0e2;
    stim[62] = 28'h6230d6e;
    stim[63] = 28'h5476b21;
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
      expv[0] = 27'hx000000;
      expv[1] = 27'h0000000;
      expv[2] = 27'h1000000;
      expv[3] = 27'h20051e8;
      expv[4] = 27'h70055df;
      expv[5] = 27'h6009295;
      expv[6] = 27'h3009bb9;
      expv[7] = 27'h300cae8;
      expv[8] = 27'h0009bf9;
      expv[9] = 27'h50096e8;
      expv[10] = 27'h30080bd;
      expv[11] = 27'h00081cc;
      expv[12] = 27'h5005d88;
      expv[13] = 27'h2003563;
      expv[14] = 27'h00095e4;
      expv[15] = 27'h3003587;
      expv[16] = 27'h300a5ea;
      expv[17] = 27'h000b7c8;
      expv[18] = 27'h000696a;
      expv[19] = 27'h10095c3;
      expv[20] = 27'h30039ce;
      expv[21] = 27'h5005b68;
      expv[22] = 27'h200cede;
      expv[23] = 27'h100749e;
      expv[24] = 27'h00069ba;
      expv[25] = 27'h7001b2c;
      expv[26] = 27'h1004c99;
      expv[27] = 27'h20013dd;
      expv[28] = 27'h40096a0;
      expv[29] = 27'h1003859;
      expv[30] = 27'h700b6e1;
      expv[31] = 27'h4006aad;
      expv[32] = 27'h7003d4c;
      expv[33] = 27'h500bffa;
      expv[34] = 27'h6004efc;
      expv[35] = 27'h1004d94;
      expv[36] = 27'h500c6d9;
      expv[37] = 27'h300a7a8;
      expv[38] = 27'h00037d9;
      expv[39] = 27'h7002fae;
      expv[40] = 27'h600a9fb;
      expv[41] = 27'h4006a70;
      expv[42] = 27'h00076b8;
      expv[43] = 27'h20071a5;
      expv[44] = 27'h700b9f8;
      expv[45] = 27'h400dcf8;
      expv[46] = 27'h100a7ad;
      expv[47] = 27'h60084b9;
      expv[48] = 27'h700a3ee;
      expv[49] = 27'h2005ee3;
      expv[50] = 27'h700a6ae;
      expv[51] = 27'h300b0f3;
      expv[52] = 27'h200b0cf;
      expv[53] = 27'h00017a8;
      expv[54] = 27'h4004ce7;
      expv[55] = 27'h700b0d2;
      expv[56] = 27'h00029f1;
      expv[57] = 27'h000c7f0;
      expv[58] = 27'h7003b54;
      expv[59] = 27'h700f0ff;
      expv[60] = 27'h0009fc2;
      expv[61] = 27'h70047b5;
      expv[62] = 27'h7008ce2;
      expv[63] = 27'h600616e;
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
