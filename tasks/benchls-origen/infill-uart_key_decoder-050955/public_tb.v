// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_050955 dut (
    .clk(clk),
    .rst_n(in_vec[9:9]),
    .po_data(in_vec[8:1]),
    .rx_down(in_vec[0:0]),
    .key_state1(out_vec[3:3]),
    .key_state2(out_vec[2:2]),
    .key_state3(out_vec[1:1]),
    .key_state4(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h1bb;
    stim[1] = 10'h1ad;
    stim[2] = 10'h2a9;
    stim[3] = 10'h2c5;
    stim[4] = 10'h225;
    stim[5] = 10'h241;
    stim[6] = 10'h20a;
    stim[7] = 10'h3df;
    stim[8] = 10'h2fc;
    stim[9] = 10'h218;
    stim[10] = 10'h3b8;
    stim[11] = 10'h295;
    stim[12] = 10'h2bf;
    stim[13] = 10'h367;
    stim[14] = 10'h256;
    stim[15] = 10'h380;
    stim[16] = 10'h394;
    stim[17] = 10'h30d;
    stim[18] = 10'h351;
    stim[19] = 10'h209;
    stim[20] = 10'h3f4;
    stim[21] = 10'h228;
    stim[22] = 10'h31a;
    stim[23] = 10'h303;
    stim[24] = 10'h3df;
    stim[25] = 10'h257;
    stim[26] = 10'h32b;
    stim[27] = 10'h36a;
    stim[28] = 10'h37f;
    stim[29] = 10'h32f;
    stim[30] = 10'h35b;
    stim[31] = 10'h3ff;
    stim[32] = 10'h232;
    stim[33] = 10'h324;
    stim[34] = 10'h2e6;
    stim[35] = 10'h2ea;
    stim[36] = 10'h2e6;
    stim[37] = 10'h33c;
    stim[38] = 10'h362;
    stim[39] = 10'h394;
    stim[40] = 10'h2e7;
    stim[41] = 10'h285;
    stim[42] = 10'h31a;
    stim[43] = 10'h22f;
    stim[44] = 10'h3ac;
    stim[45] = 10'h218;
    stim[46] = 10'h3e5;
    stim[47] = 10'h396;
    stim[48] = 10'h386;
    stim[49] = 10'h350;
    stim[50] = 10'h393;
    stim[51] = 10'h2b5;
    stim[52] = 10'h28c;
    stim[53] = 10'h2f4;
    stim[54] = 10'h3ca;
    stim[55] = 10'h31c;
    stim[56] = 10'h36f;
    stim[57] = 10'h241;
    stim[58] = 10'h3ad;
    stim[59] = 10'h228;
    stim[60] = 10'h23e;
    stim[61] = 10'h206;
    stim[62] = 10'h26e;
    stim[63] = 10'h3ce;
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
      expv[0] = 4'h0;
      expv[1] = 4'h0;
      expv[2] = 4'h0;
      expv[3] = 4'h0;
      expv[4] = 4'h0;
      expv[5] = 4'h0;
      expv[6] = 4'h0;
      expv[7] = 4'h0;
      expv[8] = 4'h0;
      expv[9] = 4'h0;
      expv[10] = 4'h0;
      expv[11] = 4'h0;
      expv[12] = 4'h0;
      expv[13] = 4'h0;
      expv[14] = 4'h0;
      expv[15] = 4'h0;
      expv[16] = 4'h0;
      expv[17] = 4'h0;
      expv[18] = 4'h0;
      expv[19] = 4'h0;
      expv[20] = 4'h0;
      expv[21] = 4'h0;
      expv[22] = 4'h0;
      expv[23] = 4'h0;
      expv[24] = 4'h0;
      expv[25] = 4'h0;
      expv[26] = 4'h0;
      expv[27] = 4'h0;
      expv[28] = 4'h0;
      expv[29] = 4'h0;
      expv[30] = 4'h0;
      expv[31] = 4'h0;
      expv[32] = 4'h0;
      expv[33] = 4'h0;
      expv[34] = 4'h0;
      expv[35] = 4'h0;
      expv[36] = 4'h0;
      expv[37] = 4'h0;
      expv[38] = 4'h0;
      expv[39] = 4'h0;
      expv[40] = 4'h0;
      expv[41] = 4'h0;
      expv[42] = 4'h0;
      expv[43] = 4'h0;
      expv[44] = 4'h0;
      expv[45] = 4'h0;
      expv[46] = 4'h0;
      expv[47] = 4'h0;
      expv[48] = 4'h0;
      expv[49] = 4'h0;
      expv[50] = 4'h0;
      expv[51] = 4'h0;
      expv[52] = 4'h0;
      expv[53] = 4'h0;
      expv[54] = 4'h0;
      expv[55] = 4'h0;
      expv[56] = 4'h0;
      expv[57] = 4'h0;
      expv[58] = 4'h0;
      expv[59] = 4'h0;
      expv[60] = 4'h0;
      expv[61] = 4'h0;
      expv[62] = 4'h0;
      expv[63] = 4'h0;
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
