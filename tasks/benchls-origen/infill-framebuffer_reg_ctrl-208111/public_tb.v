// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 100;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_208111 dut (
    .Clock(clk),
    .ResetN(in_vec[99:99]),
    .ReadAddress(in_vec[98:67]),
    .ReadEN(in_vec[66:66]),
    .WriteAddress(in_vec[65:34]),
    .WriteData(in_vec[33:2]),
    .WriteEN(in_vec[1:1]),
    .CurrentFB(in_vec[0:0]),
    .ReadData(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 100'h0029c747da85c0af2e00f8a91;
    stim[1] = 100'h2c8c515ab572baa4b575896ef;
    stim[2] = 100'h97445a846960aa51ea7b93a74;
    stim[3] = 100'h971454502c61fb1f60c1d93c8;
    stim[4] = 100'h85f3f72d8e3d6fea626954651;
    stim[5] = 100'h9b49c3e180e8d58a3f644ca68;
    stim[6] = 100'ha8d7fe487b6692ef8441d3639;
    stim[7] = 100'hf21f8ca3fac2c2491217de7df;
    stim[8] = 100'hbb26d703cb924c13c947e8206;
    stim[9] = 100'hafb3a2cfcb74f769a93ad7873;
    stim[10] = 100'hb452964691d5f974934755b49;
    stim[11] = 100'ha1245d041cadd4bff17e5f2c9;
    stim[12] = 100'he49efc023e727de653f48ac96;
    stim[13] = 100'hb614c5daae4c3f20d9c14c18b;
    stim[14] = 100'heb377eda38afcc5513be15611;
    stim[15] = 100'h8ef83ea6ee90db71e98369fb2;
    stim[16] = 100'he0b32d1c2c41423fb8ea9da31;
    stim[17] = 100'hbfc597d60eeb6b70d42054a62;
    stim[18] = 100'he8ff3572f00ae73143642aa77;
    stim[19] = 100'hbd925e81280d2fa05d3389a4e;
    stim[20] = 100'hf7b9394719c5a5796a4a33aea;
    stim[21] = 100'ha734f201d02b404907060d271;
    stim[22] = 100'ha229dea1ddb837f85279e05f3;
    stim[23] = 100'hdae09d610d57105696a2a81a5;
    stim[24] = 100'hffaa5ac830e042e7d753af516;
    stim[25] = 100'hf0183ff1e6764dd71755b071d;
    stim[26] = 100'hdb570b517da25d7826307bb47;
    stim[27] = 100'he1879b4ae8bdd611626bca865;
    stim[28] = 100'hfb4adcbb759381ef95994740c;
    stim[29] = 100'h42439021c82e84c3d392f9180;
    stim[30] = 100'hd0c7ff3d8a4e8ac18b51f0284;
    stim[31] = 100'hedb0e46efab0045c371c62238;
    stim[32] = 100'hb6377f65c54df917a6664a743;
    stim[33] = 100'h9c5d1e5367587754dc9893d76;
    stim[34] = 100'h903345d1110707a3172a9332d;
    stim[35] = 100'h9647e4165ac1ad4f2c8f6422c;
    stim[36] = 100'hf96db972ef6e6920b3cb6bd8e;
    stim[37] = 100'hd581d7672f0ff0c5fa802dc2e;
    stim[38] = 100'h4e1aba7b2ce115dfc2f2836df;
    stim[39] = 100'h9f225f3db89830c549d1978cc;
    stim[40] = 100'haabc6aa86fade066faae3503a;
    stim[41] = 100'hd7486d037fccb4708427d1781;
    stim[42] = 100'h98675e17b1f97bac9629dd5df;
    stim[43] = 100'h87163cf62e8b75f88ff94a7a0;
    stim[44] = 100'hf11200e43419d8a85d4ab71fb;
    stim[45] = 100'hd38eb0d0ae7fd1adc53be3839;
    stim[46] = 100'h82bf4afbb7ceae0972fce0e6e;
    stim[47] = 100'hff2efa0e4d487763a9f3eb1ba;
    stim[48] = 100'hdcb33e626fa03bc533632b148;
    stim[49] = 100'he3896abfece8e23c05631ac0b;
    stim[50] = 100'h98def89b8a7dd0497952ef6c4;
    stim[51] = 100'h9fbea8cf106c95acd123eae6e;
    stim[52] = 100'hb9229e7bc76d258b26e507082;
    stim[53] = 100'h8a93d79466a1c4291ee137ba7;
    stim[54] = 100'hf53cba311d21d14a60f0eff6b;
    stim[55] = 100'hfa0996d98d1fdfba40aa76dd0;
    stim[56] = 100'hb41be67a7703c3cce23d47e73;
    stim[57] = 100'hcab804af2889de80ef755bdab;
    stim[58] = 100'hf85621b72eb7d584866c24d93;
    stim[59] = 100'hddaa777a119c4dd645a427249;
    stim[60] = 100'haa15218ec68e6ee969a21bb12;
    stim[61] = 100'hb7b5bfd785c6914231d59bc45;
    stim[62] = 100'hcd7e51496fb2686772cf8e4ec;
    stim[63] = 100'hb201e37748af5de74ed9b1fd9;
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
      expv[0] = 32'hxxxxxxxx;
      expv[1] = 32'hxxxxxxxx;
      expv[2] = 32'hxxxxxxxx;
      expv[3] = 32'h00000000;
      expv[4] = 32'h00000000;
      expv[5] = 32'h00000000;
      expv[6] = 32'h00000000;
      expv[7] = 32'h00000000;
      expv[8] = 32'h00000000;
      expv[9] = 32'h00000000;
      expv[10] = 32'h00000000;
      expv[11] = 32'h00000000;
      expv[12] = 32'h00000000;
      expv[13] = 32'h00000000;
      expv[14] = 32'h00000000;
      expv[15] = 32'h00000000;
      expv[16] = 32'h00000000;
      expv[17] = 32'h00000000;
      expv[18] = 32'h00000000;
      expv[19] = 32'h00000000;
      expv[20] = 32'h00000000;
      expv[21] = 32'h00000000;
      expv[22] = 32'h00000000;
      expv[23] = 32'h00000000;
      expv[24] = 32'h00000000;
      expv[25] = 32'h00000000;
      expv[26] = 32'h00000000;
      expv[27] = 32'h00000000;
      expv[28] = 32'h00000000;
      expv[29] = 32'h00000000;
      expv[30] = 32'h00000000;
      expv[31] = 32'h00000000;
      expv[32] = 32'h00000000;
      expv[33] = 32'h00000000;
      expv[34] = 32'h00000000;
      expv[35] = 32'h00000000;
      expv[36] = 32'h00000000;
      expv[37] = 32'h00000000;
      expv[38] = 32'h00000000;
      expv[39] = 32'h00000000;
      expv[40] = 32'h00000000;
      expv[41] = 32'h00000000;
      expv[42] = 32'h00000000;
      expv[43] = 32'h00000000;
      expv[44] = 32'h00000000;
      expv[45] = 32'h00000000;
      expv[46] = 32'h00000000;
      expv[47] = 32'h00000000;
      expv[48] = 32'h00000000;
      expv[49] = 32'h00000000;
      expv[50] = 32'h00000000;
      expv[51] = 32'h00000000;
      expv[52] = 32'h00000000;
      expv[53] = 32'h00000000;
      expv[54] = 32'h00000000;
      expv[55] = 32'h00000000;
      expv[56] = 32'h00000000;
      expv[57] = 32'h00000000;
      expv[58] = 32'h00000000;
      expv[59] = 32'h00000000;
      expv[60] = 32'h00000000;
      expv[61] = 32'h00000000;
      expv[62] = 32'h00000000;
      expv[63] = 32'h00000000;
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
