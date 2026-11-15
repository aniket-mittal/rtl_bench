// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 51;
  localparam OW = 36;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_190341 dut (
    .clk(clk),
    .reset(in_vec[50:50]),
    .readaddress1(in_vec[49:46]),
    .readaddress2(in_vec[45:42]),
    .writeaddress1(in_vec[41:38]),
    .writeaddress2(in_vec[37:34]),
    .writedata1(in_vec[33:18]),
    .writedata2(in_vec[17:2]),
    .enable1(in_vec[1:1]),
    .enable2(in_vec[0:0]),
    .readdata1(out_vec[35:20]),
    .readdata2(out_vec[19:4]),
    .reg15address(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 51'h4d7b44900007a;
    stim[1] = 51'h42adf3f3cada0;
    stim[2] = 51'h12fd3648111e1;
    stim[3] = 51'h315b50dd22676;
    stim[4] = 51'h0c73af0d22e9f;
    stim[5] = 51'h2e504dc60b291;
    stim[6] = 51'h14399aeb10f15;
    stim[7] = 51'h2e2ee6c3cd6a1;
    stim[8] = 51'h36b65197e868a;
    stim[9] = 51'h2e6e4a6a05e2a;
    stim[10] = 51'h1d9576d3c8c50;
    stim[11] = 51'h1945d7923ea81;
    stim[12] = 51'h037b7410922fb;
    stim[13] = 51'h042487b5a0c11;
    stim[14] = 51'h3057eeb282328;
    stim[15] = 51'h2594e3d1f56dd;
    stim[16] = 51'h14d9a48d777d9;
    stim[17] = 51'h348fa7028a479;
    stim[18] = 51'h2dc5379805067;
    stim[19] = 51'h10fc83bc51e80;
    stim[20] = 51'h329c58aff7a67;
    stim[21] = 51'h0e6d60a83bcd1;
    stim[22] = 51'h3487a4f33cd08;
    stim[23] = 51'h28dad5da01057;
    stim[24] = 51'h05b14a1cedad4;
    stim[25] = 51'h3c7bd5032c7da;
    stim[26] = 51'h3ca58dcc6ec15;
    stim[27] = 51'h1fccdcd6efc2f;
    stim[28] = 51'h0dd10411954a8;
    stim[29] = 51'h0f0c9b7ca488b;
    stim[30] = 51'h08a559b4d48c6;
    stim[31] = 51'h2f2a15a0e3f93;
    stim[32] = 51'h385ca0071fee6;
    stim[33] = 51'h150d4a9d803df;
    stim[34] = 51'h10a7de03cf2de;
    stim[35] = 51'h2d18478a77c06;
    stim[36] = 51'h3f778a1155513;
    stim[37] = 51'h009793b28e297;
    stim[38] = 51'h275d21f62e94e;
    stim[39] = 51'h055906086aa93;
    stim[40] = 51'h0cdf835d65652;
    stim[41] = 51'h3be1617d341e2;
    stim[42] = 51'h2f4e862a7ed0e;
    stim[43] = 51'h2ea9548cc65cf;
    stim[44] = 51'h0ae0c8fffa669;
    stim[45] = 51'h2097885201be0;
    stim[46] = 51'h2c95a0c0ba285;
    stim[47] = 51'h14199ad3bc5f5;
    stim[48] = 51'h1496e8944667a;
    stim[49] = 51'h0e516e5140de5;
    stim[50] = 51'h28db12298f5ed;
    stim[51] = 51'h3adc1c91d44ab;
    stim[52] = 51'h31213b0c4f54f;
    stim[53] = 51'h2b8edf046ac32;
    stim[54] = 51'h286cb8a349ddf;
    stim[55] = 51'h22eed12d230b5;
    stim[56] = 51'h15b1a38d5f400;
    stim[57] = 51'h04bca40634649;
    stim[58] = 51'h03bd29d6b7885;
    stim[59] = 51'h2db44989e11f3;
    stim[60] = 51'h13d33d8be9b94;
    stim[61] = 51'h284bd5194f4df;
    stim[62] = 51'h1a74543b0531b;
    stim[63] = 51'h3e6052d541c30;
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
      expv[0] = 36'hff0f0040f;
      expv[1] = 36'h00000000f;
      expv[2] = 36'hf0ff0000f;
      expv[3] = 36'hcc890040f;
      expv[4] = 36'hff0f0f00f;
      expv[5] = 36'h00000000f;
      expv[6] = 36'h00400000f;
      expv[7] = 36'h0000ff77f;
      expv[8] = 36'h00020000f;
      expv[9] = 36'h00000000f;
      expv[10] = 36'h00ff6666f;
      expv[11] = 36'h66660040f;
      expv[12] = 36'h00000002f;
      expv[13] = 36'h0f000000f;
      expv[14] = 36'hcc890f00f;
      expv[15] = 36'h00006666f;
      expv[16] = 36'h0040ff0ff;
      expv[17] = 36'h00020050f;
      expv[18] = 36'h000000fff;
      expv[19] = 36'hf0ffff0ff;
      expv[20] = 36'hcc890000f;
      expv[21] = 36'hff0f0000f;
      expv[22] = 36'h00020050f;
      expv[23] = 36'h0000ff0ff;
      expv[24] = 36'h0f006666f;
      expv[25] = 36'h00000f00f;
      expv[26] = 36'h00000050f;
      expv[27] = 36'h00ff0000f;
      expv[28] = 36'hff0f00fff;
      expv[29] = 36'hff0fcc89f;
      expv[30] = 36'h00500050f;
      expv[31] = 36'h0000cc89f;
      expv[32] = 36'h00000f00f;
      expv[33] = 36'h0040f0fff;
      expv[34] = 36'hf0ff0050f;
      expv[35] = 36'h0000f0fff;
      expv[36] = 36'h00000002f;
      expv[37] = 36'h00000050f;
      expv[38] = 36'h00000002f;
      expv[39] = 36'h0f000040f;
      expv[40] = 36'hff0fff0ff;
      expv[41] = 36'h00000000f;
      expv[42] = 36'h00000002f;
      expv[43] = 36'h00000000f;
      expv[44] = 36'h00500000f;
      expv[45] = 36'hff770050f;
      expv[46] = 36'h00000050f;
      expv[47] = 36'h00400000f;
      expv[48] = 36'h00400050f;
      expv[49] = 36'hff0f0000f;
      expv[50] = 36'h0000ff0ff;
      expv[51] = 36'h00000000f;
      expv[52] = 36'hcc89f0fff;
      expv[53] = 36'h00000000f;
      expv[54] = 36'h00000f00f;
      expv[55] = 36'hff770000f;
      expv[56] = 36'h00406666f;
      expv[57] = 36'h0f000050f;
      expv[58] = 36'h00000000f;
      expv[59] = 36'h00006666f;
      expv[60] = 36'hf0ff0000f;
      expv[61] = 36'h00000f00f;
      expv[62] = 36'h66660000f;
      expv[63] = 36'h00000000f;
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
