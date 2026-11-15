// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 40;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_07941 dut (
    .clk(clk),
    .d(in_vec[11:4]),
    .calc(in_vec[3:3]),
    .init(in_vec[2:2]),
    .d_valid(in_vec[1:1]),
    .reset(in_vec[0:0]),
    .crc_reg(out_vec[39:8]),
    .crc(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h63b;
    stim[1] = 12'h7a1;
    stim[2] = 12'hbfe;
    stim[3] = 12'h906;
    stim[4] = 12'h6f6;
    stim[5] = 12'h15c;
    stim[6] = 12'h678;
    stim[7] = 12'hff8;
    stim[8] = 12'h9e2;
    stim[9] = 12'hc3a;
    stim[10] = 12'he4e;
    stim[11] = 12'h238;
    stim[12] = 12'hdd6;
    stim[13] = 12'h40e;
    stim[14] = 12'he04;
    stim[15] = 12'h5e6;
    stim[16] = 12'h87c;
    stim[17] = 12'hf3e;
    stim[18] = 12'h370;
    stim[19] = 12'he9e;
    stim[20] = 12'h56a;
    stim[21] = 12'h5aa;
    stim[22] = 12'hca8;
    stim[23] = 12'h59a;
    stim[24] = 12'h38c;
    stim[25] = 12'h040;
    stim[26] = 12'h710;
    stim[27] = 12'h2f4;
    stim[28] = 12'h014;
    stim[29] = 12'h46c;
    stim[30] = 12'ha8a;
    stim[31] = 12'hbd4;
    stim[32] = 12'h8a2;
    stim[33] = 12'hcde;
    stim[34] = 12'h7e0;
    stim[35] = 12'h8fc;
    stim[36] = 12'h5a6;
    stim[37] = 12'h8c4;
    stim[38] = 12'he54;
    stim[39] = 12'h39e;
    stim[40] = 12'h9b6;
    stim[41] = 12'h5ca;
    stim[42] = 12'h522;
    stim[43] = 12'h0f2;
    stim[44] = 12'hfba;
    stim[45] = 12'h546;
    stim[46] = 12'ha96;
    stim[47] = 12'h748;
    stim[48] = 12'hb9a;
    stim[49] = 12'h0cc;
    stim[50] = 12'h43a;
    stim[51] = 12'ha20;
    stim[52] = 12'he30;
    stim[53] = 12'hd9a;
    stim[54] = 12'habe;
    stim[55] = 12'hf1c;
    stim[56] = 12'h1da;
    stim[57] = 12'h5b0;
    stim[58] = 12'hc9a;
    stim[59] = 12'hdfc;
    stim[60] = 12'h884;
    stim[61] = 12'h0e6;
    stim[62] = 12'hc36;
    stim[63] = 12'h676;
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
      expv[0] = 40'hffffffffff;
      expv[1] = 40'hffffffffff;
      expv[2] = 40'hffffffffff;
      expv[3] = 40'hffffffffff;
      expv[4] = 40'hffffffffff;
      expv[5] = 40'hffffffffff;
      expv[6] = 40'hffffffffff;
      expv[7] = 40'hffffffffff;
      expv[8] = 40'hffffffffff;
      expv[9] = 40'hffffffff00;
      expv[10] = 40'h1ec109f487;
      expv[11] = 40'hffffffffff;
      expv[12] = 40'hffffffffff;
      expv[13] = 40'hffffffffff;
      expv[14] = 40'hffffffffff;
      expv[15] = 40'hffffffffff;
      expv[16] = 40'hffffffffff;
      expv[17] = 40'hffffffffff;
      expv[18] = 40'hffffffffff;
      expv[19] = 40'hffffffffff;
      expv[20] = 40'hffffffffff;
      expv[21] = 40'hcd27aff54c;
      expv[22] = 40'h1cf59e9bc7;
      expv[23] = 40'h1cf59e9bc7;
      expv[24] = 40'h8614365c9e;
      expv[25] = 40'hffffffffff;
      expv[26] = 40'hffffffffff;
      expv[27] = 40'hffffffffff;
      expv[28] = 40'hffffffffff;
      expv[29] = 40'hffffffffff;
      expv[30] = 40'hffffffffff;
      expv[31] = 40'h15dc0faf57;
      expv[32] = 40'hffffffffff;
      expv[33] = 40'hffffffff00;
      expv[34] = 40'hffffffffff;
      expv[35] = 40'hffffffffff;
      expv[36] = 40'hffffffffff;
      expv[37] = 40'hffffffffff;
      expv[38] = 40'hffffffffff;
      expv[39] = 40'hffffffffff;
      expv[40] = 40'hffffffffff;
      expv[41] = 40'hffffffffff;
      expv[42] = 40'hb5b004f252;
      expv[43] = 40'hb004f2fff2;
      expv[44] = 40'h04f2ffffdf;
      expv[45] = 40'hc82f7f88ec;
      expv[46] = 40'hffffffffff;
      expv[47] = 40'hffffffffff;
      expv[48] = 40'hffffffffff;
      expv[49] = 40'h5ad802f9a5;
      expv[50] = 40'hffffffffff;
      expv[51] = 40'h1a001443a7;
      expv[52] = 40'h1a001443a7;
      expv[53] = 40'h1a001443a7;
      expv[54] = 40'h6dd9be5949;
      expv[55] = 40'hffffffffff;
      expv[56] = 40'hffffffffff;
      expv[57] = 40'hd53edf7254;
      expv[58] = 40'hd53edf7254;
      expv[59] = 40'h10df4fc5f7;
      expv[60] = 40'hffffffffff;
      expv[61] = 40'hffffffffff;
      expv[62] = 40'hffffffffff;
      expv[63] = 40'hffffffffff;
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
