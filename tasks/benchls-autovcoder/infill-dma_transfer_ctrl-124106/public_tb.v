// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 98;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_124106 dut (
    .clk(clk),
    .reset(in_vec[97:97]),
    .start(in_vec[96:96]),
    .src_addr(in_vec[95:64]),
    .dest_addr(in_vec[63:32]),
    .data_in(in_vec[31:0]),
    .ready(out_vec[33:33]),
    .error(out_vec[32:32]),
    .data_out(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 98'h2ad678188d28b0b83cbf62616;
    stim[1] = 98'h38d4e9ca7d3adcbe97372f229;
    stim[2] = 98'h1416a3e12789546fbba5c080e;
    stim[3] = 98'h03abda9301b74ef735a7ce729;
    stim[4] = 98'h1ad83adddd278d58eb599bcec;
    stim[5] = 98'h074a8982ea9493b5bcef3f1ee;
    stim[6] = 98'h132f732cb237ea102ff306f0f;
    stim[7] = 98'h10b2f1aeaaed44bbbe4160bc1;
    stim[8] = 98'h1dccfd0ed8f3a720b768328a1;
    stim[9] = 98'h0e643a7c6717959a386bbb92f;
    stim[10] = 98'h11e804e3a396060bc9ef015df;
    stim[11] = 98'h0c3ac138e33d3b4827ab5993d;
    stim[12] = 98'h0449cfec02d1e6acbe098801e;
    stim[13] = 98'h048f7072ac4abaf425a5b348a;
    stim[14] = 98'h080a58058fb47a4aa5bafebc0;
    stim[15] = 98'h01e4d8461e697a591987f808b;
    stim[16] = 98'h1bec781b5bb3465c8c5764f9a;
    stim[17] = 98'h1704f60d1fbb713790e86804e;
    stim[18] = 98'h00dae0e1e6cf06a60f1611059;
    stim[19] = 98'h09baf61f4f77d4f7ac5d0aa51;
    stim[20] = 98'h12a7967b49fa019452d276c15;
    stim[21] = 98'h095ca3cf2bd68851d7348f01d;
    stim[22] = 98'h03d4a60ef9e571dca804f2071;
    stim[23] = 98'h05960ed567eca294d5793608e;
    stim[24] = 98'h163a5a531155860ed722c50e1;
    stim[25] = 98'h087e66d006b8d1ce0f53600ca;
    stim[26] = 98'h0d29f995e054eb72f1f3767da;
    stim[27] = 98'h1b08c71f38434d85263d03f9b;
    stim[28] = 98'h1512074296638b80d5e3e6bce;
    stim[29] = 98'h009bca4adea74251d9f377ffb;
    stim[30] = 98'h07149aff5b81dfedfe9899f32;
    stim[31] = 98'h019f86eb16d9ff7d005325f71;
    stim[32] = 98'h02adac445f36d02937ce622b2;
    stim[33] = 98'h0de0ba512f9489e9be2cb3585;
    stim[34] = 98'h0e17c10afbb40d7c4a0016b26;
    stim[35] = 98'h1b720cfb228a88f03ce7a9a0e;
    stim[36] = 98'h15207dfc9853f3d606696acf0;
    stim[37] = 98'h0c2a26f482ed008eca14b4bf4;
    stim[38] = 98'h1c3683dbebdd2a2d738abb5d0;
    stim[39] = 98'h0d2b55182d5ca4407d7f344c7;
    stim[40] = 98'h02184dc6313503ef3b6f40472;
    stim[41] = 98'h173d954d059cd44b39a9892a9;
    stim[42] = 98'h1286dcad63a9fdf4d151cddf0;
    stim[43] = 98'h2c0c118ab2e2a017b43c6f042;
    stim[44] = 98'h11ce69df33b48a279552c4ce5;
    stim[45] = 98'h113ef03280825e3641cb92e5a;
    stim[46] = 98'h11caefc617ec4b0baf0971ae4;
    stim[47] = 98'h1c86ce36893cd6b1bfc27dd6e;
    stim[48] = 98'h13b16dc7330a69222eab21f69;
    stim[49] = 98'h0c74591479fff09f0af08857a;
    stim[50] = 98'h1dcfa40652fea88f8dd53bac4;
    stim[51] = 98'h162ed9f553650c290d0e00f0e;
    stim[52] = 98'h1e0b2ced80b90a5b2df936ee7;
    stim[53] = 98'h0317dd16016ef4fbf77616b3c;
    stim[54] = 98'h051cecdaac393ce716944f29e;
    stim[55] = 98'h1d90c416a540af8522b057788;
    stim[56] = 98'h16ac89ede98a80317c86a252f;
    stim[57] = 98'h00bd95b6d5386c9fa5ce5b4a2;
    stim[58] = 98'h053ba1e89bcc596066e477197;
    stim[59] = 98'h0ba5922878ba6d6937b006fef;
    stim[60] = 98'h14f968c361d2464e6b3d4b37f;
    stim[61] = 98'h07e01cc7b698a5fa0b6498b31;
    stim[62] = 98'h0dcbca51fe9bd27d8e318a7b6;
    stim[63] = 98'h0524913b29e50c50093faf971;
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
      expv[0] = 34'h200000000;
      expv[1] = 34'h200000000;
      expv[2] = 34'h200000000;
      expv[3] = 34'h000000000;
      expv[4] = 34'h05a7ce729;
      expv[5] = 34'h25a7ce729;
      expv[6] = 34'h25a7ce729;
      expv[7] = 34'h05a7ce729;
      expv[8] = 34'h0e4160bc1;
      expv[9] = 34'h2e4160bc1;
      expv[10] = 34'h2e4160bc1;
      expv[11] = 34'h0e4160bc1;
      expv[12] = 34'h07ab5993d;
      expv[13] = 34'h27ab5993d;
      expv[14] = 34'h27ab5993d;
      expv[15] = 34'h27ab5993d;
      expv[16] = 34'h27ab5993d;
      expv[17] = 34'h07ab5993d;
      expv[18] = 34'h00e86804e;
      expv[19] = 34'h20e86804e;
      expv[20] = 34'h20e86804e;
      expv[21] = 34'h00e86804e;
      expv[22] = 34'h07348f01d;
      expv[23] = 34'h27348f01d;
      expv[24] = 34'h27348f01d;
      expv[25] = 34'h07348f01d;
      expv[26] = 34'h0f53600ca;
      expv[27] = 34'h2f53600ca;
      expv[28] = 34'h0f53600ca;
      expv[29] = 34'h05e3e6bce;
      expv[30] = 34'h25e3e6bce;
      expv[31] = 34'h25e3e6bce;
      expv[32] = 34'h25e3e6bce;
      expv[33] = 34'h25e3e6bce;
      expv[34] = 34'h25e3e6bce;
      expv[35] = 34'h25e3e6bce;
      expv[36] = 34'h05e3e6bce;
      expv[37] = 34'h06696acf0;
      expv[38] = 34'h26696acf0;
      expv[39] = 34'h06696acf0;
      expv[40] = 34'h0d7f344c7;
      expv[41] = 34'h2d7f344c7;
      expv[42] = 34'h0d7f344c7;
      expv[43] = 34'h200000000;
      expv[44] = 34'h200000000;
      expv[45] = 34'h000000000;
      expv[46] = 34'h01cb92e5a;
      expv[47] = 34'h21cb92e5a;
      expv[48] = 34'h01cb92e5a;
      expv[49] = 34'h0eab21f69;
      expv[50] = 34'h2eab21f69;
      expv[51] = 34'h0eab21f69;
      expv[52] = 34'h0d0e00f0e;
      expv[53] = 34'h2d0e00f0e;
      expv[54] = 34'h2d0e00f0e;
      expv[55] = 34'h2d0e00f0e;
      expv[56] = 34'h0d0e00f0e;
      expv[57] = 34'h0c86a252f;
      expv[58] = 34'h2c86a252f;
      expv[59] = 34'h2c86a252f;
      expv[60] = 34'h2c86a252f;
      expv[61] = 34'h0c86a252f;
      expv[62] = 34'h0b6498b31;
      expv[63] = 34'h2b6498b31;
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
