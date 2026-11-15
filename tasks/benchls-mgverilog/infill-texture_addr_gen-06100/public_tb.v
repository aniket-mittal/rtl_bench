// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 36;
  localparam OW = 20;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_06100 dut (
    .clk(clk),
    .u(in_vec[35:29]),
    .v(in_vec[28:22]),
    .start(in_vec[21:4]),
    .factor(in_vec[3:1]),
    .enable(in_vec[0:0]),
    .addr(out_vec[19:2]),
    .texelselect(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 36'hfd717ff02;
    stim[1] = 36'hd50de0975;
    stim[2] = 36'h5277c8df0;
    stim[3] = 36'h1c4195c32;
    stim[4] = 36'h914fe4230;
    stim[5] = 36'haaaff7e27;
    stim[6] = 36'he2985e055;
    stim[7] = 36'hc84c81510;
    stim[8] = 36'h74d81f50f;
    stim[9] = 36'h29b481554;
    stim[10] = 36'ha539379b4;
    stim[11] = 36'h7ad916c5c;
    stim[12] = 36'hfa21504df;
    stim[13] = 36'hc508db6f9;
    stim[14] = 36'hc26b0d89a;
    stim[15] = 36'h1c730ce5b;
    stim[16] = 36'hce0edea32;
    stim[17] = 36'h338ba5462;
    stim[18] = 36'h9f9dc3ce5;
    stim[19] = 36'h1b76d0f45;
    stim[20] = 36'hf78c3d8a0;
    stim[21] = 36'ha6dfd0085;
    stim[22] = 36'h46d658402;
    stim[23] = 36'h04c262048;
    stim[24] = 36'h30e197cef;
    stim[25] = 36'heb6577111;
    stim[26] = 36'h211f650ac;
    stim[27] = 36'h2d1191313;
    stim[28] = 36'he903cbe9e;
    stim[29] = 36'hb7e2d0d8d;
    stim[30] = 36'he3748c0b5;
    stim[31] = 36'h420187850;
    stim[32] = 36'hbfe23bfab;
    stim[33] = 36'he5e7f2c48;
    stim[34] = 36'h3faa1db44;
    stim[35] = 36'h7f92d184d;
    stim[36] = 36'h3f7883211;
    stim[37] = 36'hc6332fd32;
    stim[38] = 36'h4279515af;
    stim[39] = 36'h46190c29c;
    stim[40] = 36'h30d39ea25;
    stim[41] = 36'h1469ab528;
    stim[42] = 36'h32767ba3e;
    stim[43] = 36'h7414dd90f;
    stim[44] = 36'h2b71f676e;
    stim[45] = 36'hffa16008d;
    stim[46] = 36'h221998a1d;
    stim[47] = 36'h0c430c40d;
    stim[48] = 36'he01e8a959;
    stim[49] = 36'hbe81a45d6;
    stim[50] = 36'h4a6cb2cd3;
    stim[51] = 36'h902a1b97b;
    stim[52] = 36'h52b07cd25;
    stim[53] = 36'h47b5dcc18;
    stim[54] = 36'h2c37ebce6;
    stim[55] = 36'h5358cd8c5;
    stim[56] = 36'h674392667;
    stim[57] = 36'h519b5ef74;
    stim[58] = 36'hfbe0d9bf2;
    stim[59] = 36'hdadd524d0;
    stim[60] = 36'h8d61eca2b;
    stim[61] = 36'h219f7b71b;
    stim[62] = 36'h8e72ffc90;
    stim[63] = 36'h627bfded8;
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
      expv[0] = 20'hxxxxx;
      expv[1] = 20'hxxxxx;
      expv[2] = 20'hxxxxx;
      expv[3] = 20'hf24f2;
      expv[4] = 20'h6598e;
      expv[5] = 20'hf9202;
      expv[6] = 20'hfe851;
      expv[7] = 20'h17b19;
      expv[8] = 20'h2064d;
      expv[9] = 20'h0c9b2;
      expv[10] = 20'h208ee;
      expv[11] = 20'h4e206;
      expv[12] = 20'h4914e;
      expv[13] = 20'h5ad6d;
      expv[14] = 20'h3703a;
      expv[15] = 20'hc5786;
      expv[16] = 20'hc54f6;
      expv[17] = 20'hb7b7a;
      expv[18] = 20'he9606;
      expv[19] = 20'h71107;
      expv[20] = 20'hb4a8d;
      expv[21] = 20'h0f7a9;
      expv[22] = 20'hf45ff;
      expv[23] = 20'h9630b;
      expv[24] = 20'h99623;
      expv[25] = 20'h6cd88;
      expv[26] = 20'h5dd3d;
      expv[27] = 20'hded9d;
      expv[28] = 20'h64802;
      expv[29] = 20'hfb7ba;
      expv[30] = 20'hb8777;
      expv[31] = 20'h23805;
      expv[32] = 20'h61ff9;
      expv[33] = 20'h91edb;
      expv[34] = 20'hfe96f;
      expv[35] = 20'h87eaf;
      expv[36] = 20'hbbe6f;
      expv[37] = 20'h20e53;
      expv[38] = 20'hcc25b;
      expv[39] = 20'h60185;
      expv[40] = 20'h44ec5;
      expv[41] = 20'he7c88;
      expv[42] = 20'h6ba60;
      expv[43] = 20'ha56a4;
      expv[44] = 20'h3de5a;
      expv[45] = 20'h7e412;
      expv[46] = 20'h5855b;
      expv[47] = 20'h6cb01;
      expv[48] = 20'hc3712;
      expv[49] = 20'ha2e58;
      expv[50] = 20'h692c4;
      expv[51] = 20'h2cbdd;
      expv[52] = 20'h87c00;
      expv[53] = 20'h1f431;
      expv[54] = 20'h77e2d;
      expv[55] = 20'hfb4e1;
      expv[56] = 20'h33919;
      expv[57] = 20'he5483;
      expv[58] = 20'hd810f;
      expv[59] = 20'h369af;
      expv[60] = 20'h54aa7;
      expv[61] = 20'h7daba;
      expv[62] = 20'he1a08;
      expv[63] = 20'hc00d0;
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
