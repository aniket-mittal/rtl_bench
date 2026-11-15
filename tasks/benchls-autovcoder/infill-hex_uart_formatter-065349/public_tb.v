// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_065349 dut (
    .i_clk(clk),
    .i_reset(in_vec[7:7]),
    .i_stb(in_vec[6:6]),
    .i_bits(in_vec[5:1]),
    .i_busy(in_vec[0:0]),
    .o_gx_busy(out_vec[8:8]),
    .o_gx_stb(out_vec[7:7]),
    .o_gx_char(out_vec[6:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'hb2;
    stim[1] = 8'hc0;
    stim[2] = 8'h33;
    stim[3] = 8'h7a;
    stim[4] = 8'h11;
    stim[5] = 8'h03;
    stim[6] = 8'h19;
    stim[7] = 8'h34;
    stim[8] = 8'h53;
    stim[9] = 8'h3c;
    stim[10] = 8'h60;
    stim[11] = 8'h39;
    stim[12] = 8'h19;
    stim[13] = 8'h32;
    stim[14] = 8'h2e;
    stim[15] = 8'h6c;
    stim[16] = 8'h0a;
    stim[17] = 8'h37;
    stim[18] = 8'h48;
    stim[19] = 8'h14;
    stim[20] = 8'h2c;
    stim[21] = 8'h25;
    stim[22] = 8'h68;
    stim[23] = 8'h3f;
    stim[24] = 8'h2d;
    stim[25] = 8'h63;
    stim[26] = 8'h0c;
    stim[27] = 8'h73;
    stim[28] = 8'h6a;
    stim[29] = 8'h30;
    stim[30] = 8'h7f;
    stim[31] = 8'h29;
    stim[32] = 8'h3c;
    stim[33] = 8'h19;
    stim[34] = 8'h09;
    stim[35] = 8'h0c;
    stim[36] = 8'h6a;
    stim[37] = 8'h04;
    stim[38] = 8'h45;
    stim[39] = 8'h2c;
    stim[40] = 8'h48;
    stim[41] = 8'h2a;
    stim[42] = 8'h7b;
    stim[43] = 8'h31;
    stim[44] = 8'h07;
    stim[45] = 8'h3b;
    stim[46] = 8'h45;
    stim[47] = 8'h1f;
    stim[48] = 8'h07;
    stim[49] = 8'h76;
    stim[50] = 8'h27;
    stim[51] = 8'hf1;
    stim[52] = 8'h26;
    stim[53] = 8'h08;
    stim[54] = 8'h57;
    stim[55] = 8'h1e;
    stim[56] = 8'hd8;
    stim[57] = 8'h72;
    stim[58] = 8'h46;
    stim[59] = 8'h6a;
    stim[60] = 8'h21;
    stim[61] = 8'h19;
    stim[62] = 8'h7b;
    stim[63] = 8'h53;
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
      expv[0] = 9'h000;
      expv[1] = 9'h045;
      expv[2] = 9'h030;
      expv[3] = 9'h045;
      expv[4] = 9'h18d;
      expv[5] = 9'h18d;
      expv[6] = 9'h18d;
      expv[7] = 9'h08d;
      expv[8] = 9'h049;
      expv[9] = 9'h0b9;
      expv[10] = 9'h00d;
      expv[11] = 9'h1d2;
      expv[12] = 9'h1d2;
      expv[13] = 9'h0d2;
      expv[14] = 9'h045;
      expv[15] = 9'h00d;
      expv[16] = 9'h08d;
      expv[17] = 9'h035;
      expv[18] = 9'h05a;
      expv[19] = 9'h0b4;
      expv[20] = 9'h061;
      expv[21] = 9'h00d;
      expv[22] = 9'h041;
      expv[23] = 9'h18d;
      expv[24] = 9'h18d;
      expv[25] = 9'h18d;
      expv[26] = 9'h08d;
      expv[27] = 9'h036;
      expv[28] = 9'h0c5;
      expv[29] = 9'h08d;
      expv[30] = 9'h054;
      expv[31] = 9'h18d;
      expv[32] = 9'h08d;
      expv[33] = 9'h00d;
      expv[34] = 9'h063;
      expv[35] = 9'h034;
      expv[36] = 9'h036;
      expv[37] = 9'h08d;
      expv[38] = 9'h032;
      expv[39] = 9'h0b2;
      expv[40] = 9'h00d;
      expv[41] = 9'h0b4;
      expv[42] = 9'h00d;
      expv[43] = 9'h18d;
      expv[44] = 9'h18d;
      expv[45] = 9'h18d;
      expv[46] = 9'h18d;
      expv[47] = 9'h18d;
      expv[48] = 9'h18d;
      expv[49] = 9'h08d;
      expv[50] = 9'h1da;
      expv[51] = 9'h1da;
      expv[52] = 9'h05a;
      expv[53] = 9'h053;
      expv[54] = 9'h034;
      expv[55] = 9'h0e2;
      expv[56] = 9'h066;
      expv[57] = 9'h063;
      expv[58] = 9'h0c5;
      expv[59] = 9'h0b3;
      expv[60] = 9'h18d;
      expv[61] = 9'h18d;
      expv[62] = 9'h18d;
      expv[63] = 9'h18d;
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
