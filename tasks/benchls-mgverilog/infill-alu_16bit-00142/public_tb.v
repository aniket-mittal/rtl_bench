// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 37;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_00142 dut (
    .ctrl(in_vec[36:32]),
    .data_in_A(in_vec[31:16]),
    .data_in_B(in_vec[15:0]),
    .data_out(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 37'h05e2b1345c;
    stim[1] = 37'h12d4918d6b;
    stim[2] = 37'h19b0b44d78;
    stim[3] = 37'h1e39f0d7fc;
    stim[4] = 37'h1bf89565a0;
    stim[5] = 37'h1c29b8032c;
    stim[6] = 37'h19fa3d19e4;
    stim[7] = 37'h1688103938;
    stim[8] = 37'h1a35bf748f;
    stim[9] = 37'h1f4cd59be3;
    stim[10] = 37'h18932e8e63;
    stim[11] = 37'h1662257744;
    stim[12] = 37'h1aa0d87c3d;
    stim[13] = 37'h1eac019076;
    stim[14] = 37'h17483f301d;
    stim[15] = 37'h176607399a;
    stim[16] = 37'h065687bbd4;
    stim[17] = 37'h0bb61b8bbe;
    stim[18] = 37'h0a304c3fbc;
    stim[19] = 37'h1168de5fd4;
    stim[20] = 37'h060a76c8df;
    stim[21] = 37'h04a0e59502;
    stim[22] = 37'h107fda2632;
    stim[23] = 37'h0fb885a904;
    stim[24] = 37'h1113f1e371;
    stim[25] = 37'h1a0b55b4a0;
    stim[26] = 37'h1a9221252c;
    stim[27] = 37'h19f9ef2358;
    stim[28] = 37'h1a5b7bebbb;
    stim[29] = 37'h11ad83d578;
    stim[30] = 37'h1ae3bc1466;
    stim[31] = 37'h0c47cd3674;
    stim[32] = 37'h0b13d7686c;
    stim[33] = 37'h19347ed91f;
    stim[34] = 37'h157f4c5631;
    stim[35] = 37'h14dd55f89d;
    stim[36] = 37'h0dbe5fa18a;
    stim[37] = 37'h044f777329;
    stim[38] = 37'h09b2ee125c;
    stim[39] = 37'h0e96272f22;
    stim[40] = 37'h009df6cdc6;
    stim[41] = 37'h0578cdd195;
    stim[42] = 37'h004875b5e6;
    stim[43] = 37'h0547aa61fe;
    stim[44] = 37'h1ef41bc12c;
    stim[45] = 37'h1d8e3447e4;
    stim[46] = 37'h180572abe1;
    stim[47] = 37'h19f9e846a2;
    stim[48] = 37'h1f00828d50;
    stim[49] = 37'h17831dd619;
    stim[50] = 37'h11d9e707c4;
    stim[51] = 37'h0ff18cbdb3;
    stim[52] = 37'h04be9c0371;
    stim[53] = 37'h0ffc9c7557;
    stim[54] = 37'h046569ce6f;
    stim[55] = 37'h0d6fe623f4;
    stim[56] = 37'h1d8a2c52a5;
    stim[57] = 37'h1aa477089e;
    stim[58] = 37'h17a2e7168b;
    stim[59] = 37'h181889b127;
    stim[60] = 37'h0cfc8a1814;
    stim[61] = 37'h1d4df80cab;
    stim[62] = 37'h07a7e943ad;
    stim[63] = 37'h08de14e0cb;
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
      expv[0] = 16'hf6fd;
      expv[1] = 16'h0001;
      expv[2] = 16'h0001;
      expv[3] = 16'h0000;
      expv[4] = 16'h0001;
      expv[5] = 16'h0000;
      expv[6] = 16'h0001;
      expv[7] = 16'h0001;
      expv[8] = 16'h0001;
      expv[9] = 16'h0000;
      expv[10] = 16'h0001;
      expv[11] = 16'h0001;
      expv[12] = 16'h0001;
      expv[13] = 16'h0001;
      expv[14] = 16'h0000;
      expv[15] = 16'h0000;
      expv[16] = 16'ha978;
      expv[17] = 16'h0000;
      expv[18] = 16'h0000;
      expv[19] = 16'h0000;
      expv[20] = 16'hf589;
      expv[21] = 16'h8000;
      expv[22] = 16'h0000;
      expv[23] = 16'h0000;
      expv[24] = 16'h0000;
      expv[25] = 16'h0000;
      expv[26] = 16'h0001;
      expv[27] = 16'h0001;
      expv[28] = 16'h0000;
      expv[29] = 16'h0000;
      expv[30] = 16'h0001;
      expv[31] = 16'h0000;
      expv[32] = 16'h0000;
      expv[33] = 16'h0000;
      expv[34] = 16'h0000;
      expv[35] = 16'h0000;
      expv[36] = 16'h0000;
      expv[37] = 16'h4321;
      expv[38] = 16'h0000;
      expv[39] = 16'h0000;
      expv[40] = 16'h9df6;
      expv[41] = 16'hf9dd;
      expv[42] = 16'h4875;
      expv[43] = 16'h67fe;
      expv[44] = 16'h0001;
      expv[45] = 16'h0001;
      expv[46] = 16'h0000;
      expv[47] = 16'h0001;
      expv[48] = 16'h0000;
      expv[49] = 16'h0000;
      expv[50] = 16'h0001;
      expv[51] = 16'h0000;
      expv[52] = 16'h0210;
      expv[53] = 16'h0000;
      expv[54] = 16'h4469;
      expv[55] = 16'h0000;
      expv[56] = 16'h0001;
      expv[57] = 16'h0001;
      expv[58] = 16'h0001;
      expv[59] = 16'h0000;
      expv[60] = 16'h0000;
      expv[61] = 16'h0000;
      expv[62] = 16'he444;
      expv[63] = 16'h0001;
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
