// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_097234 dut (
    .clk(clk),
    .rstn(in_vec[32:32]),
    .instr(in_vec[31:0]),
    .led(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h09fa8b572;
    stim[1] = 33'h02b7e629d;
    stim[2] = 33'h1f6bd89ee;
    stim[3] = 33'h19e2f2d67;
    stim[4] = 33'h124f2b3f9;
    stim[5] = 33'h14e1df541;
    stim[6] = 33'h12d61e615;
    stim[7] = 33'h1b7c54c80;
    stim[8] = 33'h10946f0ac;
    stim[9] = 33'h17d689ee1;
    stim[10] = 33'h1503e5203;
    stim[11] = 33'h167b3fd6c;
    stim[12] = 33'h10c2d2e32;
    stim[13] = 33'h1c20fcaa8;
    stim[14] = 33'h1e0527227;
    stim[15] = 33'h16be1de98;
    stim[16] = 33'h1e132031b;
    stim[17] = 33'h16f2be237;
    stim[18] = 33'h1ec56ae69;
    stim[19] = 33'h1fc6b8ff9;
    stim[20] = 33'h16ce13795;
    stim[21] = 33'h1a3cf7b52;
    stim[22] = 33'h13621ddea;
    stim[23] = 33'h15e953ad5;
    stim[24] = 33'h15825b2da;
    stim[25] = 33'h1d2796333;
    stim[26] = 33'h11c4cead1;
    stim[27] = 33'h1fc9ef936;
    stim[28] = 33'h1d3c04096;
    stim[29] = 33'h10ff53703;
    stim[30] = 33'h1dc40415a;
    stim[31] = 33'h1abe3a738;
    stim[32] = 33'h1d96b2e4f;
    stim[33] = 33'h1ec45a596;
    stim[34] = 33'h149277b19;
    stim[35] = 33'h17ce794fb;
    stim[36] = 33'h129677cd8;
    stim[37] = 33'h1d3644124;
    stim[38] = 33'h1e7d11101;
    stim[39] = 33'h1de106355;
    stim[40] = 33'h1cdfeb4d0;
    stim[41] = 33'h1ce7e5877;
    stim[42] = 33'h1d0574603;
    stim[43] = 33'h1980c0343;
    stim[44] = 33'h1eea997b1;
    stim[45] = 33'h1ff8d8358;
    stim[46] = 33'h1783c0676;
    stim[47] = 33'h10a7ebbd0;
    stim[48] = 33'h11be8abf7;
    stim[49] = 33'h1abf5e086;
    stim[50] = 33'h15faa8453;
    stim[51] = 33'h194743112;
    stim[52] = 33'h102a4a47d;
    stim[53] = 33'h1ab102a74;
    stim[54] = 33'h1f1c4ba8a;
    stim[55] = 33'h1c8b0cd15;
    stim[56] = 33'h1b1cbfe8b;
    stim[57] = 33'h15444b38f;
    stim[58] = 33'h16b0344ee;
    stim[59] = 33'h180c79908;
    stim[60] = 33'h109d98abe;
    stim[61] = 33'h123de3aeb;
    stim[62] = 33'h11e2e87c2;
    stim[63] = 33'h1f7e40ac9;
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
      expv[0] = 8'hxx;
      expv[1] = 8'h00;
      expv[2] = 8'h00;
      expv[3] = 8'h00;
      expv[4] = 8'h00;
      expv[5] = 8'h5a;
      expv[6] = 8'h5a;
      expv[7] = 8'h5a;
      expv[8] = 8'h26;
      expv[9] = 8'h26;
      expv[10] = 8'h26;
      expv[11] = 8'h14;
      expv[12] = 8'h14;
      expv[13] = 8'h14;
      expv[14] = 8'hbd;
      expv[15] = 8'hbd;
      expv[16] = 8'hbd;
      expv[17] = 8'h70;
      expv[18] = 8'h70;
      expv[19] = 8'h70;
      expv[20] = 8'h3c;
      expv[21] = 8'h3c;
      expv[22] = 8'h3c;
      expv[23] = 8'h9e;
      expv[24] = 8'h9e;
      expv[25] = 8'h9e;
      expv[26] = 8'h3c;
      expv[27] = 8'h3c;
      expv[28] = 8'h3c;
      expv[29] = 8'h6c;
      expv[30] = 8'h6c;
      expv[31] = 8'h6c;
      expv[32] = 8'hce;
      expv[33] = 8'hce;
      expv[34] = 8'hce;
      expv[35] = 8'h5c;
      expv[36] = 8'h5c;
      expv[37] = 8'h5c;
      expv[38] = 8'h26;
      expv[39] = 8'h26;
      expv[40] = 8'h26;
      expv[41] = 8'h82;
      expv[42] = 8'h82;
      expv[43] = 8'h82;
      expv[44] = 8'h7f;
      expv[45] = 8'h7f;
      expv[46] = 8'h7f;
      expv[47] = 8'hb8;
      expv[48] = 8'hb8;
      expv[49] = 8'hb8;
      expv[50] = 8'h31;
      expv[51] = 8'h31;
      expv[52] = 8'h31;
      expv[53] = 8'h53;
      expv[54] = 8'h53;
      expv[55] = 8'h53;
      expv[56] = 8'h41;
      expv[57] = 8'h41;
      expv[58] = 8'h41;
      expv[59] = 8'hd8;
      expv[60] = 8'hd8;
      expv[61] = 8'hd8;
      expv[62] = 8'hfb;
      expv[63] = 8'hfb;
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
