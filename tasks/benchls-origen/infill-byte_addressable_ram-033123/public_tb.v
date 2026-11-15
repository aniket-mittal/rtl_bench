// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 46;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_033123 dut (
    .clk(clk),
    .MemWrite(in_vec[45:45]),
    .MemRead(in_vec[44:44]),
    .mode(in_vec[43:42]),
    .i_address(in_vec[41:32]),
    .i_write_data(in_vec[31:0]),
    .o_read_data(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 46'h3e37c8591a88;
    stim[1] = 46'h25e8535d8b72;
    stim[2] = 46'h2956daea803a;
    stim[3] = 46'h3c5ea37a01c6;
    stim[4] = 46'h056e1e800614;
    stim[5] = 46'h2bac724ff55c;
    stim[6] = 46'h1cb941a1cbe0;
    stim[7] = 46'h3ac1212aa3db;
    stim[8] = 46'h2a59c7656add;
    stim[9] = 46'h333f98998074;
    stim[10] = 46'h0f8df88ee3b0;
    stim[11] = 46'h27d68d8970ea;
    stim[12] = 46'h15d6767402c5;
    stim[13] = 46'h273ae22fcc4f;
    stim[14] = 46'h08a3c7061801;
    stim[15] = 46'h0eac7b4b333a;
    stim[16] = 46'h30c426d80aad;
    stim[17] = 46'h05f8a84dae17;
    stim[18] = 46'h1f0738279131;
    stim[19] = 46'h305c83ca1713;
    stim[20] = 46'h03b8db28ee42;
    stim[21] = 46'h0474f038b9f0;
    stim[22] = 46'h313349a2f598;
    stim[23] = 46'h2bbcbdbe93a2;
    stim[24] = 46'h1c23e8242b14;
    stim[25] = 46'h332412398fd0;
    stim[26] = 46'h3488351addaf;
    stim[27] = 46'h3d0add8674ff;
    stim[28] = 46'h2a283b180801;
    stim[29] = 46'h330b2b240b0a;
    stim[30] = 46'h2c5a7464aaf6;
    stim[31] = 46'h04e2ef5eb1d5;
    stim[32] = 46'h006ee6c81330;
    stim[33] = 46'h17157b45d5b7;
    stim[34] = 46'h35cf6ba7db36;
    stim[35] = 46'h115bf6751ecf;
    stim[36] = 46'h29106379081d;
    stim[37] = 46'h3b3b529b974a;
    stim[38] = 46'h292e2e71ee49;
    stim[39] = 46'h26303d615bb5;
    stim[40] = 46'h0ae50891046e;
    stim[41] = 46'h2ffb724ddc41;
    stim[42] = 46'h05345cc2c049;
    stim[43] = 46'h2a7a591ec95e;
    stim[44] = 46'h178c0ee3bf0a;
    stim[45] = 46'h2f80c56b56f5;
    stim[46] = 46'h2ea98136cabd;
    stim[47] = 46'h0f290d4adc94;
    stim[48] = 46'h18f31a83351d;
    stim[49] = 46'h0504c5061d5f;
    stim[50] = 46'h3558abf73e71;
    stim[51] = 46'h34585e9f2d6e;
    stim[52] = 46'h380ceba5a3a6;
    stim[53] = 46'h39650a40d781;
    stim[54] = 46'h2fab16d3fd72;
    stim[55] = 46'h3c010770100f;
    stim[56] = 46'h1e49642c9b24;
    stim[57] = 46'h066ee0236a37;
    stim[58] = 46'h0efd7a8121f7;
    stim[59] = 46'h398b569ee407;
    stim[60] = 46'h02527d6ddc7f;
    stim[61] = 46'h383d7db91add;
    stim[62] = 46'h16b85fd15050;
    stim[63] = 46'h244197d5e47f;
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
      expv[0] = 32'h00000000;
      expv[1] = 32'h00000000;
      expv[2] = 32'h00000000;
      expv[3] = 32'h00000000;
      expv[4] = 32'h00000000;
      expv[5] = 32'h00000000;
      expv[6] = 32'h00000000;
      expv[7] = 32'h00000000;
      expv[8] = 32'h00000000;
      expv[9] = 32'h00000000;
      expv[10] = 32'h00000000;
      expv[11] = 32'h00000000;
      expv[12] = 32'h00000000;
      expv[13] = 32'h00000000;
      expv[14] = 32'h00000000;
      expv[15] = 32'h00000000;
      expv[16] = 32'h00000000;
      expv[17] = 32'h00000000;
      expv[18] = 32'h00000000;
      expv[19] = 32'h00000000;
      expv[20] = 32'h00000000;
      expv[21] = 32'h00000000;
      expv[22] = 32'h00000000;
      expv[23] = 32'h00000000;
      expv[24] = 32'h00000000;
      expv[25] = 32'h00000000;
      expv[26] = 32'h00000000;
      expv[27] = 32'h00000000;
      expv[28] = 32'h00000000;
      expv[29] = 32'h00000000;
      expv[30] = 32'h00000000;
      expv[31] = 32'h00000000;
      expv[32] = 32'h00000000;
      expv[33] = 32'h00000000;
      expv[34] = 32'h00000000;
      expv[35] = 32'h00000000;
      expv[36] = 32'h00000000;
      expv[37] = 32'h000000cc;
      expv[38] = 32'h00000000;
      expv[39] = 32'h00000000;
      expv[40] = 32'h00000000;
      expv[41] = 32'h00000000;
      expv[42] = 32'h00000000;
      expv[43] = 32'h00000000;
      expv[44] = 32'h00000000;
      expv[45] = 32'h00000000;
      expv[46] = 32'h00000000;
      expv[47] = 32'h00000000;
      expv[48] = 32'h00000000;
      expv[49] = 32'h00000000;
      expv[50] = 32'h00000000;
      expv[51] = 32'h00000000;
      expv[52] = 32'h00000000;
      expv[53] = 32'h00000000;
      expv[54] = 32'h00000000;
      expv[55] = 32'h00000000;
      expv[56] = 32'h00000000;
      expv[57] = 32'h00000000;
      expv[58] = 32'h00000000;
      expv[59] = 32'h00000000;
      expv[60] = 32'h00000000;
      expv[61] = 32'h00000000;
      expv[62] = 32'h00000000;
      expv[63] = 32'h00000000;
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
