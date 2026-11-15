// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 64;
  localparam OW = 6;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_024336 dut (
    .x_num_expand(in_vec[63:0]),
    .x_num(out_vec[5:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 64'hc3b682258eb3ee9d;
    stim[1] = 64'h1c7469d71457b56d;
    stim[2] = 64'hf0b29bfeaa02544b;
    stim[3] = 64'h9b39ffc0ca088c68;
    stim[4] = 64'h831135bacf787fef;
    stim[5] = 64'hd9bb858a1223fb31;
    stim[6] = 64'h20c254c5780e3d8f;
    stim[7] = 64'hf4d6a1623ef65fd7;
    stim[8] = 64'h6a51e61786eea588;
    stim[9] = 64'heb7523beda257e52;
    stim[10] = 64'h7aba547cb2d9ef81;
    stim[11] = 64'hec785a30e0411fde;
    stim[12] = 64'hdc186dfd5ea93c02;
    stim[13] = 64'h3343eb20e90911b8;
    stim[14] = 64'h400fcb6379e9ae69;
    stim[15] = 64'h427bf3672f1effeb;
    stim[16] = 64'h08730f0bb37d2bc6;
    stim[17] = 64'h42fc0660f66d2808;
    stim[18] = 64'h1fb1ec081494bffd;
    stim[19] = 64'h4ec1f9d6c80444a2;
    stim[20] = 64'h84fb45a21c0f3585;
    stim[21] = 64'h0d3e51bb1dfb3560;
    stim[22] = 64'hd6a5b2c3dd32ff4f;
    stim[23] = 64'ha2eae60807abcbfa;
    stim[24] = 64'h296132927c7195da;
    stim[25] = 64'hd24437cac3b09733;
    stim[26] = 64'h96dd83a054e42c94;
    stim[27] = 64'h4e35e5bf32a55167;
    stim[28] = 64'h18e56703049c13cc;
    stim[29] = 64'h4635809c1901f3ac;
    stim[30] = 64'h9e2da09b0614040d;
    stim[31] = 64'h910f5365f80ba374;
    stim[32] = 64'h5082cb01a0c251d6;
    stim[33] = 64'h59117bf9afad78b3;
    stim[34] = 64'h704f1d12108742af;
    stim[35] = 64'h354a92786e51541e;
    stim[36] = 64'hf5ea8877b0b6f228;
    stim[37] = 64'hcbacb7eb459e85bb;
    stim[38] = 64'h1a153942f24286ff;
    stim[39] = 64'h88be74d0665db912;
    stim[40] = 64'hfb2a9470185406d1;
    stim[41] = 64'h35680dbf0178cd39;
    stim[42] = 64'hb3c1dab655ba65d4;
    stim[43] = 64'h894461001079e902;
    stim[44] = 64'he670355f91f05328;
    stim[45] = 64'h46cbdc30ae708646;
    stim[46] = 64'hce4c5be1a0f70ffd;
    stim[47] = 64'h8df609b5a7249964;
    stim[48] = 64'hd25ddf0d25921388;
    stim[49] = 64'h4cf6cc117a0eaed7;
    stim[50] = 64'hfe00ea517b3b945e;
    stim[51] = 64'hea880cb2ec4a8aa0;
    stim[52] = 64'hed3b49c9280ca4f5;
    stim[53] = 64'h4e8f6a226e578bd3;
    stim[54] = 64'hff7ca87f3d79339b;
    stim[55] = 64'h57fbaa5461d85754;
    stim[56] = 64'haf7ea494738d0fe3;
    stim[57] = 64'h21f069c081b4f589;
    stim[58] = 64'h18799bdbaf089999;
    stim[59] = 64'h497403ab7aa5ef0e;
    stim[60] = 64'h8b8a61fb5fdd06c6;
    stim[61] = 64'h1aa396a97973f5b6;
    stim[62] = 64'h53da2906a143e296;
    stim[63] = 64'h99b174f9cb77a5fc;
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
      expv[0] = 6'h3f;
      expv[1] = 6'h3f;
      expv[2] = 6'h3f;
      expv[3] = 6'h3f;
      expv[4] = 6'h3f;
      expv[5] = 6'h3f;
      expv[6] = 6'h3f;
      expv[7] = 6'h3f;
      expv[8] = 6'h3f;
      expv[9] = 6'h3f;
      expv[10] = 6'h3f;
      expv[11] = 6'h3f;
      expv[12] = 6'h3f;
      expv[13] = 6'h3f;
      expv[14] = 6'h3f;
      expv[15] = 6'h3f;
      expv[16] = 6'h3f;
      expv[17] = 6'h3f;
      expv[18] = 6'h3f;
      expv[19] = 6'h3f;
      expv[20] = 6'h3f;
      expv[21] = 6'h3f;
      expv[22] = 6'h3f;
      expv[23] = 6'h3f;
      expv[24] = 6'h3f;
      expv[25] = 6'h3f;
      expv[26] = 6'h3f;
      expv[27] = 6'h3f;
      expv[28] = 6'h3f;
      expv[29] = 6'h3f;
      expv[30] = 6'h3f;
      expv[31] = 6'h3f;
      expv[32] = 6'h3f;
      expv[33] = 6'h3f;
      expv[34] = 6'h3f;
      expv[35] = 6'h3f;
      expv[36] = 6'h3f;
      expv[37] = 6'h3f;
      expv[38] = 6'h3f;
      expv[39] = 6'h3f;
      expv[40] = 6'h3f;
      expv[41] = 6'h3f;
      expv[42] = 6'h3f;
      expv[43] = 6'h3f;
      expv[44] = 6'h3f;
      expv[45] = 6'h3f;
      expv[46] = 6'h3f;
      expv[47] = 6'h3f;
      expv[48] = 6'h3f;
      expv[49] = 6'h3f;
      expv[50] = 6'h3f;
      expv[51] = 6'h3f;
      expv[52] = 6'h3f;
      expv[53] = 6'h3f;
      expv[54] = 6'h3f;
      expv[55] = 6'h3f;
      expv[56] = 6'h3f;
      expv[57] = 6'h3f;
      expv[58] = 6'h3f;
      expv[59] = 6'h3f;
      expv[60] = 6'h3f;
      expv[61] = 6'h3f;
      expv[62] = 6'h3f;
      expv[63] = 6'h3f;
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
