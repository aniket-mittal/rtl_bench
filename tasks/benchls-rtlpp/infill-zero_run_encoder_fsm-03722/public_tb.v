// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 7;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_03722 dut (
    .clock(clk),
    .reset(in_vec[7:7]),
    .i_d(in_vec[6:4]),
    .state(in_vec[3:0]),
    .o_d(out_vec[6:3]),
    .f_start_i_eq_0(out_vec[2:2]),
    .f_zeros_i_eq_0(out_vec[1:1]),
    .f_zeros_t_cnt_eq_15(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'hb1;
    stim[1] = 8'h95;
    stim[2] = 8'h16;
    stim[3] = 8'h03;
    stim[4] = 8'h0c;
    stim[5] = 8'h61;
    stim[6] = 8'h48;
    stim[7] = 8'h49;
    stim[8] = 8'h77;
    stim[9] = 8'h79;
    stim[10] = 8'h35;
    stim[11] = 8'h5d;
    stim[12] = 8'h7f;
    stim[13] = 8'h53;
    stim[14] = 8'h32;
    stim[15] = 8'h77;
    stim[16] = 8'h07;
    stim[17] = 8'h1f;
    stim[18] = 8'h69;
    stim[19] = 8'h40;
    stim[20] = 8'h65;
    stim[21] = 8'h1c;
    stim[22] = 8'h03;
    stim[23] = 8'h2d;
    stim[24] = 8'h07;
    stim[25] = 8'h02;
    stim[26] = 8'h4c;
    stim[27] = 8'h15;
    stim[28] = 8'h47;
    stim[29] = 8'h08;
    stim[30] = 8'h33;
    stim[31] = 8'h51;
    stim[32] = 8'h17;
    stim[33] = 8'h1e;
    stim[34] = 8'h0b;
    stim[35] = 8'h49;
    stim[36] = 8'h10;
    stim[37] = 8'h4d;
    stim[38] = 8'h6f;
    stim[39] = 8'h44;
    stim[40] = 8'h24;
    stim[41] = 8'h72;
    stim[42] = 8'h20;
    stim[43] = 8'h18;
    stim[44] = 8'h59;
    stim[45] = 8'h36;
    stim[46] = 8'h38;
    stim[47] = 8'h2d;
    stim[48] = 8'h53;
    stim[49] = 8'h7c;
    stim[50] = 8'h45;
    stim[51] = 8'h36;
    stim[52] = 8'h29;
    stim[53] = 8'h35;
    stim[54] = 8'h53;
    stim[55] = 8'h27;
    stim[56] = 8'h35;
    stim[57] = 8'h38;
    stim[58] = 8'h78;
    stim[59] = 8'h73;
    stim[60] = 8'h2d;
    stim[61] = 8'h16;
    stim[62] = 8'h20;
    stim[63] = 8'h59;
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
      expv[0] = 7'hxx;
      expv[1] = 7'h08;
      expv[2] = 7'hxx;
      expv[3] = 7'hxx;
      expv[4] = 7'hxx;
      expv[5] = 7'hxx;
      expv[6] = 7'hxx;
      expv[7] = 7'hxx;
      expv[8] = 7'h00;
      expv[9] = 7'hxx;
      expv[10] = 7'h00;
      expv[11] = 7'hxx;
      expv[12] = 7'hxx;
      expv[13] = 7'hxx;
      expv[14] = 7'hxx;
      expv[15] = 7'h00;
      expv[16] = 7'h06;
      expv[17] = 7'hxx;
      expv[18] = 7'hxx;
      expv[19] = 7'hxx;
      expv[20] = 7'h00;
      expv[21] = 7'hxx;
      expv[22] = 7'hxx;
      expv[23] = 7'hxx;
      expv[24] = 7'h06;
      expv[25] = 7'hxx;
      expv[26] = 7'hxx;
      expv[27] = 7'h00;
      expv[28] = 7'h00;
      expv[29] = 7'hxx;
      expv[30] = 7'hxx;
      expv[31] = 7'hxx;
      expv[32] = 7'h00;
      expv[33] = 7'hxx;
      expv[34] = 7'hxx;
      expv[35] = 7'hxx;
      expv[36] = 7'hxx;
      expv[37] = 7'hxx;
      expv[38] = 7'hxx;
      expv[39] = 7'hxx;
      expv[40] = 7'hxx;
      expv[41] = 7'hxx;
      expv[42] = 7'hxx;
      expv[43] = 7'hxx;
      expv[44] = 7'hxx;
      expv[45] = 7'hxx;
      expv[46] = 7'hxx;
      expv[47] = 7'hxx;
      expv[48] = 7'hxx;
      expv[49] = 7'hxx;
      expv[50] = 7'h00;
      expv[51] = 7'hxx;
      expv[52] = 7'hxx;
      expv[53] = 7'h00;
      expv[54] = 7'hxx;
      expv[55] = 7'h00;
      expv[56] = 7'h00;
      expv[57] = 7'hxx;
      expv[58] = 7'hxx;
      expv[59] = 7'hxx;
      expv[60] = 7'hxx;
      expv[61] = 7'hxx;
      expv[62] = 7'hxx;
      expv[63] = 7'hxx;
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
