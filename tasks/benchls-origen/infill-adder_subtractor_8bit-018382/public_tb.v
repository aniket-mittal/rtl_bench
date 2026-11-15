// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 18;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_018382 dut (
    .A(in_vec[17:10]),
    .B(in_vec[9:2]),
    .Comin(in_vec[1:1]),
    .Cin(in_vec[0:0]),
    .S(out_vec[9:1]),
    .comover(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 18'h0ec59;
    stim[1] = 18'h27b87;
    stim[2] = 18'h1c66a;
    stim[3] = 18'h29d93;
    stim[4] = 18'h37fba;
    stim[5] = 18'h38e9b;
    stim[6] = 18'h12450;
    stim[7] = 18'h28538;
    stim[8] = 18'h11486;
    stim[9] = 18'h34c12;
    stim[10] = 18'h17c9f;
    stim[11] = 18'h1ff93;
    stim[12] = 18'h3dd0b;
    stim[13] = 18'h3acd7;
    stim[14] = 18'h33f7e;
    stim[15] = 18'h0766b;
    stim[16] = 18'h395d3;
    stim[17] = 18'h12524;
    stim[18] = 18'h2043b;
    stim[19] = 18'h2a9ee;
    stim[20] = 18'h2f709;
    stim[21] = 18'h11d1e;
    stim[22] = 18'h2525f;
    stim[23] = 18'h20d31;
    stim[24] = 18'h1f9ce;
    stim[25] = 18'h3cd9f;
    stim[26] = 18'h08cbf;
    stim[27] = 18'h2b20d;
    stim[28] = 18'h2b01b;
    stim[29] = 18'h3afdc;
    stim[30] = 18'h10ed2;
    stim[31] = 18'h0e819;
    stim[32] = 18'h3bfa4;
    stim[33] = 18'h3d360;
    stim[34] = 18'h03889;
    stim[35] = 18'h05ac7;
    stim[36] = 18'h02856;
    stim[37] = 18'h3975b;
    stim[38] = 18'h0cb94;
    stim[39] = 18'h2c2f0;
    stim[40] = 18'h31511;
    stim[41] = 18'h3de6a;
    stim[42] = 18'h34525;
    stim[43] = 18'h0d8d6;
    stim[44] = 18'h3a993;
    stim[45] = 18'h1a20b;
    stim[46] = 18'h024e1;
    stim[47] = 18'h0cd1c;
    stim[48] = 18'h2aaa1;
    stim[49] = 18'h04ead;
    stim[50] = 18'h0b173;
    stim[51] = 18'h0c45a;
    stim[52] = 18'h31756;
    stim[53] = 18'h3f4d9;
    stim[54] = 18'h2d71e;
    stim[55] = 18'h046f3;
    stim[56] = 18'h0876c;
    stim[57] = 18'h0abc1;
    stim[58] = 18'h27d8c;
    stim[59] = 18'h157b0;
    stim[60] = 18'h01d02;
    stim[61] = 18'h0b6db;
    stim[62] = 18'h10a4b;
    stim[63] = 18'h1159b;
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
      expv[0] = 10'h04d;
      expv[1] = 10'h17b;
      expv[2] = 10'h3ac;
      expv[3] = 10'h287;
      expv[4] = 10'h1e1;
      expv[5] = 10'h27b;
      expv[6] = 10'h06b;
      expv[7] = 10'h2a7;
      expv[8] = 10'h047;
      expv[9] = 10'h39d;
      expv[10] = 10'h071;
      expv[11] = 10'h336;
      expv[12] = 10'h36b;
      expv[13] = 10'h36d;
      expv[14] = 10'h1df;
      expv[15] = 10'h306;
      expv[16] = 10'h2e3;
      expv[17] = 10'h001;
      expv[18] = 10'h2e7;
      expv[19] = 10'h25d;
      expv[20] = 10'h1f9;
      expv[21] = 10'h3fe;
      expv[22] = 10'h1fb;
      expv[23] = 10'h271;
      expv[24] = 10'h015;
      expv[25] = 10'h319;
      expv[26] = 10'h3e8;
      expv[27] = 10'h255;
      expv[28] = 10'h34d;
      expv[29] = 10'h1e9;
      expv[30] = 10'h31c;
      expv[31] = 10'h06b;
      expv[32] = 10'h20d;
      expv[33] = 10'h239;
      expv[34] = 10'h3da;
      expv[35] = 10'h2ca;
      expv[36] = 10'h3e8;
      expv[37] = 10'h21f;
      expv[38] = 10'h29a;
      expv[39] = 10'h1e9;
      expv[40] = 10'h305;
      expv[41] = 10'h2b9;
      expv[42] = 10'h313;
      expv[43] = 10'h001;
      expv[44] = 10'h30d;
      expv[45] = 10'h3cc;
      expv[46] = 10'h3a4;
      expv[47] = 10'h3d8;
      expv[48] = 10'h207;
      expv[49] = 10'h2d2;
      expv[50] = 10'h3a0;
      expv[51] = 10'h035;
      expv[52] = 10'h1df;
      expv[53] = 10'h391;
      expv[54] = 10'h1db;
      expv[55] = 10'h2aa;
      expv[56] = 10'h28c;
      expv[57] = 10'h276;
      expv[58] = 10'h279;
      expv[59] = 10'h2d2;
      expv[60] = 10'h38c;
      expv[61] = 10'h2ee;
      expv[62] = 10'h360;
      expv[63] = 10'h3be;
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
