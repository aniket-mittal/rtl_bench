// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 23;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_10841 dut (
    .clk(clk),
    .address(in_vec[22:19]),
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
    stim[0] = 23'h790b16;
    stim[1] = 23'h2023fd;
    stim[2] = 23'h52f498;
    stim[3] = 23'h077180;
    stim[4] = 23'h334fc2;
    stim[5] = 23'h3bc83c;
    stim[6] = 23'h560dd1;
    stim[7] = 23'h2fbdce;
    stim[8] = 23'h1f0fd0;
    stim[9] = 23'h7774f8;
    stim[10] = 23'h5f78e1;
    stim[11] = 23'h2ff74d;
    stim[12] = 23'h27e816;
    stim[13] = 23'h76dbf9;
    stim[14] = 23'h42c817;
    stim[15] = 23'h67f84b;
    stim[16] = 23'h473cde;
    stim[17] = 23'h537b66;
    stim[18] = 23'h1eab79;
    stim[19] = 23'h5ad04e;
    stim[20] = 23'h0f020b;
    stim[21] = 23'h7325ac;
    stim[22] = 23'h6bc573;
    stim[23] = 23'h6a9746;
    stim[24] = 23'h7ba02c;
    stim[25] = 23'h12b019;
    stim[26] = 23'h0bd9fa;
    stim[27] = 23'h32d489;
    stim[28] = 23'h7728d0;
    stim[29] = 23'h03612c;
    stim[30] = 23'h7bd714;
    stim[31] = 23'h6e798a;
    stim[32] = 23'h0a25b3;
    stim[33] = 23'h7fcf56;
    stim[34] = 23'h574612;
    stim[35] = 23'h3aa14f;
    stim[36] = 23'h1ef82a;
    stim[37] = 23'h3bea42;
    stim[38] = 23'h3ae806;
    stim[39] = 23'h77f9ac;
    stim[40] = 23'h6b7c12;
    stim[41] = 23'h2e0f68;
    stim[42] = 23'h4f62be;
    stim[43] = 23'h3e8d8a;
    stim[44] = 23'h2a14c5;
    stim[45] = 23'h16330e;
    stim[46] = 23'h1efdfd;
    stim[47] = 23'h734720;
    stim[48] = 23'h068f20;
    stim[49] = 23'h72003e;
    stim[50] = 23'h6794f0;
    stim[51] = 23'h7e43ea;
    stim[52] = 23'h0347c2;
    stim[53] = 23'h362e29;
    stim[54] = 23'h53837b;
    stim[55] = 23'h7af7ab;
    stim[56] = 23'h17772e;
    stim[57] = 23'h1be8f4;
    stim[58] = 23'h2b48c5;
    stim[59] = 23'h4f016c;
    stim[60] = 23'h372acc;
    stim[61] = 23'h3f962d;
    stim[62] = 23'h428600;
    stim[63] = 23'h5a7b0e;
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
      expv[5] = 17'h00000;
      expv[6] = 17'h00000;
      expv[7] = 17'h00000;
      expv[8] = 17'h00000;
      expv[9] = 17'h00000;
      expv[10] = 17'h00000;
      expv[11] = 17'h00000;
      expv[12] = 17'h00000;
      expv[13] = 17'h00000;
      expv[14] = 17'h00000;
      expv[15] = 17'h00000;
      expv[16] = 17'h00000;
      expv[17] = 17'h00000;
      expv[18] = 17'h00000;
      expv[19] = 17'h00000;
      expv[20] = 17'h00000;
      expv[21] = 17'h00000;
      expv[22] = 17'h00000;
      expv[23] = 17'h00000;
      expv[24] = 17'h00000;
      expv[25] = 17'h00000;
      expv[26] = 17'h0c34f;
      expv[27] = 17'h00000;
      expv[28] = 17'h00000;
      expv[29] = 17'h00000;
      expv[30] = 17'h00000;
      expv[31] = 17'h00000;
      expv[32] = 17'h00000;
      expv[33] = 17'h00000;
      expv[34] = 17'h00000;
      expv[35] = 17'h00000;
      expv[36] = 17'h00000;
      expv[37] = 17'h0ab79;
      expv[38] = 17'h00000;
      expv[39] = 17'h00000;
      expv[40] = 17'h00000;
      expv[41] = 17'h00000;
      expv[42] = 17'h00000;
      expv[43] = 17'h00000;
      expv[44] = 17'h00000;
      expv[45] = 17'h00f68;
      expv[46] = 17'h0c34f;
      expv[47] = 17'h0f82a;
      expv[48] = 17'h00000;
      expv[49] = 17'h00000;
      expv[50] = 17'h00000;
      expv[51] = 17'h00000;
      expv[52] = 17'h00000;
      expv[53] = 17'h00000;
      expv[54] = 17'h0c34f;
      expv[55] = 17'h00000;
      expv[56] = 17'h00000;
      expv[57] = 17'h0330e;
      expv[58] = 17'h0fdfd;
      expv[59] = 17'h00f68;
      expv[60] = 17'h00f68;
      expv[61] = 17'h0330e;
      expv[62] = 17'h0fdfd;
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
