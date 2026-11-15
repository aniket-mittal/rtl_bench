// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 20;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_077085 dut (
    .out_data_pram_i(in_vec[19:4]),
    .z_flag_i(in_vec[3:3]),
    .s_flag_i(in_vec[2:2]),
    .c_flag_i(in_vec[1:1]),
    .ovr_flag_i(in_vec[0:0]),
    .mask_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 20'ha633f;
    stim[1] = 20'hfa098;
    stim[2] = 20'h6c4c8;
    stim[3] = 20'h064f6;
    stim[4] = 20'hc1692;
    stim[5] = 20'h43819;
    stim[6] = 20'h64a0e;
    stim[7] = 20'h0432a;
    stim[8] = 20'h73e18;
    stim[9] = 20'h2e0bc;
    stim[10] = 20'h36131;
    stim[11] = 20'hbe399;
    stim[12] = 20'hf979d;
    stim[13] = 20'h441de;
    stim[14] = 20'h041d7;
    stim[15] = 20'h464d9;
    stim[16] = 20'hd9977;
    stim[17] = 20'h8c20a;
    stim[18] = 20'h5be2c;
    stim[19] = 20'h72ab2;
    stim[20] = 20'h0167c;
    stim[21] = 20'hb7e08;
    stim[22] = 20'h9030d;
    stim[23] = 20'h7f99e;
    stim[24] = 20'h55b54;
    stim[25] = 20'h02e01;
    stim[26] = 20'h00b85;
    stim[27] = 20'h418a4;
    stim[28] = 20'h4e474;
    stim[29] = 20'h7fe59;
    stim[30] = 20'h3783d;
    stim[31] = 20'h063b9;
    stim[32] = 20'h1cd67;
    stim[33] = 20'hca8ee;
    stim[34] = 20'hb79bc;
    stim[35] = 20'h0cee1;
    stim[36] = 20'h7045a;
    stim[37] = 20'hca9ff;
    stim[38] = 20'h2f860;
    stim[39] = 20'hf95c5;
    stim[40] = 20'h2c100;
    stim[41] = 20'ha041a;
    stim[42] = 20'h8a5f0;
    stim[43] = 20'hf69dd;
    stim[44] = 20'h35b62;
    stim[45] = 20'h7bf2b;
    stim[46] = 20'h06375;
    stim[47] = 20'hc346f;
    stim[48] = 20'h2590f;
    stim[49] = 20'hb6cd9;
    stim[50] = 20'h2134e;
    stim[51] = 20'h4cc14;
    stim[52] = 20'hdcb1e;
    stim[53] = 20'h50ae9;
    stim[54] = 20'h01fc8;
    stim[55] = 20'hde26e;
    stim[56] = 20'h8c963;
    stim[57] = 20'hd7b5f;
    stim[58] = 20'h0e584;
    stim[59] = 20'hda4b4;
    stim[60] = 20'h06539;
    stim[61] = 20'he0388;
    stim[62] = 20'h6af28;
    stim[63] = 20'h62a1c;
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
      expv[0] = 1'h1;
      expv[1] = 1'h0;
      expv[2] = 1'h1;
      expv[3] = 1'h1;
      expv[4] = 1'h1;
      expv[5] = 1'h1;
      expv[6] = 1'h1;
      expv[7] = 1'h1;
      expv[8] = 1'h1;
      expv[9] = 1'h1;
      expv[10] = 1'h1;
      expv[11] = 1'h0;
      expv[12] = 1'h0;
      expv[13] = 1'h0;
      expv[14] = 1'h1;
      expv[15] = 1'h0;
      expv[16] = 1'h1;
      expv[17] = 1'h1;
      expv[18] = 1'h0;
      expv[19] = 1'h1;
      expv[20] = 1'h0;
      expv[21] = 1'h1;
      expv[22] = 1'h1;
      expv[23] = 1'h0;
      expv[24] = 1'h0;
      expv[25] = 1'h1;
      expv[26] = 1'h0;
      expv[27] = 1'h1;
      expv[28] = 1'h0;
      expv[29] = 1'h1;
      expv[30] = 1'h1;
      expv[31] = 1'h0;
      expv[32] = 1'h0;
      expv[33] = 1'h1;
      expv[34] = 1'h1;
      expv[35] = 1'h0;
      expv[36] = 1'h1;
      expv[37] = 1'h0;
      expv[38] = 1'h1;
      expv[39] = 1'h0;
      expv[40] = 1'h1;
      expv[41] = 1'h1;
      expv[42] = 1'h0;
      expv[43] = 1'h0;
      expv[44] = 1'h1;
      expv[45] = 1'h1;
      expv[46] = 1'h1;
      expv[47] = 1'h0;
      expv[48] = 1'h1;
      expv[49] = 1'h0;
      expv[50] = 1'h1;
      expv[51] = 1'h1;
      expv[52] = 1'h1;
      expv[53] = 1'h1;
      expv[54] = 1'h1;
      expv[55] = 1'h0;
      expv[56] = 1'h1;
      expv[57] = 1'h1;
      expv[58] = 1'h0;
      expv[59] = 1'h1;
      expv[60] = 1'h1;
      expv[61] = 1'h0;
      expv[62] = 1'h0;
      expv[63] = 1'h1;
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
