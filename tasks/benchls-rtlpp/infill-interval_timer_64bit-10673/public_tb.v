// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 23;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_10673 dut (
    .clk(clk),
    .address(in_vec[22:19]),
    .chipselect(in_vec[18:18]),
    .reset_n(in_vec[17:17]),
    .write_n(in_vec[16:16]),
    .writedata(in_vec[15:0]),
    .irq(out_vec[16:16]),
    .readdata(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 23'h6c79f3;
    stim[1] = 23'h40fa94;
    stim[2] = 23'h0af7a5;
    stim[3] = 23'h23d42c;
    stim[4] = 23'h3256d8;
    stim[5] = 23'h3be237;
    stim[6] = 23'h1bf648;
    stim[7] = 23'h6289fc;
    stim[8] = 23'h026423;
    stim[9] = 23'h37f89b;
    stim[10] = 23'h3f19b9;
    stim[11] = 23'h136fcd;
    stim[12] = 23'h2ed1ea;
    stim[13] = 23'h6f6f91;
    stim[14] = 23'h3f270e;
    stim[15] = 23'h1a5c1d;
    stim[16] = 23'h74d8e4;
    stim[17] = 23'h52c171;
    stim[18] = 23'h160385;
    stim[19] = 23'h267342;
    stim[20] = 23'h57450c;
    stim[21] = 23'h0bc4de;
    stim[22] = 23'h7354cf;
    stim[23] = 23'h66ca7f;
    stim[24] = 23'h420c67;
    stim[25] = 23'h43d245;
    stim[26] = 23'h6ba04d;
    stim[27] = 23'h528040;
    stim[28] = 23'h02426b;
    stim[29] = 23'h1b5225;
    stim[30] = 23'h1e2f7e;
    stim[31] = 23'h723540;
    stim[32] = 23'h171744;
    stim[33] = 23'h478c41;
    stim[34] = 23'h1ae60c;
    stim[35] = 23'h6fdcfb;
    stim[36] = 23'h1e561f;
    stim[37] = 23'h463210;
    stim[38] = 23'h2ec5c7;
    stim[39] = 23'h4b940b;
    stim[40] = 23'h6a45bb;
    stim[41] = 23'h3b93c8;
    stim[42] = 23'h375f44;
    stim[43] = 23'h3f4825;
    stim[44] = 23'h7f6e05;
    stim[45] = 23'h7ef381;
    stim[46] = 23'h573f81;
    stim[47] = 23'h43f56a;
    stim[48] = 23'h1a7236;
    stim[49] = 23'h5b911f;
    stim[50] = 23'h3ad656;
    stim[51] = 23'h3ea530;
    stim[52] = 23'h17c9ae;
    stim[53] = 23'h7af36a;
    stim[54] = 23'h7b0637;
    stim[55] = 23'h126a26;
    stim[56] = 23'h06b4fb;
    stim[57] = 23'h4afb77;
    stim[58] = 23'h5edd80;
    stim[59] = 23'h0ac2f0;
    stim[60] = 23'h425175;
    stim[61] = 23'h526574;
    stim[62] = 23'h1c6c24;
    stim[63] = 23'h1edbf4;
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
      expv[0] = 17'h00000;
      expv[1] = 17'h00000;
      expv[2] = 17'h00000;
      expv[3] = 17'h00000;
      expv[4] = 17'h00000;
      expv[5] = 17'h00000;
      expv[6] = 17'h00000;
      expv[7] = 17'h00000;
      expv[8] = 17'h00000;
      expv[9] = 17'h00000;
      expv[10] = 17'h00000;
      expv[11] = 17'h00000;
      expv[12] = 17'h0c34f;
      expv[13] = 17'h00000;
      expv[14] = 17'h00000;
      expv[15] = 17'h00000;
      expv[16] = 17'h00000;
      expv[17] = 17'h00000;
      expv[18] = 17'h00000;
      expv[19] = 17'h0c34f;
      expv[20] = 17'h00000;
      expv[21] = 17'h00000;
      expv[22] = 17'h00000;
      expv[23] = 17'h00000;
      expv[24] = 17'h00000;
      expv[25] = 17'h00000;
      expv[26] = 17'h00000;
      expv[27] = 17'h00000;
      expv[28] = 17'h00000;
      expv[29] = 17'h00000;
      expv[30] = 17'h00000;
      expv[31] = 17'h00000;
      expv[32] = 17'h00000;
      expv[33] = 17'h00385;
      expv[34] = 17'h00000;
      expv[35] = 17'h02f7e;
      expv[36] = 17'h00000;
      expv[37] = 17'h02f7e;
      expv[38] = 17'h00000;
      expv[39] = 17'h00000;
      expv[40] = 17'h00000;
      expv[41] = 17'h00000;
      expv[42] = 17'h02f7e;
      expv[43] = 17'h00385;
      expv[44] = 17'h02f7e;
      expv[45] = 17'h00000;
      expv[46] = 17'h00000;
      expv[47] = 17'h00000;
      expv[48] = 17'h07342;
      expv[49] = 17'h0561f;
      expv[50] = 17'h00000;
      expv[51] = 17'h02f7e;
      expv[52] = 17'h02f7e;
      expv[53] = 17'h00385;
      expv[54] = 17'h00000;
      expv[55] = 17'h00000;
      expv[56] = 17'h00385;
      expv[57] = 17'h00000;
      expv[58] = 17'h0c5c7;
      expv[59] = 17'h00000;
      expv[60] = 17'h00000;
      expv[61] = 17'h07342;
      expv[62] = 17'h00000;
      expv[63] = 17'h00000;
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
