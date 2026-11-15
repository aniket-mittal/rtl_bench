// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 16;
  localparam OW = 6;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_08616 dut (
    .clk(clk),
    .en_in(in_vec[15:15]),
    .process(in_vec[14:14]),
    .inc_dec(in_vec[13:13]),
    .inc(in_vec[12:12]),
    .dec(in_vec[11:11]),
    .enc_period_curr(in_vec[10:6]),
    .dir_last(in_vec[5:5]),
    .enc_period_last(in_vec[4:0]),
    .dir_this(out_vec[5:5]),
    .enc_period_this(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 16'he1f5;
    stim[1] = 16'h1309;
    stim[2] = 16'hac19;
    stim[3] = 16'h71fb;
    stim[4] = 16'h94ea;
    stim[5] = 16'h9297;
    stim[6] = 16'he462;
    stim[7] = 16'h3a7b;
    stim[8] = 16'h4166;
    stim[9] = 16'h6adf;
    stim[10] = 16'hdd9f;
    stim[11] = 16'h9b8f;
    stim[12] = 16'h438e;
    stim[13] = 16'h4005;
    stim[14] = 16'h2a08;
    stim[15] = 16'h6c89;
    stim[16] = 16'hfa19;
    stim[17] = 16'ha144;
    stim[18] = 16'h6069;
    stim[19] = 16'heb57;
    stim[20] = 16'hcb98;
    stim[21] = 16'hc060;
    stim[22] = 16'h625a;
    stim[23] = 16'h676d;
    stim[24] = 16'h380c;
    stim[25] = 16'h8cc4;
    stim[26] = 16'h5129;
    stim[27] = 16'h12e9;
    stim[28] = 16'h74b7;
    stim[29] = 16'h29fc;
    stim[30] = 16'h4f3b;
    stim[31] = 16'hebd2;
    stim[32] = 16'hd83b;
    stim[33] = 16'h8041;
    stim[34] = 16'hee26;
    stim[35] = 16'hfb04;
    stim[36] = 16'h0c79;
    stim[37] = 16'h68b4;
    stim[38] = 16'h6e2f;
    stim[39] = 16'hbcc8;
    stim[40] = 16'h1275;
    stim[41] = 16'he68c;
    stim[42] = 16'he113;
    stim[43] = 16'h0639;
    stim[44] = 16'h76bb;
    stim[45] = 16'h5f0b;
    stim[46] = 16'ha2ea;
    stim[47] = 16'h18fd;
    stim[48] = 16'h6189;
    stim[49] = 16'hada3;
    stim[50] = 16'h4bc0;
    stim[51] = 16'hcb58;
    stim[52] = 16'he639;
    stim[53] = 16'h954a;
    stim[54] = 16'h6065;
    stim[55] = 16'hb5f8;
    stim[56] = 16'hf7e9;
    stim[57] = 16'h860c;
    stim[58] = 16'hc4c2;
    stim[59] = 16'hc6e2;
    stim[60] = 16'hb440;
    stim[61] = 16'h434a;
    stim[62] = 16'h84e0;
    stim[63] = 16'h9f48;
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
      expv[0] = 6'h07;
      expv[1] = 6'h0c;
      expv[2] = 6'h30;
      expv[3] = 6'h07;
      expv[4] = 6'h33;
      expv[5] = 6'h17;
      expv[6] = 6'h11;
      expv[7] = 6'h29;
      expv[8] = 6'h26;
      expv[9] = 6'h2b;
      expv[10] = 6'h1f;
      expv[11] = 6'h0f;
      expv[12] = 6'h0e;
      expv[13] = 6'h05;
      expv[14] = 6'h28;
      expv[15] = 6'h32;
      expv[16] = 6'h28;
      expv[17] = 6'h05;
      expv[18] = 6'h01;
      expv[19] = 6'h2d;
      expv[20] = 6'h18;
      expv[21] = 6'h21;
      expv[22] = 6'h09;
      expv[23] = 6'h1d;
      expv[24] = 6'h20;
      expv[25] = 6'h13;
      expv[26] = 6'h29;
      expv[27] = 6'h2b;
      expv[28] = 6'h12;
      expv[29] = 6'h27;
      expv[30] = 6'h3c;
      expv[31] = 6'h2f;
      expv[32] = 6'h3b;
      expv[33] = 6'h01;
      expv[34] = 6'h38;
      expv[35] = 6'h2c;
      expv[36] = 6'h39;
      expv[37] = 6'h22;
      expv[38] = 6'h38;
      expv[39] = 6'h33;
      expv[40] = 6'h35;
      expv[41] = 6'h1a;
      expv[42] = 6'h04;
      expv[43] = 6'h39;
      expv[44] = 6'h1a;
      expv[45] = 6'h1c;
      expv[46] = 6'h0b;
      expv[47] = 6'h3d;
      expv[48] = 6'h06;
      expv[49] = 6'h36;
      expv[50] = 6'h0f;
      expv[51] = 6'h18;
      expv[52] = 6'h18;
      expv[53] = 6'h15;
      expv[54] = 6'h01;
      expv[55] = 6'h17;
      expv[56] = 6'h1f;
      expv[57] = 6'h18;
      expv[58] = 6'h13;
      expv[59] = 6'h3b;
      expv[60] = 6'h11;
      expv[61] = 6'h0d;
      expv[62] = 6'h33;
      expv[63] = 6'h1d;
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
