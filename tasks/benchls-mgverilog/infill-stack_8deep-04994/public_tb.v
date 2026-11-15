// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 34;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04994 dut (
    .clk(clk),
    .push(in_vec[33:33]),
    .pop(in_vec[32:32]),
    .data_i(in_vec[31:0]),
    .data_o(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 34'h257c817d1;
    stim[1] = 34'h04cc14b55;
    stim[2] = 34'h02d775688;
    stim[3] = 34'h0589efc22;
    stim[4] = 34'h37ee85a1b;
    stim[5] = 34'h2e22041b9;
    stim[6] = 34'h0d5cd9642;
    stim[7] = 34'h3c72388a7;
    stim[8] = 34'h1cbfbf79c;
    stim[9] = 34'h0e4ac13af;
    stim[10] = 34'h2a3ae02f9;
    stim[11] = 34'h3640c3b54;
    stim[12] = 34'h19a3eb743;
    stim[13] = 34'h193f3ec07;
    stim[14] = 34'h02410e7f3;
    stim[15] = 34'h396e00ce9;
    stim[16] = 34'h327812f7f;
    stim[17] = 34'h1d70e3192;
    stim[18] = 34'h11153e14e;
    stim[19] = 34'h03553d8d3;
    stim[20] = 34'h2f11e4644;
    stim[21] = 34'h2f18138be;
    stim[22] = 34'h360bf51a9;
    stim[23] = 34'h04a527d56;
    stim[24] = 34'h394ea5225;
    stim[25] = 34'h06394a0c1;
    stim[26] = 34'h36fb8da03;
    stim[27] = 34'h0d4b9a994;
    stim[28] = 34'h360b608e2;
    stim[29] = 34'h04cf6c13d;
    stim[30] = 34'h33633c0c1;
    stim[31] = 34'h174240378;
    stim[32] = 34'h3aa724463;
    stim[33] = 34'h2efb35cc5;
    stim[34] = 34'h251e591ec;
    stim[35] = 34'h15d11f04e;
    stim[36] = 34'h009f2d02c;
    stim[37] = 34'h2b5877b1b;
    stim[38] = 34'h24de4a262;
    stim[39] = 34'h05b85179b;
    stim[40] = 34'h2f413e74b;
    stim[41] = 34'h0c98a3a20;
    stim[42] = 34'h388af7008;
    stim[43] = 34'h1ca15e396;
    stim[44] = 34'h01beb25e9;
    stim[45] = 34'h1ed0aca2b;
    stim[46] = 34'h2db1506a3;
    stim[47] = 34'h1ed4b0dbb;
    stim[48] = 34'h33563638c;
    stim[49] = 34'h0632d69bb;
    stim[50] = 34'h246e68c61;
    stim[51] = 34'h1f94095a4;
    stim[52] = 34'h39b084e9f;
    stim[53] = 34'h26a357358;
    stim[54] = 34'h1543bf136;
    stim[55] = 34'h2fd015d0c;
    stim[56] = 34'h2d2327b47;
    stim[57] = 34'h027a8ea47;
    stim[58] = 34'h2b94965e4;
    stim[59] = 34'h004a734b1;
    stim[60] = 34'h37ebdd3ac;
    stim[61] = 34'h1b5cb876b;
    stim[62] = 34'h01470c1a2;
    stim[63] = 34'h0db7cc231;
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
      expv[0] = 32'hxxxxxxxx;
      expv[1] = 32'h57c817d1;
      expv[2] = 32'h57c817d1;
      expv[3] = 32'h57c817d1;
      expv[4] = 32'h57c817d1;
      expv[5] = 32'h7ee85a1b;
      expv[6] = 32'he22041b9;
      expv[7] = 32'he22041b9;
      expv[8] = 32'hc72388a7;
      expv[9] = 32'he22041b9;
      expv[10] = 32'he22041b9;
      expv[11] = 32'ha3ae02f9;
      expv[12] = 32'h640c3b54;
      expv[13] = 32'ha3ae02f9;
      expv[14] = 32'he22041b9;
      expv[15] = 32'he22041b9;
      expv[16] = 32'h96e00ce9;
      expv[17] = 32'h27812f7f;
      expv[18] = 32'h96e00ce9;
      expv[19] = 32'he22041b9;
      expv[20] = 32'he22041b9;
      expv[21] = 32'hf11e4644;
      expv[22] = 32'hf18138be;
      expv[23] = 32'h60bf51a9;
      expv[24] = 32'h60bf51a9;
      expv[25] = 32'h94ea5225;
      expv[26] = 32'h94ea5225;
      expv[27] = 32'h6fb8da03;
      expv[28] = 32'h6fb8da03;
      expv[29] = 32'h60b608e2;
      expv[30] = 32'h60b608e2;
      expv[31] = 32'h3633c0c1;
      expv[32] = 32'h60b608e2;
      expv[33] = 32'haa724463;
      expv[34] = 32'hefb35cc5;
      expv[35] = 32'h51e591ec;
      expv[36] = 32'hefb35cc5;
      expv[37] = 32'hefb35cc5;
      expv[38] = 32'hb5877b1b;
      expv[39] = 32'h4de4a262;
      expv[40] = 32'h4de4a262;
      expv[41] = 32'hf413e74b;
      expv[42] = 32'hf413e74b;
      expv[43] = 32'h88af7008;
      expv[44] = 32'hf413e74b;
      expv[45] = 32'hf413e74b;
      expv[46] = 32'h4de4a262;
      expv[47] = 32'hdb1506a3;
      expv[48] = 32'h4de4a262;
      expv[49] = 32'h3563638c;
      expv[50] = 32'h3563638c;
      expv[51] = 32'h46e68c61;
      expv[52] = 32'h3563638c;
      expv[53] = 32'h9b084e9f;
      expv[54] = 32'h6a357358;
      expv[55] = 32'h9b084e9f;
      expv[56] = 32'hfd015d0c;
      expv[57] = 32'hd2327b47;
      expv[58] = 32'hd2327b47;
      expv[59] = 32'hb94965e4;
      expv[60] = 32'hb94965e4;
      expv[61] = 32'h7ebdd3ac;
      expv[62] = 32'hb94965e4;
      expv[63] = 32'hb94965e4;
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
