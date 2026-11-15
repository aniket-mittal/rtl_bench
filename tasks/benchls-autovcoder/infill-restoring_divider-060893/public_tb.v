// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 23;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_060893 dut (
    .i_w_clk(clk),
    .i_w_rst(in_vec[22:22]),
    .i_w_num(in_vec[21:11]),
    .i_w_den(in_vec[10:0]),
    .o_w_quot(out_vec[11:1]),
    .o_w_rdy(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 23'h7e0d62;
    stim[1] = 23'h64e07a;
    stim[2] = 23'h3dc42b;
    stim[3] = 23'h01298e;
    stim[4] = 23'h04b14f;
    stim[5] = 23'h247aa9;
    stim[6] = 23'h58b3c9;
    stim[7] = 23'h3c1816;
    stim[8] = 23'h2040a1;
    stim[9] = 23'h39c55d;
    stim[10] = 23'h21d226;
    stim[11] = 23'h3c4e89;
    stim[12] = 23'h37cfac;
    stim[13] = 23'h033b97;
    stim[14] = 23'h3a15f5;
    stim[15] = 23'h2a1520;
    stim[16] = 23'h05f49d;
    stim[17] = 23'h74735c;
    stim[18] = 23'h1d8c79;
    stim[19] = 23'h17e278;
    stim[20] = 23'h2a28cc;
    stim[21] = 23'h068d35;
    stim[22] = 23'h0996da;
    stim[23] = 23'h109dd0;
    stim[24] = 23'h2fb75e;
    stim[25] = 23'h242665;
    stim[26] = 23'h30e79e;
    stim[27] = 23'h3832d0;
    stim[28] = 23'h07ced2;
    stim[29] = 23'h26bfde;
    stim[30] = 23'h3bae1e;
    stim[31] = 23'h2ad4fd;
    stim[32] = 23'h0d0adc;
    stim[33] = 23'h26c845;
    stim[34] = 23'h1d4f72;
    stim[35] = 23'h047250;
    stim[36] = 23'h12cac9;
    stim[37] = 23'h2d3736;
    stim[38] = 23'h30533c;
    stim[39] = 23'h37bb23;
    stim[40] = 23'h3ab4a7;
    stim[41] = 23'h3cfcba;
    stim[42] = 23'h1fc486;
    stim[43] = 23'h0d9b7b;
    stim[44] = 23'h307a00;
    stim[45] = 23'h2c6804;
    stim[46] = 23'h358609;
    stim[47] = 23'h0a6ec3;
    stim[48] = 23'h3be111;
    stim[49] = 23'h04d32d;
    stim[50] = 23'h11b3e0;
    stim[51] = 23'h1ed565;
    stim[52] = 23'h2b4cbd;
    stim[53] = 23'h0fb12b;
    stim[54] = 23'h22c80e;
    stim[55] = 23'h3a423b;
    stim[56] = 23'h02d446;
    stim[57] = 23'h2dc677;
    stim[58] = 23'h0b7e53;
    stim[59] = 23'h26267b;
    stim[60] = 23'h0d0162;
    stim[61] = 23'h3ea2d6;
    stim[62] = 23'h0f57ac;
    stim[63] = 23'h15ceb8;
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
      expv[0] = 12'hxxx;
      expv[1] = 12'h800;
      expv[2] = 12'h800;
      expv[3] = 12'h800;
      expv[4] = 12'ha00;
      expv[5] = 12'ha00;
      expv[6] = 12'ha00;
      expv[7] = 12'h800;
      expv[8] = 12'hc00;
      expv[9] = 12'he00;
      expv[10] = 12'hf00;
      expv[11] = 12'hf80;
      expv[12] = 12'hfc0;
      expv[13] = 12'hfe0;
      expv[14] = 12'hff0;
      expv[15] = 12'hff8;
      expv[16] = 12'hffc;
      expv[17] = 12'hffe;
      expv[18] = 12'h800;
      expv[19] = 12'hc00;
      expv[20] = 12'he00;
      expv[21] = 12'hf00;
      expv[22] = 12'hf80;
      expv[23] = 12'hfc0;
      expv[24] = 12'hfc0;
      expv[25] = 12'hfc0;
      expv[26] = 12'hfc8;
      expv[27] = 12'hfcc;
      expv[28] = 12'hfce;
      expv[29] = 12'hfcf;
      expv[30] = 12'hfcf;
      expv[31] = 12'hfcf;
      expv[32] = 12'hfcf;
      expv[33] = 12'hfcf;
      expv[34] = 12'hfcf;
      expv[35] = 12'hfcf;
      expv[36] = 12'hfcf;
      expv[37] = 12'hfcf;
      expv[38] = 12'hfcf;
      expv[39] = 12'hfcf;
      expv[40] = 12'hfcf;
      expv[41] = 12'hfcf;
      expv[42] = 12'hfcf;
      expv[43] = 12'hfcf;
      expv[44] = 12'hfcf;
      expv[45] = 12'hfcf;
      expv[46] = 12'hfcf;
      expv[47] = 12'hfcf;
      expv[48] = 12'hfcf;
      expv[49] = 12'hfcf;
      expv[50] = 12'hfcf;
      expv[51] = 12'hfcf;
      expv[52] = 12'hfcf;
      expv[53] = 12'hfcf;
      expv[54] = 12'hfcf;
      expv[55] = 12'hfcf;
      expv[56] = 12'hfcf;
      expv[57] = 12'hfcf;
      expv[58] = 12'hfcf;
      expv[59] = 12'hfcf;
      expv[60] = 12'hfcf;
      expv[61] = 12'hfcf;
      expv[62] = 12'hfcf;
      expv[63] = 12'hfcf;
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
