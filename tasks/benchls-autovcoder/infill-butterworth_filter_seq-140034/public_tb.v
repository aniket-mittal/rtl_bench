// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_140034 dut (
    .clk(clk),
    .rst(in_vec[16:16]),
    .x_in(in_vec[15:0]),
    .y_out(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h1fa6f;
    stim[1] = 17'h1f93c;
    stim[2] = 17'h0fb57;
    stim[3] = 17'h0c5f2;
    stim[4] = 17'h03903;
    stim[5] = 17'h0d537;
    stim[6] = 17'h05783;
    stim[7] = 17'h0fe4a;
    stim[8] = 17'h0c7f1;
    stim[9] = 17'h01963;
    stim[10] = 17'h0e16e;
    stim[11] = 17'h0061a;
    stim[12] = 17'h0035e;
    stim[13] = 17'h027cd;
    stim[14] = 17'h0e7d5;
    stim[15] = 17'h0bfa3;
    stim[16] = 17'h0a57e;
    stim[17] = 17'h0433e;
    stim[18] = 17'h0faa1;
    stim[19] = 17'h0aac8;
    stim[20] = 17'h0a6a6;
    stim[21] = 17'h0f46b;
    stim[22] = 17'h0e47d;
    stim[23] = 17'h03c0f;
    stim[24] = 17'h09f99;
    stim[25] = 17'h0ab68;
    stim[26] = 17'h03105;
    stim[27] = 17'h08218;
    stim[28] = 17'h0f814;
    stim[29] = 17'h03150;
    stim[30] = 17'h045aa;
    stim[31] = 17'h0a509;
    stim[32] = 17'h073cd;
    stim[33] = 17'h04d51;
    stim[34] = 17'h1fb7d;
    stim[35] = 17'h0137c;
    stim[36] = 17'h08409;
    stim[37] = 17'h00fe8;
    stim[38] = 17'h174fa;
    stim[39] = 17'h068eb;
    stim[40] = 17'h02798;
    stim[41] = 17'h01c91;
    stim[42] = 17'h0d6d6;
    stim[43] = 17'h0f753;
    stim[44] = 17'h00a93;
    stim[45] = 17'h0a17b;
    stim[46] = 17'h01280;
    stim[47] = 17'h0e7e3;
    stim[48] = 17'h0f41b;
    stim[49] = 17'h0606a;
    stim[50] = 17'h06233;
    stim[51] = 17'h00797;
    stim[52] = 17'h0a1a2;
    stim[53] = 17'h00cb8;
    stim[54] = 17'h0735d;
    stim[55] = 17'h0c809;
    stim[56] = 17'h0b6ca;
    stim[57] = 17'h002b7;
    stim[58] = 17'h056d7;
    stim[59] = 17'h088eb;
    stim[60] = 17'h07c31;
    stim[61] = 17'h066b3;
    stim[62] = 17'h0e09d;
    stim[63] = 17'h017c1;
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
      expv[4] = 16'hfb57;
      expv[5] = 16'h0000;
      expv[6] = 16'hf6ae;
      expv[7] = 16'hfb57;
      expv[8] = 16'h5783;
      expv[9] = 16'hed5c;
      expv[10] = 16'haf06;
      expv[11] = 16'h5783;
      expv[12] = 16'hd81c;
      expv[13] = 16'h5e0c;
      expv[14] = 16'h9d94;
      expv[15] = 16'he16e;
      expv[16] = 16'h96db;
      expv[17] = 16'h7314;
      expv[18] = 16'h8bc2;
      expv[19] = 16'he7d5;
      expv[20] = 16'hbd7d;
      expv[21] = 16'hfd60;
      expv[22] = 16'hee0e;
      expv[23] = 16'hfaa1;
      expv[24] = 16'hb427;
      expv[25] = 16'h703c;
      expv[26] = 16'h65ae;
      expv[27] = 16'he47d;
      expv[28] = 16'h2647;
      expv[29] = 16'h3148;
      expv[30] = 16'hbcca;
      expv[31] = 16'h3105;
      expv[32] = 16'h0ea4;
      expv[33] = 16'hae98;
      expv[34] = 16'h0000;
      expv[35] = 16'h0000;
      expv[36] = 16'h0000;
      expv[37] = 16'h137c;
      expv[38] = 16'h0000;
      expv[39] = 16'h0000;
      expv[40] = 16'h0000;
      expv[41] = 16'h68eb;
      expv[42] = 16'h0000;
      expv[43] = 16'hd1d6;
      expv[44] = 16'h68eb;
      expv[45] = 16'hf753;
      expv[46] = 16'ha3ac;
      expv[47] = 16'heea6;
      expv[48] = 16'hf753;
      expv[49] = 16'hb9b9;
      expv[50] = 16'hdd4c;
      expv[51] = 16'h171e;
      expv[52] = 16'he7e3;
      expv[53] = 16'hf63d;
      expv[54] = 16'h4338;
      expv[55] = 16'hc9c6;
      expv[56] = 16'h0797;
      expv[57] = 16'h97cf;
      expv[58] = 16'hfba8;
      expv[59] = 16'h72d6;
      expv[60] = 16'hc809;
      expv[61] = 16'h9819;
      expv[62] = 16'hbfb0;
      expv[63] = 16'h2bda;
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
