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

  CDMA_mgc_shift_l dut (
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
    stim[0] = 6'h30;
    stim[1] = 6'h08;
    stim[2] = 6'h08;
    stim[3] = 6'h3a;
    stim[4] = 6'h0c;
    stim[5] = 6'h3c;
    stim[6] = 6'h11;
    stim[7] = 6'h06;
    stim[8] = 6'h1b;
    stim[9] = 6'h04;
    stim[10] = 6'h33;
    stim[11] = 6'h1d;
    stim[12] = 6'h27;
    stim[13] = 6'h3e;
    stim[14] = 6'h22;
    stim[15] = 6'h00;
    stim[16] = 6'h0c;
    stim[17] = 6'h1a;
    stim[18] = 6'h07;
    stim[19] = 6'h1b;
    stim[20] = 6'h3a;
    stim[21] = 6'h14;
    stim[22] = 6'h2a;
    stim[23] = 6'h18;
    stim[24] = 6'h31;
    stim[25] = 6'h1d;
    stim[26] = 6'h25;
    stim[27] = 6'h3d;
    stim[28] = 6'h13;
    stim[29] = 6'h03;
    stim[30] = 6'h38;
    stim[31] = 6'h1c;
    stim[32] = 6'h05;
    stim[33] = 6'h02;
    stim[34] = 6'h20;
    stim[35] = 6'h3a;
    stim[36] = 6'h0d;
    stim[37] = 6'h3e;
    stim[38] = 6'h36;
    stim[39] = 6'h11;
    stim[40] = 6'h25;
    stim[41] = 6'h2d;
    stim[42] = 6'h1d;
    stim[43] = 6'h2a;
    stim[44] = 6'h35;
    stim[45] = 6'h34;
    stim[46] = 6'h38;
    stim[47] = 6'h28;
    stim[48] = 6'h3a;
    stim[49] = 6'h21;
    stim[50] = 6'h30;
    stim[51] = 6'h13;
    stim[52] = 6'h1c;
    stim[53] = 6'h3d;
    stim[54] = 6'h2b;
    stim[55] = 6'h14;
    stim[56] = 6'h0a;
    stim[57] = 6'h14;
    stim[58] = 6'h07;
    stim[59] = 6'h3c;
    stim[60] = 6'h12;
    stim[61] = 6'h0b;
    stim[62] = 6'h3a;
    stim[63] = 6'h2a;
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
      expv[0] = 8'hfc;
      expv[1] = 8'h02;
      expv[2] = 8'h02;
      expv[3] = 8'hf8;
      expv[4] = 8'h03;
      expv[5] = 8'hff;
      expv[6] = 8'h08;
      expv[7] = 8'h04;
      expv[8] = 8'h30;
      expv[9] = 8'h01;
      expv[10] = 8'he0;
      expv[11] = 8'h0e;
      expv[12] = 8'hc8;
      expv[13] = 8'hfc;
      expv[14] = 8'he0;
      expv[15] = 8'h00;
      expv[16] = 8'h03;
      expv[17] = 8'h18;
      expv[18] = 8'h08;
      expv[19] = 8'h30;
      expv[20] = 8'hf8;
      expv[21] = 8'h05;
      expv[22] = 8'he8;
      expv[23] = 8'h06;
      expv[24] = 8'hf8;
      expv[25] = 8'h0e;
      expv[26] = 8'hf2;
      expv[27] = 8'hfe;
      expv[28] = 8'h20;
      expv[29] = 8'h00;
      expv[30] = 8'hfe;
      expv[31] = 8'h07;
      expv[32] = 8'h02;
      expv[33] = 8'h00;
      expv[34] = 8'hf8;
      expv[35] = 8'hf8;
      expv[36] = 8'h06;
      expv[37] = 8'hfc;
      expv[38] = 8'hf4;
      expv[39] = 8'h08;
      expv[40] = 8'hf2;
      expv[41] = 8'hf6;
      expv[42] = 8'h0e;
      expv[43] = 8'he8;
      expv[44] = 8'hfa;
      expv[45] = 8'hfd;
      expv[46] = 8'hfe;
      expv[47] = 8'hfa;
      expv[48] = 8'hf8;
      expv[49] = 8'hf0;
      expv[50] = 8'hfc;
      expv[51] = 8'h20;
      expv[52] = 8'h07;
      expv[53] = 8'hfe;
      expv[54] = 8'hd0;
      expv[55] = 8'h05;
      expv[56] = 8'h08;
      expv[57] = 8'h05;
      expv[58] = 8'h08;
      expv[59] = 8'hff;
      expv[60] = 8'h10;
      expv[61] = 8'h10;
      expv[62] = 8'hf8;
      expv[63] = 8'he8;
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
