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

  origen_160695 dut (
    .alu_op(in_vec[7:6]),
    .funct(in_vec[5:0]),
    .alu_ctrl(out_vec[8:6]),
    .pc_jr_sel(out_vec[5:5]),
    .rf_mult_shift_wd_sel(out_vec[4:4]),
    .mult_we(out_vec[3:3]),
    .mult_hilo_sel(out_vec[2:2]),
    .mult_shift_sel(out_vec[1:1]),
    .sl_or_sr(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'h0d;
    stim[1] = 8'h9d;
    stim[2] = 8'h6b;
    stim[3] = 8'hb6;
    stim[4] = 8'h26;
    stim[5] = 8'h6c;
    stim[6] = 8'hea;
    stim[7] = 8'hf6;
    stim[8] = 8'h06;
    stim[9] = 8'h0b;
    stim[10] = 8'h6e;
    stim[11] = 8'hf5;
    stim[12] = 8'h74;
    stim[13] = 8'h58;
    stim[14] = 8'h12;
    stim[15] = 8'h5e;
    stim[16] = 8'hb7;
    stim[17] = 8'hf1;
    stim[18] = 8'h8a;
    stim[19] = 8'h12;
    stim[20] = 8'hb9;
    stim[21] = 8'h66;
    stim[22] = 8'h36;
    stim[23] = 8'hd9;
    stim[24] = 8'hd0;
    stim[25] = 8'h88;
    stim[26] = 8'h55;
    stim[27] = 8'hc2;
    stim[28] = 8'h89;
    stim[29] = 8'he7;
    stim[30] = 8'h87;
    stim[31] = 8'h5f;
    stim[32] = 8'hd4;
    stim[33] = 8'hf4;
    stim[34] = 8'hbd;
    stim[35] = 8'h24;
    stim[36] = 8'he9;
    stim[37] = 8'hd0;
    stim[38] = 8'h6b;
    stim[39] = 8'h45;
    stim[40] = 8'h7f;
    stim[41] = 8'h1e;
    stim[42] = 8'hee;
    stim[43] = 8'h21;
    stim[44] = 8'h1b;
    stim[45] = 8'hea;
    stim[46] = 8'hb5;
    stim[47] = 8'h50;
    stim[48] = 8'hfa;
    stim[49] = 8'h51;
    stim[50] = 8'h52;
    stim[51] = 8'hd8;
    stim[52] = 8'h6c;
    stim[53] = 8'h53;
    stim[54] = 8'h2a;
    stim[55] = 8'hec;
    stim[56] = 8'hc8;
    stim[57] = 8'h4a;
    stim[58] = 8'ha6;
    stim[59] = 8'hfd;
    stim[60] = 8'hce;
    stim[61] = 8'h70;
    stim[62] = 8'h66;
    stim[63] = 8'haa;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 9'h000;
      expv[1] = 9'h000;
      expv[2] = 9'h000;
      expv[3] = 9'h000;
      expv[4] = 9'h000;
      expv[5] = 9'h000;
      expv[6] = 9'h000;
      expv[7] = 9'h000;
      expv[8] = 9'h000;
      expv[9] = 9'h000;
      expv[10] = 9'h000;
      expv[11] = 9'h000;
      expv[12] = 9'h000;
      expv[13] = 9'h000;
      expv[14] = 9'h000;
      expv[15] = 9'h000;
      expv[16] = 9'h000;
      expv[17] = 9'h000;
      expv[18] = 9'h000;
      expv[19] = 9'h000;
      expv[20] = 9'h000;
      expv[21] = 9'h000;
      expv[22] = 9'h000;
      expv[23] = 9'h000;
      expv[24] = 9'h000;
      expv[25] = 9'h020;
      expv[26] = 9'h000;
      expv[27] = 9'h000;
      expv[28] = 9'h000;
      expv[29] = 9'h000;
      expv[30] = 9'h000;
      expv[31] = 9'h000;
      expv[32] = 9'h000;
      expv[33] = 9'h000;
      expv[34] = 9'h000;
      expv[35] = 9'h000;
      expv[36] = 9'h000;
      expv[37] = 9'h000;
      expv[38] = 9'h000;
      expv[39] = 9'h000;
      expv[40] = 9'h000;
      expv[41] = 9'h000;
      expv[42] = 9'h000;
      expv[43] = 9'h000;
      expv[44] = 9'h000;
      expv[45] = 9'h000;
      expv[46] = 9'h000;
      expv[47] = 9'h000;
      expv[48] = 9'h000;
      expv[49] = 9'h000;
      expv[50] = 9'h000;
      expv[51] = 9'h000;
      expv[52] = 9'h000;
      expv[53] = 9'h000;
      expv[54] = 9'h000;
      expv[55] = 9'h000;
      expv[56] = 9'h000;
      expv[57] = 9'h000;
      expv[58] = 9'h000;
      expv[59] = 9'h000;
      expv[60] = 9'h000;
      expv[61] = 9'h000;
      expv[62] = 9'h000;
      expv[63] = 9'h000;
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
