// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 20;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_101198 dut (
    .clk(clk),
    .rst(in_vec[19:19]),
    .enable(in_vec[18:18]),
    .counter(in_vec[17:16]),
    .data_in(in_vec[15:0]),
    .data_out0(out_vec[63:48]),
    .data_out1(out_vec[47:32]),
    .data_out2(out_vec[31:16]),
    .data_out3(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 20'h98140;
    stim[1] = 20'hca3fe;
    stim[2] = 20'h0c098;
    stim[3] = 20'h12e9b;
    stim[4] = 20'h29332;
    stim[5] = 20'h6592c;
    stim[6] = 20'h56f0a;
    stim[7] = 20'h6e422;
    stim[8] = 20'h7f5ab;
    stim[9] = 20'h0f8ec;
    stim[10] = 20'h7ce54;
    stim[11] = 20'h40288;
    stim[12] = 20'h17414;
    stim[13] = 20'h37994;
    stim[14] = 20'h656c6;
    stim[15] = 20'h2c1c8;
    stim[16] = 20'h6a797;
    stim[17] = 20'h65460;
    stim[18] = 20'h63acf;
    stim[19] = 20'h30f38;
    stim[20] = 20'h256e8;
    stim[21] = 20'h4b91a;
    stim[22] = 20'h70ef5;
    stim[23] = 20'h60d20;
    stim[24] = 20'h34f47;
    stim[25] = 20'h61cd3;
    stim[26] = 20'h68c31;
    stim[27] = 20'h192e8;
    stim[28] = 20'h7fb91;
    stim[29] = 20'h08968;
    stim[30] = 20'h4a48d;
    stim[31] = 20'h79edd;
    stim[32] = 20'h61b3e;
    stim[33] = 20'h00167;
    stim[34] = 20'h43919;
    stim[35] = 20'h69fcb;
    stim[36] = 20'h0e06a;
    stim[37] = 20'h5888c;
    stim[38] = 20'h36522;
    stim[39] = 20'h4fdcc;
    stim[40] = 20'h1cc16;
    stim[41] = 20'h50672;
    stim[42] = 20'h6b3a8;
    stim[43] = 20'h50434;
    stim[44] = 20'h539c7;
    stim[45] = 20'h389cd;
    stim[46] = 20'h7c44b;
    stim[47] = 20'h20250;
    stim[48] = 20'h13f9c;
    stim[49] = 20'h0b94f;
    stim[50] = 20'h3a2b9;
    stim[51] = 20'h4b604;
    stim[52] = 20'h0e371;
    stim[53] = 20'h43fd4;
    stim[54] = 20'h5c0ee;
    stim[55] = 20'h511ad;
    stim[56] = 20'h4f3bf;
    stim[57] = 20'h672e4;
    stim[58] = 20'h726bc;
    stim[59] = 20'h1b3d6;
    stim[60] = 20'h70dbd;
    stim[61] = 20'h3cd8b;
    stim[62] = 20'h1e486;
    stim[63] = 20'h22919;
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
      expv[3] = 64'h0000000000000000;
      expv[4] = 64'h0000000000000000;
      expv[5] = 64'h0000000000000000;
      expv[6] = 64'h0000000000000000;
      expv[7] = 64'h0000000000000000;
      expv[8] = 64'h0000000000000000;
      expv[9] = 64'h0000000000000000;
      expv[10] = 64'h0000000000000000;
      expv[11] = 64'h0000000000000000;
      expv[12] = 64'h0000000000000000;
      expv[13] = 64'h0000000000000000;
      expv[14] = 64'h0000000000000000;
      expv[15] = 64'h0000000000000000;
      expv[16] = 64'h0000000000000000;
      expv[17] = 64'h0000000000000000;
      expv[18] = 64'h0000000000000000;
      expv[19] = 64'h0000000000000000;
      expv[20] = 64'h0000000000000000;
      expv[21] = 64'h0000000000000000;
      expv[22] = 64'h0000000000000000;
      expv[23] = 64'h0000000000000000;
      expv[24] = 64'h0000000000000000;
      expv[25] = 64'h0000000000000000;
      expv[26] = 64'h0000000000000000;
      expv[27] = 64'h0000000000000000;
      expv[28] = 64'h0000000000000000;
      expv[29] = 64'h0000000000000000;
      expv[30] = 64'h0000000000000000;
      expv[31] = 64'h0000000000000000;
      expv[32] = 64'h0000000000000000;
      expv[33] = 64'h0000000000000000;
      expv[34] = 64'h0000000000000000;
      expv[35] = 64'h0000000000000000;
      expv[36] = 64'h0000000000000000;
      expv[37] = 64'h0000000000000000;
      expv[38] = 64'h0000000000000000;
      expv[39] = 64'h0000000000000000;
      expv[40] = 64'h0000000000000000;
      expv[41] = 64'h0000000000000000;
      expv[42] = 64'h0000000000000000;
      expv[43] = 64'h0000000000000000;
      expv[44] = 64'h0000000000000000;
      expv[45] = 64'h0000000000000000;
      expv[46] = 64'h0000000000000000;
      expv[47] = 64'h0000000000000000;
      expv[48] = 64'h0000000000000000;
      expv[49] = 64'h0000000000000000;
      expv[50] = 64'h0000000000000000;
      expv[51] = 64'h0000000000000000;
      expv[52] = 64'h0000000000000000;
      expv[53] = 64'h0000000000000000;
      expv[54] = 64'h0000000000000000;
      expv[55] = 64'h0000000000000000;
      expv[56] = 64'h0000000000000000;
      expv[57] = 64'h0000000000000000;
      expv[58] = 64'h0000000000000000;
      expv[59] = 64'h0000000000000000;
      expv[60] = 64'h0000000000000000;
      expv[61] = 64'h0000000000000000;
      expv[62] = 64'h0000000000000000;
      expv[63] = 64'h0000000000000000;
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
