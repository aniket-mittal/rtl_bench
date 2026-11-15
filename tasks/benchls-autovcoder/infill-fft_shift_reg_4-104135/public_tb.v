// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 50;
  localparam OW = 48;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_104135 dut (
    .clk(clk),
    .rst_n(in_vec[49:49]),
    .in_valid(in_vec[48:48]),
    .din_r(in_vec[47:24]),
    .din_i(in_vec[23:0]),
    .dout_r(out_vec[47:24]),
    .dout_i(out_vec[23:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 50'h0b2cda0394078;
    stim[1] = 50'h0405f1b67ca46;
    stim[2] = 50'h3da15b6128c38;
    stim[3] = 50'h357b531c819dd;
    stim[4] = 50'h277d045f3393a;
    stim[5] = 50'h37a33c570fc9c;
    stim[6] = 50'h3e0a29d2fc8f8;
    stim[7] = 50'h2c1ca8eb8efb6;
    stim[8] = 50'h28f5fbd4380fc;
    stim[9] = 50'h282301280f343;
    stim[10] = 50'h355deb937327f;
    stim[11] = 50'h2277d74e3bfe2;
    stim[12] = 50'h22cc166e0515c;
    stim[13] = 50'h2c49cea82db32;
    stim[14] = 50'h215632c89d7ba;
    stim[15] = 50'h2e74925270c85;
    stim[16] = 50'h234ac21809044;
    stim[17] = 50'h3d39456f1ae03;
    stim[18] = 50'h29687f40a1718;
    stim[19] = 50'h2879e41c9214d;
    stim[20] = 50'h314165d862d09;
    stim[21] = 50'h28438c6941cf8;
    stim[22] = 50'h2e496c51c800f;
    stim[23] = 50'h3f7ca5343e3c0;
    stim[24] = 50'h23f9b27fa7053;
    stim[25] = 50'h2c143d280aeb9;
    stim[26] = 50'h2acc66507f9b7;
    stim[27] = 50'h2155ef2bbc3a7;
    stim[28] = 50'h3b02aecdd608a;
    stim[29] = 50'h28b15955f8e04;
    stim[30] = 50'h2fe01e9b14497;
    stim[31] = 50'h31773bbe27d1d;
    stim[32] = 50'h3d7562e981902;
    stim[33] = 50'h3b962c6639219;
    stim[34] = 50'h3647ae9a06beb;
    stim[35] = 50'h207020efccc60;
    stim[36] = 50'h3ebf4e38efba3;
    stim[37] = 50'h3f12fbc243060;
    stim[38] = 50'h222a79bfc87b0;
    stim[39] = 50'h283b72663edf4;
    stim[40] = 50'h35f8d62209895;
    stim[41] = 50'h2661b339c5577;
    stim[42] = 50'h2c8932b6e359b;
    stim[43] = 50'h3feeeb549cad1;
    stim[44] = 50'h2059109aef230;
    stim[45] = 50'h2f79bcae4f30b;
    stim[46] = 50'h3ce4f518292a1;
    stim[47] = 50'h293c77ad7dac0;
    stim[48] = 50'h2cc4e2700bf2d;
    stim[49] = 50'h2ac89e630f13b;
    stim[50] = 50'h2b407d070538e;
    stim[51] = 50'h2a6e2abf6af09;
    stim[52] = 50'h3b7706a2c65ca;
    stim[53] = 50'h24a7e008e8b7b;
    stim[54] = 50'h2d2dc2e49faab;
    stim[55] = 50'h21f46c3e61b1d;
    stim[56] = 50'h2281e073acad1;
    stim[57] = 50'h364e22c05f416;
    stim[58] = 50'h3fdaeba2ae112;
    stim[59] = 50'h295fb47a6d739;
    stim[60] = 50'h28f78de68858e;
    stim[61] = 50'h27362b1f1b8c4;
    stim[62] = 50'h28eadcaadbff4;
    stim[63] = 50'h33bf58a091fad;
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
      expv[0] = 48'h000000000000;
      expv[1] = 48'h000000000000;
      expv[2] = 48'h000000000000;
      expv[3] = 48'h000000000000;
      expv[4] = 48'h000000000000;
      expv[5] = 48'h000000000000;
      expv[6] = 48'hda15b6128c38;
      expv[7] = 48'h57b531c819dd;
      expv[8] = 48'h77d045f3393a;
      expv[9] = 48'h7a33c570fc9c;
      expv[10] = 48'he0a29d2fc8f8;
      expv[11] = 48'hc1ca8eb8efb6;
      expv[12] = 48'h8f5fbd4380fc;
      expv[13] = 48'h82301280f343;
      expv[14] = 48'h55deb937327f;
      expv[15] = 48'h277d74e3bfe2;
      expv[16] = 48'h2cc166e0515c;
      expv[17] = 48'hc49cea82db32;
      expv[18] = 48'h15632c89d7ba;
      expv[19] = 48'he74925270c85;
      expv[20] = 48'h34ac21809044;
      expv[21] = 48'hd39456f1ae03;
      expv[22] = 48'h9687f40a1718;
      expv[23] = 48'h879e41c9214d;
      expv[24] = 48'h14165d862d09;
      expv[25] = 48'h8438c6941cf8;
      expv[26] = 48'he496c51c800f;
      expv[27] = 48'hf7ca5343e3c0;
      expv[28] = 48'h3f9b27fa7053;
      expv[29] = 48'hc143d280aeb9;
      expv[30] = 48'hacc66507f9b7;
      expv[31] = 48'h155ef2bbc3a7;
      expv[32] = 48'hb02aecdd608a;
      expv[33] = 48'h8b15955f8e04;
      expv[34] = 48'hfe01e9b14497;
      expv[35] = 48'h1773bbe27d1d;
      expv[36] = 48'hd7562e981902;
      expv[37] = 48'hb962c6639219;
      expv[38] = 48'h647ae9a06beb;
      expv[39] = 48'h07020efccc60;
      expv[40] = 48'hebf4e38efba3;
      expv[41] = 48'hf12fbc243060;
      expv[42] = 48'h22a79bfc87b0;
      expv[43] = 48'h83b72663edf4;
      expv[44] = 48'h5f8d62209895;
      expv[45] = 48'h661b339c5577;
      expv[46] = 48'hc8932b6e359b;
      expv[47] = 48'hfeeeb549cad1;
      expv[48] = 48'h059109aef230;
      expv[49] = 48'hf79bcae4f30b;
      expv[50] = 48'hce4f518292a1;
      expv[51] = 48'h93c77ad7dac0;
      expv[52] = 48'hcc4e2700bf2d;
      expv[53] = 48'hac89e630f13b;
      expv[54] = 48'hb407d070538e;
      expv[55] = 48'ha6e2abf6af09;
      expv[56] = 48'hb7706a2c65ca;
      expv[57] = 48'h4a7e008e8b7b;
      expv[58] = 48'hd2dc2e49faab;
      expv[59] = 48'h1f46c3e61b1d;
      expv[60] = 48'h281e073acad1;
      expv[61] = 48'h64e22c05f416;
      expv[62] = 48'hfdaeba2ae112;
      expv[63] = 48'h95fb47a6d739;
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
