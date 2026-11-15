// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 36;
  localparam OW = 3;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_08762 dut (
    .clk_i(clk),
    .rst_i(in_vec[35:35]),
    .offset_i(in_vec[34:3]),
    .position_i(in_vec[2:0]),
    .position_o(out_vec[2:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 36'h99aec5a3a;
    stim[1] = 36'hd63e95ea7;
    stim[2] = 36'h03d1eb1b7;
    stim[3] = 36'h165432d78;
    stim[4] = 36'h4a205d2a4;
    stim[5] = 36'h0d65fa36b;
    stim[6] = 36'h77a4a760c;
    stim[7] = 36'h7a045f6d0;
    stim[8] = 36'h275fe23e9;
    stim[9] = 36'h6f3f86919;
    stim[10] = 36'h79b223240;
    stim[11] = 36'h2fe1f57e3;
    stim[12] = 36'h4f2bda4af;
    stim[13] = 36'h425cb0cf1;
    stim[14] = 36'h2fedb2145;
    stim[15] = 36'h27401f8cc;
    stim[16] = 36'h0a64fa1ec;
    stim[17] = 36'h1c1c1db0b;
    stim[18] = 36'h06b3b0abf;
    stim[19] = 36'h4ada621b4;
    stim[20] = 36'h20d6d54d3;
    stim[21] = 36'h1ca417f11;
    stim[22] = 36'h6efa7d499;
    stim[23] = 36'h5a392d499;
    stim[24] = 36'h1b46c1785;
    stim[25] = 36'h467a67aee;
    stim[26] = 36'h0a771f0b2;
    stim[27] = 36'hcc90ed73e;
    stim[28] = 36'h15ee32077;
    stim[29] = 36'h005083bf2;
    stim[30] = 36'h5b8acc071;
    stim[31] = 36'h7c6d2853b;
    stim[32] = 36'h0146ca0c0;
    stim[33] = 36'h130f4477e;
    stim[34] = 36'h110399142;
    stim[35] = 36'hc6cb93062;
    stim[36] = 36'h618dce78b;
    stim[37] = 36'h0242e3424;
    stim[38] = 36'h3e24aa358;
    stim[39] = 36'h1464b54ca;
    stim[40] = 36'h426f3a418;
    stim[41] = 36'h0e4892f2d;
    stim[42] = 36'h46f9a5d9d;
    stim[43] = 36'h4b4efc317;
    stim[44] = 36'h58daa570d;
    stim[45] = 36'h77e1648a7;
    stim[46] = 36'h6ea3b7aee;
    stim[47] = 36'h39e96e333;
    stim[48] = 36'h4997893a5;
    stim[49] = 36'h31532f451;
    stim[50] = 36'h4fb960707;
    stim[51] = 36'h3e162d3d2;
    stim[52] = 36'h328233eeb;
    stim[53] = 36'h72b6bc820;
    stim[54] = 36'h1e33a3d2b;
    stim[55] = 36'h2bfe8882e;
    stim[56] = 36'h569d07623;
    stim[57] = 36'h34de89e09;
    stim[58] = 36'h06619a09a;
    stim[59] = 36'h2aecae38a;
    stim[60] = 36'h46da23401;
    stim[61] = 36'h12d279fa1;
    stim[62] = 36'h55d9cb3c3;
    stim[63] = 36'h63cbac6a3;
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
      expv[0] = 3'hx;
      expv[1] = 3'h1;
      expv[2] = 3'h1;
      expv[3] = 3'h1;
      expv[4] = 3'h1;
      expv[5] = 3'h1;
      expv[6] = 3'h1;
      expv[7] = 3'h1;
      expv[8] = 3'h1;
      expv[9] = 3'h1;
      expv[10] = 3'h5;
      expv[11] = 3'h5;
      expv[12] = 3'h5;
      expv[13] = 3'h5;
      expv[14] = 3'h5;
      expv[15] = 3'h5;
      expv[16] = 3'h5;
      expv[17] = 3'h6;
      expv[18] = 3'h6;
      expv[19] = 3'h6;
      expv[20] = 3'h6;
      expv[21] = 3'h6;
      expv[22] = 3'h6;
      expv[23] = 3'h6;
      expv[24] = 3'h6;
      expv[25] = 3'h4;
      expv[26] = 3'h4;
      expv[27] = 3'h4;
      expv[28] = 3'h1;
      expv[29] = 3'h1;
      expv[30] = 3'h1;
      expv[31] = 3'h1;
      expv[32] = 3'h1;
      expv[33] = 3'h1;
      expv[34] = 3'h2;
      expv[35] = 3'h2;
      expv[36] = 3'h1;
      expv[37] = 3'h1;
      expv[38] = 3'h1;
      expv[39] = 3'h1;
      expv[40] = 3'h1;
      expv[41] = 3'h1;
      expv[42] = 3'h4;
      expv[43] = 3'h4;
      expv[44] = 3'h4;
      expv[45] = 3'h4;
      expv[46] = 3'h4;
      expv[47] = 3'h4;
      expv[48] = 3'h4;
      expv[49] = 3'h4;
      expv[50] = 3'h5;
      expv[51] = 3'h5;
      expv[52] = 3'h5;
      expv[53] = 3'h5;
      expv[54] = 3'h5;
      expv[55] = 3'h5;
      expv[56] = 3'h5;
      expv[57] = 3'h5;
      expv[58] = 3'h5;
      expv[59] = 3'h5;
      expv[60] = 3'h5;
      expv[61] = 3'h5;
      expv[62] = 3'h5;
      expv[63] = 3'h5;
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
