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

  rtlpp_10999 dut (
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
    stim[0] = 22'h24c56a;
    stim[1] = 22'h113369;
    stim[2] = 22'h126b9f;
    stim[3] = 22'h3fddb9;
    stim[4] = 22'h262652;
    stim[5] = 22'h3a17c1;
    stim[6] = 22'h33adde;
    stim[7] = 22'h33b3cb;
    stim[8] = 22'h0e02f2;
    stim[9] = 22'h3e2938;
    stim[10] = 22'h1f035c;
    stim[11] = 22'h3f2930;
    stim[12] = 22'h13442d;
    stim[13] = 22'h17669e;
    stim[14] = 22'h2e6223;
    stim[15] = 22'h177c66;
    stim[16] = 22'h3f302f;
    stim[17] = 22'h32e350;
    stim[18] = 22'h1bfa4f;
    stim[19] = 22'h3a74f1;
    stim[20] = 22'h3a4e51;
    stim[21] = 22'h2ac48a;
    stim[22] = 22'h222126;
    stim[23] = 22'h071179;
    stim[24] = 22'h2bcffa;
    stim[25] = 22'h1b66a5;
    stim[26] = 22'h075956;
    stim[27] = 22'h034978;
    stim[28] = 22'h1791ad;
    stim[29] = 22'h2e585e;
    stim[30] = 22'h2b0cf8;
    stim[31] = 22'h0f1b83;
    stim[32] = 22'h071478;
    stim[33] = 22'h363c42;
    stim[34] = 22'h02d948;
    stim[35] = 22'h2b04e4;
    stim[36] = 22'h0f4dec;
    stim[37] = 22'h0fb542;
    stim[38] = 22'h2e2f4d;
    stim[39] = 22'h2e9b10;
    stim[40] = 22'h0629e0;
    stim[41] = 22'h3ae88e;
    stim[42] = 22'h1eaf78;
    stim[43] = 22'h1bdcb1;
    stim[44] = 22'h0aacfa;
    stim[45] = 22'h1a1ae2;
    stim[46] = 22'h36751b;
    stim[47] = 22'h2bcafa;
    stim[48] = 22'h22bb08;
    stim[49] = 22'h025863;
    stim[50] = 22'h2b8d0e;
    stim[51] = 22'h1f1956;
    stim[52] = 22'h134495;
    stim[53] = 22'h13f530;
    stim[54] = 22'h1eb69b;
    stim[55] = 22'h2a8446;
    stim[56] = 22'h1b750e;
    stim[57] = 22'h3aca81;
    stim[58] = 22'h0bb206;
    stim[59] = 22'h2f0a22;
    stim[60] = 22'h228036;
    stim[61] = 22'h232419;
    stim[62] = 22'h321ae9;
    stim[63] = 22'h061260;
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
      expv[3] = 17'h0c34f;
      expv[4] = 17'h00000;
      expv[5] = 17'h00000;
      expv[6] = 17'h00000;
      expv[7] = 17'h00000;
      expv[8] = 17'h00000;
      expv[9] = 17'h00000;
      expv[10] = 17'h00000;
      expv[11] = 17'h00000;
      expv[12] = 17'h00000;
      expv[13] = 17'h0c34f;
      expv[14] = 17'h0c34f;
      expv[15] = 17'h00000;
      expv[16] = 17'h0c34f;
      expv[17] = 17'h00000;
      expv[18] = 17'h00000;
      expv[19] = 17'h00000;
      expv[20] = 17'h00000;
      expv[21] = 17'h00000;
      expv[22] = 17'h00000;
      expv[23] = 17'h0c34f;
      expv[24] = 17'h00000;
      expv[25] = 17'h00000;
      expv[26] = 17'h00000;
      expv[27] = 17'h00000;
      expv[28] = 17'h00000;
      expv[29] = 17'h0c34f;
      expv[30] = 17'h00000;
      expv[31] = 17'h00000;
      expv[32] = 17'h00002;
      expv[33] = 17'h00000;
      expv[34] = 17'h00000;
      expv[35] = 17'h00000;
      expv[36] = 17'h00000;
      expv[37] = 17'h00002;
      expv[38] = 17'h00002;
      expv[39] = 17'h00000;
      expv[40] = 17'h00000;
      expv[41] = 17'h00000;
      expv[42] = 17'h00000;
      expv[43] = 17'h00000;
      expv[44] = 17'h0af78;
      expv[45] = 17'h00002;
      expv[46] = 17'h0af78;
      expv[47] = 17'h00000;
      expv[48] = 17'h00000;
      expv[49] = 17'h0c34f;
      expv[50] = 17'h00000;
      expv[51] = 17'h00000;
      expv[52] = 17'h0af78;
      expv[53] = 17'h0c34f;
      expv[54] = 17'h0c34f;
      expv[55] = 17'h0af78;
      expv[56] = 17'h00000;
      expv[57] = 17'h0b69b;
      expv[58] = 17'h00000;
      expv[59] = 17'h00002;
      expv[60] = 17'h00000;
      expv[61] = 17'h0c34f;
      expv[62] = 17'h0c34f;
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
