// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 18;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_11650 dut (
    .clk(clk),
    .rst(in_vec[17:17]),
    .idata(in_vec[16:9]),
    .ivalid(in_vec[8:8]),
    .strobe(in_vec[7:0]),
    .odata(out_vec[8:1]),
    .ovalid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 18'h23b6f;
    stim[1] = 18'h3498d;
    stim[2] = 18'h107aa;
    stim[3] = 18'h0a0be;
    stim[4] = 18'h16838;
    stim[5] = 18'h0ca7b;
    stim[6] = 18'h1c4ab;
    stim[7] = 18'h062d7;
    stim[8] = 18'h163e9;
    stim[9] = 18'h189d2;
    stim[10] = 18'h1afe5;
    stim[11] = 18'h1dff4;
    stim[12] = 18'h055d5;
    stim[13] = 18'h10f9a;
    stim[14] = 18'h1e0a4;
    stim[15] = 18'h11387;
    stim[16] = 18'h1a2fb;
    stim[17] = 18'h1b913;
    stim[18] = 18'h0fe7d;
    stim[19] = 18'h0dd5e;
    stim[20] = 18'h0c44c;
    stim[21] = 18'h026c1;
    stim[22] = 18'h04063;
    stim[23] = 18'h1ef39;
    stim[24] = 18'h0693f;
    stim[25] = 18'h1c216;
    stim[26] = 18'h075d2;
    stim[27] = 18'h1c6bc;
    stim[28] = 18'h0a03e;
    stim[29] = 18'h04501;
    stim[30] = 18'h04f01;
    stim[31] = 18'h0961f;
    stim[32] = 18'h1cdb1;
    stim[33] = 18'h36a96;
    stim[34] = 18'h064ee;
    stim[35] = 18'h17618;
    stim[36] = 18'h1c1a6;
    stim[37] = 18'h02b5d;
    stim[38] = 18'h0eeea;
    stim[39] = 18'h15089;
    stim[40] = 18'h12e7f;
    stim[41] = 18'h02cce;
    stim[42] = 18'h1b8c6;
    stim[43] = 18'h0089e;
    stim[44] = 18'h010c4;
    stim[45] = 18'h1211b;
    stim[46] = 18'h07502;
    stim[47] = 18'h0223f;
    stim[48] = 18'h020ff;
    stim[49] = 18'h07ce9;
    stim[50] = 18'h0cc73;
    stim[51] = 18'h10fdc;
    stim[52] = 18'h06f26;
    stim[53] = 18'h1a5d7;
    stim[54] = 18'h15e83;
    stim[55] = 18'h19f65;
    stim[56] = 18'h0720c;
    stim[57] = 18'h0b171;
    stim[58] = 18'h032e8;
    stim[59] = 18'h18bce;
    stim[60] = 18'h1bdbd;
    stim[61] = 18'h17ffc;
    stim[62] = 18'h0a3f9;
    stim[63] = 18'h1c5fa;
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
      expv[0] = 9'hxxx;
      expv[1] = 9'h000;
      expv[2] = 9'h000;
      expv[3] = 9'h001;
      expv[4] = 9'h107;
      expv[5] = 9'h107;
      expv[6] = 9'h107;
      expv[7] = 9'h107;
      expv[8] = 9'h107;
      expv[9] = 9'h107;
      expv[10] = 9'h163;
      expv[11] = 9'h189;
      expv[12] = 9'h1af;
      expv[13] = 9'h1df;
      expv[14] = 9'h055;
      expv[15] = 9'h10f;
      expv[16] = 9'h10f;
      expv[17] = 9'h113;
      expv[18] = 9'h113;
      expv[19] = 9'h1c7;
      expv[20] = 9'h1c7;
      expv[21] = 9'h1b9;
      expv[22] = 9'h1b9;
      expv[23] = 9'h1b9;
      expv[24] = 9'h1bb;
      expv[25] = 9'h1b9;
      expv[26] = 9'h1a7;
      expv[27] = 9'h1a1;
      expv[28] = 9'h075;
      expv[29] = 9'h075;
      expv[30] = 9'h075;
      expv[31] = 9'h027;
      expv[32] = 9'h14b;
      expv[33] = 9'h1e7;
      expv[34] = 9'h1cc;
      expv[35] = 9'h000;
      expv[36] = 9'h000;
      expv[37] = 9'h001;
      expv[38] = 9'h1c1;
      expv[39] = 9'h055;
      expv[40] = 9'h057;
      expv[41] = 9'h057;
      expv[42] = 9'h055;
      expv[43] = 9'h057;
      expv[44] = 9'h055;
      expv[45] = 9'h055;
      expv[46] = 9'h057;
      expv[47] = 9'h103;
      expv[48] = 9'h109;
      expv[49] = 9'h109;
      expv[50] = 9'h11f;
      expv[51] = 9'h133;
      expv[52] = 9'h143;
      expv[53] = 9'h10f;
      expv[54] = 9'h1bf;
      expv[55] = 9'h1a5;
      expv[56] = 9'h1a5;
      expv[57] = 9'h13d;
      expv[58] = 9'h13d;
      expv[59] = 9'h161;
      expv[60] = 9'h163;
      expv[61] = 9'h18b;
      expv[62] = 9'h1bd;
      expv[63] = 9'h17f;
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
