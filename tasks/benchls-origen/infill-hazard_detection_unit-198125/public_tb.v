// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_198125 dut (
    .PCSrc_i(in_vec[16:16]),
    .EX_MemRead_i(in_vec[15:15]),
    .IFID_RSRT_i(in_vec[14:5]),
    .IDEX_RT_i(in_vec[4:0]),
    .PCWrite_o(out_vec[4:4]),
    .IFIDStall_o(out_vec[3:3]),
    .IFFlush_o(out_vec[2:2]),
    .IDFlush_o(out_vec[1:1]),
    .EXFlush_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h1392a;
    stim[1] = 17'h014aa;
    stim[2] = 17'h0867a;
    stim[3] = 17'h186ef;
    stim[4] = 17'h0b6a9;
    stim[5] = 17'h07ea2;
    stim[6] = 17'h03087;
    stim[7] = 17'h093bc;
    stim[8] = 17'h03a0c;
    stim[9] = 17'h04329;
    stim[10] = 17'h0d330;
    stim[11] = 17'h108f2;
    stim[12] = 17'h09847;
    stim[13] = 17'h01928;
    stim[14] = 17'h0b9e5;
    stim[15] = 17'h0f408;
    stim[16] = 17'h19dae;
    stim[17] = 17'h1c5de;
    stim[18] = 17'h1c633;
    stim[19] = 17'h050e7;
    stim[20] = 17'h01be8;
    stim[21] = 17'h07344;
    stim[22] = 17'h1ec84;
    stim[23] = 17'h1a900;
    stim[24] = 17'h1cc23;
    stim[25] = 17'h0e4b3;
    stim[26] = 17'h1234b;
    stim[27] = 17'h0dc9f;
    stim[28] = 17'h04f5a;
    stim[29] = 17'h11710;
    stim[30] = 17'h12c6b;
    stim[31] = 17'h19b89;
    stim[32] = 17'h07391;
    stim[33] = 17'h00557;
    stim[34] = 17'h08eea;
    stim[35] = 17'h05e1a;
    stim[36] = 17'h0a360;
    stim[37] = 17'h0f564;
    stim[38] = 17'h09a22;
    stim[39] = 17'h086fa;
    stim[40] = 17'h0f059;
    stim[41] = 17'h08d39;
    stim[42] = 17'h10f23;
    stim[43] = 17'h1d259;
    stim[44] = 17'h10580;
    stim[45] = 17'h19ec6;
    stim[46] = 17'h0585b;
    stim[47] = 17'h1ceb1;
    stim[48] = 17'h170e0;
    stim[49] = 17'h0a703;
    stim[50] = 17'h15c3d;
    stim[51] = 17'h09d64;
    stim[52] = 17'h0efed;
    stim[53] = 17'h19222;
    stim[54] = 17'h12b8e;
    stim[55] = 17'h124fc;
    stim[56] = 17'h1c775;
    stim[57] = 17'h1fae9;
    stim[58] = 17'h180a5;
    stim[59] = 17'h16954;
    stim[60] = 17'h0c7d2;
    stim[61] = 17'h03cbf;
    stim[62] = 17'h00604;
    stim[63] = 17'h16a97;
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
      expv[0] = 5'h17;
      expv[1] = 5'h10;
      expv[2] = 5'h10;
      expv[3] = 5'h17;
      expv[4] = 5'h10;
      expv[5] = 5'h10;
      expv[6] = 5'h10;
      expv[7] = 5'h10;
      expv[8] = 5'h10;
      expv[9] = 5'h10;
      expv[10] = 5'h10;
      expv[11] = 5'h17;
      expv[12] = 5'h10;
      expv[13] = 5'h10;
      expv[14] = 5'h10;
      expv[15] = 5'h10;
      expv[16] = 5'h17;
      expv[17] = 5'h17;
      expv[18] = 5'h17;
      expv[19] = 5'h10;
      expv[20] = 5'h10;
      expv[21] = 5'h10;
      expv[22] = 5'h17;
      expv[23] = 5'h17;
      expv[24] = 5'h17;
      expv[25] = 5'h10;
      expv[26] = 5'h17;
      expv[27] = 5'h10;
      expv[28] = 5'h10;
      expv[29] = 5'h17;
      expv[30] = 5'h17;
      expv[31] = 5'h17;
      expv[32] = 5'h10;
      expv[33] = 5'h10;
      expv[34] = 5'h10;
      expv[35] = 5'h10;
      expv[36] = 5'h10;
      expv[37] = 5'h10;
      expv[38] = 5'h10;
      expv[39] = 5'h10;
      expv[40] = 5'h10;
      expv[41] = 5'h10;
      expv[42] = 5'h17;
      expv[43] = 5'h17;
      expv[44] = 5'h17;
      expv[45] = 5'h17;
      expv[46] = 5'h10;
      expv[47] = 5'h17;
      expv[48] = 5'h17;
      expv[49] = 5'h10;
      expv[50] = 5'h17;
      expv[51] = 5'h10;
      expv[52] = 5'h10;
      expv[53] = 5'h17;
      expv[54] = 5'h17;
      expv[55] = 5'h17;
      expv[56] = 5'h17;
      expv[57] = 5'h17;
      expv[58] = 5'h17;
      expv[59] = 5'h17;
      expv[60] = 5'h10;
      expv[61] = 5'h10;
      expv[62] = 5'h10;
      expv[63] = 5'h17;
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
