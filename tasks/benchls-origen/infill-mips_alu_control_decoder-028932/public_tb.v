// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_028932 dut (
    .op(in_vec[31:0]),
    .aluOp(out_vec[15:14]),
    .aluCtrl(out_vec[13:10]),
    .outcalc(out_vec[9:8]),
    .ina(out_vec[7:7]),
    .inb(out_vec[6:6]),
    .writein(out_vec[5:5]),
    .shiftsign(out_vec[4:4]),
    .extend(out_vec[3:3]),
    .luisign(out_vec[2:2]),
    .sign(out_vec[1:1]),
    .signslt(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'hd65be2bf;
    stim[1] = 32'he45195d3;
    stim[2] = 32'hd838e2a6;
    stim[3] = 32'h9c50d322;
    stim[4] = 32'h4ea48f95;
    stim[5] = 32'hf9784b14;
    stim[6] = 32'h34a3080c;
    stim[7] = 32'h49392d43;
    stim[8] = 32'haaef3fda;
    stim[9] = 32'h18aaa4df;
    stim[10] = 32'he0690e78;
    stim[11] = 32'h3649af1b;
    stim[12] = 32'hb5e4f1fb;
    stim[13] = 32'h8e46ad1a;
    stim[14] = 32'h839753de;
    stim[15] = 32'h60386694;
    stim[16] = 32'h1faf8854;
    stim[17] = 32'h946194a6;
    stim[18] = 32'h2b6769a6;
    stim[19] = 32'h554753c5;
    stim[20] = 32'haff2bf2f;
    stim[21] = 32'h497a20b2;
    stim[22] = 32'h31e31998;
    stim[23] = 32'h24b775ae;
    stim[24] = 32'h542ae9a2;
    stim[25] = 32'h66ce19a9;
    stim[26] = 32'hfdde1dba;
    stim[27] = 32'h3c7398ba;
    stim[28] = 32'hfc075e4f;
    stim[29] = 32'hf00fb986;
    stim[30] = 32'h07e79216;
    stim[31] = 32'h3e38375a;
    stim[32] = 32'h7e7a5bb5;
    stim[33] = 32'h73c776b1;
    stim[34] = 32'h75f5eaed;
    stim[35] = 32'h315b4fc3;
    stim[36] = 32'h0d9a46ba;
    stim[37] = 32'h748cfd66;
    stim[38] = 32'h9bf7f700;
    stim[39] = 32'ha21d017e;
    stim[40] = 32'hf6eece16;
    stim[41] = 32'h2e4c4a50;
    stim[42] = 32'h3e966b4d;
    stim[43] = 32'h39ddbd6b;
    stim[44] = 32'hd3e7d8e4;
    stim[45] = 32'h4273a11e;
    stim[46] = 32'h27c1261b;
    stim[47] = 32'h454177a9;
    stim[48] = 32'h7d749061;
    stim[49] = 32'h21c145e7;
    stim[50] = 32'h6895f86d;
    stim[51] = 32'hdadc2858;
    stim[52] = 32'h31f48555;
    stim[53] = 32'h323c6c15;
    stim[54] = 32'h92dbcabd;
    stim[55] = 32'h90334f5e;
    stim[56] = 32'hc8cf07b0;
    stim[57] = 32'h04c7b990;
    stim[58] = 32'h9d1a35ca;
    stim[59] = 32'h26857c26;
    stim[60] = 32'h034eb241;
    stim[61] = 32'hb69ea6b4;
    stim[62] = 32'h603922fe;
    stim[63] = 32'h680a50b1;
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
      expv[0] = 16'h4840;
      expv[1] = 16'h4840;
      expv[2] = 16'h4840;
      expv[3] = 16'h4840;
      expv[4] = 16'h4840;
      expv[5] = 16'h4840;
      expv[6] = 16'h4840;
      expv[7] = 16'h4850;
      expv[8] = 16'h4840;
      expv[9] = 16'h4840;
      expv[10] = 16'h4840;
      expv[11] = 16'h4840;
      expv[12] = 16'h4840;
      expv[13] = 16'h4848;
      expv[14] = 16'h4840;
      expv[15] = 16'h4840;
      expv[16] = 16'h4840;
      expv[17] = 16'h4840;
      expv[18] = 16'h4843;
      expv[19] = 16'h4840;
      expv[20] = 16'h4848;
      expv[21] = 16'h4840;
      expv[22] = 16'h4840;
      expv[23] = 16'h4840;
      expv[24] = 16'h4840;
      expv[25] = 16'h4840;
      expv[26] = 16'h4840;
      expv[27] = 16'h48c4;
      expv[28] = 16'h4840;
      expv[29] = 16'h4840;
      expv[30] = 16'h4840;
      expv[31] = 16'h48c4;
      expv[32] = 16'h4840;
      expv[33] = 16'h4840;
      expv[34] = 16'h4840;
      expv[35] = 16'h4850;
      expv[36] = 16'h4840;
      expv[37] = 16'h4840;
      expv[38] = 16'h4840;
      expv[39] = 16'h4840;
      expv[40] = 16'h4840;
      expv[41] = 16'h4842;
      expv[42] = 16'h48c4;
      expv[43] = 16'h4840;
      expv[44] = 16'h4840;
      expv[45] = 16'h4840;
      expv[46] = 16'h4840;
      expv[47] = 16'h4840;
      expv[48] = 16'h4840;
      expv[49] = 16'h4848;
      expv[50] = 16'h4840;
      expv[51] = 16'h4840;
      expv[52] = 16'h4840;
      expv[53] = 16'h4840;
      expv[54] = 16'h4840;
      expv[55] = 16'h4840;
      expv[56] = 16'h4840;
      expv[57] = 16'h4840;
      expv[58] = 16'h4840;
      expv[59] = 16'h4840;
      expv[60] = 16'h8020;
      expv[61] = 16'h4840;
      expv[62] = 16'h4840;
      expv[63] = 16'h4840;
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
