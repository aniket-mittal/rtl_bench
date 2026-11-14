// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 130;
  localparam OW = 66;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  adder_pipe_64bit dut (
    .clk(clk),
    .rst_n(in_vec[129:129]),
    .i_en(in_vec[128:128]),
    .adda(in_vec[127:64]),
    .addb(in_vec[63:0]),
    .result(out_vec[65:1]),
    .o_en(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 130'h02a7485daadacd420791955ffb8667ee5;
    stim[1] = 130'h05c28ec926ad7832bb14fbd999e089b77;
    stim[2] = 130'h34af872ab024d1330f5c4632cedb3f266;
    stim[3] = 130'h2d15051c8ba0177d026ab9a1e757917bf;
    stim[4] = 130'h2368008fb4e32cc7af076a8cf6ba9bc18;
    stim[5] = 130'h2227fb4fddee07c0e1be0e38362098455;
    stim[6] = 130'h310b63be162886868e2be9f9018849fb8;
    stim[7] = 130'h21eda33840904b74908dd59b68afb5698;
    stim[8] = 130'h263c587a47a5573cf3486ac78b63a142e;
    stim[9] = 130'h3a3765c30861ca445d134b0a164405822;
    stim[10] = 130'h38c5839aaa86da638af67814903a3989c;
    stim[11] = 130'h246f462a08060a31578f21ecb694e5ea9;
    stim[12] = 130'h298d0c204e233274d705f203e51457823;
    stim[13] = 130'h3520a87f2fd1240b36e5455899de81de5;
    stim[14] = 130'h25fef9cd8a3b83858ffcede2e83b1c199;
    stim[15] = 130'h20ac27e71b4a3467a66621ba6eb0f09e0;
    stim[16] = 130'h3eec0957e45f819256a763d2fa07b0a3a;
    stim[17] = 130'h3b829b20709053c74b4a98c2d8c2cf446;
    stim[18] = 130'h277f0b6065946b065cf2ef4170efd5461;
    stim[19] = 130'h3f53aa0476d4946d81fb50456ec73077b;
    stim[20] = 130'h2bac1bbdf8da074af3bb90f0b07c73494;
    stim[21] = 130'h29fe946f955019360b8512e02684c69a3;
    stim[22] = 130'h202b60db2e229e19d4f9970a74adaebfa;
    stim[23] = 130'h26c283bb2e328be55ac8145fb3b73c6c2;
    stim[24] = 130'h38d361ea3471f0bd99c31f4f2a5fd2bd5;
    stim[25] = 130'h28f7f63a479e5208221a05308af7b2d8f;
    stim[26] = 130'h30ce4d3cb40c74a9a9c016feaf5989d83;
    stim[27] = 130'h211a99a01494bdf6451f1e2008c1cc1e4;
    stim[28] = 130'h2a8a572f67eb2f93260fd7d71ab66755c;
    stim[29] = 130'h229f2bd60d274692045c2ae2d0ad76c16;
    stim[30] = 130'h2d4d0cc56b3bffbf21382671b44de2eec;
    stim[31] = 130'h10e49266a73b0dd66830654373ccd0344;
    stim[32] = 130'h305f1b773fc6019d20a04b024cfd5641e;
    stim[33] = 130'h21fd713a7cfde98a57b5bb6cf2815edf5;
    stim[34] = 130'h36e908617b07b5451e45bb1735c256ca8;
    stim[35] = 130'h3305b65a064a36938d7479e7e9483c000;
    stim[36] = 130'h3d58025723feb9c59ab3b799307e08f0e;
    stim[37] = 130'h346cce57a0548241c7ec8af3b8d3e2606;
    stim[38] = 130'h24a13b91b214a01717d5ea50f446c72d7;
    stim[39] = 130'h1157c911548ad55673ba739bdb0815ca4;
    stim[40] = 130'h2ad5e39da01fd3703a45f043b20d8654d;
    stim[41] = 130'h2ebfcac39826a9eeb111b0ac4b0853e06;
    stim[42] = 130'h2bc22d71a0c9d9df427ee7e44e0eec6c8;
    stim[43] = 130'h3cf361e8333428a3d8992c8a59c9767c4;
    stim[44] = 130'h271c3b3803936f6c84108096887dc44e8;
    stim[45] = 130'h331a23358e4ea698940562ec453f39f7f;
    stim[46] = 130'h309d6469d48be308b82c5f580801ad446;
    stim[47] = 130'h2882c5bf7c21bc5e1f88ab27051aea8e8;
    stim[48] = 130'h32f70d487ce88a27ed23297f9598f70af;
    stim[49] = 130'h286b2cdd2e62148abd6c60808ec1fb7c2;
    stim[50] = 130'h341a9a0a36e44a5e25abdd78676e65a9e;
    stim[51] = 130'h26222b877eb20249b2c7a127b8087f32b;
    stim[52] = 130'h3c097e081e697dc84c093a3d75b9ef3b1;
    stim[53] = 130'h299fcbc3232b226cbf7e513a17d1f42b8;
    stim[54] = 130'h25482a57557bf159ff610b8bf1fe54fe7;
    stim[55] = 130'h375119c5fc4894c1becdad3e4c8aafac4;
    stim[56] = 130'h2f0dc291b67d8ca59c1b512d46ffb36c2;
    stim[57] = 130'h3ce24e0615aed12227a0d0c7be43b394e;
    stim[58] = 130'h37aa288226507c15638e5663912a6368a;
    stim[59] = 130'h38999e8a38cb464012c0d333b29135b92;
    stim[60] = 130'h24626c62a7fbf9d8ff6ff8301c65f1349;
    stim[61] = 130'h2d5c8c519ebcb84701ad15ea72850879d;
    stim[62] = 130'h39651febea9c6904b577c105900f762e1;
    stim[63] = 130'h21aa6eb1eeec901774dc7be14d0a93253;
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
      expv[0] = 66'h00000000000000000;
      expv[1] = 66'h00000000000000000;
      expv[2] = 66'h00000000000000000;
      expv[3] = 66'h00000000000000000;
      expv[4] = 66'h00000000000000000;
      expv[5] = 66'h00000000000000000;
      expv[6] = 66'h28179abafe0020b2d;
      expv[7] = 66'h28179abafe0020b2c;
      expv[8] = 66'h28179abafe0020b2c;
      expv[9] = 66'h28179abafe0020b2c;
      expv[10] = 66'h1e6e9b6e2f61a1041;
      expv[11] = 66'h1e6e9b6e2f61a1040;
      expv[12] = 66'h1e6e9b6e2f61a1040;
      expv[13] = 66'h2e95619a3d4b9f8cf;
      expv[14] = 66'h2777f75e758227da9;
      expv[15] = 66'h2777f75e758227da8;
      expv[16] = 66'h2777f75e758227da8;
      expv[17] = 66'h180bdbaf935f4bd31;
      expv[18] = 66'h180bdbaf935f4bd30;
      expv[19] = 66'h180bdbaf935f4bd30;
      expv[20] = 66'h2b26da55bcce646bf;
      expv[21] = 66'h2d9a67c692a646175;
      expv[22] = 66'h2d9a67c692a646174;
      expv[23] = 66'h229df493cb3789ca7;
      expv[24] = 66'h229df493cb3789ca6;
      expv[25] = 66'h229df493cb3789ca6;
      expv[26] = 66'h229df493cb3789ca6;
      expv[27] = 66'h229df493cb3789ca6;
      expv[28] = 66'h252d0272bda386f5d;
      expv[29] = 66'h252d0272bda386f5c;
      expv[30] = 66'h151cc876c6cbfd03b;
      expv[31] = 66'h00000000000000000;
      expv[32] = 66'h00000000000000000;
      expv[33] = 66'h00000000000000000;
      expv[34] = 66'h00000000000000000;
      expv[35] = 66'h00000000000000000;
      expv[36] = 66'h01feccf31986afbe1;
      expv[37] = 66'h01feccf31986afbe0;
      expv[38] = 66'h2a5d86f16194181f3;
      expv[39] = 66'h00000000000000000;
      expv[40] = 66'h00000000000000000;
      expv[41] = 66'h00000000000000000;
      expv[42] = 66'h00000000000000000;
      expv[43] = 66'h00000000000000000;
      expv[44] = 66'h00000000000000000;
      expv[45] = 66'h00000000000000000;
      expv[46] = 66'h00000000000000000;
      expv[47] = 66'h2b191ce519fb3e403;
      expv[48] = 66'h2b191ce519fb3e402;
      expv[49] = 66'h0e3f0c43a71bc1211;
      expv[50] = 66'h11938783b91b209a3;
      expv[51] = 66'h11938783b91b209a2;
      expv[52] = 66'h20346d9025030265b;
      expv[53] = 66'h20346d9025030265a;
      expv[54] = 66'h138cef053ca560101;
      expv[55] = 66'h138cef053ca560100;
      expv[56] = 66'h3025708b2846da06b;
      expv[57] = 66'h3025708b2846da06a;
      expv[58] = 66'h3025708b2846da06a;
      expv[59] = 66'h2c3d8e0891a688dbf;
      expv[60] = 66'h2c3d8e0891a688dbe;
      expv[61] = 66'h29063d9ba7e5096e1;
      expv[62] = 66'h1670fdcb6ef5befc1;
      expv[63] = 66'h16b4e37bd6b8f7f27;
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
