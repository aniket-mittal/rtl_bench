// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 48;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_08117 dut (
    .clk(clk),
    .rst(in_vec[47:47]),
    .x(in_vec[46:36]),
    .y(in_vec[35:25]),
    .poX(in_vec[24:14]),
    .poY(in_vec[13:3]),
    .trigger(in_vec[2:2]),
    .timer(in_vec[1:1]),
    .d(in_vec[0:0]),
    .bullet(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 48'hdbc7b7091b22;
    stim[1] = 48'h8f74cae85a41;
    stim[2] = 48'h4469c401bfff;
    stim[3] = 48'ha9e743ba44aa;
    stim[4] = 48'h473d00e84598;
    stim[5] = 48'h57580332f4e7;
    stim[6] = 48'h251e8efb54de;
    stim[7] = 48'h7457e2dbfe2c;
    stim[8] = 48'h6ee79f02a8b9;
    stim[9] = 48'h60a4742a3907;
    stim[10] = 48'h2f153c7358e8;
    stim[11] = 48'h0f90c423cbc5;
    stim[12] = 48'h0ca74db52627;
    stim[13] = 48'h47ee808d1d30;
    stim[14] = 48'h66bcdd952a69;
    stim[15] = 48'hd5d04ed11ac2;
    stim[16] = 48'h02698165f1ea;
    stim[17] = 48'h13818d0f2b4d;
    stim[18] = 48'h179efa80247f;
    stim[19] = 48'h354b6813631b;
    stim[20] = 48'h36c122135e13;
    stim[21] = 48'h700d64cc8e34;
    stim[22] = 48'h15bbfe549ef7;
    stim[23] = 48'h4c2671efc668;
    stim[24] = 48'h34357be254d3;
    stim[25] = 48'h2d23f69ce625;
    stim[26] = 48'h6c43097bb9b5;
    stim[27] = 48'h1bf05a770652;
    stim[28] = 48'h7340cacf7978;
    stim[29] = 48'h21edb29e6b1b;
    stim[30] = 48'h48df8f0acf6d;
    stim[31] = 48'h510e2fd1c841;
    stim[32] = 48'h6d989233dc44;
    stim[33] = 48'h56a1ff13444f;
    stim[34] = 48'h55d945c4bffe;
    stim[35] = 48'h3ad4c6b0df8b;
    stim[36] = 48'hfeb76c96c2ea;
    stim[37] = 48'h34355844b5cb;
    stim[38] = 48'h6abff10d1f36;
    stim[39] = 48'hec41d882cc68;
    stim[40] = 48'h1404fbcb4e7a;
    stim[41] = 48'h5b83aff396fa;
    stim[42] = 48'h3dff09f8fd76;
    stim[43] = 48'h7406ea6cbbd5;
    stim[44] = 48'h073acd3d1072;
    stim[45] = 48'h2a345c443791;
    stim[46] = 48'h3cf980355f33;
    stim[47] = 48'h170c7c63583a;
    stim[48] = 48'h09fd1aecb186;
    stim[49] = 48'h549b1dc97c1e;
    stim[50] = 48'h063c42aab36c;
    stim[51] = 48'h654d209a5ab3;
    stim[52] = 48'h7db9b6c3633c;
    stim[53] = 48'h5bf6490a74b0;
    stim[54] = 48'h3b3085997bb4;
    stim[55] = 48'h0e8b39472b40;
    stim[56] = 48'h5a3b486f1645;
    stim[57] = 48'hf383c6d94aa9;
    stim[58] = 48'h4838c0783a8b;
    stim[59] = 48'h016bc8d568e9;
    stim[60] = 48'h0918cb172d0a;
    stim[61] = 48'h1eb2cc2b4eaf;
    stim[62] = 48'hb90128c1e95f;
    stim[63] = 48'h1ebb68c22154;
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
      expv[0] = 1'h0;
      expv[1] = 1'h0;
      expv[2] = 1'h0;
      expv[3] = 1'h0;
      expv[4] = 1'h0;
      expv[5] = 1'h0;
      expv[6] = 1'h0;
      expv[7] = 1'h0;
      expv[8] = 1'h0;
      expv[9] = 1'h0;
      expv[10] = 1'h0;
      expv[11] = 1'h0;
      expv[12] = 1'h0;
      expv[13] = 1'h0;
      expv[14] = 1'h0;
      expv[15] = 1'h0;
      expv[16] = 1'h0;
      expv[17] = 1'h0;
      expv[18] = 1'h0;
      expv[19] = 1'h0;
      expv[20] = 1'h0;
      expv[21] = 1'h0;
      expv[22] = 1'h0;
      expv[23] = 1'h0;
      expv[24] = 1'h0;
      expv[25] = 1'h0;
      expv[26] = 1'h0;
      expv[27] = 1'h0;
      expv[28] = 1'h0;
      expv[29] = 1'h0;
      expv[30] = 1'h0;
      expv[31] = 1'h0;
      expv[32] = 1'h0;
      expv[33] = 1'h0;
      expv[34] = 1'h0;
      expv[35] = 1'h0;
      expv[36] = 1'h0;
      expv[37] = 1'h0;
      expv[38] = 1'h0;
      expv[39] = 1'h0;
      expv[40] = 1'h0;
      expv[41] = 1'h0;
      expv[42] = 1'h0;
      expv[43] = 1'h0;
      expv[44] = 1'h0;
      expv[45] = 1'h0;
      expv[46] = 1'h0;
      expv[47] = 1'h0;
      expv[48] = 1'h0;
      expv[49] = 1'h0;
      expv[50] = 1'h0;
      expv[51] = 1'h0;
      expv[52] = 1'h0;
      expv[53] = 1'h0;
      expv[54] = 1'h0;
      expv[55] = 1'h0;
      expv[56] = 1'h0;
      expv[57] = 1'h0;
      expv[58] = 1'h0;
      expv[59] = 1'h0;
      expv[60] = 1'h0;
      expv[61] = 1'h0;
      expv[62] = 1'h0;
      expv[63] = 1'h0;
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
