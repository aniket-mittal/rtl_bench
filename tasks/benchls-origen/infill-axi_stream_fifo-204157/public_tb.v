// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 67;
  localparam OW = 110;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_204157 dut (
    .clk(clk),
    .rst_n(in_vec[66:66]),
    .ififo_wdata(in_vec[65:2]),
    .ififo_wen(in_vec[1:1]),
    .tfifo_rready(in_vec[0:0]),
    .ififo_rdy(out_vec[109:109]),
    .tfifo_rdata(out_vec[108:45]),
    .tfifo_rstrb(out_vec[44:37]),
    .tfifo_rkeep(out_vec[36:29]),
    .tfifo_rid(out_vec[28:21]),
    .tfifo_rdest(out_vec[20:13]),
    .tfifo_ruser(out_vec[12:5]),
    .tfifo_rlast(out_vec[4:4]),
    .tfifo_rvalid(out_vec[3:3]),
    .fifo_empty(out_vec[2:2]),
    .fifo_full(out_vec[1:1]),
    .fifo_almost_full(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 67'h27359dde07dfd7287;
    stim[1] = 67'h076a9a5a03e0f2186;
    stim[2] = 67'h5e63f18f2b67300f5;
    stim[3] = 67'h567162efdada0287e;
    stim[4] = 67'h7662a8a11dfbafe3d;
    stim[5] = 67'h7af93c5767bbbe7a7;
    stim[6] = 67'h3d6d129011c492b79;
    stim[7] = 67'h4daf49fed2088fb5a;
    stim[8] = 67'h5bacbeda7dcc0764b;
    stim[9] = 67'h6230a5ea2e4800b3c;
    stim[10] = 67'h5423c8935beb6959a;
    stim[11] = 67'h56f30807e8a4b932f;
    stim[12] = 67'h4d1c109df5c4671d8;
    stim[13] = 67'h54b93e69b228001d5;
    stim[14] = 67'h6563f7556e603c724;
    stim[15] = 67'h54fe86e96c46095f1;
    stim[16] = 67'h620f1144f849f5e79;
    stim[17] = 67'h50aa2e85525d12bcd;
    stim[18] = 67'h61f92b4c2157664e6;
    stim[19] = 67'h639931e9a406e775f;
    stim[20] = 67'h7d4ee83fb571c756a;
    stim[21] = 67'h4843b7794a0058ace;
    stim[22] = 67'h61fe9919d5cb3c1e6;
    stim[23] = 67'h31eccda3df08d82e1;
    stim[24] = 67'h71bf0ad3aa737b160;
    stim[25] = 67'h41a099b442bb515d1;
    stim[26] = 67'h44cf227957dd3ea13;
    stim[27] = 67'h5107bce154cedf0c0;
    stim[28] = 67'h5e20cad0d87d7dd17;
    stim[29] = 67'h6fa3eadd57e2ff7cb;
    stim[30] = 67'h4e7d21360b7a18de4;
    stim[31] = 67'h6ca283cf8d7574344;
    stim[32] = 67'h54434ba6106dae233;
    stim[33] = 67'h6c7e21482913d103d;
    stim[34] = 67'h54381c0a585a676f5;
    stim[35] = 67'h66229efaaf2efcbd0;
    stim[36] = 67'h6e22c690b40b752c8;
    stim[37] = 67'h5dc5f68af03b32b47;
    stim[38] = 67'h7c0c73631f3c3e7ac;
    stim[39] = 67'h66330cb6983059161;
    stim[40] = 67'h4ca47ace4f1c182ff;
    stim[41] = 67'h5cce864bfe0fa7065;
    stim[42] = 67'h7c34ca453a2ca22b9;
    stim[43] = 67'h6d84b600399b1a7b1;
    stim[44] = 67'h6c101555e3de25f51;
    stim[45] = 67'h6ab9f803129fa6202;
    stim[46] = 67'h62155a8bab612eedf;
    stim[47] = 67'h58f0cf69627bd7d59;
    stim[48] = 67'h3aea8e2236a08b3d2;
    stim[49] = 67'h57a24f758f141ee33;
    stim[50] = 67'h47da0d5d9ac3a0d59;
    stim[51] = 67'h6f0eff42c7f7a89e3;
    stim[52] = 67'h522d8506a666f730b;
    stim[53] = 67'h0a5d896311963d3a5;
    stim[54] = 67'h79ca525fa84dfa3b6;
    stim[55] = 67'h5f0ca14d7f57c6e5f;
    stim[56] = 67'h72ed731e3d53752a3;
    stim[57] = 67'h584d071bf8d4b505f;
    stim[58] = 67'h6f95259c5b4d2d37b;
    stim[59] = 67'h4bc7561f23caad648;
    stim[60] = 67'h4a55341df51564e93;
    stim[61] = 67'h4df6fa13b00bd9809;
    stim[62] = 67'h49ab728a169ae15e1;
    stim[63] = 67'h6d68b3b48675ea855;
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
      expv[0] = 110'hxxxxxxxxxxxxxxxxxxxxxxxxxxx4;
      expv[1] = 110'hxxxxxxxxxxxxxxxxxxxxxxxxxxx4;
      expv[2] = 110'hxxxxxxxxxxxxxxxxxxxxxxxxxxx4;
      expv[3] = 110'hxxxxxxxxxxxxxxxxxxxxxxxxxxx4;
      expv[4] = 110'hxxxxxxxxxxxxxxxxxxxxxxxxxxx0;
      expv[5] = 110'hxxxxxxxxxxxxxxxxxxxxxxxxxxx0;
      expv[6] = 110'hxxxxxxxxxxxxxxxxxxxxxxxxxxx4;
      expv[7] = 110'hxxxxxxxxxxxxxxxxxxxxxxxxxxx4;
      expv[8] = 110'hxxxxxxxxxxxxxxxxxxxxxxxxxxx0;
      expv[9] = 110'hxxxxxxxxxxxxxxxxxxxxxxxxxxx0;
      expv[10] = 110'hxxxxxxxxxxxxxxxxxxxxxxxxxxx0;
      expv[11] = 110'hxxxxxxxxxxxxxxxxxxxxxxxxxxx0;
      expv[12] = 110'hxxxxxxxxxxxxxxxxxxxxxxxxxxx0;
      expv[13] = 110'hxxxxxxxxxxxxxxxxxxxxxxxxxxx0;
      expv[14] = 110'hxxxxxxxxxxxxxxxxxxxxxxxxxxx0;
      expv[15] = 110'hxxxxxxxxxxxxxxxxxxxxxxxxxxx0;
      expv[16] = 110'hxxxxxxxxxxxxxxxxxxxxxxxxxxx0;
      expv[17] = 110'hxxxxxxxxxxxxxxxxxxxxxxxxxxx0;
      expv[18] = 110'hxxxxxxxxxxxxxxxxxxxxxxxxxxx0;
      expv[19] = 110'hxxxxxxxxxxxxxxxxxxxxxxxxxxx0;
      expv[20] = 110'hxxxxxxxxxxxxxxxxxxxxxxxxxxx0;
      expv[21] = 110'hxxxxxxxxxxxxxxxxxxxxxxxxxxx0;
      expv[22] = 110'hxxxxxxxxxxxxxxxxxxxxxxxxxxx0;
      expv[23] = 110'hxxxxxxxxxxxxxxxxxxxxxxxxxxx4;
      expv[24] = 110'hxxxxxxxxxxxxxxxxxxxxxxxxxxx4;
      expv[25] = 110'hxxxxxxxxxxxxxxxxxxxxxxxxxxx4;
      expv[26] = 110'hxxxxxxxxxxxxxxxxxxxxxxxxxxx4;
      expv[27] = 110'hxxxxxxxxxxxxxxxxxxxxxxxxxxx0;
      expv[28] = 110'hxxxxxxxxxxxxxxxxxxxxxxxxxxx0;
      expv[29] = 110'hxxxxxxxxxxxxxxxxxxxxxxxxxxx0;
      expv[30] = 110'hxxxxxxxxxxxxxxxxxxxxxxxxxxx0;
      expv[31] = 110'hxxxxxxxxxxxxxxxxxxxxxxxxxxx0;
      expv[32] = 110'hxxxxxxxxxxxxxxxxxxxxxxxxxxx0;
      expv[33] = 110'hxxxxxxxxxxxxxxxxxxxxxxxxxxx0;
      expv[34] = 110'hxxxxxxxxxxxxxxxxxxxxxxxxxxx0;
      expv[35] = 110'hxxxxxxxxxxxxxxxxxxxxxxxxxxx0;
      expv[36] = 110'hxxxxxxxxxxxxxxxxxxxxxxxxxxx0;
      expv[37] = 110'hxxxxxxxxxxxxxxxxxxxxxxxxxxx0;
      expv[38] = 110'hxxxxxxxxxxxxxxxxxxxxxxxxxxx0;
      expv[39] = 110'hxxxxxxxxxxxxxxxxxxxxxxxxxxx0;
      expv[40] = 110'hxxxxxxxxxxxxxxxxxxxxxxxxxxx0;
      expv[41] = 110'hxxxxxxxxxxxxxxxxxxxxxxxxxxx0;
      expv[42] = 110'hxxxxxxxxxxxxxxxxxxxxxxxxxxx0;
      expv[43] = 110'hxxxxxxxxxxxxxxxxxxxxxxxxxxx0;
      expv[44] = 110'hxxxxxxxxxxxxxxxxxxxxxxxxxxx0;
      expv[45] = 110'hxxxxxxxxxxxxxxxxxxxxxxxxxxx0;
      expv[46] = 110'hxxxxxxxxxxxxxxxxxxxxxxxxxxx0;
      expv[47] = 110'hxxxxxxxxxxxxxxxxxxxxxxxxxxx0;
      expv[48] = 110'hxxxxxxxxxxxxxxxxxxxxxxxxxxx4;
      expv[49] = 110'hxxxxxxxxxxxxxxxxxxxxxxxxxxx4;
      expv[50] = 110'hxxxxxxxxxxxxxxxxxxxxxxxxxxx0;
      expv[51] = 110'hxxxxxxxxxxxxxxxxxxxxxxxxxxx0;
      expv[52] = 110'hxxxxxxxxxxxxxxxxxxxxxxxxxxx0;
      expv[53] = 110'hxxxxxxxxxxxxxxxxxxxxxxxxxxx4;
      expv[54] = 110'hxxxxxxxxxxxxxxxxxxxxxxxxxxx4;
      expv[55] = 110'hxxxxxxxxxxxxxxxxxxxxxxxxxxx0;
      expv[56] = 110'hxxxxxxxxxxxxxxxxxxxxxxxxxxx0;
      expv[57] = 110'hxxxxxxxxxxxxxxxxxxxxxxxxxxx0;
      expv[58] = 110'hxxxxxxxxxxxxxxxxxxxxxxxxxxx0;
      expv[59] = 110'hxxxxxxxxxxxxxxxxxxxxxxxxxxx0;
      expv[60] = 110'hxxxxxxxxxxxxxxxxxxxxxxxxxxx0;
      expv[61] = 110'hxxxxxxxxxxxxxxxxxxxxxxxxxxx0;
      expv[62] = 110'hxxxxxxxxxxxxxxxxxxxxxxxxxxx0;
      expv[63] = 110'hxxxxxxxxxxxxxxxxxxxxxxxxxxx0;
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
