// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_071606 dut (
    .sclk(clk),
    .reset(in_vec[11:11]),
    .sclk_en(in_vec[10:10]),
    .rdreq(in_vec[9:9]),
    .wrreq(in_vec[8:8]),
    .data(in_vec[7:0]),
    .empty_n(out_vec[9:9]),
    .full_n(out_vec[8:8]),
    .q(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'hfa4;
    stim[1] = 12'hf32;
    stim[2] = 12'h37a;
    stim[3] = 12'h0ef;
    stim[4] = 12'h70d;
    stim[5] = 12'h39d;
    stim[6] = 12'h4db;
    stim[7] = 12'h64c;
    stim[8] = 12'h589;
    stim[9] = 12'h04f;
    stim[10] = 12'h0ba;
    stim[11] = 12'h7c3;
    stim[12] = 12'h370;
    stim[13] = 12'h6b1;
    stim[14] = 12'h454;
    stim[15] = 12'h366;
    stim[16] = 12'h238;
    stim[17] = 12'h483;
    stim[18] = 12'h141;
    stim[19] = 12'h2df;
    stim[20] = 12'h22c;
    stim[21] = 12'h6ea;
    stim[22] = 12'h24e;
    stim[23] = 12'h5c3;
    stim[24] = 12'h56f;
    stim[25] = 12'h2eb;
    stim[26] = 12'h15d;
    stim[27] = 12'h666;
    stim[28] = 12'h193;
    stim[29] = 12'h5ba;
    stim[30] = 12'h616;
    stim[31] = 12'h67a;
    stim[32] = 12'h0e1;
    stim[33] = 12'h725;
    stim[34] = 12'h1d2;
    stim[35] = 12'h748;
    stim[36] = 12'h2f8;
    stim[37] = 12'h10a;
    stim[38] = 12'h434;
    stim[39] = 12'h769;
    stim[40] = 12'h6d1;
    stim[41] = 12'h4a3;
    stim[42] = 12'h659;
    stim[43] = 12'h261;
    stim[44] = 12'h2c8;
    stim[45] = 12'h476;
    stim[46] = 12'h6f5;
    stim[47] = 12'h660;
    stim[48] = 12'h3bd;
    stim[49] = 12'h15e;
    stim[50] = 12'h0e8;
    stim[51] = 12'h0f4;
    stim[52] = 12'h7b6;
    stim[53] = 12'h269;
    stim[54] = 12'h6ec;
    stim[55] = 12'h6b0;
    stim[56] = 12'h40b;
    stim[57] = 12'h00c;
    stim[58] = 12'h751;
    stim[59] = 12'h468;
    stim[60] = 12'h6c5;
    stim[61] = 12'h031;
    stim[62] = 12'h520;
    stim[63] = 12'h78a;
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
      expv[0] = 10'hxxx;
      expv[1] = 10'h100;
      expv[2] = 10'h100;
      expv[3] = 10'h100;
      expv[4] = 10'h100;
      expv[5] = 10'h132;
      expv[6] = 10'h132;
      expv[7] = 10'h30d;
      expv[8] = 10'h10d;
      expv[9] = 10'h10d;
      expv[10] = 10'h10d;
      expv[11] = 10'h10d;
      expv[12] = 10'h389;
      expv[13] = 10'h389;
      expv[14] = 10'h3c3;
      expv[15] = 10'h3c3;
      expv[16] = 10'h3c3;
      expv[17] = 10'h3c3;
      expv[18] = 10'h3c3;
      expv[19] = 10'h3c3;
      expv[20] = 10'h3c3;
      expv[21] = 10'h3c3;
      expv[22] = 10'h1c3;
      expv[23] = 10'h1c3;
      expv[24] = 10'h1c3;
      expv[25] = 10'h3c3;
      expv[26] = 10'h3c3;
      expv[27] = 10'h3c3;
      expv[28] = 10'h36f;
      expv[29] = 10'h36f;
      expv[30] = 10'h36f;
      expv[31] = 10'h3ba;
      expv[32] = 10'h1ba;
      expv[33] = 10'h1ba;
      expv[34] = 10'h1ba;
      expv[35] = 10'h1ba;
      expv[36] = 10'h325;
      expv[37] = 10'h325;
      expv[38] = 10'h325;
      expv[39] = 10'h325;
      expv[40] = 10'h348;
      expv[41] = 10'h369;
      expv[42] = 10'h369;
      expv[43] = 10'h169;
      expv[44] = 10'h169;
      expv[45] = 10'h169;
      expv[46] = 10'h169;
      expv[47] = 10'h169;
      expv[48] = 10'h169;
      expv[49] = 10'h169;
      expv[50] = 10'h169;
      expv[51] = 10'h169;
      expv[52] = 10'h169;
      expv[53] = 10'h169;
      expv[54] = 10'h169;
      expv[55] = 10'h3b6;
      expv[56] = 10'h1b6;
      expv[57] = 10'h1b6;
      expv[58] = 10'h1b6;
      expv[59] = 10'h1b6;
      expv[60] = 10'h351;
      expv[61] = 10'h151;
      expv[62] = 10'h151;
      expv[63] = 10'h151;
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
