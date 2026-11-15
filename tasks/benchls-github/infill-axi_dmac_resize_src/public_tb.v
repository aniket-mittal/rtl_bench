// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 71;
  localparam OW = 70;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  axi_dmac_resize_src dut (
    .clk(clk),
    .reset(in_vec[70:70]),
    .src_data_valid(in_vec[69:69]),
    .src_data(in_vec[68:5]),
    .src_data_last(in_vec[4:4]),
    .src_data_valid_bytes(in_vec[3:1]),
    .src_data_partial_burst(in_vec[0:0]),
    .mem_data_valid(out_vec[69:69]),
    .mem_data(out_vec[68:5]),
    .mem_data_last(out_vec[4:4]),
    .mem_data_valid_bytes(out_vec[3:1]),
    .mem_data_partial_burst(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 71'h4eda37f9fb4ba6838c;
    stim[1] = 71'h75bcdd46fde81eae8c;
    stim[2] = 71'h185599e1162e0be3ce;
    stim[3] = 71'h2d9023179cc9368962;
    stim[4] = 71'h16d97a5d1238e40380;
    stim[5] = 71'h1e2202d34432fbfff5;
    stim[6] = 71'h14de91331ccf177482;
    stim[7] = 71'h21d318427aeb106271;
    stim[8] = 71'h0a301b544fdd4a8884;
    stim[9] = 71'h0a41db9877fd306280;
    stim[10] = 71'h29b4510e44e9094bb7;
    stim[11] = 71'h098c8b0274160bc336;
    stim[12] = 71'h335af3c25b29915c42;
    stim[13] = 71'h12fd46b16ab2b45824;
    stim[14] = 71'h26fd47f2edc6dc5e06;
    stim[15] = 71'h13ade0feb4c578b428;
    stim[16] = 71'h338d5db2e89b54bf64;
    stim[17] = 71'h1d45a684b29ed519a5;
    stim[18] = 71'h3f626c4c9a27757315;
    stim[19] = 71'h15d96dfd5f80484f2b;
    stim[20] = 71'h021b990a5b386e52ee;
    stim[21] = 71'h19b6c6263ee04bc596;
    stim[22] = 71'h096793a7c509ce7769;
    stim[23] = 71'h121cbb49b6d0c1cac6;
    stim[24] = 71'h168631747fe768f0c0;
    stim[25] = 71'h02b882ff534f9bb521;
    stim[26] = 71'h3c2fe54d707be61e5e;
    stim[27] = 71'h33b3946df900f6ec49;
    stim[28] = 71'h04d26cb8f2d5042766;
    stim[29] = 71'h07e9ead21257373fe3;
    stim[30] = 71'h366070bb1344aacd6f;
    stim[31] = 71'h2d66026d4a9a6dc72e;
    stim[32] = 71'h3a51fded4fab504d63;
    stim[33] = 71'h1ed46592ada0764c74;
    stim[34] = 71'h00e27b2e91bd903aa5;
    stim[35] = 71'h39ba880882b9071836;
    stim[36] = 71'h374eda0d712edc8949;
    stim[37] = 71'h1978cd73483784474a;
    stim[38] = 71'h20cc60f32a6452b483;
    stim[39] = 71'h056716d18108a3edfa;
    stim[40] = 71'h2f68e1f39b1f4f799a;
    stim[41] = 71'h0f798a963d74ed266d;
    stim[42] = 71'h3b63ca9f702853733c;
    stim[43] = 71'h2c982942ff3b921175;
    stim[44] = 71'h05015a5b418d509bdf;
    stim[45] = 71'h13fe07a17320c2353b;
    stim[46] = 71'h295cabae39eae5bf54;
    stim[47] = 71'h002af8d317173098a7;
    stim[48] = 71'h080b2210a152a99357;
    stim[49] = 71'h2df7dd59d0c7efd6b4;
    stim[50] = 71'h1b446fb2301aa3f3eb;
    stim[51] = 71'h13b4f828c9c6b8ac76;
    stim[52] = 71'h2bee09fd046e4e27c7;
    stim[53] = 71'h066b6d231d568eb388;
    stim[54] = 71'h388dfedc4c37a5b9a8;
    stim[55] = 71'h209ae15d2864bce2b9;
    stim[56] = 71'h62d798a215af782a8b;
    stim[57] = 71'h0686cdf7ef8a3729d8;
    stim[58] = 71'h21dcf00e5440d9437d;
    stim[59] = 71'h111fa00cc8ec2cede1;
    stim[60] = 71'h0bc1e0661dc5e98c86;
    stim[61] = 71'h3837fa61aab5893247;
    stim[62] = 71'h0e9f359065310c62a1;
    stim[63] = 71'h1af07de5fa18e42520;
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
      expv[0] = 70'h0eda37f9fb4ba6838c;
      expv[1] = 70'h35bcdd46fde81eae8c;
      expv[2] = 70'h185599e1162e0be3ce;
      expv[3] = 70'h2d9023179cc9368962;
      expv[4] = 70'h16d97a5d1238e40380;
      expv[5] = 70'h1e2202d34432fbfff5;
      expv[6] = 70'h14de91331ccf177482;
      expv[7] = 70'h21d318427aeb106271;
      expv[8] = 70'h0a301b544fdd4a8884;
      expv[9] = 70'h0a41db9877fd306280;
      expv[10] = 70'h29b4510e44e9094bb7;
      expv[11] = 70'h098c8b0274160bc336;
      expv[12] = 70'h335af3c25b29915c42;
      expv[13] = 70'h12fd46b16ab2b45824;
      expv[14] = 70'h26fd47f2edc6dc5e06;
      expv[15] = 70'h13ade0feb4c578b428;
      expv[16] = 70'h338d5db2e89b54bf64;
      expv[17] = 70'h1d45a684b29ed519a5;
      expv[18] = 70'h3f626c4c9a27757315;
      expv[19] = 70'h15d96dfd5f80484f2b;
      expv[20] = 70'h021b990a5b386e52ee;
      expv[21] = 70'h19b6c6263ee04bc596;
      expv[22] = 70'h096793a7c509ce7769;
      expv[23] = 70'h121cbb49b6d0c1cac6;
      expv[24] = 70'h168631747fe768f0c0;
      expv[25] = 70'h02b882ff534f9bb521;
      expv[26] = 70'h3c2fe54d707be61e5e;
      expv[27] = 70'h33b3946df900f6ec49;
      expv[28] = 70'h04d26cb8f2d5042766;
      expv[29] = 70'h07e9ead21257373fe3;
      expv[30] = 70'h366070bb1344aacd6f;
      expv[31] = 70'h2d66026d4a9a6dc72e;
      expv[32] = 70'h3a51fded4fab504d63;
      expv[33] = 70'h1ed46592ada0764c74;
      expv[34] = 70'h00e27b2e91bd903aa5;
      expv[35] = 70'h39ba880882b9071836;
      expv[36] = 70'h374eda0d712edc8949;
      expv[37] = 70'h1978cd73483784474a;
      expv[38] = 70'h20cc60f32a6452b483;
      expv[39] = 70'h056716d18108a3edfa;
      expv[40] = 70'h2f68e1f39b1f4f799a;
      expv[41] = 70'h0f798a963d74ed266d;
      expv[42] = 70'h3b63ca9f702853733c;
      expv[43] = 70'h2c982942ff3b921175;
      expv[44] = 70'h05015a5b418d509bdf;
      expv[45] = 70'h13fe07a17320c2353b;
      expv[46] = 70'h295cabae39eae5bf54;
      expv[47] = 70'h002af8d317173098a7;
      expv[48] = 70'h080b2210a152a99357;
      expv[49] = 70'h2df7dd59d0c7efd6b4;
      expv[50] = 70'h1b446fb2301aa3f3eb;
      expv[51] = 70'h13b4f828c9c6b8ac76;
      expv[52] = 70'h2bee09fd046e4e27c7;
      expv[53] = 70'h066b6d231d568eb388;
      expv[54] = 70'h388dfedc4c37a5b9a8;
      expv[55] = 70'h209ae15d2864bce2b9;
      expv[56] = 70'h22d798a215af782a8b;
      expv[57] = 70'h0686cdf7ef8a3729d8;
      expv[58] = 70'h21dcf00e5440d9437d;
      expv[59] = 70'h111fa00cc8ec2cede1;
      expv[60] = 70'h0bc1e0661dc5e98c86;
      expv[61] = 70'h3837fa61aab5893247;
      expv[62] = 70'h0e9f359065310c62a1;
      expv[63] = 70'h1af07de5fa18e42520;
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
