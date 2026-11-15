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

  SDP_Y_INP_mgc_shift_l_v4 dut (
    .a(in_vec[5:2]),
    .s(in_vec[1:0]),
    .z(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 6'h2d;
    stim[1] = 6'h38;
    stim[2] = 6'h32;
    stim[3] = 6'h0f;
    stim[4] = 6'h19;
    stim[5] = 6'h33;
    stim[6] = 6'h05;
    stim[7] = 6'h34;
    stim[8] = 6'h11;
    stim[9] = 6'h2c;
    stim[10] = 6'h14;
    stim[11] = 6'h0b;
    stim[12] = 6'h18;
    stim[13] = 6'h28;
    stim[14] = 6'h17;
    stim[15] = 6'h2a;
    stim[16] = 6'h34;
    stim[17] = 6'h09;
    stim[18] = 6'h3a;
    stim[19] = 6'h1b;
    stim[20] = 6'h02;
    stim[21] = 6'h10;
    stim[22] = 6'h22;
    stim[23] = 6'h19;
    stim[24] = 6'h1b;
    stim[25] = 6'h01;
    stim[26] = 6'h02;
    stim[27] = 6'h33;
    stim[28] = 6'h18;
    stim[29] = 6'h28;
    stim[30] = 6'h14;
    stim[31] = 6'h0b;
    stim[32] = 6'h29;
    stim[33] = 6'h1f;
    stim[34] = 6'h30;
    stim[35] = 6'h15;
    stim[36] = 6'h1d;
    stim[37] = 6'h0f;
    stim[38] = 6'h36;
    stim[39] = 6'h0d;
    stim[40] = 6'h3e;
    stim[41] = 6'h3b;
    stim[42] = 6'h25;
    stim[43] = 6'h12;
    stim[44] = 6'h14;
    stim[45] = 6'h18;
    stim[46] = 6'h11;
    stim[47] = 6'h32;
    stim[48] = 6'h3b;
    stim[49] = 6'h3c;
    stim[50] = 6'h1e;
    stim[51] = 6'h2e;
    stim[52] = 6'h09;
    stim[53] = 6'h29;
    stim[54] = 6'h33;
    stim[55] = 6'h11;
    stim[56] = 6'h1f;
    stim[57] = 6'h16;
    stim[58] = 6'h2e;
    stim[59] = 6'h30;
    stim[60] = 6'h0f;
    stim[61] = 6'h35;
    stim[62] = 6'h1f;
    stim[63] = 6'h2e;
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
      expv[0] = 8'hf6;
      expv[1] = 8'hfe;
      expv[2] = 8'hf0;
      expv[3] = 8'h18;
      expv[4] = 8'h0c;
      expv[5] = 8'he0;
      expv[6] = 8'h02;
      expv[7] = 8'hfd;
      expv[8] = 8'h08;
      expv[9] = 8'hfb;
      expv[10] = 8'h05;
      expv[11] = 8'h10;
      expv[12] = 8'h06;
      expv[13] = 8'hfa;
      expv[14] = 8'h28;
      expv[15] = 8'he8;
      expv[16] = 8'hfd;
      expv[17] = 8'h04;
      expv[18] = 8'hf8;
      expv[19] = 8'h30;
      expv[20] = 8'h00;
      expv[21] = 8'h04;
      expv[22] = 8'he0;
      expv[23] = 8'h0c;
      expv[24] = 8'h30;
      expv[25] = 8'h00;
      expv[26] = 8'h00;
      expv[27] = 8'he0;
      expv[28] = 8'h06;
      expv[29] = 8'hfa;
      expv[30] = 8'h05;
      expv[31] = 8'h10;
      expv[32] = 8'hf4;
      expv[33] = 8'h38;
      expv[34] = 8'hfc;
      expv[35] = 8'h0a;
      expv[36] = 8'h0e;
      expv[37] = 8'h18;
      expv[38] = 8'hf4;
      expv[39] = 8'h06;
      expv[40] = 8'hfc;
      expv[41] = 8'hf0;
      expv[42] = 8'hf2;
      expv[43] = 8'h10;
      expv[44] = 8'h05;
      expv[45] = 8'h06;
      expv[46] = 8'h08;
      expv[47] = 8'hf0;
      expv[48] = 8'hf0;
      expv[49] = 8'hff;
      expv[50] = 8'h1c;
      expv[51] = 8'hec;
      expv[52] = 8'h04;
      expv[53] = 8'hf4;
      expv[54] = 8'he0;
      expv[55] = 8'h08;
      expv[56] = 8'h38;
      expv[57] = 8'h14;
      expv[58] = 8'hec;
      expv[59] = 8'hfc;
      expv[60] = 8'h18;
      expv[61] = 8'hfa;
      expv[62] = 8'h38;
      expv[63] = 8'hec;
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
