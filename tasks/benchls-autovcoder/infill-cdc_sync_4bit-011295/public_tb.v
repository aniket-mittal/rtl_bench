// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 6;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_011295 dut (
    .iclk_i(clk),
    .iclk_reset_i(in_vec[5:5]),
    .oclk_i(in_vec[4:4]),
    .iclk_data_i(in_vec[3:0]),
    .iclk_data_o(out_vec[7:4]),
    .oclk_data_o(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 6'h34;
    stim[1] = 6'h3e;
    stim[2] = 6'h1a;
    stim[3] = 6'h12;
    stim[4] = 6'h1a;
    stim[5] = 6'h19;
    stim[6] = 6'h08;
    stim[7] = 6'h0d;
    stim[8] = 6'h01;
    stim[9] = 6'h06;
    stim[10] = 6'h1b;
    stim[11] = 6'h16;
    stim[12] = 6'h04;
    stim[13] = 6'h04;
    stim[14] = 6'h1b;
    stim[15] = 6'h12;
    stim[16] = 6'h05;
    stim[17] = 6'h1d;
    stim[18] = 6'h1b;
    stim[19] = 6'h0a;
    stim[20] = 6'h06;
    stim[21] = 6'h00;
    stim[22] = 6'h17;
    stim[23] = 6'h0a;
    stim[24] = 6'h12;
    stim[25] = 6'h11;
    stim[26] = 6'h1f;
    stim[27] = 6'h1f;
    stim[28] = 6'h0e;
    stim[29] = 6'h25;
    stim[30] = 6'h19;
    stim[31] = 6'h16;
    stim[32] = 6'h1c;
    stim[33] = 6'h1c;
    stim[34] = 6'h09;
    stim[35] = 6'h1c;
    stim[36] = 6'h10;
    stim[37] = 6'h15;
    stim[38] = 6'h0d;
    stim[39] = 6'h1e;
    stim[40] = 6'h00;
    stim[41] = 6'h0c;
    stim[42] = 6'h07;
    stim[43] = 6'h1c;
    stim[44] = 6'h1b;
    stim[45] = 6'h02;
    stim[46] = 6'h01;
    stim[47] = 6'h1d;
    stim[48] = 6'h02;
    stim[49] = 6'h10;
    stim[50] = 6'h05;
    stim[51] = 6'h1a;
    stim[52] = 6'h15;
    stim[53] = 6'h0c;
    stim[54] = 6'h0c;
    stim[55] = 6'h06;
    stim[56] = 6'h19;
    stim[57] = 6'h16;
    stim[58] = 6'h19;
    stim[59] = 6'h00;
    stim[60] = 6'h12;
    stim[61] = 6'h0b;
    stim[62] = 6'h04;
    stim[63] = 6'h1b;
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
      expv[0] = 8'hxx;
      expv[1] = 8'h0x;
      expv[2] = 8'h0x;
      expv[3] = 8'hax;
      expv[4] = 8'h2x;
      expv[5] = 8'hax;
      expv[6] = 8'h9x;
      expv[7] = 8'h8x;
      expv[8] = 8'hdx;
      expv[9] = 8'h1x;
      expv[10] = 8'h6x;
      expv[11] = 8'hbx;
      expv[12] = 8'h6x;
      expv[13] = 8'h4x;
      expv[14] = 8'h46;
      expv[15] = 8'hb6;
      expv[16] = 8'h26;
      expv[17] = 8'h54;
      expv[18] = 8'hd4;
      expv[19] = 8'hb4;
      expv[20] = 8'ha4;
      expv[21] = 8'h64;
      expv[22] = 8'h05;
      expv[23] = 8'h75;
      expv[24] = 8'ha0;
      expv[25] = 8'h20;
      expv[26] = 8'h10;
      expv[27] = 8'hf0;
      expv[28] = 8'hf0;
      expv[29] = 8'he0;
      expv[30] = 8'h0a;
      expv[31] = 8'h9a;
      expv[32] = 8'h6a;
      expv[33] = 8'hca;
      expv[34] = 8'hca;
      expv[35] = 8'h90;
      expv[36] = 8'hc0;
      expv[37] = 8'h00;
      expv[38] = 8'h50;
      expv[39] = 8'hd9;
      expv[40] = 8'he9;
      expv[41] = 8'h09;
      expv[42] = 8'hc9;
      expv[43] = 8'h7d;
      expv[44] = 8'hcd;
      expv[45] = 8'hbd;
      expv[46] = 8'h2d;
      expv[47] = 8'h17;
      expv[48] = 8'hd7;
      expv[49] = 8'h21;
      expv[50] = 8'h01;
      expv[51] = 8'h52;
      expv[52] = 8'ha2;
      expv[53] = 8'h52;
      expv[54] = 8'hc2;
      expv[55] = 8'hc2;
      expv[56] = 8'h65;
      expv[57] = 8'h95;
      expv[58] = 8'h65;
      expv[59] = 8'h95;
      expv[60] = 8'h06;
      expv[61] = 8'h26;
      expv[62] = 8'hb6;
      expv[63] = 8'h40;
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
