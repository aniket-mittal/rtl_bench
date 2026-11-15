// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 26;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_020994 dut (
    .clk(clk),
    .rst(in_vec[25:25]),
    .read(in_vec[24:24]),
    .write(in_vec[23:23]),
    .address(in_vec[22:16]),
    .write_data(in_vec[15:0]),
    .read_data(out_vec[16:1]),
    .busy_wait(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 26'h2767ab6;
    stim[1] = 26'h272ec5f;
    stim[2] = 26'h18ed979;
    stim[3] = 26'h18c0e2a;
    stim[4] = 26'h0adab9c;
    stim[5] = 26'h046383e;
    stim[6] = 26'h0425a71;
    stim[7] = 26'h045e50a;
    stim[8] = 26'h0d76045;
    stim[9] = 26'h1cd7f17;
    stim[10] = 26'h09f76d7;
    stim[11] = 26'h1320cfa;
    stim[12] = 26'h0837173;
    stim[13] = 26'h12f1e11;
    stim[14] = 26'h1901e96;
    stim[15] = 26'h1d7d5dd;
    stim[16] = 26'h14b6692;
    stim[17] = 26'h0efbe21;
    stim[18] = 26'h060eb8b;
    stim[19] = 26'h07d3df5;
    stim[20] = 26'h013b2ae;
    stim[21] = 26'h1c7018b;
    stim[22] = 26'h018b2bb;
    stim[23] = 26'h0ca062f;
    stim[24] = 26'h194999a;
    stim[25] = 26'h0cb8c3c;
    stim[26] = 26'h0493a34;
    stim[27] = 26'h15195c5;
    stim[28] = 26'h1060822;
    stim[29] = 26'h1872752;
    stim[30] = 26'h0ceac51;
    stim[31] = 26'h1851fff;
    stim[32] = 26'h07be04c;
    stim[33] = 26'h123cb62;
    stim[34] = 26'h18f89d4;
    stim[35] = 26'h1306137;
    stim[36] = 26'h13b898c;
    stim[37] = 26'h03fb0fb;
    stim[38] = 26'h120f264;
    stim[39] = 26'h0ae36f8;
    stim[40] = 26'h106609a;
    stim[41] = 26'h014a7ed;
    stim[42] = 26'h109b790;
    stim[43] = 26'h12fc385;
    stim[44] = 26'h1867e35;
    stim[45] = 26'h14a6769;
    stim[46] = 26'h0430937;
    stim[47] = 26'h00e4ca3;
    stim[48] = 26'h166ec7f;
    stim[49] = 26'h1a362f0;
    stim[50] = 26'h14c81fa;
    stim[51] = 26'h0c69d2b;
    stim[52] = 26'h1f64cba;
    stim[53] = 26'h055447e;
    stim[54] = 26'h1b14a43;
    stim[55] = 26'h1a95f05;
    stim[56] = 26'h0262f70;
    stim[57] = 26'h164a943;
    stim[58] = 26'h33c015e;
    stim[59] = 26'h19b19ee;
    stim[60] = 26'h011bb03;
    stim[61] = 26'h24b4217;
    stim[62] = 26'h07cdf9d;
    stim[63] = 26'h199758a;
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
      expv[5] = 17'h00001;
      expv[6] = 17'h00001;
      expv[7] = 17'h00001;
      expv[8] = 17'h00001;
      expv[9] = 17'h00001;
      expv[10] = 17'h00001;
      expv[11] = 17'h00001;
      expv[12] = 17'h00001;
      expv[13] = 17'h00001;
      expv[14] = 17'h00001;
      expv[15] = 17'h00001;
      expv[16] = 17'h00001;
      expv[17] = 17'h00001;
      expv[18] = 17'h00001;
      expv[19] = 17'h00001;
      expv[20] = 17'h00001;
      expv[21] = 17'h00001;
      expv[22] = 17'h00001;
      expv[23] = 17'h00001;
      expv[24] = 17'h00001;
      expv[25] = 17'h00001;
      expv[26] = 17'h00001;
      expv[27] = 17'h00001;
      expv[28] = 17'h00001;
      expv[29] = 17'h00001;
      expv[30] = 17'h00001;
      expv[31] = 17'h00001;
      expv[32] = 17'h00001;
      expv[33] = 17'h00001;
      expv[34] = 17'h00001;
      expv[35] = 17'h00001;
      expv[36] = 17'h00001;
      expv[37] = 17'h00001;
      expv[38] = 17'h00001;
      expv[39] = 17'h00001;
      expv[40] = 17'h00001;
      expv[41] = 17'h00001;
      expv[42] = 17'h00001;
      expv[43] = 17'h00001;
      expv[44] = 17'h00001;
      expv[45] = 17'h00001;
      expv[46] = 17'h00001;
      expv[47] = 17'h00001;
      expv[48] = 17'h00001;
      expv[49] = 17'h00001;
      expv[50] = 17'h00001;
      expv[51] = 17'h00001;
      expv[52] = 17'h00001;
      expv[53] = 17'h00001;
      expv[54] = 17'h00001;
      expv[55] = 17'h00001;
      expv[56] = 17'h00001;
      expv[57] = 17'h00001;
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
