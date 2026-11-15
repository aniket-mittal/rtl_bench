// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 22;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_05343 dut (
    .clk(clk),
    .address(in_vec[21:19]),
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
    stim[0] = 22'h1cef8d;
    stim[1] = 22'h29b839;
    stim[2] = 22'h26adce;
    stim[3] = 22'h224721;
    stim[4] = 22'h1e756c;
    stim[5] = 22'h0e09cc;
    stim[6] = 22'h030ccc;
    stim[7] = 22'h0ba377;
    stim[8] = 22'h366ec3;
    stim[9] = 22'h3ab19d;
    stim[10] = 22'h0366c0;
    stim[11] = 22'h126197;
    stim[12] = 22'h0315e7;
    stim[13] = 22'h1fec72;
    stim[14] = 22'h33fceb;
    stim[15] = 22'h2302d9;
    stim[16] = 22'h1b42e0;
    stim[17] = 22'h3223e2;
    stim[18] = 22'h1bd82e;
    stim[19] = 22'h0ed1f7;
    stim[20] = 22'h0ec94a;
    stim[21] = 22'h070914;
    stim[22] = 22'h1ba2ac;
    stim[23] = 22'h2a932c;
    stim[24] = 22'h36f4ed;
    stim[25] = 22'h374953;
    stim[26] = 22'h2a31f0;
    stim[27] = 22'h260a37;
    stim[28] = 22'h375fdb;
    stim[29] = 22'h12052a;
    stim[30] = 22'h1fbc8b;
    stim[31] = 22'h272945;
    stim[32] = 22'h16b08b;
    stim[33] = 22'h023c37;
    stim[34] = 22'h1aab01;
    stim[35] = 22'h0ba424;
    stim[36] = 22'h3f1005;
    stim[37] = 22'h3f4a46;
    stim[38] = 22'h2bab97;
    stim[39] = 22'h0aaa0c;
    stim[40] = 22'h37f4ad;
    stim[41] = 22'h377824;
    stim[42] = 22'h1ee4c5;
    stim[43] = 22'h1fbe1f;
    stim[44] = 22'h3fcbbd;
    stim[45] = 22'h0b760a;
    stim[46] = 22'h2af7f1;
    stim[47] = 22'h2a8a7b;
    stim[48] = 22'h1f65a4;
    stim[49] = 22'h3fdd52;
    stim[50] = 22'h2b13ea;
    stim[51] = 22'h1be5af;
    stim[52] = 22'h326726;
    stim[53] = 22'h24e6ce;
    stim[54] = 22'h021b88;
    stim[55] = 22'h3276bf;
    stim[56] = 22'h0799e5;
    stim[57] = 22'h33153c;
    stim[58] = 22'h2242e6;
    stim[59] = 22'h1eca4d;
    stim[60] = 22'h23f767;
    stim[61] = 22'h2674f0;
    stim[62] = 22'h0a3b0d;
    stim[63] = 22'h1f5f61;
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
      expv[4] = 17'h00063;
      expv[5] = 17'h00000;
      expv[6] = 17'h00000;
      expv[7] = 17'h00002;
      expv[8] = 17'h0000c;
      expv[9] = 17'h00000;
      expv[10] = 17'h00000;
      expv[11] = 17'h00002;
      expv[12] = 17'h00063;
      expv[13] = 17'h00002;
      expv[14] = 17'h0756c;
      expv[15] = 17'h00000;
      expv[16] = 17'h00063;
      expv[17] = 17'h0756c;
      expv[18] = 17'h00000;
      expv[19] = 17'h0756c;
      expv[20] = 17'h0000c;
      expv[21] = 17'h00007;
      expv[22] = 17'h00000;
      expv[23] = 17'h0756c;
      expv[24] = 17'h00000;
      expv[25] = 17'h00000;
      expv[26] = 17'h00000;
      expv[27] = 17'h00000;
      expv[28] = 17'h00063;
      expv[29] = 17'h00000;
      expv[30] = 17'h00063;
      expv[31] = 17'h0756c;
      expv[32] = 17'h00054;
      expv[33] = 17'h00063;
      expv[34] = 17'h00000;
      expv[35] = 17'h0756c;
      expv[36] = 17'h0000a;
      expv[37] = 17'h00000;
      expv[38] = 17'h00000;
      expv[39] = 17'h0756c;
      expv[40] = 17'h0000a;
      expv[41] = 17'h00000;
      expv[42] = 17'h00000;
      expv[43] = 17'h0756c;
      expv[44] = 17'h0e4c5;
      expv[45] = 17'h00000;
      expv[46] = 17'h0000a;
      expv[47] = 17'h0756c;
      expv[48] = 17'h0756c;
      expv[49] = 17'h0e4c5;
      expv[50] = 17'h00000;
      expv[51] = 17'h0756c;
      expv[52] = 17'h0e4c5;
      expv[53] = 17'h00000;
      expv[54] = 17'h00000;
      expv[55] = 17'h00000;
      expv[56] = 17'h00000;
      expv[57] = 17'h00000;
      expv[58] = 17'h00000;
      expv[59] = 17'h00000;
      expv[60] = 17'h00000;
      expv[61] = 17'h00000;
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
