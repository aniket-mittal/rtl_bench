// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 48;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  compress_32 dut (
    .a(in_vec[47:32]),
    .b(in_vec[31:16]),
    .c(in_vec[15:0]),
    .oo(out_vec[31:16]),
    .ot(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 48'he5f0100c81d3;
    stim[1] = 48'h2d990fbfa88f;
    stim[2] = 48'h698423fcc2f5;
    stim[3] = 48'he476f34def74;
    stim[4] = 48'hd0f42ed1fa1a;
    stim[5] = 48'h9db58c40a88a;
    stim[6] = 48'h949acb7d7c2a;
    stim[7] = 48'h2984853bebf2;
    stim[8] = 48'hb1a9134492ce;
    stim[9] = 48'he7f47aab08f8;
    stim[10] = 48'h4262b3860e34;
    stim[11] = 48'ha5056ab54886;
    stim[12] = 48'hd1c7c1a84dfd;
    stim[13] = 48'h8c24a8646b12;
    stim[14] = 48'h4ce3602c2bdc;
    stim[15] = 48'h53e4441a0e28;
    stim[16] = 48'h59d57f554f82;
    stim[17] = 48'h2abbbc824cd9;
    stim[18] = 48'h609d65d4e009;
    stim[19] = 48'h148de4bda586;
    stim[20] = 48'hce2daf17f223;
    stim[21] = 48'h74326422bc5a;
    stim[22] = 48'hec9a269d0fbc;
    stim[23] = 48'h8fcb388cd97c;
    stim[24] = 48'hcdb7cb5e63ab;
    stim[25] = 48'ha698177bdfaf;
    stim[26] = 48'hff197d148e13;
    stim[27] = 48'h3eee420d6795;
    stim[28] = 48'h69cdfeb466b7;
    stim[29] = 48'h99787b6775f7;
    stim[30] = 48'h3c235c2e2a6b;
    stim[31] = 48'hceab1a769872;
    stim[32] = 48'h3e12e8b94e64;
    stim[33] = 48'hbbb6e8b65630;
    stim[34] = 48'h4e872d265ceb;
    stim[35] = 48'h126b537d5043;
    stim[36] = 48'hb1a9cc133f07;
    stim[37] = 48'h16c203751627;
    stim[38] = 48'hf435bf813899;
    stim[39] = 48'hac84e10aec6a;
    stim[40] = 48'hbd639da9e952;
    stim[41] = 48'h1c425f35aa67;
    stim[42] = 48'h1bdb2737bea3;
    stim[43] = 48'he382108e628d;
    stim[44] = 48'h09c5c6b0faec;
    stim[45] = 48'hf0f2cd404458;
    stim[46] = 48'hae4fe03eb7b1;
    stim[47] = 48'hb20ce01bf851;
    stim[48] = 48'h653de4c72a38;
    stim[49] = 48'hf6515151ac70;
    stim[50] = 48'h51cf2852dea1;
    stim[51] = 48'heee3fd267230;
    stim[52] = 48'h9cc18c8917a1;
    stim[53] = 48'h60cf31c59ced;
    stim[54] = 48'hdecfdc037d27;
    stim[55] = 48'hb4c889326e41;
    stim[56] = 48'hd29f6977f612;
    stim[57] = 48'h521342043b12;
    stim[58] = 48'hb772ca4da9a1;
    stim[59] = 48'hb161c93c8624;
    stim[60] = 48'h1a1b93436c93;
    stim[61] = 48'h148c97837ada;
    stim[62] = 48'h3c4065e27e40;
    stim[63] = 48'h12c2349f0532;
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
      expv[0] = 32'h742f81d0;
      expv[1] = 32'h8aa92d9f;
      expv[2] = 32'h888d63f4;
      expv[3] = 32'hf84fe774;
      expv[4] = 32'h043ffad0;
      expv[5] = 32'hb97f8c80;
      expv[6] = 32'h23cddc3a;
      expv[7] = 32'h474da9b2;
      expv[8] = 32'h302393cc;
      expv[9] = 32'h95a76af8;
      expv[10] = 32'hffd00226;
      expv[11] = 32'h87366885;
      expv[12] = 32'h5d92c1ed;
      expv[13] = 32'h4f52a824;
      expv[14] = 32'h071368ec;
      expv[15] = 32'h19d64628;
      expv[16] = 32'h69025fd5;
      expv[17] = 32'hdae02c9b;
      expv[18] = 32'he540609d;
      expv[19] = 32'h55b6a48d;
      expv[20] = 32'h9319ee27;
      expv[21] = 32'hac4a7432;
      expv[22] = 32'hc5bb2e9c;
      expv[23] = 32'h6e3b99cc;
      expv[24] = 32'h6542cbbf;
      expv[25] = 32'h6e4c97bb;
      expv[26] = 32'h0c1eff11;
      expv[27] = 32'h1b76668d;
      expv[28] = 32'hf1ce6eb5;
      expv[29] = 32'h97e87977;
      expv[30] = 32'h4a663c2b;
      expv[31] = 32'h4caf9a72;
      expv[32] = 32'h98cf6e30;
      expv[33] = 32'h0530fab6;
      expv[34] = 32'h3f4a4ca7;
      expv[35] = 32'h1155526b;
      expv[36] = 32'h42bdbd03;
      expv[37] = 32'h03901667;
      expv[38] = 32'h732dbc91;
      expv[39] = 32'ha1e4ec0a;
      expv[40] = 32'hc998bd63;
      expv[41] = 32'he9101e67;
      expv[42] = 32'h824f3fb3;
      expv[43] = 32'h9181628e;
      expv[44] = 32'h3599cae4;
      expv[45] = 32'h79eac450;
      expv[46] = 32'hf9c0a63f;
      expv[47] = 32'haa46f019;
      expv[48] = 32'habc2643d;
      expv[49] = 32'h0b70f451;
      expv[50] = 32'ha73c58c3;
      expv[51] = 32'h61f5fe22;
      expv[52] = 32'h07e99c81;
      expv[53] = 32'hcde730cd;
      expv[54] = 32'h7febdc07;
      expv[55] = 32'h53bbac40;
      expv[56] = 32'h4dfaf217;
      expv[57] = 32'h2b055212;
      expv[58] = 32'hd49eab61;
      expv[59] = 32'hfe798124;
      expv[60] = 32'he5cb1a13;
      expv[61] = 32'hf9d5168a;
      expv[62] = 32'h27e27c40;
      expv[63] = 32'h236f1492;
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
