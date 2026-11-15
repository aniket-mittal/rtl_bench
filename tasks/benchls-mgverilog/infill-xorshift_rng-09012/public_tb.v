// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 1;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_09012 dut (
    .clk(clk),
    .rst(in_vec[0:0]),
    .urn(out_vec[63:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 1'h1;
    stim[1] = 1'h1;
    stim[2] = 1'h0;
    stim[3] = 1'h0;
    stim[4] = 1'h0;
    stim[5] = 1'h0;
    stim[6] = 1'h0;
    stim[7] = 1'h0;
    stim[8] = 1'h1;
    stim[9] = 1'h0;
    stim[10] = 1'h0;
    stim[11] = 1'h0;
    stim[12] = 1'h0;
    stim[13] = 1'h0;
    stim[14] = 1'h0;
    stim[15] = 1'h0;
    stim[16] = 1'h0;
    stim[17] = 1'h0;
    stim[18] = 1'h0;
    stim[19] = 1'h0;
    stim[20] = 1'h0;
    stim[21] = 1'h0;
    stim[22] = 1'h0;
    stim[23] = 1'h0;
    stim[24] = 1'h0;
    stim[25] = 1'h0;
    stim[26] = 1'h0;
    stim[27] = 1'h0;
    stim[28] = 1'h0;
    stim[29] = 1'h0;
    stim[30] = 1'h0;
    stim[31] = 1'h0;
    stim[32] = 1'h0;
    stim[33] = 1'h0;
    stim[34] = 1'h0;
    stim[35] = 1'h0;
    stim[36] = 1'h0;
    stim[37] = 1'h0;
    stim[38] = 1'h0;
    stim[39] = 1'h0;
    stim[40] = 1'h0;
    stim[41] = 1'h0;
    stim[42] = 1'h0;
    stim[43] = 1'h0;
    stim[44] = 1'h0;
    stim[45] = 1'h0;
    stim[46] = 1'h0;
    stim[47] = 1'h0;
    stim[48] = 1'h0;
    stim[49] = 1'h0;
    stim[50] = 1'h0;
    stim[51] = 1'h0;
    stim[52] = 1'h0;
    stim[53] = 1'h0;
    stim[54] = 1'h0;
    stim[55] = 1'h0;
    stim[56] = 1'h0;
    stim[57] = 1'h0;
    stim[58] = 1'h0;
    stim[59] = 1'h0;
    stim[60] = 1'h0;
    stim[61] = 1'h0;
    stim[62] = 1'h0;
    stim[63] = 1'h0;
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
      expv[0] = 64'h0000000000000000;
      expv[1] = 64'h0000000000000000;
      expv[2] = 64'h0000000000000000;
      expv[3] = 64'h00000000462c42b4;
      expv[4] = 64'h00008cc4d2189089;
      expv[5] = 64'h19804da01362956b;
      expv[6] = 64'h05c8b01410852224;
      expv[7] = 64'h40016439a21e19a6;
      expv[8] = 64'h5c41ec08b39b5039;
      expv[9] = 64'h0000000000000000;
      expv[10] = 64'h00000000462c42b4;
      expv[11] = 64'h00008cc4d2189089;
      expv[12] = 64'h19804da01362956b;
      expv[13] = 64'h05c8b01410852224;
      expv[14] = 64'h40016439a21e19a6;
      expv[15] = 64'h5c41ec08b39b5039;
      expv[16] = 64'h1cecfdc325cdbf80;
      expv[17] = 64'hfb103fc1475445db;
      expv[18] = 64'h45fb8efc2c2238f9;
      expv[19] = 64'h08366e4fbe1bc42b;
      expv[20] = 64'hace40a178fb9726c;
      expv[21] = 64'h2426aba72e4d8b94;
      expv[22] = 64'h3d129fd37f137902;
      expv[23] = 64'hda75435f89886464;
      expv[24] = 64'h5159f9812e31b8bb;
      expv[25] = 64'hf541851150950299;
      expv[26] = 64'hca7ffa06f7bee54d;
      expv[27] = 64'h5a2213cabb392fbf;
      expv[28] = 64'he9a88842640b3d2b;
      expv[29] = 64'h21a871747e50a9f9;
      expv[30] = 64'he60aa1e8d9adbe90;
      expv[31] = 64'h53e8e45c6c6e6883;
      expv[32] = 64'hcc724df630fba50d;
      expv[33] = 64'h25a63572cf4afb40;
      expv[34] = 64'h95a4d5daa35685a3;
      expv[35] = 64'h2fae99f190983363;
      expv[36] = 64'h429d541c914475b5;
      expv[37] = 64'h5274b5e004b94a41;
      expv[38] = 64'h5d5f368fb1bfa2c8;
      expv[39] = 64'haf0c7c71049a1db2;
      expv[40] = 64'h6b5d98fd1c48bc8c;
      expv[41] = 64'hf45508098990b721;
      expv[42] = 64'hb22b54b1f7e48584;
      expv[43] = 64'hc8ec2e9c0052f3d9;
      expv[44] = 64'ha82d49213c93b8f7;
      expv[45] = 64'h9043331c727fc89f;
      expv[46] = 64'hca5a8b3c731bb846;
      expv[47] = 64'hf89115b037ece45a;
      expv[48] = 64'h2ebd27a614f12db0;
      expv[49] = 64'ha76a9da687467a3b;
      expv[50] = 64'h14e3940d019b78b4;
      expv[51] = 64'hf2fdc5601183cf5d;
      expv[52] = 64'h73cea99d765764e6;
      expv[53] = 64'h3238188b58c69bd3;
      expv[54] = 64'hc859b0cfe3155840;
      expv[55] = 64'h32122c7079ab7ba1;
      expv[56] = 64'hdd59432e47753b52;
      expv[57] = 64'h4b56f5a79aebcf4c;
      expv[58] = 64'hc1e475fd4a5a9c3c;
      expv[59] = 64'hd7072bd82950cdc9;
      expv[60] = 64'h2320817528db0b21;
      expv[61] = 64'h706c67b1a84f8f5f;
      expv[62] = 64'h9263f6f8861ad2f2;
      expv[63] = 64'h5c7c0f0bc9dc095c;
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
