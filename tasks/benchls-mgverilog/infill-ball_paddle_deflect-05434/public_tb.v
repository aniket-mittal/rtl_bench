// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 20;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_05434 dut (
    .collide(clk),
    .ball_y(in_vec[19:10]),
    .paddle_y(in_vec[9:0]),
    .deflect(out_vec[9:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 20'h733eb;
    stim[1] = 20'h3b4e3;
    stim[2] = 20'h573b5;
    stim[3] = 20'h73718;
    stim[4] = 20'hee976;
    stim[5] = 20'h80694;
    stim[6] = 20'h4491a;
    stim[7] = 20'hf5f7d;
    stim[8] = 20'h2553e;
    stim[9] = 20'hcefa7;
    stim[10] = 20'h0b96e;
    stim[11] = 20'h446a3;
    stim[12] = 20'hb09c1;
    stim[13] = 20'h1a303;
    stim[14] = 20'hd70ea;
    stim[15] = 20'hc4a48;
    stim[16] = 20'h3b1ec;
    stim[17] = 20'h4e0e8;
    stim[18] = 20'h4c175;
    stim[19] = 20'h247b5;
    stim[20] = 20'h36494;
    stim[21] = 20'h6238d;
    stim[22] = 20'h4deca;
    stim[23] = 20'h8b45a;
    stim[24] = 20'h467c6;
    stim[25] = 20'h61045;
    stim[26] = 20'h6eab8;
    stim[27] = 20'h9ed8e;
    stim[28] = 20'h16292;
    stim[29] = 20'h36eec;
    stim[30] = 20'h85290;
    stim[31] = 20'h48e7d;
    stim[32] = 20'hd1483;
    stim[33] = 20'h454ed;
    stim[34] = 20'hc3ba1;
    stim[35] = 20'h81f65;
    stim[36] = 20'h6d1a8;
    stim[37] = 20'h644c6;
    stim[38] = 20'hf4544;
    stim[39] = 20'h01c3a;
    stim[40] = 20'h183bb;
    stim[41] = 20'h0a03e;
    stim[42] = 20'h1a6a4;
    stim[43] = 20'h0fed1;
    stim[44] = 20'h57e30;
    stim[45] = 20'hadff4;
    stim[46] = 20'h82fcb;
    stim[47] = 20'h4a8f3;
    stim[48] = 20'h7c50d;
    stim[49] = 20'h014ed;
    stim[50] = 20'h6244e;
    stim[51] = 20'hc7f3e;
    stim[52] = 20'h47bf8;
    stim[53] = 20'hb1a23;
    stim[54] = 20'hb8d7c;
    stim[55] = 20'hca868;
    stim[56] = 20'h8981c;
    stim[57] = 20'h732e8;
    stim[58] = 20'hc6d08;
    stim[59] = 20'h64708;
    stim[60] = 20'h82ea1;
    stim[61] = 20'h3af5a;
    stim[62] = 20'h2ddec;
    stim[63] = 20'h9c709;
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
      expv[0] = 10'hxxx;
      expv[1] = 10'h1e1;
      expv[2] = 10'h00a;
      expv[3] = 10'h1a7;
      expv[4] = 10'h34b;
      expv[5] = 10'h3bc;
      expv[6] = 10'h293;
      expv[7] = 10'h208;
      expv[8] = 10'h05a;
      expv[9] = 10'h2a9;
      expv[10] = 10'h26c;
      expv[11] = 10'h340;
      expv[12] = 10'h392;
      expv[13] = 10'h101;
      expv[14] = 10'h165;
      expv[15] = 10'h38e;
      expv[16] = 10'h0ca;
      expv[17] = 10'h300;
      expv[18] = 10'h050;
      expv[19] = 10'h245;
      expv[20] = 10'h0dc;
      expv[21] = 10'h045;
      expv[22] = 10'h1fb;
      expv[23] = 10'h393;
      expv[24] = 10'h1d3;
      expv[25] = 10'h153;
      expv[26] = 10'h13f;
      expv[27] = 10'h2fe;
      expv[28] = 10'h0ed;
      expv[29] = 10'h1c6;
      expv[30] = 10'h1ef;
      expv[31] = 10'h27c;
      expv[32] = 10'h35a;
      expv[33] = 10'h33e;
      expv[34] = 10'h028;
      expv[35] = 10'h293;
      expv[36] = 10'h35e;
      expv[37] = 10'h00c;
      expv[38] = 10'h0cb;
      expv[39] = 10'h373;
      expv[40] = 10'h233;
      expv[41] = 10'h0a5;
      expv[42] = 10'h216;
      expv[43] = 10'h1c5;
      expv[44] = 10'h16e;
      expv[45] = 10'h2d1;
      expv[46] = 10'h33d;
      expv[47] = 10'h3c0;
      expv[48] = 10'h037;
      expv[49] = 10'h0e4;
      expv[50] = 10'h2e8;
      expv[51] = 10'h13b;
      expv[52] = 10'h21f;
      expv[53] = 10'h126;
      expv[54] = 10'h0a3;
      expv[55] = 10'h167;
      expv[56] = 10'h33e;
      expv[57] = 10'h3f6;
      expv[58] = 10'h31c;
      expv[59] = 10'h3ed;
      expv[60] = 10'h377;
      expv[61] = 10'h296;
      expv[62] = 10'h191;
      expv[63] = 10'h335;
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
