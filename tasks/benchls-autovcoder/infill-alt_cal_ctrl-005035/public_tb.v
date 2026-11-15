// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 39;
  localparam OW = 44;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_005035 dut (
    .clock(clk),
    .dprio_busy(in_vec[38:38]),
    .dprio_datain(in_vec[37:22]),
    .remap_addr(in_vec[21:10]),
    .reset(in_vec[9:9]),
    .start(in_vec[8:8]),
    .testbuses(in_vec[7:0]),
    .busy(out_vec[43:43]),
    .dprio_addr(out_vec[42:27]),
    .dprio_dataout(out_vec[26:11]),
    .dprio_rden(out_vec[10:10]),
    .dprio_wren(out_vec[9:9]),
    .quad_addr(out_vec[8:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 39'h79e5e0caf9;
    stim[1] = 39'h3593962e8f;
    stim[2] = 39'h18956a99a2;
    stim[3] = 39'h32a6b8a1f4;
    stim[4] = 39'h0efbc0a9c1;
    stim[5] = 39'h0bb37b1462;
    stim[6] = 39'h2f3c055c74;
    stim[7] = 39'h2200d561df;
    stim[8] = 39'h0edef38c97;
    stim[9] = 39'h0b528aa8ce;
    stim[10] = 39'h48c07bc856;
    stim[11] = 39'h68493ebcee;
    stim[12] = 39'h28a4efd900;
    stim[13] = 39'h7dc102497d;
    stim[14] = 39'h2cef8b38fe;
    stim[15] = 39'h6ee2d7ed57;
    stim[16] = 39'h27dad4fd84;
    stim[17] = 39'h7ccd0fc0ed;
    stim[18] = 39'h5e188a75b5;
    stim[19] = 39'h56be68c104;
    stim[20] = 39'h600cf3843d;
    stim[21] = 39'h246b53484f;
    stim[22] = 39'h5520f21114;
    stim[23] = 39'h7479d7516e;
    stim[24] = 39'h5c7e60f0f7;
    stim[25] = 39'h3e41fcd4f1;
    stim[26] = 39'h2b5126c91d;
    stim[27] = 39'h6f47f9d429;
    stim[28] = 39'h17af469c2f;
    stim[29] = 39'h6da79105bd;
    stim[30] = 39'h405b0f3da0;
    stim[31] = 39'h4b7dfedc2b;
    stim[32] = 39'h5eb63bb1cb;
    stim[33] = 39'h029ccf99e8;
    stim[34] = 39'h1a963378ae;
    stim[35] = 39'h56a544c921;
    stim[36] = 39'h135eda8cdb;
    stim[37] = 39'h5d6d4530d6;
    stim[38] = 39'h043529646c;
    stim[39] = 39'h5c1829d849;
    stim[40] = 39'h0d6e76e8ce;
    stim[41] = 39'h0a471b04a6;
    stim[42] = 39'h37bace9932;
    stim[43] = 39'h3625bb81b7;
    stim[44] = 39'h4ae8e74904;
    stim[45] = 39'h5fe637ac4f;
    stim[46] = 39'h34a130c1b1;
    stim[47] = 39'h6873b14146;
    stim[48] = 39'h4734a7f964;
    stim[49] = 39'h71152ded04;
    stim[50] = 39'h689e59dca0;
    stim[51] = 39'h1b16e02db6;
    stim[52] = 39'h31814bcd2c;
    stim[53] = 39'h7cf74cc9fd;
    stim[54] = 39'h1f2b7371ea;
    stim[55] = 39'h0b10e0d537;
    stim[56] = 39'h7991eec1bc;
    stim[57] = 39'h54aae8a40b;
    stim[58] = 39'h417fc3b81b;
    stim[59] = 39'h5468789996;
    stim[60] = 39'h1c7130af88;
    stim[61] = 39'h58ff49a12b;
    stim[62] = 39'h5113ceb49e;
    stim[63] = 39'h4074af684e;
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
      expv[0] = 44'h00000000000;
      expv[1] = 44'h00000000000;
      expv[2] = 44'h80000000000;
      expv[3] = 44'h80000000000;
      expv[4] = 44'h80000000000;
      expv[5] = 44'h80000000000;
      expv[6] = 44'h80000000000;
      expv[7] = 44'h80000000000;
      expv[8] = 44'h80000000000;
      expv[9] = 44'h80000000000;
      expv[10] = 44'h80000000000;
      expv[11] = 44'h80000000000;
      expv[12] = 44'h80000000000;
      expv[13] = 44'h80000000000;
      expv[14] = 44'h80000000000;
      expv[15] = 44'h80000000000;
      expv[16] = 44'h80000000000;
      expv[17] = 44'h80000000000;
      expv[18] = 44'h80000000000;
      expv[19] = 44'h80000000000;
      expv[20] = 44'h80000000000;
      expv[21] = 44'h80000000000;
      expv[22] = 44'h80000000000;
      expv[23] = 44'h80000000000;
      expv[24] = 44'h80000000000;
      expv[25] = 44'h80000000000;
      expv[26] = 44'h80000000000;
      expv[27] = 44'h80000000000;
      expv[28] = 44'h80000000000;
      expv[29] = 44'h80000000000;
      expv[30] = 44'h80000000000;
      expv[31] = 44'h80000000000;
      expv[32] = 44'h80000000000;
      expv[33] = 44'h80000000000;
      expv[34] = 44'h80000000000;
      expv[35] = 44'h80000000000;
      expv[36] = 44'h80000000000;
      expv[37] = 44'h80000000000;
      expv[38] = 44'h80000000000;
      expv[39] = 44'h80000000000;
      expv[40] = 44'h80000000000;
      expv[41] = 44'h80000000000;
      expv[42] = 44'h80000000000;
      expv[43] = 44'h80000000000;
      expv[44] = 44'h80000000000;
      expv[45] = 44'h80000000000;
      expv[46] = 44'h80000000000;
      expv[47] = 44'h80000000000;
      expv[48] = 44'h80000000000;
      expv[49] = 44'h80000000000;
      expv[50] = 44'h80000000000;
      expv[51] = 44'h80000000000;
      expv[52] = 44'h80000000000;
      expv[53] = 44'h80000000000;
      expv[54] = 44'h80000000000;
      expv[55] = 44'h80000000000;
      expv[56] = 44'h80000000000;
      expv[57] = 44'h80000000000;
      expv[58] = 44'h80000000000;
      expv[59] = 44'h80000000000;
      expv[60] = 44'h00000000000;
      expv[61] = 44'h80000000000;
      expv[62] = 44'h80000000000;
      expv[63] = 44'h80000000000;
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
