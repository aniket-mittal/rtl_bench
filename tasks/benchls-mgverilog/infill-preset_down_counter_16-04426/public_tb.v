// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 19;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04426 dut (
    .Clk_i(clk),
    .Reset_n_i(in_vec[18:18]),
    .Preset_i(in_vec[17:17]),
    .Enable_i(in_vec[16:16]),
    .PresetVal_i(in_vec[15:0]),
    .Zero_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 19'h22fcd;
    stim[1] = 19'h7f6d7;
    stim[2] = 19'h48c23;
    stim[3] = 19'h1bf10;
    stim[4] = 19'h0f666;
    stim[5] = 19'h09512;
    stim[6] = 19'h4d8b2;
    stim[7] = 19'h4483d;
    stim[8] = 19'h58a42;
    stim[9] = 19'h14f6e;
    stim[10] = 19'h49c66;
    stim[11] = 19'h0f61a;
    stim[12] = 19'h161ff;
    stim[13] = 19'h1008a;
    stim[14] = 19'h51701;
    stim[15] = 19'h507af;
    stim[16] = 19'h02bcf;
    stim[17] = 19'h17e40;
    stim[18] = 19'h45b50;
    stim[19] = 19'h58861;
    stim[20] = 19'h123ff;
    stim[21] = 19'h54377;
    stim[22] = 19'h5238c;
    stim[23] = 19'h4ca93;
    stim[24] = 19'h410b4;
    stim[25] = 19'h1464f;
    stim[26] = 19'h0873c;
    stim[27] = 19'h41b1b;
    stim[28] = 19'h002b6;
    stim[29] = 19'h5f992;
    stim[30] = 19'h5e046;
    stim[31] = 19'h673ef;
    stim[32] = 19'h4333b;
    stim[33] = 19'h01735;
    stim[34] = 19'h13fee;
    stim[35] = 19'h5e999;
    stim[36] = 19'h02652;
    stim[37] = 19'h08c6d;
    stim[38] = 19'h08eaf;
    stim[39] = 19'h4f959;
    stim[40] = 19'h59e9b;
    stim[41] = 19'h11f2e;
    stim[42] = 19'h38436;
    stim[43] = 19'h53a05;
    stim[44] = 19'h44d75;
    stim[45] = 19'h0aedd;
    stim[46] = 19'h079f9;
    stim[47] = 19'h408c6;
    stim[48] = 19'h55c01;
    stim[49] = 19'h47a64;
    stim[50] = 19'h08d31;
    stim[51] = 19'h48197;
    stim[52] = 19'h49a57;
    stim[53] = 19'h002b3;
    stim[54] = 19'h4d3be;
    stim[55] = 19'h45e74;
    stim[56] = 19'h198c5;
    stim[57] = 19'h5a1fe;
    stim[58] = 19'h47a05;
    stim[59] = 19'h43da1;
    stim[60] = 19'h5c9b3;
    stim[61] = 19'h4b91b;
    stim[62] = 19'h5429b;
    stim[63] = 19'h40614;
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
      expv[0] = 1'h1;
      expv[1] = 1'h1;
      expv[2] = 1'h0;
      expv[3] = 1'h1;
      expv[4] = 1'h1;
      expv[5] = 1'h1;
      expv[6] = 1'h1;
      expv[7] = 1'h1;
      expv[8] = 1'h1;
      expv[9] = 1'h1;
      expv[10] = 1'h1;
      expv[11] = 1'h1;
      expv[12] = 1'h1;
      expv[13] = 1'h1;
      expv[14] = 1'h1;
      expv[15] = 1'h0;
      expv[16] = 1'h1;
      expv[17] = 1'h1;
      expv[18] = 1'h1;
      expv[19] = 1'h1;
      expv[20] = 1'h1;
      expv[21] = 1'h1;
      expv[22] = 1'h0;
      expv[23] = 1'h0;
      expv[24] = 1'h0;
      expv[25] = 1'h1;
      expv[26] = 1'h1;
      expv[27] = 1'h1;
      expv[28] = 1'h1;
      expv[29] = 1'h1;
      expv[30] = 1'h0;
      expv[31] = 1'h0;
      expv[32] = 1'h0;
      expv[33] = 1'h1;
      expv[34] = 1'h1;
      expv[35] = 1'h1;
      expv[36] = 1'h1;
      expv[37] = 1'h1;
      expv[38] = 1'h1;
      expv[39] = 1'h1;
      expv[40] = 1'h1;
      expv[41] = 1'h1;
      expv[42] = 1'h1;
      expv[43] = 1'h1;
      expv[44] = 1'h0;
      expv[45] = 1'h1;
      expv[46] = 1'h1;
      expv[47] = 1'h1;
      expv[48] = 1'h1;
      expv[49] = 1'h0;
      expv[50] = 1'h1;
      expv[51] = 1'h1;
      expv[52] = 1'h1;
      expv[53] = 1'h1;
      expv[54] = 1'h1;
      expv[55] = 1'h1;
      expv[56] = 1'h1;
      expv[57] = 1'h1;
      expv[58] = 1'h0;
      expv[59] = 1'h0;
      expv[60] = 1'h0;
      expv[61] = 1'h0;
      expv[62] = 1'h0;
      expv[63] = 1'h0;
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
