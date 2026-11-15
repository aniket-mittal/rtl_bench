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

  mg_01529 dut (
    .Clock_in(clk),
    .Write_Enable_in(in_vec[16:16]),
    .Address_in(in_vec[15:8]),
    .Data_in(in_vec[7:0]),
    .Data_out(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h14e74;
    stim[1] = 17'h01589;
    stim[2] = 17'h0e085;
    stim[3] = 17'h11113;
    stim[4] = 17'h1873d;
    stim[5] = 17'h1d144;
    stim[6] = 17'h08274;
    stim[7] = 17'h08e45;
    stim[8] = 17'h0bb30;
    stim[9] = 17'h03308;
    stim[10] = 17'h064c6;
    stim[11] = 17'h01d49;
    stim[12] = 17'h002ed;
    stim[13] = 17'h13682;
    stim[14] = 17'h1224f;
    stim[15] = 17'h12f9f;
    stim[16] = 17'h138ac;
    stim[17] = 17'h0b5d5;
    stim[18] = 17'h1fa55;
    stim[19] = 17'h13706;
    stim[20] = 17'h0f69f;
    stim[21] = 17'h1ccee;
    stim[22] = 17'h1f191;
    stim[23] = 17'h1bbb7;
    stim[24] = 17'h0f2aa;
    stim[25] = 17'h131af;
    stim[26] = 17'h0c025;
    stim[27] = 17'h14148;
    stim[28] = 17'h1f404;
    stim[29] = 17'h11635;
    stim[30] = 17'h18b7e;
    stim[31] = 17'h0b97d;
    stim[32] = 17'h1d27c;
    stim[33] = 17'h139f9;
    stim[34] = 17'h15a4b;
    stim[35] = 17'h08dfc;
    stim[36] = 17'h06883;
    stim[37] = 17'h03963;
    stim[38] = 17'h0f151;
    stim[39] = 17'h075a7;
    stim[40] = 17'h17e0b;
    stim[41] = 17'h12b7d;
    stim[42] = 17'h1f388;
    stim[43] = 17'h1898c;
    stim[44] = 17'h1ed82;
    stim[45] = 17'h0f67c;
    stim[46] = 17'h088c1;
    stim[47] = 17'h076e8;
    stim[48] = 17'h1c55b;
    stim[49] = 17'h16680;
    stim[50] = 17'h1ac99;
    stim[51] = 17'h08bd5;
    stim[52] = 17'h0d61b;
    stim[53] = 17'h0f43a;
    stim[54] = 17'h0bb02;
    stim[55] = 17'h1c2cc;
    stim[56] = 17'h11f46;
    stim[57] = 17'h04911;
    stim[58] = 17'h1ffa7;
    stim[59] = 17'h110de;
    stim[60] = 17'h097f5;
    stim[61] = 17'h0b970;
    stim[62] = 17'h05b50;
    stim[63] = 17'h115f2;
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
      expv[0] = 8'h00;
      expv[1] = 8'h00;
      expv[2] = 8'h00;
      expv[3] = 8'h00;
      expv[4] = 8'h00;
      expv[5] = 8'h00;
      expv[6] = 8'h00;
      expv[7] = 8'h00;
      expv[8] = 8'h00;
      expv[9] = 8'h00;
      expv[10] = 8'h00;
      expv[11] = 8'h00;
      expv[12] = 8'h00;
      expv[13] = 8'h00;
      expv[14] = 8'h00;
      expv[15] = 8'h00;
      expv[16] = 8'h00;
      expv[17] = 8'h00;
      expv[18] = 8'h00;
      expv[19] = 8'h00;
      expv[20] = 8'h00;
      expv[21] = 8'h00;
      expv[22] = 8'h00;
      expv[23] = 8'h00;
      expv[24] = 8'h00;
      expv[25] = 8'h00;
      expv[26] = 8'h00;
      expv[27] = 8'h00;
      expv[28] = 8'h00;
      expv[29] = 8'h00;
      expv[30] = 8'h00;
      expv[31] = 8'h00;
      expv[32] = 8'h00;
      expv[33] = 8'h00;
      expv[34] = 8'h00;
      expv[35] = 8'h00;
      expv[36] = 8'h00;
      expv[37] = 8'hf9;
      expv[38] = 8'h91;
      expv[39] = 8'h00;
      expv[40] = 8'h00;
      expv[41] = 8'h00;
      expv[42] = 8'h00;
      expv[43] = 8'h00;
      expv[44] = 8'h00;
      expv[45] = 8'h00;
      expv[46] = 8'h00;
      expv[47] = 8'h00;
      expv[48] = 8'h00;
      expv[49] = 8'h00;
      expv[50] = 8'h00;
      expv[51] = 8'h7e;
      expv[52] = 8'h00;
      expv[53] = 8'h04;
      expv[54] = 8'hb7;
      expv[55] = 8'h00;
      expv[56] = 8'h00;
      expv[57] = 8'h00;
      expv[58] = 8'h00;
      expv[59] = 8'h00;
      expv[60] = 8'h00;
      expv[61] = 8'h00;
      expv[62] = 8'h00;
      expv[63] = 8'h00;
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
