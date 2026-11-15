// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 35;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_03240 dut (
    .in7(in_vec[34:31]),
    .in6(in_vec[30:27]),
    .in5(in_vec[26:23]),
    .in4(in_vec[22:19]),
    .in3(in_vec[18:15]),
    .in2(in_vec[14:11]),
    .in1(in_vec[10:7]),
    .in0(in_vec[6:3]),
    .select(in_vec[2:0]),
    .out(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 35'h6c729aa15;
    stim[1] = 35'h17785d2b6;
    stim[2] = 35'h4b1245897;
    stim[3] = 35'h1895faa98;
    stim[4] = 35'h7b84d2031;
    stim[5] = 35'h1b4516ebe;
    stim[6] = 35'h31ec63817;
    stim[7] = 35'h485909f23;
    stim[8] = 35'h72c31bf4e;
    stim[9] = 35'h5a21aae5d;
    stim[10] = 35'h7539336b3;
    stim[11] = 35'h416cbccb4;
    stim[12] = 35'h2df7af587;
    stim[13] = 35'h493c75d9d;
    stim[14] = 35'h3ed9ec6d6;
    stim[15] = 35'h41e73787e;
    stim[16] = 35'h3a16ed673;
    stim[17] = 35'h7ed06310d;
    stim[18] = 35'h0a95e3243;
    stim[19] = 35'h75e866aaf;
    stim[20] = 35'h292403cfa;
    stim[21] = 35'h0d88fc480;
    stim[22] = 35'h323b3e61e;
    stim[23] = 35'h7e04ea56f;
    stim[24] = 35'h2449ddf6c;
    stim[25] = 35'h734bd719b;
    stim[26] = 35'h60f367139;
    stim[27] = 35'h1eb00bbcc;
    stim[28] = 35'h0d3a78ab5;
    stim[29] = 35'h4515bb776;
    stim[30] = 35'h33524a5ec;
    stim[31] = 35'h1c04f8d84;
    stim[32] = 35'h1bc7261f3;
    stim[33] = 35'h77c87dd78;
    stim[34] = 35'h029275f54;
    stim[35] = 35'h3e9309b4b;
    stim[36] = 35'h1ee0bbf83;
    stim[37] = 35'h212bb9092;
    stim[38] = 35'h4de067580;
    stim[39] = 35'h6d6106ef7;
    stim[40] = 35'h3edc4ff33;
    stim[41] = 35'h205644592;
    stim[42] = 35'h2dcdeca9f;
    stim[43] = 35'h4aa2c037f;
    stim[44] = 35'h137a04794;
    stim[45] = 35'h567eeec3f;
    stim[46] = 35'h6fc028cb0;
    stim[47] = 35'h4be9e1813;
    stim[48] = 35'h589a027c6;
    stim[49] = 35'h66184ff92;
    stim[50] = 35'h74e0892c0;
    stim[51] = 35'h76aa0aad8;
    stim[52] = 35'h3f0e9925b;
    stim[53] = 35'h3e609e987;
    stim[54] = 35'h687d4be94;
    stim[55] = 35'h3b507288c;
    stim[56] = 35'h408b49368;
    stim[57] = 35'h1b3251e3b;
    stim[58] = 35'h5c7c71c20;
    stim[59] = 35'h233b36ff5;
    stim[60] = 35'h0109dfe4f;
    stim[61] = 35'h4da091f99;
    stim[62] = 35'h59536d2c3;
    stim[63] = 35'h546c97428;
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
      expv[0] = 4'he;
      expv[1] = 4'he;
      expv[2] = 4'h9;
      expv[3] = 4'h3;
      expv[4] = 4'h0;
      expv[5] = 4'h6;
      expv[6] = 4'h6;
      expv[7] = 4'h1;
      expv[8] = 4'h5;
      expv[9] = 4'h4;
      expv[10] = 4'h6;
      expv[11] = 4'h9;
      expv[12] = 4'h5;
      expv[13] = 4'h7;
      expv[14] = 4'hd;
      expv[15] = 4'h3;
      expv[16] = 4'hd;
      expv[17] = 4'ha;
      expv[18] = 4'hc;
      expv[19] = 4'he;
      expv[20] = 4'h7;
      expv[21] = 4'h0;
      expv[22] = 4'h4;
      expv[23] = 4'hf;
      expv[24] = 4'h3;
      expv[25] = 4'ha;
      expv[26] = 4'h2;
      expv[27] = 4'h0;
      expv[28] = 4'h7;
      expv[29] = 4'ha;
      expv[30] = 4'h4;
      expv[31] = 4'h9;
      expv[32] = 4'h4;
      expv[33] = 4'hf;
      expv[34] = 4'h4;
      expv[35] = 4'h1;
      expv[36] = 4'h7;
      expv[37] = 4'h2;
      expv[38] = 4'h0;
      expv[39] = 4'hd;
      expv[40] = 4'h9;
      expv[41] = 4'h8;
      expv[42] = 4'h5;
      expv[43] = 4'h9;
      expv[44] = 4'h4;
      expv[45] = 4'ha;
      expv[46] = 4'h6;
      expv[47] = 4'hc;
      expv[48] = 4'h1;
      expv[49] = 4'hf;
      expv[50] = 4'h8;
      expv[51] = 4'hb;
      expv[52] = 4'h3;
      expv[53] = 4'h7;
      expv[54] = 4'ha;
      expv[55] = 4'h0;
      expv[56] = 4'hd;
      expv[57] = 4'ha;
      expv[58] = 4'h4;
      expv[59] = 4'h7;
      expv[60] = 4'h0;
      expv[61] = 4'hf;
      expv[62] = 4'hd;
      expv[63] = 4'h5;
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
