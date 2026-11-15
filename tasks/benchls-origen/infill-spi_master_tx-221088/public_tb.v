// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 35;
  localparam OW = 2;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_221088 dut (
    .s_axis_aclk(clk),
    .s_axis_aresetn(in_vec[34:34]),
    .s_axis_tdata(in_vec[33:2]),
    .s_axis_tlast(in_vec[1:1]),
    .s_axis_tvalid(in_vec[0:0]),
    .DOUT(out_vec[1:1]),
    .s_axis_tready(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 35'h388349400;
    stim[1] = 35'h146a167c9;
    stim[2] = 35'h46e5fc2d8;
    stim[3] = 35'h49657832f;
    stim[4] = 35'h75003a00d;
    stim[5] = 35'h6a7886cde;
    stim[6] = 35'h66318b4c7;
    stim[7] = 35'h7080d4300;
    stim[8] = 35'h30123dea9;
    stim[9] = 35'h47b66436f;
    stim[10] = 35'h65666140f;
    stim[11] = 35'h7f5e43984;
    stim[12] = 35'h6bd7c477e;
    stim[13] = 35'h7bde37cfd;
    stim[14] = 35'h780d0795c;
    stim[15] = 35'h5983f6239;
    stim[16] = 35'h6e7d554a9;
    stim[17] = 35'h54c16e625;
    stim[18] = 35'h4cc760751;
    stim[19] = 35'h683c3c9b8;
    stim[20] = 35'h44f2a6b49;
    stim[21] = 35'h4ab5e86d9;
    stim[22] = 35'h6f1aece3d;
    stim[23] = 35'h55b33cc07;
    stim[24] = 35'h61ed1511e;
    stim[25] = 35'h63e296548;
    stim[26] = 35'h747bbfed7;
    stim[27] = 35'h5eed80c52;
    stim[28] = 35'h44f79d57f;
    stim[29] = 35'h6f4cb37b7;
    stim[30] = 35'h56d978c99;
    stim[31] = 35'h7e4450c96;
    stim[32] = 35'h5bb157efd;
    stim[33] = 35'h47f514faf;
    stim[34] = 35'h7e32c2e8b;
    stim[35] = 35'h458a97360;
    stim[36] = 35'h5ad6d0830;
    stim[37] = 35'h519a76d2a;
    stim[38] = 35'h7a48626cc;
    stim[39] = 35'h43ab04a75;
    stim[40] = 35'h694fe1807;
    stim[41] = 35'h6adfdbf20;
    stim[42] = 35'h782362340;
    stim[43] = 35'h494de3108;
    stim[44] = 35'h7b4ff57aa;
    stim[45] = 35'h6c9506198;
    stim[46] = 35'h41ac094ce;
    stim[47] = 35'h747c6cdc6;
    stim[48] = 35'h44380d88a;
    stim[49] = 35'h589052438;
    stim[50] = 35'h57044e291;
    stim[51] = 35'h5d6855911;
    stim[52] = 35'h57ad0487d;
    stim[53] = 35'h4ec0bc1d1;
    stim[54] = 35'h6f3aa4510;
    stim[55] = 35'h62370e97c;
    stim[56] = 35'h60190ff0d;
    stim[57] = 35'h76e5412c6;
    stim[58] = 35'h652bd6a29;
    stim[59] = 35'h5d60387c8;
    stim[60] = 35'h4ffe0da1d;
    stim[61] = 35'h4cf976490;
    stim[62] = 35'h6fa0b2310;
    stim[63] = 35'h74365e8ff;
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
      expv[0] = 2'h0;
      expv[1] = 2'h0;
      expv[2] = 2'h0;
      expv[3] = 2'h1;
      expv[4] = 2'h1;
      expv[5] = 2'h0;
      expv[6] = 2'h2;
      expv[7] = 2'h2;
      expv[8] = 2'h0;
      expv[9] = 2'h0;
      expv[10] = 2'h0;
      expv[11] = 2'h0;
      expv[12] = 2'h2;
      expv[13] = 2'h2;
      expv[14] = 2'h2;
      expv[15] = 2'h2;
      expv[16] = 2'h2;
      expv[17] = 2'h2;
      expv[18] = 2'h2;
      expv[19] = 2'h2;
      expv[20] = 2'h2;
      expv[21] = 2'h2;
      expv[22] = 2'h2;
      expv[23] = 2'h2;
      expv[24] = 2'h2;
      expv[25] = 2'h2;
      expv[26] = 2'h2;
      expv[27] = 2'h2;
      expv[28] = 2'h2;
      expv[29] = 2'h2;
      expv[30] = 2'h2;
      expv[31] = 2'h2;
      expv[32] = 2'h2;
      expv[33] = 2'h2;
      expv[34] = 2'h2;
      expv[35] = 2'h2;
      expv[36] = 2'h2;
      expv[37] = 2'h2;
      expv[38] = 2'h2;
      expv[39] = 2'h2;
      expv[40] = 2'h2;
      expv[41] = 2'h2;
      expv[42] = 2'h2;
      expv[43] = 2'h2;
      expv[44] = 2'h2;
      expv[45] = 2'h2;
      expv[46] = 2'h2;
      expv[47] = 2'h2;
      expv[48] = 2'h2;
      expv[49] = 2'h2;
      expv[50] = 2'h2;
      expv[51] = 2'h2;
      expv[52] = 2'h2;
      expv[53] = 2'h2;
      expv[54] = 2'h2;
      expv[55] = 2'h2;
      expv[56] = 2'h2;
      expv[57] = 2'h2;
      expv[58] = 2'h2;
      expv[59] = 2'h2;
      expv[60] = 2'h2;
      expv[61] = 2'h2;
      expv[62] = 2'h2;
      expv[63] = 2'h2;
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
