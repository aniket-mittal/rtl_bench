// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 20;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01183 dut (
    .clk_i(clk),
    .rst_i(in_vec[19:19]),
    .flush_i(in_vec[18:18]),
    .stb_i(in_vec[17:17]),
    .di(in_vec[16:1]),
    .next_i(in_vec[0:0]),
    .can_burst_o(out_vec[9:9]),
    .do8_valid(out_vec[8:8]),
    .do8(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 20'h8150b;
    stim[1] = 20'hbcdf8;
    stim[2] = 20'h18b6c;
    stim[3] = 20'h6bcae;
    stim[4] = 20'h291c3;
    stim[5] = 20'h22c0f;
    stim[6] = 20'h02a89;
    stim[7] = 20'h31593;
    stim[8] = 20'h50ff9;
    stim[9] = 20'h22367;
    stim[10] = 20'h2fff5;
    stim[11] = 20'h14582;
    stim[12] = 20'h0d816;
    stim[13] = 20'h33585;
    stim[14] = 20'h7c583;
    stim[15] = 20'h7ffca;
    stim[16] = 20'h59d2c;
    stim[17] = 20'h72c88;
    stim[18] = 20'h7b198;
    stim[19] = 20'h79d3d;
    stim[20] = 20'h13956;
    stim[21] = 20'ha31cc;
    stim[22] = 20'h34df1;
    stim[23] = 20'h25f77;
    stim[24] = 20'h23416;
    stim[25] = 20'h03409;
    stim[26] = 20'h6f3cf;
    stim[27] = 20'h36071;
    stim[28] = 20'h7267c;
    stim[29] = 20'h4ad07;
    stim[30] = 20'h4b39c;
    stim[31] = 20'h7767a;
    stim[32] = 20'h606a1;
    stim[33] = 20'h45e19;
    stim[34] = 20'h0b90c;
    stim[35] = 20'h4f4d8;
    stim[36] = 20'h54711;
    stim[37] = 20'h3760d;
    stim[38] = 20'h09c3f;
    stim[39] = 20'h798ad;
    stim[40] = 20'h09c1c;
    stim[41] = 20'h7d836;
    stim[42] = 20'h0dc5b;
    stim[43] = 20'h5e8af;
    stim[44] = 20'h62ee7;
    stim[45] = 20'h2294e;
    stim[46] = 20'h461bb;
    stim[47] = 20'h6a9cb;
    stim[48] = 20'h3bebe;
    stim[49] = 20'h00f28;
    stim[50] = 20'h0f41b;
    stim[51] = 20'h7385c;
    stim[52] = 20'h7ab5d;
    stim[53] = 20'h73d3d;
    stim[54] = 20'h1a46d;
    stim[55] = 20'h3f71a;
    stim[56] = 20'h50f90;
    stim[57] = 20'h4c2c0;
    stim[58] = 20'h3c493;
    stim[59] = 20'h59e89;
    stim[60] = 20'h210ef;
    stim[61] = 20'h7d509;
    stim[62] = 20'h48a93;
    stim[63] = 20'h7b67e;
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
      expv[0] = 10'hxxx;
      expv[1] = 10'h0xx;
      expv[2] = 10'h0xx;
      expv[3] = 10'h0xx;
      expv[4] = 10'h15e;
      expv[5] = 10'h157;
      expv[6] = 10'h148;
      expv[7] = 10'h1e1;
      expv[8] = 10'h116;
      expv[9] = 10'h107;
      expv[10] = 10'h18a;
      expv[11] = 10'h1c9;
      expv[12] = 10'h1c9;
      expv[13] = 10'h1c9;
      expv[14] = 10'h111;
      expv[15] = 10'h1b3;
      expv[16] = 10'h1b3;
      expv[17] = 10'h1b3;
      expv[18] = 10'h1b3;
      expv[19] = 10'h1b3;
      expv[20] = 10'h37f;
      expv[21] = 10'h37f;
      expv[22] = 10'h0ff;
      expv[23] = 10'h1f8;
      expv[24] = 10'h12f;
      expv[25] = 10'h12f;
      expv[26] = 10'h1bb;
      expv[27] = 10'h11a;
      expv[28] = 10'h10b;
      expv[29] = 10'h10b;
      expv[30] = 10'h179;
      expv[31] = 10'h179;
      expv[32] = 10'h179;
      expv[33] = 10'h1e7;
      expv[34] = 10'h1b0;
      expv[35] = 10'h1b0;
      expv[36] = 10'h1b0;
      expv[37] = 10'h138;
      expv[38] = 10'h193;
      expv[39] = 10'h13e;
      expv[40] = 10'h1bb;
      expv[41] = 10'h1bb;
      expv[42] = 10'h1bb;
      expv[43] = 10'h13d;
      expv[44] = 10'h103;
      expv[45] = 10'h150;
      expv[46] = 10'h150;
      expv[47] = 10'h1bb;
      expv[48] = 10'h106;
      expv[49] = 10'h106;
      expv[50] = 10'h106;
      expv[51] = 10'h1cc;
      expv[52] = 10'h3cc;
      expv[53] = 10'h356;
      expv[54] = 10'h0ec;
      expv[55] = 10'h31b;
      expv[56] = 10'h18d;
      expv[57] = 10'h18d;
      expv[58] = 10'h18d;
      expv[59] = 10'h1e2;
      expv[60] = 10'h149;
      expv[61] = 10'h108;
      expv[62] = 10'h177;
      expv[63] = 10'h1ea;
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
