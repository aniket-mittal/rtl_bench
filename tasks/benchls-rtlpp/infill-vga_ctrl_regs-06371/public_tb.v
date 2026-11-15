// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 22;
  localparam OW = 35;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_06371 dut (
    .Clock(clk),
    .Reset_L(in_vec[21:21]),
    .CPU_Enable(in_vec[20:20]),
    .Address(in_vec[19:8]),
    .Data(in_vec[7:0]),
    .ocrx(out_vec[34:27]),
    .ocry(out_vec[26:19]),
    .octl(out_vec[18:11]),
    .WEA(out_vec[10:10]),
    .WEB(out_vec[9:9]),
    .VGABLANKING_L(out_vec[8:8]),
    .dataB(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 22'h29378e;
    stim[1] = 22'h2e53da;
    stim[2] = 22'h13b7b5;
    stim[3] = 22'h196dbd;
    stim[4] = 22'h08236b;
    stim[5] = 22'h0c1868;
    stim[6] = 22'h04e808;
    stim[7] = 22'h19f5af;
    stim[8] = 22'h131121;
    stim[9] = 22'h077a96;
    stim[10] = 22'h049e4e;
    stim[11] = 22'h1aee82;
    stim[12] = 22'h131548;
    stim[13] = 22'h1be996;
    stim[14] = 22'h140b5f;
    stim[15] = 22'h170b75;
    stim[16] = 22'h1fb37c;
    stim[17] = 22'h0dde4e;
    stim[18] = 22'h1661af;
    stim[19] = 22'h1d6079;
    stim[20] = 22'h0334a5;
    stim[21] = 22'h0960c1;
    stim[22] = 22'h0c597e;
    stim[23] = 22'h117966;
    stim[24] = 22'h064d38;
    stim[25] = 22'h039497;
    stim[26] = 22'h1edc6f;
    stim[27] = 22'h0e51a0;
    stim[28] = 22'h0e04f3;
    stim[29] = 22'h1ffb64;
    stim[30] = 22'h0a42e4;
    stim[31] = 22'h11710b;
    stim[32] = 22'h19e2eb;
    stim[33] = 22'h039956;
    stim[34] = 22'h119c95;
    stim[35] = 22'h19cdee;
    stim[36] = 22'h17b5b1;
    stim[37] = 22'h1525aa;
    stim[38] = 22'h004bf8;
    stim[39] = 22'h12f9aa;
    stim[40] = 22'h1d1add;
    stim[41] = 22'h08f1a4;
    stim[42] = 22'h1811b0;
    stim[43] = 22'h02c6c4;
    stim[44] = 22'h1f80f0;
    stim[45] = 22'h0c685c;
    stim[46] = 22'h01117a;
    stim[47] = 22'h053850;
    stim[48] = 22'h1d6356;
    stim[49] = 22'h1a90c1;
    stim[50] = 22'h039cd0;
    stim[51] = 22'h167fd9;
    stim[52] = 22'h034e24;
    stim[53] = 22'h142b19;
    stim[54] = 22'h1a5e23;
    stim[55] = 22'h12d18f;
    stim[56] = 22'h16718f;
    stim[57] = 22'h0befa3;
    stim[58] = 22'h140093;
    stim[59] = 22'h164090;
    stim[60] = 22'h1e60bb;
    stim[61] = 22'h154f7e;
    stim[62] = 22'h17f596;
    stim[63] = 22'h00c127;
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
      expv[0] = 35'hxxxxxxxxx;
      expv[1] = 35'h140a7a900;
      expv[2] = 35'h140a7a900;
      expv[3] = 35'h140a7a900;
      expv[4] = 35'h140a7a900;
      expv[5] = 35'h140a7a900;
      expv[6] = 35'h140a7a900;
      expv[7] = 35'h140a7a900;
      expv[8] = 35'h140a7a900;
      expv[9] = 35'h140a7a900;
      expv[10] = 35'h140a7a900;
      expv[11] = 35'h140a7a900;
      expv[12] = 35'h140a7a900;
      expv[13] = 35'h140a7a900;
      expv[14] = 35'h140a7a900;
      expv[15] = 35'h140a7a900;
      expv[16] = 35'h140a7a900;
      expv[17] = 35'h140a7a900;
      expv[18] = 35'h140a7a900;
      expv[19] = 35'h140a7a900;
      expv[20] = 35'h140a7a900;
      expv[21] = 35'h140a7a900;
      expv[22] = 35'h140a7a900;
      expv[23] = 35'h140a7a900;
      expv[24] = 35'h140a7a900;
      expv[25] = 35'h140a7a900;
      expv[26] = 35'h140a7a900;
      expv[27] = 35'h140a7a900;
      expv[28] = 35'h140a7a900;
      expv[29] = 35'h140a7a900;
      expv[30] = 35'h140a7a900;
      expv[31] = 35'h140a7a900;
      expv[32] = 35'h140a7a900;
      expv[33] = 35'h140a7a900;
      expv[34] = 35'h140a7a900;
      expv[35] = 35'h140a7a900;
      expv[36] = 35'h140a7a900;
      expv[37] = 35'h140a7a900;
      expv[38] = 35'h140a7a900;
      expv[39] = 35'h140a7a900;
      expv[40] = 35'h140a7a900;
      expv[41] = 35'h140a7a900;
      expv[42] = 35'h140a7a900;
      expv[43] = 35'h140a7a900;
      expv[44] = 35'h140a7a900;
      expv[45] = 35'h140a7a900;
      expv[46] = 35'h140a7a900;
      expv[47] = 35'h140a7a900;
      expv[48] = 35'h140a7a900;
      expv[49] = 35'h140a7a900;
      expv[50] = 35'h140a7a900;
      expv[51] = 35'h140a7a900;
      expv[52] = 35'h140a7a900;
      expv[53] = 35'h140a7a900;
      expv[54] = 35'h140a7a900;
      expv[55] = 35'h140a7a900;
      expv[56] = 35'h140a7a900;
      expv[57] = 35'h140a7a900;
      expv[58] = 35'h140a7a900;
      expv[59] = 35'h140a7a900;
      expv[60] = 35'h140a7a900;
      expv[61] = 35'h140a7a900;
      expv[62] = 35'h140a7a900;
      expv[63] = 35'h140a7a900;
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
