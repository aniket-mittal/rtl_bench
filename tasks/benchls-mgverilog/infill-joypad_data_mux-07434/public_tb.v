// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 27;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_07434 dut (
    .nCTRL1_ZONE(in_vec[26:26]),
    .nCTRL2_ZONE(in_vec[25:25]),
    .nSTATUSB_ZONE(in_vec[24:24]),
    .P1_IN(in_vec[23:14]),
    .P2_IN(in_vec[13:4]),
    .nWP(in_vec[3:3]),
    .nCD2(in_vec[2:2]),
    .nCD1(in_vec[1:1]),
    .SYSTEM_MODE(in_vec[0:0]),
    .M68K_DATA(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 27'h235c2ea;
    stim[1] = 27'h7eae483;
    stim[2] = 27'h5119502;
    stim[3] = 27'h7b00f3f;
    stim[4] = 27'h37f3e8f;
    stim[5] = 27'h15c6756;
    stim[6] = 27'h0fb6c9b;
    stim[7] = 27'h44d28ba;
    stim[8] = 27'h79e3f8b;
    stim[9] = 27'h4aac49b;
    stim[10] = 27'h4cf5c1c;
    stim[11] = 27'h0b29c59;
    stim[12] = 27'h0b28990;
    stim[13] = 27'h20805bc;
    stim[14] = 27'h063f54e;
    stim[15] = 27'h7074409;
    stim[16] = 27'h3382b0f;
    stim[17] = 27'h5ae578f;
    stim[18] = 27'h785ec73;
    stim[19] = 27'h223e073;
    stim[20] = 27'h0be1ed0;
    stim[21] = 27'h7dd974e;
    stim[22] = 27'h3c11775;
    stim[23] = 27'h087ac80;
    stim[24] = 27'h69e60ee;
    stim[25] = 27'h49623fb;
    stim[26] = 27'h2c7bb31;
    stim[27] = 27'h73ed4bb;
    stim[28] = 27'h3bce657;
    stim[29] = 27'h25c0806;
    stim[30] = 27'h2f53e04;
    stim[31] = 27'h140c449;
    stim[32] = 27'h56703f2;
    stim[33] = 27'h10e35cd;
    stim[34] = 27'h19633ff;
    stim[35] = 27'h0ac87a3;
    stim[36] = 27'h04f5eb6;
    stim[37] = 27'h2555efd;
    stim[38] = 27'h4c346d6;
    stim[39] = 27'h729187d;
    stim[40] = 27'h0dccac5;
    stim[41] = 27'h72b3d39;
    stim[42] = 27'h2a78122;
    stim[43] = 27'h5f455ba;
    stim[44] = 27'h63699ac;
    stim[45] = 27'h0177882;
    stim[46] = 27'h7559e8a;
    stim[47] = 27'h1bc2081;
    stim[48] = 27'h026fbae;
    stim[49] = 27'h39692c5;
    stim[50] = 27'h7a51c7e;
    stim[51] = 27'h011f946;
    stim[52] = 27'h39ff53e;
    stim[53] = 27'h3ae6d39;
    stim[54] = 27'h206d3e5;
    stim[55] = 27'h2833345;
    stim[56] = 27'h380e3e2;
    stim[57] = 27'h2893f53;
    stim[58] = 27'h4bc3588;
    stim[59] = 27'h269350e;
    stim[60] = 27'h743d524;
    stim[61] = 27'h66439eb;
    stim[62] = 27'h3018a70;
    stim[63] = 27'h4b7ab8b;
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
      expv[0] = 8'hxx;
      expv[1] = 8'hxx;
      expv[2] = 8'h50;
      expv[3] = 8'hxx;
      expv[4] = 8'hfc;
      expv[5] = 8'h7x;
      expv[6] = 8'hxx;
      expv[7] = 8'hxx;
      expv[8] = 8'hxx;
      expv[9] = 8'hxx;
      expv[10] = 8'hxx;
      expv[11] = 8'hcx;
      expv[12] = 8'hxx;
      expv[13] = 8'hx0;
      expv[14] = 8'hxx;
      expv[15] = 8'hxx;
      expv[16] = 8'he0;
      expv[17] = 8'h78;
      expv[18] = 8'hxx;
      expv[19] = 8'hxx;
      expv[20] = 8'hxx;
      expv[21] = 8'hxx;
      expv[22] = 8'h04;
      expv[23] = 8'hxx;
      expv[24] = 8'h7a;
      expv[25] = 8'hxx;
      expv[26] = 8'hxx;
      expv[27] = 8'hxx;
      expv[28] = 8'hf3;
      expv[29] = 8'hxx;
      expv[30] = 8'hxx;
      expv[31] = 8'hxx;
      expv[32] = 8'h3f;
      expv[33] = 8'hxx;
      expv[34] = 8'hxx;
      expv[35] = 8'hxx;
      expv[36] = 8'hxx;
      expv[37] = 8'hx5;
      expv[38] = 8'hxx;
      expv[39] = 8'hxx;
      expv[40] = 8'hxx;
      expv[41] = 8'hxx;
      expv[42] = 8'hxx;
      expv[43] = 8'h5b;
      expv[44] = 8'h64;
      expv[45] = 8'hxx;
      expv[46] = 8'hxx;
      expv[47] = 8'hxx;
      expv[48] = 8'hxx;
      expv[49] = 8'h5a;
      expv[50] = 8'hxx;
      expv[51] = 8'hxx;
      expv[52] = 8'h7f;
      expv[53] = 8'hb9;
      expv[54] = 8'hxx;
      expv[55] = 8'hxx;
      expv[56] = 8'h03;
      expv[57] = 8'hxx;
      expv[58] = 8'hxx;
      expv[59] = 8'hxx;
      expv[60] = 8'hxx;
      expv[61] = 8'hdd;
      expv[62] = 8'h06;
      expv[63] = 8'hxx;
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
