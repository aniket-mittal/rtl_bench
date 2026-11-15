// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 27;
  localparam OW = 19;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_09770 dut (
    .clk(clk),
    .s444_vs(in_vec[26:26]),
    .s444_hs(in_vec[25:25]),
    .s444_de(in_vec[24:24]),
    .s444_data(in_vec[23:0]),
    .s422_vs(out_vec[18:18]),
    .s422_hs(out_vec[17:17]),
    .s422_de(out_vec[16:16]),
    .s422_data(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 27'h4d662f7;
    stim[1] = 27'h6845567;
    stim[2] = 27'h7143f94;
    stim[3] = 27'h3f87979;
    stim[4] = 27'h0d53e14;
    stim[5] = 27'h58e7414;
    stim[6] = 27'h2fd190c;
    stim[7] = 27'h3c26c77;
    stim[8] = 27'h34ea661;
    stim[9] = 27'h299bc65;
    stim[10] = 27'h074f397;
    stim[11] = 27'h23620a1;
    stim[12] = 27'h7c72472;
    stim[13] = 27'h0fb00cd;
    stim[14] = 27'h644308c;
    stim[15] = 27'h58c3ffe;
    stim[16] = 27'h215b48e;
    stim[17] = 27'h5105b35;
    stim[18] = 27'h202ff3c;
    stim[19] = 27'h6332046;
    stim[20] = 27'h4efdb43;
    stim[21] = 27'h5afa9b7;
    stim[22] = 27'h0335e52;
    stim[23] = 27'h1d43bc7;
    stim[24] = 27'h3a6feaa;
    stim[25] = 27'h29ea7cb;
    stim[26] = 27'h3cdc8aa;
    stim[27] = 27'h255bdf2;
    stim[28] = 27'h7d27e12;
    stim[29] = 27'h07e08a1;
    stim[30] = 27'h01e4266;
    stim[31] = 27'h0f7694f;
    stim[32] = 27'h1bd0cec;
    stim[33] = 27'h3d37c4c;
    stim[34] = 27'h08eb7db;
    stim[35] = 27'h714b83c;
    stim[36] = 27'h02c93fe;
    stim[37] = 27'h5019bd5;
    stim[38] = 27'h5115de0;
    stim[39] = 27'h7d9344e;
    stim[40] = 27'h7dcb088;
    stim[41] = 27'h6ff0507;
    stim[42] = 27'h799b87e;
    stim[43] = 27'h4622519;
    stim[44] = 27'h5d484bb;
    stim[45] = 27'h005b073;
    stim[46] = 27'h2a95cdf;
    stim[47] = 27'h3513b9a;
    stim[48] = 27'h602b5ed;
    stim[49] = 27'h5c90b85;
    stim[50] = 27'h371c83c;
    stim[51] = 27'h4be7b04;
    stim[52] = 27'h6278d5f;
    stim[53] = 27'h0a0cca0;
    stim[54] = 27'h5ad9f75;
    stim[55] = 27'h46e021a;
    stim[56] = 27'h2c98a90;
    stim[57] = 27'h0db5821;
    stim[58] = 27'h73cd0f5;
    stim[59] = 27'h168a396;
    stim[60] = 27'h37ad184;
    stim[61] = 27'h77dbc22;
    stim[62] = 27'h5a51e28;
    stim[63] = 27'h63bd807;
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
      expv[0] = 19'h00000;
      expv[1] = 19'h00000;
      expv[2] = 19'h00000;
      expv[3] = 19'h00000;
      expv[4] = 19'h40000;
      expv[5] = 19'h60000;
      expv[6] = 19'h7683f;
      expv[7] = 19'h38179;
      expv[8] = 19'h00000;
      expv[9] = 19'h50a74;
      expv[10] = 19'h20000;
      expv[11] = 19'h3536c;
      expv[12] = 19'h357a6;
      expv[13] = 19'h20000;
      expv[14] = 19'h00000;
      expv[15] = 19'h20000;
      expv[16] = 19'h73924;
      expv[17] = 19'h00000;
      expv[18] = 19'h60000;
      expv[19] = 19'h57f3f;
      expv[20] = 19'h20000;
      expv[21] = 19'h51a5b;
      expv[22] = 19'h20000;
      expv[23] = 19'h60000;
      expv[24] = 19'h40000;
      expv[25] = 19'h55ba9;
      expv[26] = 19'h00000;
      expv[27] = 19'h18e3b;
      expv[28] = 19'h388fe;
      expv[29] = 19'h20000;
      expv[30] = 19'h355c8;
      expv[31] = 19'h20000;
      expv[32] = 19'h7097e;
      expv[33] = 19'h00000;
      expv[34] = 19'h00000;
      expv[35] = 19'h00000;
      expv[36] = 19'h1890c;
      expv[37] = 19'h3987c;
      expv[38] = 19'h00000;
      expv[39] = 19'h71eb8;
      expv[40] = 19'h00000;
      expv[41] = 19'h5a29b;
      expv[42] = 19'h53f5d;
      expv[43] = 19'h78134;
      expv[44] = 19'h7a4b0;
      expv[45] = 19'h60000;
      expv[46] = 19'h73fb8;
      expv[47] = 19'h40000;
      expv[48] = 19'h55d84;
      expv[49] = 19'h00000;
      expv[50] = 19'h20000;
      expv[51] = 19'h34d3b;
      expv[52] = 19'h60000;
      expv[53] = 19'h5510b;
      expv[54] = 19'h36ac8;
      expv[55] = 19'h40000;
      expv[56] = 19'h60000;
      expv[57] = 19'h00000;
      expv[58] = 19'h53a9f;
      expv[59] = 19'h40000;
      expv[60] = 19'h20000;
      expv[61] = 19'h00000;
      expv[62] = 19'h7a0d0;
      expv[63] = 19'h161a3;
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
