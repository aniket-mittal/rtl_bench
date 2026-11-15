// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_048262 dut (
    .condition(in_vec[11:8]),
    .set_condition(in_vec[7:7]),
    .controls(in_vec[6:2]),
    .format(in_vec[1:0]),
    .signals(out_vec[10:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'hee8;
    stim[1] = 12'h890;
    stim[2] = 12'h744;
    stim[3] = 12'h000;
    stim[4] = 12'h245;
    stim[5] = 12'hf39;
    stim[6] = 12'hafa;
    stim[7] = 12'hc83;
    stim[8] = 12'h39b;
    stim[9] = 12'h0c1;
    stim[10] = 12'h23e;
    stim[11] = 12'hc3a;
    stim[12] = 12'h517;
    stim[13] = 12'h6bb;
    stim[14] = 12'h419;
    stim[15] = 12'hf7d;
    stim[16] = 12'hf55;
    stim[17] = 12'h153;
    stim[18] = 12'h83e;
    stim[19] = 12'h530;
    stim[20] = 12'hbe0;
    stim[21] = 12'ha62;
    stim[22] = 12'h399;
    stim[23] = 12'hd30;
    stim[24] = 12'hacf;
    stim[25] = 12'h056;
    stim[26] = 12'h53b;
    stim[27] = 12'h9a8;
    stim[28] = 12'h41e;
    stim[29] = 12'ha00;
    stim[30] = 12'h5e8;
    stim[31] = 12'hf34;
    stim[32] = 12'h988;
    stim[33] = 12'heaa;
    stim[34] = 12'hf4d;
    stim[35] = 12'h82a;
    stim[36] = 12'h55d;
    stim[37] = 12'h2e4;
    stim[38] = 12'h3fe;
    stim[39] = 12'h64d;
    stim[40] = 12'h3f2;
    stim[41] = 12'h737;
    stim[42] = 12'h4e1;
    stim[43] = 12'h5d7;
    stim[44] = 12'h464;
    stim[45] = 12'h4b5;
    stim[46] = 12'h4f8;
    stim[47] = 12'h269;
    stim[48] = 12'h8a2;
    stim[49] = 12'haf3;
    stim[50] = 12'h9d0;
    stim[51] = 12'h1da;
    stim[52] = 12'hc9e;
    stim[53] = 12'h748;
    stim[54] = 12'ha21;
    stim[55] = 12'h1a1;
    stim[56] = 12'hd68;
    stim[57] = 12'hb3f;
    stim[58] = 12'h2f6;
    stim[59] = 12'h8e3;
    stim[60] = 12'h4fe;
    stim[61] = 12'heed;
    stim[62] = 12'h278;
    stim[63] = 12'h0d5;
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
      expv[0] = 11'h000;
      expv[1] = 11'h521;
      expv[2] = 11'h000;
      expv[3] = 11'h401;
      expv[4] = 11'h000;
      expv[5] = 11'h000;
      expv[6] = 11'h104;
      expv[7] = 11'h000;
      expv[8] = 11'h000;
      expv[9] = 11'h000;
      expv[10] = 11'h104;
      expv[11] = 11'h104;
      expv[12] = 11'h000;
      expv[13] = 11'h000;
      expv[14] = 11'h000;
      expv[15] = 11'h000;
      expv[16] = 11'h000;
      expv[17] = 11'h000;
      expv[18] = 11'h104;
      expv[19] = 11'h000;
      expv[20] = 11'h000;
      expv[21] = 11'h104;
      expv[22] = 11'h000;
      expv[23] = 11'h000;
      expv[24] = 11'h000;
      expv[25] = 11'h104;
      expv[26] = 11'h000;
      expv[27] = 11'h000;
      expv[28] = 11'h104;
      expv[29] = 11'h401;
      expv[30] = 11'h000;
      expv[31] = 11'h000;
      expv[32] = 11'h4a1;
      expv[33] = 11'h104;
      expv[34] = 11'h000;
      expv[35] = 11'h104;
      expv[36] = 11'h000;
      expv[37] = 11'h000;
      expv[38] = 11'h104;
      expv[39] = 11'h000;
      expv[40] = 11'h104;
      expv[41] = 11'h000;
      expv[42] = 11'h000;
      expv[43] = 11'h000;
      expv[44] = 11'h000;
      expv[45] = 11'h000;
      expv[46] = 11'h000;
      expv[47] = 11'h000;
      expv[48] = 11'h104;
      expv[49] = 11'h000;
      expv[50] = 11'h000;
      expv[51] = 11'h104;
      expv[52] = 11'h104;
      expv[53] = 11'h000;
      expv[54] = 11'h000;
      expv[55] = 11'h000;
      expv[56] = 11'h000;
      expv[57] = 11'h000;
      expv[58] = 11'h104;
      expv[59] = 11'h000;
      expv[60] = 11'h104;
      expv[61] = 11'h000;
      expv[62] = 11'h000;
      expv[63] = 11'h000;
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
