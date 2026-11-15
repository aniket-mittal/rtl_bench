// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 67;
  localparam OW = 66;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  long_to_double dut (
    .clk(clk),
    .input_a(in_vec[66:3]),
    .input_a_stb(in_vec[2:2]),
    .output_z_ack(in_vec[1:1]),
    .rst(in_vec[0:0]),
    .output_z(out_vec[65:2]),
    .output_z_stb(out_vec[1:1]),
    .input_a_ack(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 67'h590ebd4335ef19a35;
    stim[1] = 67'h3c40435684a75889d;
    stim[2] = 67'h0a1624dea1bcbc1e8;
    stim[3] = 67'h74d143a65d2978077;
    stim[4] = 67'h4f7d8030a0433d434;
    stim[5] = 67'h2374a307a42118da8;
    stim[6] = 67'h68d665029ae39f5b6;
    stim[7] = 67'h7a87e17566366c630;
    stim[8] = 67'h73e0a52b1d9034590;
    stim[9] = 67'h22ca99ea93f81ba1a;
    stim[10] = 67'h1b9a97828c7c539d8;
    stim[11] = 67'h153cf299d6b217fc8;
    stim[12] = 67'h32d910c5eab1677e6;
    stim[13] = 67'h6b1673991248f22e4;
    stim[14] = 67'h255f6498319e6528a;
    stim[15] = 67'h2013832f7fc479a62;
    stim[16] = 67'h4d0daf480588211d6;
    stim[17] = 67'h1cd468df2e55ffb24;
    stim[18] = 67'h1adc5d198517538fa;
    stim[19] = 67'h1d1210ca01ff96d98;
    stim[20] = 67'h280fd9d03205bb5aa;
    stim[21] = 67'h4e75cbd60c5e3fff4;
    stim[22] = 67'h03461045a43866109;
    stim[23] = 67'h284e61d74a5e3d054;
    stim[24] = 67'h33b765d36d258148a;
    stim[25] = 67'h719f0658ee825f204;
    stim[26] = 67'h78723522fdea4ddad;
    stim[27] = 67'h3127246563f89c438;
    stim[28] = 67'h743b76796af43d30e;
    stim[29] = 67'h5cb257163f9e0e26c;
    stim[30] = 67'h7258f6e248dca9b0a;
    stim[31] = 67'h5064242924f66b7b8;
    stim[32] = 67'h740b9f1a5e020d040;
    stim[33] = 67'h6fe0c1c50da5add88;
    stim[34] = 67'h162c6e08ab1935a3c;
    stim[35] = 67'h7776d88e50277ead2;
    stim[36] = 67'h27e3fab7c5f6f14a6;
    stim[37] = 67'h2c1670157be7e952e;
    stim[38] = 67'h6395e0f7c006a18e4;
    stim[39] = 67'h21c78fa1a9d6b6756;
    stim[40] = 67'h5e4230e05ad7ff9bc;
    stim[41] = 67'h5994b85bc162f28d8;
    stim[42] = 67'h167330c1852d05939;
    stim[43] = 67'h16042b6b7c5048d38;
    stim[44] = 67'h1ff37e19ee6b5f4e2;
    stim[45] = 67'h5f0e229e0bc714274;
    stim[46] = 67'h1d0b58f3f8140b528;
    stim[47] = 67'h6de0f04ca0d41854c;
    stim[48] = 67'h031bdfd48c7bad848;
    stim[49] = 67'h15d160b44d9537f4e;
    stim[50] = 67'h31135e6f13f275fa6;
    stim[51] = 67'h2585f60c7ed02a218;
    stim[52] = 67'h146282ecedc538fb6;
    stim[53] = 67'h07235d36f07df8738;
    stim[54] = 67'h21b4900f9e270fb46;
    stim[55] = 67'h471d5e4a0de0fe784;
    stim[56] = 67'h40e1b25817ea82af8;
    stim[57] = 67'h3c06de14c7174f586;
    stim[58] = 67'h0eb2eeee7644fe8a8;
    stim[59] = 67'h69c5dfea739855744;
    stim[60] = 67'h6c19d20b3562a4786;
    stim[61] = 67'h5115cd7003431f06a;
    stim[62] = 67'h11b31c65abe17841e;
    stim[63] = 67'h60a24caa4acef67c0;
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
      expv[0] = 66'hxxxxxxxxxxxxxxxxx;
      expv[1] = 66'hxxxxxxxxxxxxxxxxx;
      expv[2] = 66'hxxxxxxxxxxxxxxxxx;
      expv[3] = 66'hxxxxxxxxxxxxxxxxx;
      expv[4] = 66'hxxxxxxxxxxxxxxxxx;
      expv[5] = 66'hxxxxxxxxxxxxxxxxx;
      expv[6] = 66'hxxxxxxxxxxxxxxxxx;
      expv[7] = 66'hxxxxxxxxxxxxxxxxx;
      expv[8] = 66'hxxxxxxxxxxxxxxxxx;
      expv[9] = 66'hxxxxxxxxxxxxxxxxx;
      expv[10] = 66'hxxxxxxxxxxxxxxxxx;
      expv[11] = 66'hxxxxxxxxxxxxxxxxx;
      expv[12] = 66'hxxxxxxxxxxxxxxxxx;
      expv[13] = 66'hxxxxxxxxxxxxxxxxx;
      expv[14] = 66'hxxxxxxxxxxxxxxxxx;
      expv[15] = 66'h30f1ca66bf5947186;
      expv[16] = 66'h30f1ca66bf5947184;
      expv[17] = 66'h30f1ca66bf5947185;
      expv[18] = 66'h30f1ca66bf5947184;
      expv[19] = 66'h30f1ca66bf5947184;
      expv[20] = 66'h30f1ca66bf5947184;
      expv[21] = 66'h30f1ca66bf5947184;
      expv[22] = 66'h30f1ca66bf5947184;
      expv[23] = 66'h30f1ca66bf5947184;
      expv[24] = 66'h30f1ca66bf5947185;
      expv[25] = 66'h30f1ca66bf5947185;
      expv[26] = 66'h30f1ca66bf5947184;
      expv[27] = 66'h30f1ca66bf5947184;
      expv[28] = 66'h30f1ca66bf5947185;
      expv[29] = 66'h30f1ca66bf5947184;
      expv[30] = 66'h30f1ca66bf5947184;
      expv[31] = 66'h30f1ca66bf5947184;
      expv[32] = 66'h30f1ca66bf5947184;
      expv[33] = 66'h30f1ca66bf5947184;
      expv[34] = 66'h30f1ca66bf5947184;
      expv[35] = 66'h30f1ca66bf5947184;
      expv[36] = 66'h30f1ca66bf5947184;
      expv[37] = 66'h30f1ca66bf5947184;
      expv[38] = 66'h30ede244c34a85e1a;
      expv[39] = 66'h30ede244c34a85e1a;
      expv[40] = 66'h30ede244c34a85e18;
      expv[41] = 66'h30ede244c34a85e19;
      expv[42] = 66'h30ede244c34a85e19;
      expv[43] = 66'h30ede244c34a85e18;
      expv[44] = 66'h30ede244c34a85e19;
      expv[45] = 66'h30ede244c34a85e19;
      expv[46] = 66'h30ede244c34a85e18;
      expv[47] = 66'h30ede244c34a85e18;
      expv[48] = 66'h30ede244c34a85e18;
      expv[49] = 66'h30ede244c34a85e18;
      expv[50] = 66'h30ede244c34a85e18;
      expv[51] = 66'h30ede244c34a85e18;
      expv[52] = 66'h30ede244c34a85e18;
      expv[53] = 66'h30f41e3bac3e871da;
      expv[54] = 66'h30f41e3bac3e871da;
      expv[55] = 66'h30f41e3bac3e871d8;
      expv[56] = 66'h30f41e3bac3e871d9;
      expv[57] = 66'h30f41e3bac3e871d9;
      expv[58] = 66'h30f41e3bac3e871d8;
      expv[59] = 66'h30f41e3bac3e871d8;
      expv[60] = 66'h30f41e3bac3e871d8;
      expv[61] = 66'h30f41e3bac3e871d8;
      expv[62] = 66'h30f41e3bac3e871d8;
      expv[63] = 66'h30f41e3bac3e871d8;
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
