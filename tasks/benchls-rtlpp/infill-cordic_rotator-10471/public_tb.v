// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 18;
  localparam OW = 27;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_10471 dut (
    .clk(clk),
    .r_in(in_vec[17:9]),
    .phi_in(in_vec[8:0]),
    .x_out(out_vec[26:18]),
    .y_out(out_vec[17:9]),
    .eps(out_vec[8:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 18'h08ef8;
    stim[1] = 18'h1735d;
    stim[2] = 18'h23672;
    stim[3] = 18'h3db7e;
    stim[4] = 18'h2b56f;
    stim[5] = 18'h3646a;
    stim[6] = 18'h0d102;
    stim[7] = 18'h0a1ac;
    stim[8] = 18'h376d3;
    stim[9] = 18'h36b10;
    stim[10] = 18'h39842;
    stim[11] = 18'h21cfe;
    stim[12] = 18'h1216b;
    stim[13] = 18'h148dc;
    stim[14] = 18'h2b0e3;
    stim[15] = 18'h28077;
    stim[16] = 18'h14762;
    stim[17] = 18'h1c3ae;
    stim[18] = 18'h16d49;
    stim[19] = 18'h2d3be;
    stim[20] = 18'h2e934;
    stim[21] = 18'h10c71;
    stim[22] = 18'h33bf1;
    stim[23] = 18'h1cd18;
    stim[24] = 18'h32f7d;
    stim[25] = 18'h11a0a;
    stim[26] = 18'h3c27f;
    stim[27] = 18'h3cd9d;
    stim[28] = 18'h1f6c1;
    stim[29] = 18'h0204e;
    stim[30] = 18'h396e8;
    stim[31] = 18'h16c28;
    stim[32] = 18'h18791;
    stim[33] = 18'h0c9a1;
    stim[34] = 18'h2cd68;
    stim[35] = 18'h13d90;
    stim[36] = 18'h1ceb3;
    stim[37] = 18'h115f8;
    stim[38] = 18'h04c0b;
    stim[39] = 18'h0c4f7;
    stim[40] = 18'h19557;
    stim[41] = 18'h38e27;
    stim[42] = 18'h3ebff;
    stim[43] = 18'h2e677;
    stim[44] = 18'h0cd28;
    stim[45] = 18'h2b483;
    stim[46] = 18'h3c562;
    stim[47] = 18'h1f461;
    stim[48] = 18'h1382b;
    stim[49] = 18'h26f2e;
    stim[50] = 18'h386cb;
    stim[51] = 18'h0a043;
    stim[52] = 18'h2fe00;
    stim[53] = 18'h2b6d8;
    stim[54] = 18'h2e346;
    stim[55] = 18'h3b79f;
    stim[56] = 18'h25a34;
    stim[57] = 18'h1d14f;
    stim[58] = 18'h264a8;
    stim[59] = 18'h12e31;
    stim[60] = 18'h1ae33;
    stim[61] = 18'h28cd4;
    stim[62] = 18'h12723;
    stim[63] = 18'h19e01;
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
      expv[0] = 27'hxxxxxxx;
      expv[1] = 27'hxxxxxxx;
      expv[2] = 27'hxxxxxxx;
      expv[3] = 27'hxxxxxxx;
      expv[4] = 27'hxxxxxxx;
      expv[5] = 27'h6381049;
      expv[6] = 27'h3512cae;
      expv[7] = 27'h5d6c7c3;
      expv[8] = 27'h083facf;
      expv[9] = 27'h43bd6c0;
      expv[10] = 27'h1ffedbb;
      expv[11] = 27'h55c1a53;
      expv[12] = 27'h5f814fd;
      expv[13] = 27'h1c7ee24;
      expv[14] = 27'h1efec61;
      expv[15] = 27'h7eb57ed;
      expv[16] = 27'h62ac24f;
      expv[17] = 27'h45824bc;
      expv[18] = 27'h3d8282d;
      expv[19] = 27'h447d634;
      expv[20] = 27'h4e2d1c8;
      expv[21] = 27'h3e028b3;
      expv[22] = 27'h24d36ff;
      expv[23] = 27'h3652c9a;
      expv[24] = 27'h3dbd90f;
      expv[25] = 27'h393dc85;
      expv[26] = 27'h49c21c2;
      expv[27] = 27'h28be742;
      expv[28] = 27'h22d3869;
      expv[29] = 27'h2b3e4ce;
      expv[30] = 27'h04dc9b5;
      expv[31] = 27'h0cff7d0;
      expv[32] = 27'h0aff8ee;
      expv[33] = 27'h1a53e12;
      expv[34] = 27'h00835f9;
      expv[35] = 27'h15ff239;
      expv[36] = 27'h25e4fd3;
      expv[37] = 27'h31130e2;
      expv[38] = 27'h57818f2;
      expv[39] = 27'h3efd8b9;
      expv[40] = 27'h40026e1;
      expv[41] = 27'h2293804;
      expv[42] = 27'h4802349;
      expv[43] = 27'h0147bb6;
      expv[44] = 27'h5841848;
      expv[45] = 27'h2e132a8;
      expv[46] = 27'h7eb47d2;
      expv[47] = 27'h04ffd50;
      expv[48] = 27'h39bddc8;
      expv[49] = 27'h56c1879;
      expv[50] = 27'h43bd7d4;
      expv[51] = 27'h0c7f8b3;
      expv[52] = 27'h1a93fb2;
      expv[53] = 27'h051fbd6;
      expv[54] = 27'h522cc7f;
      expv[55] = 27'h193f01c;
      expv[56] = 27'h02905ee;
      expv[57] = 27'h4bc1e05;
      expv[58] = 27'h437d629;
      expv[59] = 27'h3a7da97;
      expv[60] = 27'h0f7f6f0;
      expv[61] = 27'h59d51df;
      expv[62] = 27'h21d3aa0;
      expv[63] = 27'h53ecdf9;
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
