// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 35;
  localparam OW = 35;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_092619 dut (
    .ap_clk(clk),
    .ap_rst(in_vec[34:34]),
    .ap_start(in_vec[33:33]),
    .ap_continue(in_vec[32:32]),
    .in_img_linestride(in_vec[31:0]),
    .ap_done(out_vec[34:34]),
    .ap_idle(out_vec[33:33]),
    .ap_ready(out_vec[32:32]),
    .ap_return(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 35'h7daafbca7;
    stim[1] = 35'h70be31472;
    stim[2] = 35'h2547fb345;
    stim[3] = 35'h1a9dfcc3d;
    stim[4] = 35'h32f1d9207;
    stim[5] = 35'h2be5e14d1;
    stim[6] = 35'h2407ac6b0;
    stim[7] = 35'h153fded77;
    stim[8] = 35'h2b20b7957;
    stim[9] = 35'h1341cad8b;
    stim[10] = 35'h00ae148c8;
    stim[11] = 35'h126ad7f6a;
    stim[12] = 35'h09e410a41;
    stim[13] = 35'h0225a7b56;
    stim[14] = 35'h09895ee7a;
    stim[15] = 35'h13a00d491;
    stim[16] = 35'h0c6747c60;
    stim[17] = 35'h3879e08fc;
    stim[18] = 35'h03bce0297;
    stim[19] = 35'h0eabaa50d;
    stim[20] = 35'h0a717293f;
    stim[21] = 35'h24603fe3f;
    stim[22] = 35'h23e49abab;
    stim[23] = 35'h170ad8176;
    stim[24] = 35'h10bce691d;
    stim[25] = 35'h0dac6c702;
    stim[26] = 35'h090b9efaf;
    stim[27] = 35'h2e95f694b;
    stim[28] = 35'h4313562fa;
    stim[29] = 35'h20b53522a;
    stim[30] = 35'h374b17d8c;
    stim[31] = 35'h01d9c0c5b;
    stim[32] = 35'h24b112a0f;
    stim[33] = 35'h2856aeac1;
    stim[34] = 35'h156f44aac;
    stim[35] = 35'h3158e99d6;
    stim[36] = 35'h34dffa9ce;
    stim[37] = 35'h13b9bf71c;
    stim[38] = 35'h224a338e6;
    stim[39] = 35'h2623442c0;
    stim[40] = 35'h18fea1028;
    stim[41] = 35'h2eaf5c9ae;
    stim[42] = 35'h192b7f0d7;
    stim[43] = 35'h1c280c7e9;
    stim[44] = 35'h01699c965;
    stim[45] = 35'h3ab1fd4c3;
    stim[46] = 35'h28a04e8cd;
    stim[47] = 35'h3d4b2e77f;
    stim[48] = 35'h347b79e1b;
    stim[49] = 35'h1746877c6;
    stim[50] = 35'h0616929c9;
    stim[51] = 35'h3133bd895;
    stim[52] = 35'h3e3198da0;
    stim[53] = 35'h35bfe7b2a;
    stim[54] = 35'h3d44c66d6;
    stim[55] = 35'h186c66981;
    stim[56] = 35'h0b6c3c5b4;
    stim[57] = 35'h3f6802f95;
    stim[58] = 35'h1ad3539a4;
    stim[59] = 35'h0f2152884;
    stim[60] = 35'h1176f3cd3;
    stim[61] = 35'h37f0db905;
    stim[62] = 35'h0d878c54c;
    stim[63] = 35'h0b5206d1d;
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
      expv[0] = 35'h0xxxxxxxx;
      expv[1] = 35'h0ed57de54;
      expv[2] = 35'h005f18a39;
      expv[3] = 35'h52a3fd9a2;
      expv[4] = 35'h02a3fd9a2;
      expv[5] = 35'h5178ec903;
      expv[6] = 35'h4178ec903;
      expv[7] = 35'h6203d6358;
      expv[8] = 35'h029fef6bb;
      expv[9] = 35'h5d905bcac;
      expv[10] = 35'h2d905bcac;
      expv[11] = 35'h20570a464;
      expv[12] = 35'h21356bfb5;
      expv[13] = 35'h2cf208521;
      expv[14] = 35'h2112d3dab;
      expv[15] = 35'h2cc4af73d;
      expv[16] = 35'h21d006a48;
      expv[17] = 35'h0e33a3e30;
      expv[18] = 35'h5c3cf047e;
      expv[19] = 35'h6c3cf047e;
      expv[20] = 35'h6f55d5287;
      expv[21] = 35'h4d38b94a0;
      expv[22] = 35'h42301ff1f;
      expv[23] = 35'h61f24d5d5;
      expv[24] = 35'h23856c0bb;
      expv[25] = 35'h205e7348e;
      expv[26] = 35'h2ed636381;
      expv[27] = 35'h0c85cf7d8;
      expv[28] = 35'h5f4afb4a6;
      expv[29] = 35'h0f4afb4a6;
      expv[30] = 35'h505a9a915;
      expv[31] = 35'h205a9a915;
      expv[32] = 35'h00ece062d;
      expv[33] = 35'h525889507;
      expv[34] = 35'h625889507;
      expv[35] = 35'h02b7a2556;
      expv[36] = 35'h50ac74ceb;
      expv[37] = 35'h20ac74ceb;
      expv[38] = 35'h01dcdfb8e;
      expv[39] = 35'h512519c73;
      expv[40] = 35'h612519c73;
      expv[41] = 35'h0c7f50814;
      expv[42] = 35'h5f57ae4d7;
      expv[43] = 35'h2f57ae4d7;
      expv[44] = 35'h2e14063f5;
      expv[45] = 35'h00b4ce4b2;
      expv[46] = 35'h5d58fea62;
      expv[47] = 35'h4d58fea62;
      expv[48] = 35'h0ea5973c0;
      expv[49] = 35'h523dbcf0d;
      expv[50] = 35'h223dbcf0d;
      expv[51] = 35'h030b494e4;
      expv[52] = 35'h5099dec4a;
      expv[53] = 35'h0099dec4a;
      expv[54] = 35'h52dff3d95;
      expv[55] = 35'h22dff3d95;
      expv[56] = 35'h2c36334c1;
      expv[57] = 35'h0db61e2da;
      expv[58] = 35'h5fb4017cb;
      expv[59] = 35'h2fb4017cb;
      expv[60] = 35'h2f90a9442;
      expv[61] = 35'h00bb79e69;
      expv[62] = 35'h53f86dc82;
      expv[63] = 35'h63f86dc82;
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
