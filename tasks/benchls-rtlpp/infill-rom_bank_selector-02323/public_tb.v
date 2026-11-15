// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 27;
  localparam OW = 6;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_02323 dut (
    .clk(clk),
    .dip(in_vec[26:19]),
    .reset_b(in_vec[18:18]),
    .adr15(in_vec[17:17]),
    .adr14(in_vec[16:16]),
    .adr13(in_vec[15:15]),
    .ioreq_b(in_vec[14:14]),
    .mreq_b(in_vec[13:13]),
    .romen_b(in_vec[12:12]),
    .wr_b(in_vec[11:11]),
    .rd_b(in_vec[10:10]),
    .data(in_vec[9:2]),
    .busrq_b(in_vec[1:1]),
    .busack_b(in_vec[0:0]),
    .romdis(out_vec[5:5]),
    .rom01cs_b(out_vec[4:4]),
    .rom23cs_b(out_vec[3:3]),
    .rom45cs_b(out_vec[2:2]),
    .romoe_b(out_vec[1:1]),
    .roma14(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 27'h09219d2;
    stim[1] = 27'h750898b;
    stim[2] = 27'h6dd5129;
    stim[3] = 27'h44fa452;
    stim[4] = 27'h356de50;
    stim[5] = 27'h13cc6a9;
    stim[6] = 27'h1edb0a3;
    stim[7] = 27'h2edc521;
    stim[8] = 27'h71ebd3a;
    stim[9] = 27'h20419b0;
    stim[10] = 27'h1366a49;
    stim[11] = 27'h716e8bb;
    stim[12] = 27'h7173eaf;
    stim[13] = 27'h0cedc25;
    stim[14] = 27'h6ee016c;
    stim[15] = 27'h45c5ce8;
    stim[16] = 27'h3de986d;
    stim[17] = 27'h3ef1f77;
    stim[18] = 27'h7efdb16;
    stim[19] = 27'h3d65f0c;
    stim[20] = 27'h16e3241;
    stim[21] = 27'h19ffa21;
    stim[22] = 27'h62ebcf7;
    stim[23] = 27'h0efeda9;
    stim[24] = 27'h5c5f64c;
    stim[25] = 27'h2ef4990;
    stim[26] = 27'h0dfbdf6;
    stim[27] = 27'h78dec0a;
    stim[28] = 27'h79d2cab;
    stim[29] = 27'h21d26b3;
    stim[30] = 27'h28c8538;
    stim[31] = 27'h31eca2a;
    stim[32] = 27'h3ae1d21;
    stim[33] = 27'h65c197c;
    stim[34] = 27'h2dd1f83;
    stim[35] = 27'h27c0616;
    stim[36] = 27'h10dff92;
    stim[37] = 27'h62d462c;
    stim[38] = 27'h1b7d5c6;
    stim[39] = 27'h14d4adb;
    stim[40] = 27'h08d11e9;
    stim[41] = 27'h3d78ae3;
    stim[42] = 27'h4a4a8dc;
    stim[43] = 27'h4e48b76;
    stim[44] = 27'h39ad1d3;
    stim[45] = 27'h5dd58e6;
    stim[46] = 27'h1773c38;
    stim[47] = 27'h18df4ad;
    stim[48] = 27'h55d0a1b;
    stim[49] = 27'h5a51539;
    stim[50] = 27'h3ae29f5;
    stim[51] = 27'h38522ef;
    stim[52] = 27'h1f46e71;
    stim[53] = 27'h206cc20;
    stim[54] = 27'h1c5b94b;
    stim[55] = 27'h5fc713a;
    stim[56] = 27'h395fd2f;
    stim[57] = 27'h65c17ab;
    stim[58] = 27'h5050db4;
    stim[59] = 27'h5253581;
    stim[60] = 27'h3c5496c;
    stim[61] = 27'h06662eb;
    stim[62] = 27'h2f08ad4;
    stim[63] = 27'h3cd3ef4;
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
      expv[0] = 6'h1e;
      expv[1] = 6'h1c;
      expv[2] = 6'h1e;
      expv[3] = 6'h1c;
      expv[4] = 6'h1e;
      expv[5] = 6'h2c;
      expv[6] = 6'h1e;
      expv[7] = 6'h1c;
      expv[8] = 6'h1e;
      expv[9] = 6'h1e;
      expv[10] = 6'h1c;
      expv[11] = 6'h1c;
      expv[12] = 6'h1e;
      expv[13] = 6'h2e;
      expv[14] = 6'h1c;
      expv[15] = 6'h1e;
      expv[16] = 6'h2e;
      expv[17] = 6'h1e;
      expv[18] = 6'h1e;
      expv[19] = 6'h1e;
      expv[20] = 6'h2e;
      expv[21] = 6'h1e;
      expv[22] = 6'h1e;
      expv[23] = 6'h1c;
      expv[24] = 6'h1e;
      expv[25] = 6'h1c;
      expv[26] = 6'h1e;
      expv[27] = 6'h1c;
      expv[28] = 6'h1c;
      expv[29] = 6'h1c;
      expv[30] = 6'h2c;
      expv[31] = 6'h2c;
      expv[32] = 6'h2e;
      expv[33] = 6'h1e;
      expv[34] = 6'h1e;
      expv[35] = 6'h2c;
      expv[36] = 6'h1e;
      expv[37] = 6'h1c;
      expv[38] = 6'h1e;
      expv[39] = 6'h1c;
      expv[40] = 6'h1e;
      expv[41] = 6'h1c;
      expv[42] = 6'h1c;
      expv[43] = 6'h1c;
      expv[44] = 6'h2e;
      expv[45] = 6'h1e;
      expv[46] = 6'h2f;
      expv[47] = 6'h1e;
      expv[48] = 6'h1c;
      expv[49] = 6'h1e;
      expv[50] = 6'h2c;
      expv[51] = 6'h1c;
      expv[52] = 6'h1c;
      expv[53] = 6'h1c;
      expv[54] = 6'h1e;
      expv[55] = 6'h1e;
      expv[56] = 6'h2f;
      expv[57] = 6'h1e;
      expv[58] = 6'h1c;
      expv[59] = 6'h1e;
      expv[60] = 6'h1c;
      expv[61] = 6'h1c;
      expv[62] = 6'h1c;
      expv[63] = 6'h1e;
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
