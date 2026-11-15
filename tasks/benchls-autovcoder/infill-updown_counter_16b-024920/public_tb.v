// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 20;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_024920 dut (
    .sys_clk(clk),
    .sys_rst(in_vec[19:19]),
    .dir(in_vec[18:18]),
    .load(in_vec[17:17]),
    .en(in_vec[16:16]),
    .din(in_vec[15:0]),
    .dout(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 20'h9305d;
    stim[1] = 20'h95369;
    stim[2] = 20'h65fbf;
    stim[3] = 20'h06e0d;
    stim[4] = 20'h4995e;
    stim[5] = 20'h210a0;
    stim[6] = 20'h63c59;
    stim[7] = 20'h7bd72;
    stim[8] = 20'h118a0;
    stim[9] = 20'h53acc;
    stim[10] = 20'h0d346;
    stim[11] = 20'h14170;
    stim[12] = 20'h0f3ca;
    stim[13] = 20'h7bbbd;
    stim[14] = 20'h05436;
    stim[15] = 20'h078f1;
    stim[16] = 20'h4dc45;
    stim[17] = 20'h22187;
    stim[18] = 20'h1201d;
    stim[19] = 20'h546c3;
    stim[20] = 20'h0dc96;
    stim[21] = 20'h0fccb;
    stim[22] = 20'h2a149;
    stim[23] = 20'h30598;
    stim[24] = 20'h71321;
    stim[25] = 20'h7f89c;
    stim[26] = 20'h6ad8a;
    stim[27] = 20'h43e94;
    stim[28] = 20'h5323c;
    stim[29] = 20'h23082;
    stim[30] = 20'h757f0;
    stim[31] = 20'h731cd;
    stim[32] = 20'h0cfa0;
    stim[33] = 20'h345e8;
    stim[34] = 20'h7a1ec;
    stim[35] = 20'h55e92;
    stim[36] = 20'h1ceec;
    stim[37] = 20'h5c9d2;
    stim[38] = 20'h385e7;
    stim[39] = 20'h4aa88;
    stim[40] = 20'h3218b;
    stim[41] = 20'h4f4ad;
    stim[42] = 20'h1f5b2;
    stim[43] = 20'h19dd5;
    stim[44] = 20'h18a18;
    stim[45] = 20'h5107c;
    stim[46] = 20'h5396d;
    stim[47] = 20'h6c63c;
    stim[48] = 20'h75ffc;
    stim[49] = 20'h2066f;
    stim[50] = 20'h49e24;
    stim[51] = 20'h64097;
    stim[52] = 20'h6c946;
    stim[53] = 20'h2aca5;
    stim[54] = 20'h0dd4c;
    stim[55] = 20'h12f6c;
    stim[56] = 20'h26820;
    stim[57] = 20'h11ff3;
    stim[58] = 20'h5cf18;
    stim[59] = 20'h714a1;
    stim[60] = 20'h58446;
    stim[61] = 20'h106ce;
    stim[62] = 20'h5dfa5;
    stim[63] = 20'h15c08;
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
      expv[0] = 16'h0000;
      expv[1] = 16'h0000;
      expv[2] = 16'h0000;
      expv[3] = 16'h0000;
      expv[4] = 16'h0000;
      expv[5] = 16'h0000;
      expv[6] = 16'h0000;
      expv[7] = 16'h0000;
      expv[8] = 16'hbd72;
      expv[9] = 16'hbd6e;
      expv[10] = 16'hbd72;
      expv[11] = 16'hbd72;
      expv[12] = 16'hbd6e;
      expv[13] = 16'hbd6e;
      expv[14] = 16'hbbbd;
      expv[15] = 16'hbbbd;
      expv[16] = 16'hbbbd;
      expv[17] = 16'hbbbd;
      expv[18] = 16'hbbbd;
      expv[19] = 16'hbbb9;
      expv[20] = 16'hbbbd;
      expv[21] = 16'hbbbd;
      expv[22] = 16'hbbbd;
      expv[23] = 16'hbbbd;
      expv[24] = 16'h0598;
      expv[25] = 16'h1321;
      expv[26] = 16'hf89c;
      expv[27] = 16'hf89c;
      expv[28] = 16'hf89c;
      expv[29] = 16'hf8a0;
      expv[30] = 16'hf8a0;
      expv[31] = 16'h57f0;
      expv[32] = 16'h31cd;
      expv[33] = 16'h31cd;
      expv[34] = 16'h45e8;
      expv[35] = 16'ha1ec;
      expv[36] = 16'ha1f0;
      expv[37] = 16'ha1ec;
      expv[38] = 16'ha1f0;
      expv[39] = 16'h85e7;
      expv[40] = 16'h85e7;
      expv[41] = 16'h218b;
      expv[42] = 16'h218b;
      expv[43] = 16'h2187;
      expv[44] = 16'h2183;
      expv[45] = 16'h217f;
      expv[46] = 16'h2183;
      expv[47] = 16'h2187;
      expv[48] = 16'h2187;
      expv[49] = 16'h5ffc;
      expv[50] = 16'h5ffc;
      expv[51] = 16'h5ffc;
      expv[52] = 16'h5ffc;
      expv[53] = 16'h5ffc;
      expv[54] = 16'h5ffc;
      expv[55] = 16'h5ffc;
      expv[56] = 16'h5ff8;
      expv[57] = 16'h5ff8;
      expv[58] = 16'h5ff4;
      expv[59] = 16'h5ff8;
      expv[60] = 16'h14a1;
      expv[61] = 16'h14a5;
      expv[62] = 16'h14a1;
      expv[63] = 16'h14a5;
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
