// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 6;
  localparam OW = 3;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  ct_ebiu_lowpower dut (
    .forever_cpuclk(clk),
    .clk_en(in_vec[5:5]),
    .cpurst_b(in_vec[4:4]),
    .ebiu_read_channel_no_op(in_vec[3:3]),
    .ebiu_snoop_channel_no_op(in_vec[2:2]),
    .ebiu_write_channel_no_op(in_vec[1:1]),
    .pad_ebiu_csysreq(in_vec[0:0]),
    .ebiu_pad_cactive(out_vec[2:2]),
    .ebiu_pad_csysack(out_vec[1:1]),
    .ebiu_xx_no_op(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 6'h00;
    stim[1] = 6'h04;
    stim[2] = 6'h1f;
    stim[3] = 6'h34;
    stim[4] = 6'h15;
    stim[5] = 6'h36;
    stim[6] = 6'h3b;
    stim[7] = 6'h34;
    stim[8] = 6'h30;
    stim[9] = 6'h32;
    stim[10] = 6'h31;
    stim[11] = 6'h3d;
    stim[12] = 6'h35;
    stim[13] = 6'h12;
    stim[14] = 6'h15;
    stim[15] = 6'h3d;
    stim[16] = 6'h1b;
    stim[17] = 6'h3a;
    stim[18] = 6'h07;
    stim[19] = 6'h1e;
    stim[20] = 6'h3b;
    stim[21] = 6'h16;
    stim[22] = 6'h3b;
    stim[23] = 6'h14;
    stim[24] = 6'h3a;
    stim[25] = 6'h33;
    stim[26] = 6'h39;
    stim[27] = 6'h1b;
    stim[28] = 6'h33;
    stim[29] = 6'h09;
    stim[30] = 6'h35;
    stim[31] = 6'h38;
    stim[32] = 6'h19;
    stim[33] = 6'h10;
    stim[34] = 6'h33;
    stim[35] = 6'h1d;
    stim[36] = 6'h37;
    stim[37] = 6'h33;
    stim[38] = 6'h34;
    stim[39] = 6'h30;
    stim[40] = 6'h19;
    stim[41] = 6'h3c;
    stim[42] = 6'h30;
    stim[43] = 6'h1b;
    stim[44] = 6'h3b;
    stim[45] = 6'h1f;
    stim[46] = 6'h31;
    stim[47] = 6'h3e;
    stim[48] = 6'h3c;
    stim[49] = 6'h3c;
    stim[50] = 6'h3f;
    stim[51] = 6'h18;
    stim[52] = 6'h37;
    stim[53] = 6'h37;
    stim[54] = 6'h2d;
    stim[55] = 6'h3a;
    stim[56] = 6'h14;
    stim[57] = 6'h1b;
    stim[58] = 6'h3e;
    stim[59] = 6'h1a;
    stim[60] = 6'h12;
    stim[61] = 6'h3d;
    stim[62] = 6'h3b;
    stim[63] = 6'h13;
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
      expv[0] = 3'h6;
      expv[1] = 3'h6;
      expv[2] = 3'h7;
      expv[3] = 3'h6;
      expv[4] = 3'h4;
      expv[5] = 3'h4;
      expv[6] = 3'h4;
      expv[7] = 3'h6;
      expv[8] = 3'h4;
      expv[9] = 3'h4;
      expv[10] = 3'h4;
      expv[11] = 3'h6;
      expv[12] = 3'h6;
      expv[13] = 3'h6;
      expv[14] = 3'h6;
      expv[15] = 3'h6;
      expv[16] = 3'h6;
      expv[17] = 3'h6;
      expv[18] = 3'h6;
      expv[19] = 3'h7;
      expv[20] = 3'h6;
      expv[21] = 3'h6;
      expv[22] = 3'h6;
      expv[23] = 3'h6;
      expv[24] = 3'h6;
      expv[25] = 3'h4;
      expv[26] = 3'h6;
      expv[27] = 3'h6;
      expv[28] = 3'h6;
      expv[29] = 3'h6;
      expv[30] = 3'h6;
      expv[31] = 3'h6;
      expv[32] = 3'h4;
      expv[33] = 3'h4;
      expv[34] = 3'h4;
      expv[35] = 3'h6;
      expv[36] = 3'h6;
      expv[37] = 3'h6;
      expv[38] = 3'h6;
      expv[39] = 3'h4;
      expv[40] = 3'h4;
      expv[41] = 3'h4;
      expv[42] = 3'h4;
      expv[43] = 3'h4;
      expv[44] = 3'h4;
      expv[45] = 3'h7;
      expv[46] = 3'h6;
      expv[47] = 3'h7;
      expv[48] = 3'h4;
      expv[49] = 3'h4;
      expv[50] = 3'h5;
      expv[51] = 3'h6;
      expv[52] = 3'h6;
      expv[53] = 3'h6;
      expv[54] = 3'h6;
      expv[55] = 3'h6;
      expv[56] = 3'h4;
      expv[57] = 3'h4;
      expv[58] = 3'h5;
      expv[59] = 3'h4;
      expv[60] = 3'h4;
      expv[61] = 3'h4;
      expv[62] = 3'h6;
      expv[63] = 3'h6;
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
