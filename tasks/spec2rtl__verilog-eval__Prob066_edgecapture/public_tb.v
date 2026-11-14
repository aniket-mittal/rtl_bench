// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  TopModule dut (
    .clk(clk),
    .reset(in_vec[32:32]),
    .in(in_vec[31:0]),
    .out(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h156e7b6d4;
    stim[1] = 33'h1803c7ac0;
    stim[2] = 33'h033387db9;
    stim[3] = 33'h06e5c6016;
    stim[4] = 33'h051e7b5be;
    stim[5] = 33'h062018d34;
    stim[6] = 33'h0fbe8ca8f;
    stim[7] = 33'h0f2afccec;
    stim[8] = 33'h07bb0ee66;
    stim[9] = 33'h069906b4e;
    stim[10] = 33'h0804bdbe8;
    stim[11] = 33'h00ccf4728;
    stim[12] = 33'h0950ac2b5;
    stim[13] = 33'h0feb12c84;
    stim[14] = 33'h0c58d5d4d;
    stim[15] = 33'h0b63cf347;
    stim[16] = 33'h0c36101aa;
    stim[17] = 33'h0f289687d;
    stim[18] = 33'h012d7338c;
    stim[19] = 33'h03ab4646f;
    stim[20] = 33'h0cffc6922;
    stim[21] = 33'h010d816b5;
    stim[22] = 33'h085f1de19;
    stim[23] = 33'h0081a987b;
    stim[24] = 33'h0be3466d9;
    stim[25] = 33'h09be5e1fb;
    stim[26] = 33'h077e2c868;
    stim[27] = 33'h00dba6936;
    stim[28] = 33'h0dc7d1cbc;
    stim[29] = 33'h08ef24d9e;
    stim[30] = 33'h08ea731cc;
    stim[31] = 33'h09a771a47;
    stim[32] = 33'h0e839ce74;
    stim[33] = 33'h0839ac48b;
    stim[34] = 33'h0d577061e;
    stim[35] = 33'h0738fc25a;
    stim[36] = 33'h02e03636a;
    stim[37] = 33'h06789964e;
    stim[38] = 33'h06f729f22;
    stim[39] = 33'h038e7ea3c;
    stim[40] = 33'h0b390666a;
    stim[41] = 33'h0b576b573;
    stim[42] = 33'h07e009d8f;
    stim[43] = 33'h069405793;
    stim[44] = 33'h028fe1114;
    stim[45] = 33'h0c1a90807;
    stim[46] = 33'h0998e6da2;
    stim[47] = 33'h0e58f3111;
    stim[48] = 33'h013a18d2a;
    stim[49] = 33'h008d0019b;
    stim[50] = 33'h0855ff7fe;
    stim[51] = 33'h06baf5fa3;
    stim[52] = 33'h0aae66213;
    stim[53] = 33'h07eb7e558;
    stim[54] = 33'h067f246f5;
    stim[55] = 33'h0c058fdb1;
    stim[56] = 33'h04ab93879;
    stim[57] = 33'h018c75667;
    stim[58] = 33'h0af5040e5;
    stim[59] = 33'h038b11c54;
    stim[60] = 33'h07112f8a4;
    stim[61] = 33'h0acd85ded;
    stim[62] = 33'h0ad848902;
    stim[63] = 33'h0bcf895ae;
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
      expv[0] = 32'hxxxxxxxx;
      expv[1] = 32'h00000000;
      expv[2] = 32'h00000000;
      expv[3] = 32'h80040240;
      expv[4] = 32'h91241fe9;
      expv[5] = 32'hbf3c5fe9;
      expv[6] = 32'hbffe7feb;
      expv[7] = 32'hbfff7ffb;
      expv[8] = 32'hbfff7ffb;
      expv[9] = 32'hbfff7ffb;
      expv[10] = 32'hbffffffb;
      expv[11] = 32'hffffffff;
      expv[12] = 32'hffffffff;
      expv[13] = 32'hffffffff;
      expv[14] = 32'hffffffff;
      expv[15] = 32'hffffffff;
      expv[16] = 32'hffffffff;
      expv[17] = 32'hffffffff;
      expv[18] = 32'hffffffff;
      expv[19] = 32'hffffffff;
      expv[20] = 32'hffffffff;
      expv[21] = 32'hffffffff;
      expv[22] = 32'hffffffff;
      expv[23] = 32'hffffffff;
      expv[24] = 32'hffffffff;
      expv[25] = 32'hffffffff;
      expv[26] = 32'hffffffff;
      expv[27] = 32'hffffffff;
      expv[28] = 32'hffffffff;
      expv[29] = 32'hffffffff;
      expv[30] = 32'hffffffff;
      expv[31] = 32'hffffffff;
      expv[32] = 32'hffffffff;
      expv[33] = 32'hffffffff;
      expv[34] = 32'hffffffff;
      expv[35] = 32'hffffffff;
      expv[36] = 32'hffffffff;
      expv[37] = 32'hffffffff;
      expv[38] = 32'hffffffff;
      expv[39] = 32'hffffffff;
      expv[40] = 32'hffffffff;
      expv[41] = 32'hffffffff;
      expv[42] = 32'hffffffff;
      expv[43] = 32'hffffffff;
      expv[44] = 32'hffffffff;
      expv[45] = 32'hffffffff;
      expv[46] = 32'hffffffff;
      expv[47] = 32'hffffffff;
      expv[48] = 32'hffffffff;
      expv[49] = 32'hffffffff;
      expv[50] = 32'hffffffff;
      expv[51] = 32'hffffffff;
      expv[52] = 32'hffffffff;
      expv[53] = 32'hffffffff;
      expv[54] = 32'hffffffff;
      expv[55] = 32'hffffffff;
      expv[56] = 32'hffffffff;
      expv[57] = 32'hffffffff;
      expv[58] = 32'hffffffff;
      expv[59] = 32'hffffffff;
      expv[60] = 32'hffffffff;
      expv[61] = 32'hffffffff;
      expv[62] = 32'hffffffff;
      expv[63] = 32'hffffffff;
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
