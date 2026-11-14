// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 68;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_223014 dut (
    .clk(clk),
    .rst(in_vec[67:67]),
    .en(in_vec[66:66]),
    .addr(in_vec[65:34]),
    .wr_en(in_vec[33:33]),
    .wr_data(in_vec[32:1]),
    .rd_en(in_vec[0:0]),
    .rd_data(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 68'hf07b1158bcb99d1e6;
    stim[1] = 68'h86e29034a1a725eaa;
    stim[2] = 68'h0b8f03aa70efa5148;
    stim[3] = 68'h2f1bdf14481d25bd2;
    stim[4] = 68'h2aee2e5b9903af4c3;
    stim[5] = 68'h1ad862432d2ac2218;
    stim[6] = 68'h67e9b45ccd5f7ccf8;
    stim[7] = 68'h1a48ba13628dfd6e9;
    stim[8] = 68'h2cf4842e723596762;
    stim[9] = 68'h47b2d14fab758a12a;
    stim[10] = 68'h4e2810cf30bf71d07;
    stim[11] = 68'h70895b1bfcc1e2265;
    stim[12] = 68'h1269dba06db983bb9;
    stim[13] = 68'h239eb080441783286;
    stim[14] = 68'h128ccca977e954087;
    stim[15] = 68'h3a2b19f762b8367eb;
    stim[16] = 68'h50b67f7dcc3795570;
    stim[17] = 68'h021842bf2e2b21bc2;
    stim[18] = 68'h5e06f1b418ad187c4;
    stim[19] = 68'h32c0f16791edca911;
    stim[20] = 68'h315150aa807859fcb;
    stim[21] = 68'h45eb93ca86ca3788f;
    stim[22] = 68'h2e12ff953b0bd63af;
    stim[23] = 68'h7c6aeb3a82bf5e700;
    stim[24] = 68'h2d0b6d13bed2776b9;
    stim[25] = 68'h629d8d5f4cb3214e7;
    stim[26] = 68'h579769ae82f7026bc;
    stim[27] = 68'h554121697dd9227d1;
    stim[28] = 68'h33e95870205e4e4c5;
    stim[29] = 68'h4baefd54070ce11a9;
    stim[30] = 68'h08d5cd9211a85a27f;
    stim[31] = 68'h5756c7f9ed4c1da66;
    stim[32] = 68'h40437091b4657e8a1;
    stim[33] = 68'h77336e58bba426dc9;
    stim[34] = 68'h17048632ae3f24540;
    stim[35] = 68'h42dfe949ce48c7f13;
    stim[36] = 68'h0ccb6a887dcbbc4fa;
    stim[37] = 68'h4f4b5346f76c19d12;
    stim[38] = 68'h101c4b1c6d734d64a;
    stim[39] = 68'h2752b463cfa11b0f9;
    stim[40] = 68'h2793700d192f18e1c;
    stim[41] = 68'h2d6096b50e83820a1;
    stim[42] = 68'h649e601b859956145;
    stim[43] = 68'h566814672b0b1b079;
    stim[44] = 68'h00b18804c9e89ef94;
    stim[45] = 68'h5a031668baeeb6975;
    stim[46] = 68'h7751feb7fce6dbc19;
    stim[47] = 68'h649ef7474a2273749;
    stim[48] = 68'h2dfe43685c4a5058e;
    stim[49] = 68'h6366a7ed3ed8b98ac;
    stim[50] = 68'h6580c48815e534ce4;
    stim[51] = 68'h68efaa9a1bc3e99a8;
    stim[52] = 68'h65ab6877bd94806f1;
    stim[53] = 68'h7e6bac9610d3c6fe3;
    stim[54] = 68'h551b9d97618aa49db;
    stim[55] = 68'h66367d83b08c03f99;
    stim[56] = 68'h7033ce11881c30eb5;
    stim[57] = 68'h5a49395234042fe09;
    stim[58] = 68'h0ce15afd4f0c4ab11;
    stim[59] = 68'h318c7c9b548a6bc0a;
    stim[60] = 68'h065640165e1e8094d;
    stim[61] = 68'h1c9c2b4933a8d9bc2;
    stim[62] = 68'h7bfaa2ba285fc808b;
    stim[63] = 68'h615f324e19e17063a;
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
      expv[37] = 32'h00000000;
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
