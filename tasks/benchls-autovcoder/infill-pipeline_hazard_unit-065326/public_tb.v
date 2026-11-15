// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 40;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_065326 dut (
    .Rs1E(in_vec[39:35]),
    .Rs2E(in_vec[34:30]),
    .RdM(in_vec[29:25]),
    .RdW(in_vec[24:20]),
    .Rs1D(in_vec[19:15]),
    .Rs2D(in_vec[14:10]),
    .RdE(in_vec[9:5]),
    .ResultSrcE(in_vec[4:3]),
    .RegWriteM(in_vec[2:2]),
    .RegWriteW(in_vec[1:1]),
    .PCSrcE(in_vec[0:0]),
    .StallF(out_vec[7:7]),
    .StallD(out_vec[6:6]),
    .FlushE(out_vec[5:5]),
    .FlushD(out_vec[4:4]),
    .ForwardAE(out_vec[3:2]),
    .ForwardBE(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 40'h0dff87781b;
    stim[1] = 40'hdce46be1f1;
    stim[2] = 40'hdd29269989;
    stim[3] = 40'hf17481475d;
    stim[4] = 40'h1253ed8d9c;
    stim[5] = 40'h972614c9d9;
    stim[6] = 40'h0814a31162;
    stim[7] = 40'h944cd00c13;
    stim[8] = 40'hfaf1f0f989;
    stim[9] = 40'h7f6f185951;
    stim[10] = 40'h9f6947b670;
    stim[11] = 40'h9f8ddf0a07;
    stim[12] = 40'h9bf2950831;
    stim[13] = 40'hab9a6c7ec4;
    stim[14] = 40'h031fe9c021;
    stim[15] = 40'h368f2bed03;
    stim[16] = 40'h014663a5e3;
    stim[17] = 40'hcf662724c6;
    stim[18] = 40'h8cb061cecc;
    stim[19] = 40'ha00e5ff529;
    stim[20] = 40'h33f5e59158;
    stim[21] = 40'h7964340fcb;
    stim[22] = 40'h26a15fde8c;
    stim[23] = 40'h46dacbce84;
    stim[24] = 40'h85428e005b;
    stim[25] = 40'h97c4aeed92;
    stim[26] = 40'h6df9a7cbbf;
    stim[27] = 40'he5c704901e;
    stim[28] = 40'h948d336610;
    stim[29] = 40'h2a22452f89;
    stim[30] = 40'h8f62fcf787;
    stim[31] = 40'hab6b0c1119;
    stim[32] = 40'he3022e37e5;
    stim[33] = 40'hb03de98124;
    stim[34] = 40'h9de1534080;
    stim[35] = 40'h35c6ae0a23;
    stim[36] = 40'h7ca640b46c;
    stim[37] = 40'hee5853c7c2;
    stim[38] = 40'hbe5db7b990;
    stim[39] = 40'h64b1083095;
    stim[40] = 40'h53ca2ad7b3;
    stim[41] = 40'h9552658472;
    stim[42] = 40'h8839986591;
    stim[43] = 40'h203ef43805;
    stim[44] = 40'ha15239e4f0;
    stim[45] = 40'h74adc7b218;
    stim[46] = 40'hc698df788b;
    stim[47] = 40'hfabfb72311;
    stim[48] = 40'h2de1ef0b80;
    stim[49] = 40'he846041507;
    stim[50] = 40'hca0fce87ce;
    stim[51] = 40'h74ee9b555b;
    stim[52] = 40'he2e9dbfa14;
    stim[53] = 40'h7a29f2f2b9;
    stim[54] = 40'h3e2a8d6684;
    stim[55] = 40'h03acd7f9af;
    stim[56] = 40'h5df8098955;
    stim[57] = 40'h388bc9527c;
    stim[58] = 40'h0fbb3d8ecf;
    stim[59] = 40'hb300b3afb6;
    stim[60] = 40'hc13337f357;
    stim[61] = 40'h002c5bb829;
    stim[62] = 40'he4430fae44;
    stim[63] = 40'h8c21fb1af5;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 8'h30;
      expv[1] = 8'h30;
      expv[2] = 8'h30;
      expv[3] = 8'h30;
      expv[4] = 8'h02;
      expv[5] = 8'h30;
      expv[6] = 8'h00;
      expv[7] = 8'h30;
      expv[8] = 8'h30;
      expv[9] = 8'h30;
      expv[10] = 8'h00;
      expv[11] = 8'h30;
      expv[12] = 8'h30;
      expv[13] = 8'h00;
      expv[14] = 8'h30;
      expv[15] = 8'h30;
      expv[16] = 8'h30;
      expv[17] = 8'h00;
      expv[18] = 8'h00;
      expv[19] = 8'h30;
      expv[20] = 8'h00;
      expv[21] = 8'h30;
      expv[22] = 8'h00;
      expv[23] = 8'h00;
      expv[24] = 8'h30;
      expv[25] = 8'h00;
      expv[26] = 8'h30;
      expv[27] = 8'h00;
      expv[28] = 8'h00;
      expv[29] = 8'h30;
      expv[30] = 8'h38;
      expv[31] = 8'h30;
      expv[32] = 8'h30;
      expv[33] = 8'h00;
      expv[34] = 8'h00;
      expv[35] = 8'h30;
      expv[36] = 8'h00;
      expv[37] = 8'h00;
      expv[38] = 8'h00;
      expv[39] = 8'h30;
      expv[40] = 8'h30;
      expv[41] = 8'h00;
      expv[42] = 8'h30;
      expv[43] = 8'h30;
      expv[44] = 8'h00;
      expv[45] = 8'h00;
      expv[46] = 8'h30;
      expv[47] = 8'h30;
      expv[48] = 8'h00;
      expv[49] = 8'h30;
      expv[50] = 8'h00;
      expv[51] = 8'h30;
      expv[52] = 8'h00;
      expv[53] = 8'h30;
      expv[54] = 8'h00;
      expv[55] = 8'h30;
      expv[56] = 8'h30;
      expv[57] = 8'h00;
      expv[58] = 8'h30;
      expv[59] = 8'h00;
      expv[60] = 8'h30;
      expv[61] = 8'h30;
      expv[62] = 8'h00;
      expv[63] = 8'h32;
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
