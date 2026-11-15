// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 55;
  localparam OW = 55;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_061906 dut (
    .clock(clk),
    .io_d(in_vec[54:0]),
    .io_q(out_vec[54:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 55'h314edb828248f4;
    stim[1] = 55'h11fd10b7029a32;
    stim[2] = 55'h7855944368826f;
    stim[3] = 55'h2bdb3dafac8e9d;
    stim[4] = 55'h46265d1559cb2b;
    stim[5] = 55'h3f111c7d4d132f;
    stim[6] = 55'h33759dd6814131;
    stim[7] = 55'h01e44d9366a162;
    stim[8] = 55'h0ce01d6d1520c8;
    stim[9] = 55'h4530ee23af12dd;
    stim[10] = 55'h11ed569b3590fe;
    stim[11] = 55'h4d98187b75037a;
    stim[12] = 55'h4bb943e0e4555d;
    stim[13] = 55'h70cb3ac960e23d;
    stim[14] = 55'h06177a362e5297;
    stim[15] = 55'h4c7766c10ea805;
    stim[16] = 55'h7b806b96ccdf98;
    stim[17] = 55'h34cb3bb86e3d58;
    stim[18] = 55'h7974272f06182b;
    stim[19] = 55'h738f2f8d6d7910;
    stim[20] = 55'h5f85982284c14b;
    stim[21] = 55'h52ce7171a5baec;
    stim[22] = 55'h5f32d2fd5d34ec;
    stim[23] = 55'h48c7ef758cd6ed;
    stim[24] = 55'h17e69d156b24f3;
    stim[25] = 55'h006473bc29ed69;
    stim[26] = 55'h2ba17148253fed;
    stim[27] = 55'h2442cce6988e56;
    stim[28] = 55'h5472a052f6ea63;
    stim[29] = 55'h21e080a54279bd;
    stim[30] = 55'h3c488fd633a931;
    stim[31] = 55'h3f56e6a1082857;
    stim[32] = 55'h3f08adc7f01866;
    stim[33] = 55'h702545fc9ee76f;
    stim[34] = 55'h7ca20acffe9cfe;
    stim[35] = 55'h0fd9d367cf385e;
    stim[36] = 55'h70215af89600f5;
    stim[37] = 55'h1e97958ac52d34;
    stim[38] = 55'h46d680dd4a5ed1;
    stim[39] = 55'h18e64b47a247df;
    stim[40] = 55'h49ccd46a20a16e;
    stim[41] = 55'h6307bbb3df0e62;
    stim[42] = 55'h5d9cf6c60b84db;
    stim[43] = 55'h268cd0dd8ba3b4;
    stim[44] = 55'h385f3652c7891f;
    stim[45] = 55'h29666bb19d4c73;
    stim[46] = 55'h6762be15a18530;
    stim[47] = 55'h682b1ad4691be4;
    stim[48] = 55'h4d4eeff0b6f695;
    stim[49] = 55'h2e3f31343b2ecb;
    stim[50] = 55'h3e47719f680600;
    stim[51] = 55'h1599bc46e35d02;
    stim[52] = 55'h077b55b1398701;
    stim[53] = 55'h2a1fac905f733a;
    stim[54] = 55'h30f5284f2f5001;
    stim[55] = 55'h0c0e1b3bd66e7a;
    stim[56] = 55'h6e985019f144c5;
    stim[57] = 55'h5b970cb995ab87;
    stim[58] = 55'h4656b8e75f3dd4;
    stim[59] = 55'h72ecf36750fbcd;
    stim[60] = 55'h0c4401fde39a30;
    stim[61] = 55'h4ce8eba099803f;
    stim[62] = 55'h12424b2876082d;
    stim[63] = 55'h0264f39506b1d5;
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
      expv[0] = 55'hxxxxxxxxxxxxxx;
      expv[1] = 55'h314edb828248f4;
      expv[2] = 55'h11fd10b7029a32;
      expv[3] = 55'h7855944368826f;
      expv[4] = 55'h2bdb3dafac8e9d;
      expv[5] = 55'h46265d1559cb2b;
      expv[6] = 55'h3f111c7d4d132f;
      expv[7] = 55'h33759dd6814131;
      expv[8] = 55'h01e44d9366a162;
      expv[9] = 55'h0ce01d6d1520c8;
      expv[10] = 55'h4530ee23af12dd;
      expv[11] = 55'h11ed569b3590fe;
      expv[12] = 55'h4d98187b75037a;
      expv[13] = 55'h4bb943e0e4555d;
      expv[14] = 55'h70cb3ac960e23d;
      expv[15] = 55'h06177a362e5297;
      expv[16] = 55'h4c7766c10ea805;
      expv[17] = 55'h7b806b96ccdf98;
      expv[18] = 55'h34cb3bb86e3d58;
      expv[19] = 55'h7974272f06182b;
      expv[20] = 55'h738f2f8d6d7910;
      expv[21] = 55'h5f85982284c14b;
      expv[22] = 55'h52ce7171a5baec;
      expv[23] = 55'h5f32d2fd5d34ec;
      expv[24] = 55'h48c7ef758cd6ed;
      expv[25] = 55'h17e69d156b24f3;
      expv[26] = 55'h006473bc29ed69;
      expv[27] = 55'h2ba17148253fed;
      expv[28] = 55'h2442cce6988e56;
      expv[29] = 55'h5472a052f6ea63;
      expv[30] = 55'h21e080a54279bd;
      expv[31] = 55'h3c488fd633a931;
      expv[32] = 55'h3f56e6a1082857;
      expv[33] = 55'h3f08adc7f01866;
      expv[34] = 55'h702545fc9ee76f;
      expv[35] = 55'h7ca20acffe9cfe;
      expv[36] = 55'h0fd9d367cf385e;
      expv[37] = 55'h70215af89600f5;
      expv[38] = 55'h1e97958ac52d34;
      expv[39] = 55'h46d680dd4a5ed1;
      expv[40] = 55'h18e64b47a247df;
      expv[41] = 55'h49ccd46a20a16e;
      expv[42] = 55'h6307bbb3df0e62;
      expv[43] = 55'h5d9cf6c60b84db;
      expv[44] = 55'h268cd0dd8ba3b4;
      expv[45] = 55'h385f3652c7891f;
      expv[46] = 55'h29666bb19d4c73;
      expv[47] = 55'h6762be15a18530;
      expv[48] = 55'h682b1ad4691be4;
      expv[49] = 55'h4d4eeff0b6f695;
      expv[50] = 55'h2e3f31343b2ecb;
      expv[51] = 55'h3e47719f680600;
      expv[52] = 55'h1599bc46e35d02;
      expv[53] = 55'h077b55b1398701;
      expv[54] = 55'h2a1fac905f733a;
      expv[55] = 55'h30f5284f2f5001;
      expv[56] = 55'h0c0e1b3bd66e7a;
      expv[57] = 55'h6e985019f144c5;
      expv[58] = 55'h5b970cb995ab87;
      expv[59] = 55'h4656b8e75f3dd4;
      expv[60] = 55'h72ecf36750fbcd;
      expv[61] = 55'h0c4401fde39a30;
      expv[62] = 55'h4ce8eba099803f;
      expv[63] = 55'h12424b2876082d;
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
