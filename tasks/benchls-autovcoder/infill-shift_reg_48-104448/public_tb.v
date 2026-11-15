// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 48;
  localparam OW = 48;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_104448 dut (
    .clock(clk),
    .io_d(in_vec[47:0]),
    .io_q(out_vec[47:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 48'hd269d819f184;
    stim[1] = 48'h2eaf31c7e918;
    stim[2] = 48'hf34d381e364e;
    stim[3] = 48'h80bf58833446;
    stim[4] = 48'h4db0027a3aff;
    stim[5] = 48'hcd6559c7a425;
    stim[6] = 48'hf3f376bf5ca2;
    stim[7] = 48'hd0c60784ae50;
    stim[8] = 48'h884ded4d14f7;
    stim[9] = 48'h71f4eaeac488;
    stim[10] = 48'hb911c7319615;
    stim[11] = 48'he700dcb17184;
    stim[12] = 48'h667fa6311b5f;
    stim[13] = 48'hc888a9290d90;
    stim[14] = 48'hc2df0ee71a40;
    stim[15] = 48'h5e49e6719577;
    stim[16] = 48'h31a97af6d9ae;
    stim[17] = 48'h71261d4c44e5;
    stim[18] = 48'hc82e9104e11d;
    stim[19] = 48'h34f29a716227;
    stim[20] = 48'he73e8be3ab5b;
    stim[21] = 48'h79289301458c;
    stim[22] = 48'hc99d65ff4ffc;
    stim[23] = 48'h8955dea3c535;
    stim[24] = 48'h2510c9f21f0a;
    stim[25] = 48'h02296ac5f4e0;
    stim[26] = 48'he58aa9c350f7;
    stim[27] = 48'h480c7ca42e86;
    stim[28] = 48'hab435f8a1a27;
    stim[29] = 48'h0330ee1e578a;
    stim[30] = 48'hc7659fdfb032;
    stim[31] = 48'h939ab7f10764;
    stim[32] = 48'h1d2d2409c701;
    stim[33] = 48'hcc8873322361;
    stim[34] = 48'h3ad36f1dfb1c;
    stim[35] = 48'h8a1bba1a0e6f;
    stim[36] = 48'hd86421c11461;
    stim[37] = 48'h54b9ddf80afc;
    stim[38] = 48'h94dc6ebcec36;
    stim[39] = 48'h99a48e0e14f8;
    stim[40] = 48'hf55179f4a7b3;
    stim[41] = 48'hadb5e094fe0f;
    stim[42] = 48'h9008ff086d7f;
    stim[43] = 48'h9f481a57a17d;
    stim[44] = 48'h5a1bc04c5ee1;
    stim[45] = 48'h844c540c759d;
    stim[46] = 48'ha7c9dbc4cd92;
    stim[47] = 48'hf49664e2307e;
    stim[48] = 48'h1d5a7871bc96;
    stim[49] = 48'hc02bcc5ee8c0;
    stim[50] = 48'heed55b3472b2;
    stim[51] = 48'ha55dc7a8df94;
    stim[52] = 48'hca94d1058cd8;
    stim[53] = 48'h3ba2d0090066;
    stim[54] = 48'h16493586f1a0;
    stim[55] = 48'hee5b373fca3c;
    stim[56] = 48'h21bb3bc82c34;
    stim[57] = 48'h03d6959c945f;
    stim[58] = 48'h6226b6880583;
    stim[59] = 48'h17fd2e035c40;
    stim[60] = 48'hcb8859f4acb3;
    stim[61] = 48'h857b98df1aac;
    stim[62] = 48'h59cf284b12b0;
    stim[63] = 48'hce3d8e61733e;
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
      expv[0] = 48'hxxxxxxxxxxxx;
      expv[1] = 48'hd269d819f184;
      expv[2] = 48'h2eaf31c7e918;
      expv[3] = 48'hf34d381e364e;
      expv[4] = 48'h80bf58833446;
      expv[5] = 48'h4db0027a3aff;
      expv[6] = 48'hcd6559c7a425;
      expv[7] = 48'hf3f376bf5ca2;
      expv[8] = 48'hd0c60784ae50;
      expv[9] = 48'h884ded4d14f7;
      expv[10] = 48'h71f4eaeac488;
      expv[11] = 48'hb911c7319615;
      expv[12] = 48'he700dcb17184;
      expv[13] = 48'h667fa6311b5f;
      expv[14] = 48'hc888a9290d90;
      expv[15] = 48'hc2df0ee71a40;
      expv[16] = 48'h5e49e6719577;
      expv[17] = 48'h31a97af6d9ae;
      expv[18] = 48'h71261d4c44e5;
      expv[19] = 48'hc82e9104e11d;
      expv[20] = 48'h34f29a716227;
      expv[21] = 48'he73e8be3ab5b;
      expv[22] = 48'h79289301458c;
      expv[23] = 48'hc99d65ff4ffc;
      expv[24] = 48'h8955dea3c535;
      expv[25] = 48'h2510c9f21f0a;
      expv[26] = 48'h02296ac5f4e0;
      expv[27] = 48'he58aa9c350f7;
      expv[28] = 48'h480c7ca42e86;
      expv[29] = 48'hab435f8a1a27;
      expv[30] = 48'h0330ee1e578a;
      expv[31] = 48'hc7659fdfb032;
      expv[32] = 48'h939ab7f10764;
      expv[33] = 48'h1d2d2409c701;
      expv[34] = 48'hcc8873322361;
      expv[35] = 48'h3ad36f1dfb1c;
      expv[36] = 48'h8a1bba1a0e6f;
      expv[37] = 48'hd86421c11461;
      expv[38] = 48'h54b9ddf80afc;
      expv[39] = 48'h94dc6ebcec36;
      expv[40] = 48'h99a48e0e14f8;
      expv[41] = 48'hf55179f4a7b3;
      expv[42] = 48'hadb5e094fe0f;
      expv[43] = 48'h9008ff086d7f;
      expv[44] = 48'h9f481a57a17d;
      expv[45] = 48'h5a1bc04c5ee1;
      expv[46] = 48'h844c540c759d;
      expv[47] = 48'ha7c9dbc4cd92;
      expv[48] = 48'hf49664e2307e;
      expv[49] = 48'h1d5a7871bc96;
      expv[50] = 48'hc02bcc5ee8c0;
      expv[51] = 48'heed55b3472b2;
      expv[52] = 48'ha55dc7a8df94;
      expv[53] = 48'hca94d1058cd8;
      expv[54] = 48'h3ba2d0090066;
      expv[55] = 48'h16493586f1a0;
      expv[56] = 48'hee5b373fca3c;
      expv[57] = 48'h21bb3bc82c34;
      expv[58] = 48'h03d6959c945f;
      expv[59] = 48'h6226b6880583;
      expv[60] = 48'h17fd2e035c40;
      expv[61] = 48'hcb8859f4acb3;
      expv[62] = 48'h857b98df1aac;
      expv[63] = 48'h59cf284b12b0;
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
