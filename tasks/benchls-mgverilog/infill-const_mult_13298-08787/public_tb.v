// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_08787 dut (
    .i_data0(in_vec[31:0]),
    .o_data0(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'h280eebc6;
    stim[1] = 32'h26dff802;
    stim[2] = 32'h7327618c;
    stim[3] = 32'h6d011d27;
    stim[4] = 32'hae79e052;
    stim[5] = 32'had741298;
    stim[6] = 32'h505addb2;
    stim[7] = 32'h8e200be7;
    stim[8] = 32'h3688de80;
    stim[9] = 32'hbaf5b85c;
    stim[10] = 32'h2c4d2445;
    stim[11] = 32'hc62811f9;
    stim[12] = 32'hde8032d5;
    stim[13] = 32'hfc8b1f6a;
    stim[14] = 32'h02ed85f9;
    stim[15] = 32'h03fb48b3;
    stim[16] = 32'h4374cbf5;
    stim[17] = 32'hd0d08743;
    stim[18] = 32'hfe58beb0;
    stim[19] = 32'h2ec52659;
    stim[20] = 32'h4751a192;
    stim[21] = 32'h9baa03a7;
    stim[22] = 32'hc0685982;
    stim[23] = 32'h71cf2bf5;
    stim[24] = 32'h46859932;
    stim[25] = 32'h889a9bca;
    stim[26] = 32'h153d600d;
    stim[27] = 32'hba90f7af;
    stim[28] = 32'heeb60403;
    stim[29] = 32'h86e900c5;
    stim[30] = 32'he085c32c;
    stim[31] = 32'h01d4330b;
    stim[32] = 32'h7b0a2fcf;
    stim[33] = 32'h53272349;
    stim[34] = 32'h993142e9;
    stim[35] = 32'h6e6e5bc7;
    stim[36] = 32'h82547c49;
    stim[37] = 32'h455b9f0a;
    stim[38] = 32'h768cc0fa;
    stim[39] = 32'h409b77fa;
    stim[40] = 32'h395d875e;
    stim[41] = 32'h5dc3ef41;
    stim[42] = 32'ha68b5699;
    stim[43] = 32'hdb0d9389;
    stim[44] = 32'h85d60898;
    stim[45] = 32'hd9f24044;
    stim[46] = 32'h4430f286;
    stim[47] = 32'ha7535c33;
    stim[48] = 32'h0d960006;
    stim[49] = 32'h1d59be72;
    stim[50] = 32'h72ceb08b;
    stim[51] = 32'hba670bbf;
    stim[52] = 32'hc870537a;
    stim[53] = 32'hcd3f5f15;
    stim[54] = 32'hfc7630f4;
    stim[55] = 32'h767e73ab;
    stim[56] = 32'h91593ab7;
    stim[57] = 32'h38bd586b;
    stim[58] = 32'hdbbf09fe;
    stim[59] = 32'h5ed20b5e;
    stim[60] = 32'h2550c07a;
    stim[61] = 32'hc7ae8a6e;
    stim[62] = 32'h45f3f595;
    stim[63] = 32'h10fea17a;
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
      expv[0] = 32'hd713532c;
      expv[1] = 32'h5e20d7e4;
      expv[2] = 32'hb3a91a58;
      expv[3] = 32'h43dc53de;
      expv[4] = 32'h36e66384;
      expv[5] = 32'h176ddbb0;
      expv[6] = 32'h10100844;
      expv[7] = 32'hbcaa455e;
      expv[8] = 32'hd1b5d500;
      expv[9] = 32'hb0029af8;
      expv[10] = 32'h3f26083a;
      expv[11] = 32'h4d759862;
      expv[12] = 32'hdf507c5a;
      expv[13] = 32'h72c5d034;
      expv[14] = 32'h16394062;
      expv[15] = 32'hd3066236;
      expv[16] = 32'h090a9c9a;
      expv[17] = 32'hf0123656;
      expv[18] = 32'h1de15260;
      expv[19] = 32'h7d01fb22;
      expv[20] = 32'hae5ad204;
      expv[21] = 32'h0571b8de;
      expv[22] = 32'hac7982e4;
      expv[23] = 32'hdb995c9a;
      expv[24] = 32'h47cfc744;
      expv[25] = 32'hef3082f4;
      expv[26] = 32'h4e27634a;
      expv[27] = 32'h3e62006e;
      expv[28] = 32'headc63d6;
      expv[29] = 32'hf369f93a;
      expv[30] = 32'he4544398;
      expv[31] = 32'h00c37166;
      expv[32] = 32'h57276eae;
      expv[33] = 32'h6706e602;
      expv[34] = 32'ha0e5ab42;
      expv[35] = 32'h609b671e;
      expv[36] = 32'h08a00802;
      expv[37] = 32'hd14b5574;
      expv[38] = 32'h1b803a54;
      expv[39] = 32'h0bde3854;
      expv[40] = 32'hdc61b0dc;
      expv[41] = 32'habe21e72;
      expv[42] = 32'h31f857a2;
      expv[43] = 32'hc739c282;
      expv[44] = 32'h280a67b0;
      expv[45] = 32'h49ce4c48;
      expv[46] = 32'h3695f4ac;
      expv[47] = 32'hc82b5136;
      expv[48] = 32'hb9cd37ac;
      expv[49] = 32'h9fc6bdc4;
      expv[50] = 32'hb48e9466;
      expv[51] = 32'hbcc0278e;
      expv[52] = 32'hdad03754;
      expv[53] = 32'ha5d910da;
      expv[54] = 32'h337ae2a8;
      expv[55] = 32'h349468a6;
      expv[56] = 32'h2d0bf5fe;
      expv[57] = 32'h5b9ae626;
      expv[58] = 32'hc9950c1c;
      expv[59] = 32'h7ad278dc;
      expv[60] = 32'h5cae4154;
      expv[61] = 32'h8892c5fc;
      expv[62] = 32'hba8ad5da;
      expv[63] = 32'hcadff354;
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
