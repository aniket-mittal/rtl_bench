// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 49;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_025372 dut (
    .clk(clk),
    .reset_n(in_vec[48:48]),
    .fsm(in_vec[47:44]),
    .sin(in_vec[43:43]),
    .din(in_vec[42:35]),
    .vtc_en(in_vec[34:32]),
    .dvtc_a(in_vec[31:24]),
    .dvtc_b(in_vec[23:16]),
    .dvtc_c(in_vec[15:8]),
    .d_last(in_vec[7:0]),
    .ram_d(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 49'h05174ef8caa63;
    stim[1] = 49'h06c709cbf829f;
    stim[2] = 49'h1dd1cf6aab7f2;
    stim[3] = 49'h190a6037eedea;
    stim[4] = 49'h128d2d5217b83;
    stim[5] = 49'h1831c6dd6a28a;
    stim[6] = 49'h1c738c9c600be;
    stim[7] = 49'h1c47c951875a0;
    stim[8] = 49'h13297af608e2a;
    stim[9] = 49'h150347aabe7b8;
    stim[10] = 49'h1d57fb8a81693;
    stim[11] = 49'h1dc861b840d10;
    stim[12] = 49'h1d28bc8e9bf01;
    stim[13] = 49'h1703c1f5d0bd7;
    stim[14] = 49'h1204e8aba43f6;
    stim[15] = 49'h1773bd6bdcce7;
    stim[16] = 49'h16fa625303256;
    stim[17] = 49'h10d5cf7599cb1;
    stim[18] = 49'h194977424d303;
    stim[19] = 49'h145ceb96c7291;
    stim[20] = 49'h1784d5601364f;
    stim[21] = 49'h1b9e48662b82e;
    stim[22] = 49'h1f7df7c76be9f;
    stim[23] = 49'h1a39296a07a83;
    stim[24] = 49'h116e70e214d95;
    stim[25] = 49'h1f6b91ab15b35;
    stim[26] = 49'h13c0d87827ac3;
    stim[27] = 49'h1335cd1620839;
    stim[28] = 49'h1454119db3d88;
    stim[29] = 49'h161c87927fcc8;
    stim[30] = 49'h1fbcf6919dd8b;
    stim[31] = 49'h1f5f429caea04;
    stim[32] = 49'h1bb224c354332;
    stim[33] = 49'h17b1303306a64;
    stim[34] = 49'h1487026a423c1;
    stim[35] = 49'h15ad1f4db5227;
    stim[36] = 49'h1afe73e3c47ce;
    stim[37] = 49'h11087880b5875;
    stim[38] = 49'h15f94f85f5a58;
    stim[39] = 49'h1a318d6c068ae;
    stim[40] = 49'h1d4725313c5af;
    stim[41] = 49'h105953bd66a7d;
    stim[42] = 49'h19af8f0220a55;
    stim[43] = 49'h1da6f3ea5791a;
    stim[44] = 49'h107ec1a8f1a7a;
    stim[45] = 49'h13f4ef649dd3d;
    stim[46] = 49'h1f0175868fca1;
    stim[47] = 49'h1293f77674899;
    stim[48] = 49'h185c588a7765a;
    stim[49] = 49'h18f39d8c9771d;
    stim[50] = 49'h135806d62c221;
    stim[51] = 49'h1cd994afc10fd;
    stim[52] = 49'h18087bf65b6a5;
    stim[53] = 49'h1a956376ec48a;
    stim[54] = 49'h1c3d5d92fe705;
    stim[55] = 49'h1a96895d613c2;
    stim[56] = 49'h105670d1a2715;
    stim[57] = 49'h11a810793b088;
    stim[58] = 49'h15a5dc382ba5a;
    stim[59] = 49'h14815b7403b9d;
    stim[60] = 49'h1fa7cdabf9018;
    stim[61] = 49'h1f412ca94f5ce;
    stim[62] = 49'h1bae3094f070b;
    stim[63] = 49'h1f4a67b38d1af;
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
      expv[0] = 8'h00;
      expv[1] = 8'h00;
      expv[2] = 8'h00;
      expv[3] = 8'hbb;
      expv[4] = 8'hbb;
      expv[5] = 8'h1a;
      expv[6] = 8'h1a;
      expv[7] = 8'h1a;
      expv[8] = 8'h6a;
      expv[9] = 8'h6a;
      expv[10] = 8'ha9;
      expv[11] = 8'h3b;
      expv[12] = 8'h18;
      expv[13] = 8'he9;
      expv[14] = 8'h53;
      expv[15] = 8'h53;
      expv[16] = 8'hbd;
      expv[17] = 8'hf4;
      expv[18] = 8'hf4;
      expv[19] = 8'hf4;
      expv[20] = 8'h9a;
      expv[21] = 8'h09;
      expv[22] = 8'h3c;
      expv[23] = 8'h9b;
      expv[24] = 8'h9b;
      expv[25] = 8'h9b;
      expv[26] = 8'h9b;
      expv[27] = 8'h81;
      expv[28] = 8'h81;
      expv[29] = 8'h81;
      expv[30] = 8'h81;
      expv[31] = 8'h79;
      expv[32] = 8'h0f;
      expv[33] = 8'h64;
      expv[34] = 8'h62;
      expv[35] = 8'h62;
      expv[36] = 8'h62;
      expv[37] = 8'hfc;
      expv[38] = 8'hfc;
      expv[39] = 8'hfa;
      expv[40] = 8'hfa;
      expv[41] = 8'h13;
      expv[42] = 8'h13;
      expv[43] = 8'h13;
      expv[44] = 8'h9d;
      expv[45] = 8'h9d;
      expv[46] = 8'he9;
      expv[47] = 8'hb3;
      expv[48] = 8'h27;
      expv[49] = 8'h27;
      expv[50] = 8'h27;
      expv[51] = 8'h27;
      expv[52] = 8'h27;
      expv[53] = 8'h27;
      expv[54] = 8'h2a;
      expv[55] = 8'hbb;
      expv[56] = 8'h2d;
      expv[57] = 8'h2d;
      expv[58] = 8'h2d;
      expv[59] = 8'h23;
      expv[60] = 8'h55;
      expv[61] = 8'h4f;
      expv[62] = 8'h94;
      expv[63] = 8'h5c;
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
