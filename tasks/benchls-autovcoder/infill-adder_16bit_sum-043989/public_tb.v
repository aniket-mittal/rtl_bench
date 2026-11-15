// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 34;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_043989 dut (
    .i_c0(in_vec[33:33]),
    .i_pk(in_vec[32:17]),
    .i_gk(in_vec[16:1]),
    .i_p_addn(in_vec[0:0]),
    .o_s(out_vec[16:1]),
    .o_carry(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 34'h2d4a1b772;
    stim[1] = 34'h1dec25804;
    stim[2] = 34'h012a9b9a4;
    stim[3] = 34'h32c3b9b62;
    stim[4] = 34'h1a9bbfc05;
    stim[5] = 34'h04d28b0a9;
    stim[6] = 34'h2ded199f3;
    stim[7] = 34'h1bf7ce118;
    stim[8] = 34'h11369a06b;
    stim[9] = 34'h2d9d4d289;
    stim[10] = 34'h119eb8b71;
    stim[11] = 34'h165f183fd;
    stim[12] = 34'h37ad2f84d;
    stim[13] = 34'h1f5c1c893;
    stim[14] = 34'h323fb704f;
    stim[15] = 34'h0bfdb844d;
    stim[16] = 34'h36d692eed;
    stim[17] = 34'h2a5f78022;
    stim[18] = 34'h1bd93087b;
    stim[19] = 34'h0f98e68da;
    stim[20] = 34'h1b8d7b193;
    stim[21] = 34'h0aeda0d13;
    stim[22] = 34'h1e457b084;
    stim[23] = 34'h377da95ca;
    stim[24] = 34'h005ea7189;
    stim[25] = 34'h20ea00a76;
    stim[26] = 34'h2c1132f57;
    stim[27] = 34'h08f009240;
    stim[28] = 34'h37898f658;
    stim[29] = 34'h045771ece;
    stim[30] = 34'h27fe2047b;
    stim[31] = 34'h28bce5d0d;
    stim[32] = 34'h252ce7fcb;
    stim[33] = 34'h001941370;
    stim[34] = 34'h2580560c8;
    stim[35] = 34'h003a587fd;
    stim[36] = 34'h154ea4a5f;
    stim[37] = 34'h05f6a5464;
    stim[38] = 34'h397e37463;
    stim[39] = 34'h3c35305e3;
    stim[40] = 34'h14fb81e6c;
    stim[41] = 34'h007e4f7fa;
    stim[42] = 34'h383bfb82f;
    stim[43] = 34'h077057988;
    stim[44] = 34'h02de28d27;
    stim[45] = 34'h1ec6aca94;
    stim[46] = 34'h3b8b812bc;
    stim[47] = 34'h1596413b9;
    stim[48] = 34'h3e5655507;
    stim[49] = 34'h11fe5c29a;
    stim[50] = 34'h0e5a7b29e;
    stim[51] = 34'h322904198;
    stim[52] = 34'h3d5236c1d;
    stim[53] = 34'h22da16cd2;
    stim[54] = 34'h2658ab830;
    stim[55] = 34'h2028dcfcb;
    stim[56] = 34'h35ba25ab6;
    stim[57] = 34'h2f176c524;
    stim[58] = 34'h0deddee0d;
    stim[59] = 34'h3c75554c8;
    stim[60] = 34'h14c52af5c;
    stim[61] = 34'h3451364d2;
    stim[62] = 34'h16365b71a;
    stim[63] = 34'h1d736b38c;
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
      expv[0] = 17'h1ba47;
      expv[1] = 17'h16eca;
      expv[2] = 17'h161e1;
      expv[3] = 17'h01afd;
      expv[4] = 17'h051b3;
      expv[5] = 17'h12c78;
      expv[6] = 17'h1ed37;
      expv[7] = 17'h07d4c;
      expv[8] = 17'h053bd;
      expv[9] = 17'h17cc7;
      expv[10] = 17'h00f0b;
      expv[11] = 17'h06209;
      expv[12] = 17'h08a49;
      expv[13] = 17'h064e5;
      expv[14] = 17'h1c365;
      expv[15] = 17'h1b743;
      expv[16] = 17'h130b3;
      expv[17] = 17'h1a5b1;
      expv[18] = 17'h1ad67;
      expv[19] = 17'h0283a;
      expv[20] = 17'h0dbf3;
      expv[21] = 17'h0b4fe;
      expv[22] = 17'h0855f;
      expv[23] = 17'h05c4c;
      expv[24] = 17'h0e6fa;
      expv[25] = 17'h01a4e;
      expv[26] = 17'h09fbd;
      expv[27] = 17'h1ab80;
      expv[28] = 17'h0942a;
      expv[29] = 17'h078eb;
      expv[30] = 17'h07715;
      expv[31] = 17'h031d5;
      expv[32] = 17'h0ad59;
      expv[33] = 17'h02774;
      expv[34] = 17'h09997;
      expv[35] = 17'h10c5d;
      expv[36] = 17'h1c056;
      expv[37] = 17'h0f7a2;
      expv[38] = 17'h17f25;
      expv[39] = 17'h1c895;
      expv[40] = 17'h17360;
      expv[41] = 17'h1e810;
      expv[42] = 17'h0f3e1;
      expv[43] = 17'h08415;
      expv[44] = 17'h137ae;
      expv[45] = 17'h07942;
      expv[46] = 17'h19dc2;
      expv[47] = 17'h17e14;
      expv[48] = 17'h14f6b;
      expv[49] = 17'h09ad1;
      expv[50] = 17'h1809b;
      expv[51] = 17'h1a1a2;
      expv[52] = 17'h10d19;
      expv[53] = 17'h0f407;
      expv[54] = 17'h115e8;
      expv[55] = 17'h19d1b;
      expv[56] = 17'h1eecc;
      expv[57] = 17'h17b3c;
      expv[58] = 17'h102c5;
      expv[59] = 17'h16ec7;
      expv[60] = 17'h012ea;
      expv[61] = 17'h18cb5;
      expv[62] = 17'h00d51;
      expv[63] = 17'h0b02e;
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
