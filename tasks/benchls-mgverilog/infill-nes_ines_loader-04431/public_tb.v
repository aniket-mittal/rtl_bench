// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 65;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04431 dut (
    .clk(clk),
    .reset(in_vec[9:9]),
    .indata(in_vec[8:1]),
    .indata_clk(in_vec[0:0]),
    .mem_addr(out_vec[64:43]),
    .mem_data(out_vec[42:35]),
    .mem_write(out_vec[34:34]),
    .mapper_flags(out_vec[33:2]),
    .done(out_vec[1:1]),
    .error(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h3ca;
    stim[1] = 10'h3fd;
    stim[2] = 10'h11c;
    stim[3] = 10'h1a0;
    stim[4] = 10'h1b2;
    stim[5] = 10'h0ba;
    stim[6] = 10'h1f8;
    stim[7] = 10'h0de;
    stim[8] = 10'h15a;
    stim[9] = 10'h011;
    stim[10] = 10'h151;
    stim[11] = 10'h1ef;
    stim[12] = 10'h021;
    stim[13] = 10'h049;
    stim[14] = 10'h072;
    stim[15] = 10'h06a;
    stim[16] = 10'h1d4;
    stim[17] = 10'h1fc;
    stim[18] = 10'h164;
    stim[19] = 10'h3c2;
    stim[20] = 10'h1e2;
    stim[21] = 10'h05b;
    stim[22] = 10'h050;
    stim[23] = 10'h044;
    stim[24] = 10'h006;
    stim[25] = 10'h1b5;
    stim[26] = 10'h06b;
    stim[27] = 10'h012;
    stim[28] = 10'h05a;
    stim[29] = 10'h1cd;
    stim[30] = 10'h097;
    stim[31] = 10'h08b;
    stim[32] = 10'h1a6;
    stim[33] = 10'h0a5;
    stim[34] = 10'h1af;
    stim[35] = 10'h08b;
    stim[36] = 10'h061;
    stim[37] = 10'h145;
    stim[38] = 10'h0dc;
    stim[39] = 10'h125;
    stim[40] = 10'h1ff;
    stim[41] = 10'h06e;
    stim[42] = 10'h14c;
    stim[43] = 10'h124;
    stim[44] = 10'h043;
    stim[45] = 10'h14f;
    stim[46] = 10'h1f3;
    stim[47] = 10'h1ae;
    stim[48] = 10'h07e;
    stim[49] = 10'h3d7;
    stim[50] = 10'h009;
    stim[51] = 10'h172;
    stim[52] = 10'h120;
    stim[53] = 10'h1ce;
    stim[54] = 10'h03b;
    stim[55] = 10'h15b;
    stim[56] = 10'h167;
    stim[57] = 10'h1bd;
    stim[58] = 10'h1c7;
    stim[59] = 10'h11b;
    stim[60] = 10'h009;
    stim[61] = 10'h16c;
    stim[62] = 10'h1dd;
    stim[63] = 10'h157;
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
      expv[0] = 65'hxxxxxxx28000xxxxx;
      expv[1] = 65'h0000007f0000xxxxx;
      expv[2] = 65'h000000470000xxxxx;
      expv[3] = 65'h000000680000xxxxx;
      expv[4] = 65'h0000006c8000xxxxx;
      expv[5] = 65'h0000002e8000xxxxx;
      expv[6] = 65'h0000007e0000xxxxx;
      expv[7] = 65'h000000378000xxxxx;
      expv[8] = 65'h000000568000xxxxx;
      expv[9] = 65'h000000040000xxxxx;
      expv[10] = 65'h000000540000xxxxx;
      expv[11] = 65'h0000007b8000xxxxx;
      expv[12] = 65'h000000080000xxxxx;
      expv[13] = 65'h000000120000xxxxx;
      expv[14] = 65'h0000001c8000xxxxx;
      expv[15] = 65'h0000001a8000xxxxx;
      expv[16] = 65'h000000750000xxxxx;
      expv[17] = 65'h0000007f0000xxxxx;
      expv[18] = 65'h000000590000xxxxx;
      expv[19] = 65'h000000708000xxxxx;
      expv[20] = 65'h000000788000xxxxx;
      expv[21] = 65'h000000168000xxxxx;
      expv[22] = 65'h000000140000xxxxx;
      expv[23] = 65'h000000110000xxxxx;
      expv[24] = 65'h000000018000xxxxx;
      expv[25] = 65'h0000006d0000xxxxx;
      expv[26] = 65'h0000001a8000xxxxx;
      expv[27] = 65'h000000048000xxxxx;
      expv[28] = 65'h000000168000xxxxx;
      expv[29] = 65'h000000730000xxxxx;
      expv[30] = 65'h000000258000xxxxx;
      expv[31] = 65'h000000228000xxxxx;
      expv[32] = 65'h000000698000xfxxx;
      expv[33] = 65'h000000290000xfxxx;
      expv[34] = 65'h0000006b80000fxx4;
      expv[35] = 65'h0000002280000ff54;
      expv[36] = 65'h0000001800000ff54;
      expv[37] = 65'h0000005100000ff54;
      expv[38] = 65'h0000003700000ff54;
      expv[39] = 65'h0000004900000ff54;
      expv[40] = 65'h0000007f80000ff54;
      expv[41] = 65'h0000001b80000ff54;
      expv[42] = 65'h0000005300000ff54;
      expv[43] = 65'h0000004900000ff54;
      expv[44] = 65'h0000001080000ff54;
      expv[45] = 65'h0000005380000ff54;
      expv[46] = 65'h0000007c80000ff54;
      expv[47] = 65'h0000006b80000ff55;
      expv[48] = 65'h0000001f80000ff55;
      expv[49] = 65'h0000007580000ff55;
      expv[50] = 65'h0000000200000ff54;
      expv[51] = 65'h0000005c80000ff54;
      expv[52] = 65'h0000004800000ff54;
      expv[53] = 65'h0000007380000ff54;
      expv[54] = 65'h0000000e80000ff54;
      expv[55] = 65'h0000005680000ff54;
      expv[56] = 65'h0000005980000ff54;
      expv[57] = 65'h0000006f00000ff54;
      expv[58] = 65'h0000007180000ff54;
      expv[59] = 65'h0000004680000ff54;
      expv[60] = 65'h0000000200001ff60;
      expv[61] = 65'h0000005b00001fc20;
      expv[62] = 65'h0000007700001fc20;
      expv[63] = 65'h0000005580001fc20;
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
