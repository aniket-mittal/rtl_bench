// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_004959 dut (
    .a(in_vec[32:17]),
    .b(in_vec[16:1]),
    .cin(in_vec[0:0]),
    .sum(out_vec[16:1]),
    .cout(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h1051a6fa6;
    stim[1] = 33'h036fd78bc;
    stim[2] = 33'h016a27a92;
    stim[3] = 33'h05719df65;
    stim[4] = 33'h01351a406;
    stim[5] = 33'h1bda07554;
    stim[6] = 33'h118c45054;
    stim[7] = 33'h0199dc322;
    stim[8] = 33'h1b1405135;
    stim[9] = 33'h0d7ed0b6b;
    stim[10] = 33'h0165fc297;
    stim[11] = 33'h19532d06f;
    stim[12] = 33'h1c5093c32;
    stim[13] = 33'h0b3df40a7;
    stim[14] = 33'h0ffa56ab9;
    stim[15] = 33'h0e4d3c7de;
    stim[16] = 33'h03083ae26;
    stim[17] = 33'h061e4e120;
    stim[18] = 33'h1c66a9d48;
    stim[19] = 33'h0782449de;
    stim[20] = 33'h05e343cc0;
    stim[21] = 33'h034d2eb1c;
    stim[22] = 33'h098c713a0;
    stim[23] = 33'h16ae6ef6b;
    stim[24] = 33'h1fbcede62;
    stim[25] = 33'h1dbba672c;
    stim[26] = 33'h1b7ea3953;
    stim[27] = 33'h0a0311713;
    stim[28] = 33'h1c1fe45dd;
    stim[29] = 33'h0406aa687;
    stim[30] = 33'h140dd7186;
    stim[31] = 33'h12a15e286;
    stim[32] = 33'h1a4f09cee;
    stim[33] = 33'h0cbc8b770;
    stim[34] = 33'h1c0457b0c;
    stim[35] = 33'h1af3eec2e;
    stim[36] = 33'h031d97ed4;
    stim[37] = 33'h077752fe6;
    stim[38] = 33'h13f49c4fd;
    stim[39] = 33'h0be5909ba;
    stim[40] = 33'h16856fbc4;
    stim[41] = 33'h0ddab97ac;
    stim[42] = 33'h0ead67649;
    stim[43] = 33'h09943e429;
    stim[44] = 33'h109e829fe;
    stim[45] = 33'h1c0afceb2;
    stim[46] = 33'h07668f5e1;
    stim[47] = 33'h1b9fb4665;
    stim[48] = 33'h14fa77af6;
    stim[49] = 33'h168edf384;
    stim[50] = 33'h192cfa753;
    stim[51] = 33'h01bd64939;
    stim[52] = 33'h12296cbaa;
    stim[53] = 33'h1a4c8a5fd;
    stim[54] = 33'h1090743d7;
    stim[55] = 33'h044e7d3fe;
    stim[56] = 33'h175d01aed;
    stim[57] = 33'h11612ca77;
    stim[58] = 33'h0da235adf;
    stim[59] = 33'h0d224bfcd;
    stim[60] = 33'h06a2bbf71;
    stim[61] = 33'h12378e3f1;
    stim[62] = 33'h0a70e82ae;
    stim[63] = 33'h05198c384;
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
      expv[0] = 17'h174c0;
      expv[1] = 17'h1afb8;
      expv[2] = 17'h09134;
      expv[3] = 17'h0367f;
      expv[4] = 17'h1b756;
      expv[5] = 17'h032f5;
      expv[6] = 17'h16918;
      expv[7] = 17'h1dcbe;
      expv[8] = 17'h00277;
      expv[9] = 17'h1e358;
      expv[10] = 17'h1d8f6;
      expv[11] = 17'h065a3;
      expv[12] = 17'h1013b;
      expv[13] = 17'h1f486;
      expv[14] = 17'h06a5f;
      expv[15] = 17'h0acb1;
      expv[16] = 17'h1dea8;
      expv[17] = 17'h14304;
      expv[18] = 17'h063b3;
      expv[19] = 17'h0c202;
      expv[20] = 17'h09af4;
      expv[21] = 17'h11fee;
      expv[22] = 17'h1ac66;
      expv[23] = 17'h05a53;
      expv[24] = 17'h0da31;
      expv[25] = 17'h042e7;
      expv[26] = 17'h1f13e;
      expv[27] = 17'h1b744;
      expv[28] = 17'h007dd;
      expv[29] = 17'h0e6f2;
      expv[30] = 17'h0b263;
      expv[31] = 17'h10c9b;
      expv[32] = 17'h041df;
      expv[33] = 17'h18338;
      expv[34] = 17'h13b51;
      expv[35] = 17'h09b6d;
      expv[36] = 17'h1b0ac;
      expv[37] = 17'h1a75a;
      expv[38] = 17'h10447;
      expv[39] = 17'h1c812;
      expv[40] = 17'h0641b;
      expv[41] = 17'h07557;
      expv[42] = 17'h16120;
      expv[43] = 17'h07d6d;
      expv[44] = 17'h133e6;
      expv[45] = 17'h18f61;
      expv[46] = 17'h16c4a;
      expv[47] = 17'h10061;
      expv[48] = 17'h0ca9d;
      expv[49] = 17'h15c71;
      expv[50] = 17'h13a23;
      expv[51] = 17'h06510;
      expv[52] = 17'h1ee40;
      expv[53] = 17'h04ac7;
      expv[54] = 17'h04cdf;
      expv[55] = 17'h018e5;
      expv[56] = 17'h190be;
      expv[57] = 17'h1e08a;
      expv[58] = 17'h03503;
      expv[59] = 17'h191f2;
      expv[60] = 17'h0299d;
      expv[61] = 17'h0076b;
      expv[62] = 17'h129bc;
      expv[63] = 17'h1151c;
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
