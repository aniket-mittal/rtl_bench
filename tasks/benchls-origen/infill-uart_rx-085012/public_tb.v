// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 18;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_085012 dut (
    .i_clk(clk),
    .i_reset(in_vec[17:17]),
    .i_uart_rx(in_vec[16:16]),
    .i_baudrate_prescaler(in_vec[15:0]),
    .o_data(out_vec[16:1]),
    .o_data_stb(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 18'h30479;
    stim[1] = 18'h3e8c4;
    stim[2] = 18'h13cba;
    stim[3] = 18'h0f86b;
    stim[4] = 18'h047c3;
    stim[5] = 18'h174b3;
    stim[6] = 18'h03075;
    stim[7] = 18'h1580c;
    stim[8] = 18'h06dc4;
    stim[9] = 18'h1b515;
    stim[10] = 18'h1ab7b;
    stim[11] = 18'h01801;
    stim[12] = 18'h1b8ed;
    stim[13] = 18'h02d57;
    stim[14] = 18'h07b8b;
    stim[15] = 18'h12d3e;
    stim[16] = 18'h17825;
    stim[17] = 18'h12a61;
    stim[18] = 18'h04297;
    stim[19] = 18'h05994;
    stim[20] = 18'h0c582;
    stim[21] = 18'h17bd0;
    stim[22] = 18'h0e0ca;
    stim[23] = 18'h0ae17;
    stim[24] = 18'h08b6c;
    stim[25] = 18'h01a55;
    stim[26] = 18'h1a1e4;
    stim[27] = 18'h233d7;
    stim[28] = 18'h04779;
    stim[29] = 18'h02c55;
    stim[30] = 18'h0f1b2;
    stim[31] = 18'h07f0a;
    stim[32] = 18'h01c03;
    stim[33] = 18'h00651;
    stim[34] = 18'h19d18;
    stim[35] = 18'h1421a;
    stim[36] = 18'h14e53;
    stim[37] = 18'h1a161;
    stim[38] = 18'h147e6;
    stim[39] = 18'h1e6c5;
    stim[40] = 18'h15c74;
    stim[41] = 18'h1c452;
    stim[42] = 18'h044c6;
    stim[43] = 18'h223c7;
    stim[44] = 18'h11251;
    stim[45] = 18'h1ea02;
    stim[46] = 18'h17aa5;
    stim[47] = 18'h0fdf4;
    stim[48] = 18'h0b797;
    stim[49] = 18'h1f43f;
    stim[50] = 18'h19f3b;
    stim[51] = 18'h1f15d;
    stim[52] = 18'h0319b;
    stim[53] = 18'h0027d;
    stim[54] = 18'h0a4d9;
    stim[55] = 18'h1caac;
    stim[56] = 18'h08329;
    stim[57] = 18'h0a85a;
    stim[58] = 18'h055e6;
    stim[59] = 18'h1215d;
    stim[60] = 18'h0f0d2;
    stim[61] = 18'h0835e;
    stim[62] = 18'h12b44;
    stim[63] = 18'h196d5;
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
      expv[0] = 17'h00000;
      expv[1] = 17'h00000;
      expv[2] = 17'h00000;
      expv[3] = 17'h00000;
      expv[4] = 17'h00000;
      expv[5] = 17'h00000;
      expv[6] = 17'h00000;
      expv[7] = 17'h00000;
      expv[8] = 17'h00000;
      expv[9] = 17'h00000;
      expv[10] = 17'h00000;
      expv[11] = 17'h00000;
      expv[12] = 17'h00000;
      expv[13] = 17'h00000;
      expv[14] = 17'h00000;
      expv[15] = 17'h00000;
      expv[16] = 17'h00000;
      expv[17] = 17'h00000;
      expv[18] = 17'h00000;
      expv[19] = 17'h00000;
      expv[20] = 17'h00000;
      expv[21] = 17'h00000;
      expv[22] = 17'h00000;
      expv[23] = 17'h00000;
      expv[24] = 17'h00000;
      expv[25] = 17'h00000;
      expv[26] = 17'h00000;
      expv[27] = 17'h00000;
      expv[28] = 17'h00000;
      expv[29] = 17'h00000;
      expv[30] = 17'h00000;
      expv[31] = 17'h00000;
      expv[32] = 17'h00000;
      expv[33] = 17'h00000;
      expv[34] = 17'h00000;
      expv[35] = 17'h00000;
      expv[36] = 17'h00000;
      expv[37] = 17'h00000;
      expv[38] = 17'h00000;
      expv[39] = 17'h00000;
      expv[40] = 17'h00000;
      expv[41] = 17'h00000;
      expv[42] = 17'h00000;
      expv[43] = 17'h00000;
      expv[44] = 17'h00000;
      expv[45] = 17'h00000;
      expv[46] = 17'h00000;
      expv[47] = 17'h00000;
      expv[48] = 17'h00000;
      expv[49] = 17'h00000;
      expv[50] = 17'h00000;
      expv[51] = 17'h00000;
      expv[52] = 17'h00000;
      expv[53] = 17'h00000;
      expv[54] = 17'h00000;
      expv[55] = 17'h00000;
      expv[56] = 17'h00000;
      expv[57] = 17'h00000;
      expv[58] = 17'h00000;
      expv[59] = 17'h00000;
      expv[60] = 17'h00000;
      expv[61] = 17'h00000;
      expv[62] = 17'h00000;
      expv[63] = 17'h00000;
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
