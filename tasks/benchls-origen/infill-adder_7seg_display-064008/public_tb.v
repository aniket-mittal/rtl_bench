// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 38;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_064008 dut (
    .SW(in_vec[9:0]),
    .LEDR(out_vec[37:28]),
    .HEX5(out_vec[27:21]),
    .HEX3(out_vec[20:14]),
    .HEX1(out_vec[13:7]),
    .HEX0(out_vec[6:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h0b2;
    stim[1] = 10'h0fb;
    stim[2] = 10'h263;
    stim[3] = 10'h03e;
    stim[4] = 10'h322;
    stim[5] = 10'h047;
    stim[6] = 10'h14f;
    stim[7] = 10'h29f;
    stim[8] = 10'h103;
    stim[9] = 10'h2a0;
    stim[10] = 10'h0bf;
    stim[11] = 10'h2d5;
    stim[12] = 10'h245;
    stim[13] = 10'h377;
    stim[14] = 10'h0b6;
    stim[15] = 10'h136;
    stim[16] = 10'h02b;
    stim[17] = 10'h30d;
    stim[18] = 10'h390;
    stim[19] = 10'h197;
    stim[20] = 10'h230;
    stim[21] = 10'h046;
    stim[22] = 10'h23b;
    stim[23] = 10'h141;
    stim[24] = 10'h182;
    stim[25] = 10'h22f;
    stim[26] = 10'h1cc;
    stim[27] = 10'h0de;
    stim[28] = 10'h179;
    stim[29] = 10'h09e;
    stim[30] = 10'h310;
    stim[31] = 10'h014;
    stim[32] = 10'h366;
    stim[33] = 10'h260;
    stim[34] = 10'h277;
    stim[35] = 10'h340;
    stim[36] = 10'h167;
    stim[37] = 10'h22b;
    stim[38] = 10'h101;
    stim[39] = 10'h3dd;
    stim[40] = 10'h1c1;
    stim[41] = 10'h061;
    stim[42] = 10'h162;
    stim[43] = 10'h183;
    stim[44] = 10'h1b9;
    stim[45] = 10'h2e3;
    stim[46] = 10'h12b;
    stim[47] = 10'h3e9;
    stim[48] = 10'h30a;
    stim[49] = 10'h26f;
    stim[50] = 10'h0a3;
    stim[51] = 10'h37e;
    stim[52] = 10'h3ad;
    stim[53] = 10'h102;
    stim[54] = 10'h038;
    stim[55] = 10'h108;
    stim[56] = 10'h177;
    stim[57] = 10'h326;
    stim[58] = 10'h34b;
    stim[59] = 10'h235;
    stim[60] = 10'h017;
    stim[61] = 10'h286;
    stim[62] = 10'h221;
    stim[63] = 10'h0e8;
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
      expv[0] = 38'h00d069070e;
      expv[1] = 38'h01a1c0c908;
      expv[2] = 38'h00904c1803;
      expv[3] = 38'h0316019830;
      expv[4] = 38'h0054890778;
      expv[5] = 38'h00b33e10a1;
      expv[6] = 38'h0143239219;
      expv[7] = 38'h0182038c80;
      expv[8] = 38'h00480c1219;
      expv[9] = 38'h00a1100908;
      expv[10] = 38'h01a0638908;
      expv[11] = 38'h012424bca4;
      expv[12] = 38'h0093249803;
      expv[13] = 38'h00ff1e0879;
      expv[14] = 38'h0310609830;
      expv[15] = 38'h00a6008908;
      expv[16] = 38'h00d480c70e;
      expv[17] = 38'h00e8084706;
      expv[18] = 38'h00a2100908;
      expv[19] = 38'h03121e1830;
      expv[20] = 38'h0036101092;
      expv[21] = 38'h00a3208908;
      expv[22] = 38'h00e600c706;
      expv[23] = 38'h00633e4182;
      expv[24] = 38'h00b00910a1;
      expv[25] = 38'h0314839830;
      expv[26] = 38'h0398d19803;
      expv[27] = 38'h03b42190a1;
      expv[28] = 38'h031f041830;
      expv[29] = 38'h0372018810;
      expv[30] = 38'h002f303ca4;
      expv[31] = 38'h005f264778;
      expv[32] = 38'h00d040870e;
      expv[33] = 38'h0060500182;
      expv[34] = 38'h00ef1e0706;
      expv[35] = 38'h0053300778;
      expv[36] = 38'h00e05e0706;
      expv[37] = 38'h00d480c70e;
      expv[38] = 38'h00281e7ca4;
      expv[39] = 38'h03b42850a1;
      expv[40] = 38'h00e8de4706;
      expv[41] = 38'h00705e4810;
      expv[42] = 38'h0090491803;
      expv[43] = 38'h00c00c0146;
      expv[44] = 38'h0350640778;
      expv[45] = 38'h0310cc1830;
      expv[46] = 38'h00e480c706;
      expv[47] = 38'h0180c40c80;
      expv[48] = 38'h00b80210a1;
      expv[49] = 38'h0350438778;
      expv[50] = 38'h00d10c070e;
      expv[51] = 38'h016f018182;
      expv[52] = 38'h0181084c80;
      expv[53] = 38'h0038091092;
      expv[54] = 38'h00b60010a1;
      expv[55] = 38'h0098001803;
      expv[56] = 38'h00ff1e0879;
      expv[57] = 38'h0094809803;
      expv[58] = 38'h010320e040;
      expv[59] = 38'h0086048c80;
      expv[60] = 38'h008f3e0c80;
      expv[61] = 38'h00e0008706;
      expv[62] = 38'h00349e5092;
      expv[63] = 38'h0160c00182;
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
