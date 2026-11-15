// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_05584 dut (
    .di(in_vec[10:0]),
    .crc_out(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h411;
    stim[1] = 11'h18d;
    stim[2] = 11'h311;
    stim[3] = 11'h5a0;
    stim[4] = 11'h690;
    stim[5] = 11'h614;
    stim[6] = 11'h007;
    stim[7] = 11'h2ca;
    stim[8] = 11'h76d;
    stim[9] = 11'h4f6;
    stim[10] = 11'h22f;
    stim[11] = 11'h0ed;
    stim[12] = 11'h22b;
    stim[13] = 11'h035;
    stim[14] = 11'h64f;
    stim[15] = 11'h6fb;
    stim[16] = 11'h5bd;
    stim[17] = 11'h16d;
    stim[18] = 11'h434;
    stim[19] = 11'h02b;
    stim[20] = 11'h492;
    stim[21] = 11'h76c;
    stim[22] = 11'h0d4;
    stim[23] = 11'h39d;
    stim[24] = 11'h303;
    stim[25] = 11'h163;
    stim[26] = 11'h641;
    stim[27] = 11'h470;
    stim[28] = 11'h1c6;
    stim[29] = 11'h16f;
    stim[30] = 11'h47c;
    stim[31] = 11'h764;
    stim[32] = 11'h100;
    stim[33] = 11'h564;
    stim[34] = 11'h26f;
    stim[35] = 11'h72a;
    stim[36] = 11'h3ca;
    stim[37] = 11'h41d;
    stim[38] = 11'h085;
    stim[39] = 11'h5d6;
    stim[40] = 11'h28f;
    stim[41] = 11'h554;
    stim[42] = 11'h75d;
    stim[43] = 11'h7d7;
    stim[44] = 11'h1c0;
    stim[45] = 11'h5d6;
    stim[46] = 11'h514;
    stim[47] = 11'h47a;
    stim[48] = 11'h5d5;
    stim[49] = 11'h69b;
    stim[50] = 11'h5c4;
    stim[51] = 11'h17d;
    stim[52] = 11'h6cf;
    stim[53] = 11'h5b6;
    stim[54] = 11'h706;
    stim[55] = 11'h2fc;
    stim[56] = 11'h6e4;
    stim[57] = 11'h285;
    stim[58] = 11'h79a;
    stim[59] = 11'h43a;
    stim[60] = 11'h10d;
    stim[61] = 11'h2c6;
    stim[62] = 11'h685;
    stim[63] = 11'h1af;
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
      expv[0] = 5'h15;
      expv[1] = 5'h07;
      expv[2] = 5'h0e;
      expv[3] = 5'h14;
      expv[4] = 5'h16;
      expv[5] = 5'h07;
      expv[6] = 5'h0d;
      expv[7] = 5'h0c;
      expv[8] = 5'h15;
      expv[9] = 5'h16;
      expv[10] = 5'h18;
      expv[11] = 5'h18;
      expv[12] = 5'h1f;
      expv[13] = 5'h17;
      expv[14] = 5'h16;
      expv[15] = 5'h0a;
      expv[16] = 5'h1e;
      expv[17] = 5'h0b;
      expv[18] = 5'h1c;
      expv[19] = 5'h15;
      expv[20] = 5'h0b;
      expv[21] = 5'h0a;
      expv[22] = 5'h04;
      expv[23] = 5'h11;
      expv[24] = 5'h05;
      expv[25] = 5'h15;
      expv[26] = 5'h08;
      expv[27] = 5'h10;
      expv[28] = 5'h0a;
      expv[29] = 5'h1c;
      expv[30] = 5'h19;
      expv[31] = 5'h04;
      expv[32] = 5'h07;
      expv[33] = 5'h0e;
      expv[34] = 5'h13;
      expv[35] = 5'h11;
      expv[36] = 5'h09;
      expv[37] = 5'h1c;
      expv[38] = 5'h0c;
      expv[39] = 5'h02;
      expv[40] = 5'h1f;
      expv[41] = 5'h03;
      expv[42] = 5'h18;
      expv[43] = 5'h17;
      expv[44] = 5'h1a;
      expv[45] = 5'h02;
      expv[46] = 5'h08;
      expv[47] = 5'h09;
      expv[48] = 5'h0a;
      expv[49] = 5'h10;
      expv[50] = 5'h09;
      expv[51] = 5'h17;
      expv[52] = 5'h00;
      expv[53] = 5'h18;
      expv[54] = 5'h09;
      expv[55] = 5'h11;
      expv[56] = 5'h17;
      expv[57] = 5'h06;
      expv[58] = 5'h0a;
      expv[59] = 5'h02;
      expv[60] = 5'h11;
      expv[61] = 5'h05;
      expv[62] = 5'h12;
      expv[63] = 5'h01;
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
