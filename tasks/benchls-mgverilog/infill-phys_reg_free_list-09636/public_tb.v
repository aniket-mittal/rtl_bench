// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 19;
  localparam OW = 7;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_09636 dut (
    .clk(clk),
    .PR_old(in_vec[18:13]),
    .RegDest_retire(in_vec[12:12]),
    .retire_reg(in_vec[11:11]),
    .RegDest(in_vec[10:10]),
    .rst(in_vec[9:9]),
    .hazard_stall(in_vec[8:8]),
    .recover(in_vec[7:7]),
    .PR_new_flush(in_vec[6:1]),
    .RegDest_ROB(in_vec[0:0]),
    .PR_new(out_vec[6:1]),
    .empty(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 19'h7a39f;
    stim[1] = 19'h28bac;
    stim[2] = 19'h4a0d7;
    stim[3] = 19'h0700a;
    stim[4] = 19'h1d0c1;
    stim[5] = 19'h1ac9a;
    stim[6] = 19'h35032;
    stim[7] = 19'h28c76;
    stim[8] = 19'h66420;
    stim[9] = 19'h795fd;
    stim[10] = 19'h28d05;
    stim[11] = 19'h5b426;
    stim[12] = 19'h5c059;
    stim[13] = 19'h40d82;
    stim[14] = 19'h2e56c;
    stim[15] = 19'h3bd14;
    stim[16] = 19'h0a8a6;
    stim[17] = 19'h36d0d;
    stim[18] = 19'h145f5;
    stim[19] = 19'h154fe;
    stim[20] = 19'h1aecb;
    stim[21] = 19'h2b4a3;
    stim[22] = 19'h04db5;
    stim[23] = 19'h7f9e9;
    stim[24] = 19'h40073;
    stim[25] = 19'h5053f;
    stim[26] = 19'h42d11;
    stim[27] = 19'h65002;
    stim[28] = 19'h54d95;
    stim[29] = 19'h7acfe;
    stim[30] = 19'h6c14b;
    stim[31] = 19'h4a055;
    stim[32] = 19'h7458c;
    stim[33] = 19'h6b8da;
    stim[34] = 19'h179e6;
    stim[35] = 19'h645e5;
    stim[36] = 19'h0ecbd;
    stim[37] = 19'h0715c;
    stim[38] = 19'h059fa;
    stim[39] = 19'h189d7;
    stim[40] = 19'h5a159;
    stim[41] = 19'h021a5;
    stim[42] = 19'h14025;
    stim[43] = 19'h64407;
    stim[44] = 19'h6ad39;
    stim[45] = 19'h10db9;
    stim[46] = 19'h7e024;
    stim[47] = 19'h30444;
    stim[48] = 19'h338ee;
    stim[49] = 19'h381e6;
    stim[50] = 19'h1a43a;
    stim[51] = 19'h125cf;
    stim[52] = 19'h1841f;
    stim[53] = 19'h4fc48;
    stim[54] = 19'h32c12;
    stim[55] = 19'h1c4ce;
    stim[56] = 19'h6dd66;
    stim[57] = 19'h03c08;
    stim[58] = 19'h154ad;
    stim[59] = 19'h25cf5;
    stim[60] = 19'h6d951;
    stim[61] = 19'h3ada8;
    stim[62] = 19'h47905;
    stim[63] = 19'h02141;
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
      expv[0] = 7'h40;
      expv[1] = 7'h40;
      expv[2] = 7'h40;
      expv[3] = 7'h40;
      expv[4] = 7'h40;
      expv[5] = 7'h40;
      expv[6] = 7'h40;
      expv[7] = 7'h40;
      expv[8] = 7'h40;
      expv[9] = 7'h40;
      expv[10] = 7'h40;
      expv[11] = 7'h40;
      expv[12] = 7'h40;
      expv[13] = 7'h40;
      expv[14] = 7'h40;
      expv[15] = 7'h40;
      expv[16] = 7'h40;
      expv[17] = 7'h40;
      expv[18] = 7'h40;
      expv[19] = 7'h40;
      expv[20] = 7'h40;
      expv[21] = 7'h40;
      expv[22] = 7'h40;
      expv[23] = 7'h40;
      expv[24] = 7'h40;
      expv[25] = 7'h40;
      expv[26] = 7'h40;
      expv[27] = 7'h40;
      expv[28] = 7'h40;
      expv[29] = 7'h40;
      expv[30] = 7'h40;
      expv[31] = 7'h40;
      expv[32] = 7'h40;
      expv[33] = 7'h40;
      expv[34] = 7'h40;
      expv[35] = 7'h40;
      expv[36] = 7'h40;
      expv[37] = 7'h40;
      expv[38] = 7'h40;
      expv[39] = 7'h40;
      expv[40] = 7'h40;
      expv[41] = 7'h40;
      expv[42] = 7'h40;
      expv[43] = 7'h40;
      expv[44] = 7'h40;
      expv[45] = 7'h40;
      expv[46] = 7'h40;
      expv[47] = 7'h40;
      expv[48] = 7'h40;
      expv[49] = 7'h40;
      expv[50] = 7'h40;
      expv[51] = 7'h40;
      expv[52] = 7'h40;
      expv[53] = 7'h40;
      expv[54] = 7'h40;
      expv[55] = 7'h40;
      expv[56] = 7'h40;
      expv[57] = 7'h40;
      expv[58] = 7'h40;
      expv[59] = 7'h40;
      expv[60] = 7'h40;
      expv[61] = 7'h40;
      expv[62] = 7'h40;
      expv[63] = 7'h40;
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
