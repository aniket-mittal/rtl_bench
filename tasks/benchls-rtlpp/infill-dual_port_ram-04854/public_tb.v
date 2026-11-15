// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_04854 dut (
    .clk(clk),
    .we(in_vec[16:16]),
    .a(in_vec[15:12]),
    .dpra(in_vec[11:8]),
    .di(in_vec[7:0]),
    .dpo(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h06d8f;
    stim[1] = 17'h1fac3;
    stim[2] = 17'h0bebb;
    stim[3] = 17'h0438f;
    stim[4] = 17'h19b2f;
    stim[5] = 17'h0fb90;
    stim[6] = 17'h10c41;
    stim[7] = 17'h0e9b7;
    stim[8] = 17'h1e1cb;
    stim[9] = 17'h04cb5;
    stim[10] = 17'h08950;
    stim[11] = 17'h0fc3b;
    stim[12] = 17'h11a88;
    stim[13] = 17'h01f4b;
    stim[14] = 17'h16293;
    stim[15] = 17'h14507;
    stim[16] = 17'h0d7c5;
    stim[17] = 17'h1d4fb;
    stim[18] = 17'h09cf0;
    stim[19] = 17'h0b267;
    stim[20] = 17'h15722;
    stim[21] = 17'h16cca;
    stim[22] = 17'h098b4;
    stim[23] = 17'h02e22;
    stim[24] = 17'h1719a;
    stim[25] = 17'h05713;
    stim[26] = 17'h1addc;
    stim[27] = 17'h1b920;
    stim[28] = 17'h16cb1;
    stim[29] = 17'h11508;
    stim[30] = 17'h0fec4;
    stim[31] = 17'h1f93e;
    stim[32] = 17'h02279;
    stim[33] = 17'h15e05;
    stim[34] = 17'h19fbd;
    stim[35] = 17'h0c19f;
    stim[36] = 17'h05cbb;
    stim[37] = 17'h0f3c8;
    stim[38] = 17'h135bd;
    stim[39] = 17'h08dd5;
    stim[40] = 17'h19f28;
    stim[41] = 17'h0c46a;
    stim[42] = 17'h0cdd4;
    stim[43] = 17'h08f5e;
    stim[44] = 17'h18961;
    stim[45] = 17'h02bbc;
    stim[46] = 17'h1c6ff;
    stim[47] = 17'h02830;
    stim[48] = 17'h174b1;
    stim[49] = 17'h10c6e;
    stim[50] = 17'h1ff5a;
    stim[51] = 17'h0b4fc;
    stim[52] = 17'h06bae;
    stim[53] = 17'h10cd6;
    stim[54] = 17'h0f1e2;
    stim[55] = 17'h0c122;
    stim[56] = 17'h1369a;
    stim[57] = 17'h09cf7;
    stim[58] = 17'h09d25;
    stim[59] = 17'h14a55;
    stim[60] = 17'h08192;
    stim[61] = 17'h08b50;
    stim[62] = 17'h1610a;
    stim[63] = 17'h10d51;
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
      expv[0] = 8'hxx;
      expv[1] = 8'hxx;
      expv[2] = 8'hxx;
      expv[3] = 8'hxx;
      expv[4] = 8'hxx;
      expv[5] = 8'hxx;
      expv[6] = 8'hxx;
      expv[7] = 8'hxx;
      expv[8] = 8'h2f;
      expv[9] = 8'hxx;
      expv[10] = 8'hxx;
      expv[11] = 8'h2f;
      expv[12] = 8'hxx;
      expv[13] = 8'hxx;
      expv[14] = 8'hc3;
      expv[15] = 8'hxx;
      expv[16] = 8'hxx;
      expv[17] = 8'hxx;
      expv[18] = 8'h07;
      expv[19] = 8'hxx;
      expv[20] = 8'hxx;
      expv[21] = 8'hxx;
      expv[22] = 8'hxx;
      expv[23] = 8'hxx;
      expv[24] = 8'hcb;
      expv[25] = 8'h88;
      expv[26] = 8'h9a;
      expv[27] = 8'hfb;
      expv[28] = 8'h2f;
      expv[29] = 8'hxx;
      expv[30] = 8'h22;
      expv[31] = 8'hcb;
      expv[32] = 8'h2f;
      expv[33] = 8'hxx;
      expv[34] = 8'hcb;
      expv[35] = 8'h3e;
      expv[36] = 8'h08;
      expv[37] = 8'hxx;
      expv[38] = 8'hxx;
      expv[39] = 8'h05;
      expv[40] = 8'hfb;
      expv[41] = 8'h3e;
      expv[42] = 8'h07;
      expv[43] = 8'hfb;
      expv[44] = 8'h3e;
      expv[45] = 8'h28;
      expv[46] = 8'h20;
      expv[47] = 8'hb1;
      expv[48] = 8'h61;
      expv[49] = 8'h07;
      expv[50] = 8'hff;
      expv[51] = 8'h3e;
      expv[52] = 8'h07;
      expv[53] = 8'h20;
      expv[54] = 8'hff;
      expv[55] = 8'h08;
      expv[56] = 8'h08;
      expv[57] = 8'hb1;
      expv[58] = 8'hff;
      expv[59] = 8'hfb;
      expv[60] = 8'hdc;
      expv[61] = 8'h08;
      expv[62] = 8'h20;
      expv[63] = 8'h08;
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
