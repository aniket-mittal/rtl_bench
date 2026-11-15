// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 42;
  localparam OW = 48;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_05159 dut (
    .clk(clk),
    .ir_in(in_vec[41:40]),
    .sr(in_vec[39:2]),
    .vs_udr(in_vec[1:1]),
    .vs_uir(in_vec[0:0]),
    .jdo(out_vec[47:10]),
    .take_action_break_a(out_vec[9:9]),
    .take_action_break_b(out_vec[8:8]),
    .take_action_break_c(out_vec[7:7]),
    .take_action_ocimem_a(out_vec[6:6]),
    .take_action_ocimem_b(out_vec[5:5]),
    .take_action_tracectrl(out_vec[4:4]),
    .take_no_action_break_a(out_vec[3:3]),
    .take_no_action_break_b(out_vec[2:2]),
    .take_no_action_break_c(out_vec[1:1]),
    .take_no_action_ocimem_a(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 42'h3dfdb906983;
    stim[1] = 42'h032a9d91c93;
    stim[2] = 42'h0214f846944;
    stim[3] = 42'h0afb4c0f2c3;
    stim[4] = 42'h25ceb56a560;
    stim[5] = 42'h34e498a986d;
    stim[6] = 42'h190aee47db4;
    stim[7] = 42'h38c8808c2bd;
    stim[8] = 42'h091aa10f9df;
    stim[9] = 42'h37d83447637;
    stim[10] = 42'h310cb9f327b;
    stim[11] = 42'h2c83f324a8a;
    stim[12] = 42'h09a61be08dd;
    stim[13] = 42'h34c06a617b0;
    stim[14] = 42'h10d4299be7b;
    stim[15] = 42'h05275939b9f;
    stim[16] = 42'h0cdedb845ed;
    stim[17] = 42'h0160a437637;
    stim[18] = 42'h0c2d40b8263;
    stim[19] = 42'h3f3db35260d;
    stim[20] = 42'h38890614f47;
    stim[21] = 42'h0159852db6a;
    stim[22] = 42'h0634397e97a;
    stim[23] = 42'h2d99bb997b4;
    stim[24] = 42'h37d20b9d005;
    stim[25] = 42'h0a33d525538;
    stim[26] = 42'h2a9facc1b1d;
    stim[27] = 42'h2cbbb4e4107;
    stim[28] = 42'h0d044fbbaed;
    stim[29] = 42'h24e4a3e2eba;
    stim[30] = 42'h020ec74dd63;
    stim[31] = 42'h0add7250e17;
    stim[32] = 42'h15de80fe1c8;
    stim[33] = 42'h0b3d37ec320;
    stim[34] = 42'h35b64e3551b;
    stim[35] = 42'h29cb83a01d7;
    stim[36] = 42'h2f4fe9d32f7;
    stim[37] = 42'h2597c29cadf;
    stim[38] = 42'h07d3fe302c6;
    stim[39] = 42'h30ba71d208c;
    stim[40] = 42'h22225802f37;
    stim[41] = 42'h3890df1532d;
    stim[42] = 42'h22de326a10b;
    stim[43] = 42'h2c1ec5e91aa;
    stim[44] = 42'h04912433eac;
    stim[45] = 42'h3227d4459b6;
    stim[46] = 42'h1a2227f965a;
    stim[47] = 42'h3181a580599;
    stim[48] = 42'h281847d66d4;
    stim[49] = 42'h279b96961d4;
    stim[50] = 42'h28e576bf9d7;
    stim[51] = 42'h1e0fadae0e7;
    stim[52] = 42'h026c96e57e3;
    stim[53] = 42'h3062c89e4f0;
    stim[54] = 42'h20805bcae25;
    stim[55] = 42'h26ab746b363;
    stim[56] = 42'h3cd6c3ad2c9;
    stim[57] = 42'h3bca7814ede;
    stim[58] = 42'h0d660423b89;
    stim[59] = 42'h1bef41c6f77;
    stim[60] = 42'h13139b071eb;
    stim[61] = 42'h14985c87df6;
    stim[62] = 42'h0f61efe4a87;
    stim[63] = 42'h2a5caa5347c;
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
      expv[1] = 48'hxxxxxxxxxxxx;
      expv[2] = 48'hxxxxxxxxxxxx;
      expv[3] = 48'hxxxxxxxxxx00;
      expv[4] = 48'hxxxxxxxxxx00;
      expv[5] = 48'hxxxxxxxxxx00;
      expv[6] = 48'hxxxxxxxxxx00;
      expv[7] = 48'hxxxxxxxxxx00;
      expv[8] = 48'hxxxxxxxxxx00;
      expv[9] = 48'hxxxxxxxxxx00;
      expv[10] = 48'hxxxxxxxxxx00;
      expv[11] = 48'hxxxxxxxxxx00;
      expv[12] = 48'hxxxxxxxxxx00;
      expv[13] = 48'hxxxxxxxxxx00;
      expv[14] = 48'hxxxxxxxxxx00;
      expv[15] = 48'hxxxxxxxxxx00;
      expv[16] = 48'hxxxxxxxxxx00;
      expv[17] = 48'hxxxxxxxxxx00;
      expv[18] = 48'hxxxxxxxxxx00;
      expv[19] = 48'hxxxxxxxxxx00;
      expv[20] = 48'hxxxxxxxxxx00;
      expv[21] = 48'hxxxxxxxxxx00;
      expv[22] = 48'hxxxxxxxxxx00;
      expv[23] = 48'hxxxxxxxxxx00;
      expv[24] = 48'hxxxxxxxxxx00;
      expv[25] = 48'hxxxxxxxxxx00;
      expv[26] = 48'hxxxxxxxxxx00;
      expv[27] = 48'hxxxxxxxxxx00;
      expv[28] = 48'hxxxxxxxxxx00;
      expv[29] = 48'hxxxxxxxxxx00;
      expv[30] = 48'hxxxxxxxxxx00;
      expv[31] = 48'hxxxxxxxxxx00;
      expv[32] = 48'hxxxxxxxxxx00;
      expv[33] = 48'hxxxxxxxxxx00;
      expv[34] = 48'hxxxxxxxxxx00;
      expv[35] = 48'hxxxxxxxxxx00;
      expv[36] = 48'hxxxxxxxxxx00;
      expv[37] = 48'hxxxxxxxxxx00;
      expv[38] = 48'hxxxxxxxxxx00;
      expv[39] = 48'hxxxxxxxxxx00;
      expv[40] = 48'hxxxxxxxxxx00;
      expv[41] = 48'hxxxxxxxxxx00;
      expv[42] = 48'hxxxxxxxxxx00;
      expv[43] = 48'hxxxxxxxxxx00;
      expv[44] = 48'hxxxxxxxxxx00;
      expv[45] = 48'hxxxxxxxxxx00;
      expv[46] = 48'hxxxxxxxxxx00;
      expv[47] = 48'hxxxxxxxxxx00;
      expv[48] = 48'hxxxxxxxxxx00;
      expv[49] = 48'hxxxxxxxxxx00;
      expv[50] = 48'hxxxxxxxxxx00;
      expv[51] = 48'hxxxxxxxxxx00;
      expv[52] = 48'hxxxxxxxxxx00;
      expv[53] = 48'hxxxxxxxxxx00;
      expv[54] = 48'hxxxxxxxxxx00;
      expv[55] = 48'hxxxxxxxxxx00;
      expv[56] = 48'hxxxxxxxxxx00;
      expv[57] = 48'hxxxxxxxxxx00;
      expv[58] = 48'hxxxxxxxxxx00;
      expv[59] = 48'hxxxxxxxxxx00;
      expv[60] = 48'hxxxxxxxxxx00;
      expv[61] = 48'hxxxxxxxxxx00;
      expv[62] = 48'hxxxxxxxxxx00;
      expv[63] = 48'hxxxxxxxxxx00;
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
