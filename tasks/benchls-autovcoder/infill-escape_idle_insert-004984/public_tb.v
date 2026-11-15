// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_004984 dut (
    .clk(clk),
    .reset_n(in_vec[10:10]),
    .in_valid(in_vec[9:9]),
    .in_data(in_vec[8:1]),
    .out_ready(in_vec[0:0]),
    .in_ready(out_vec[9:9]),
    .out_valid(out_vec[8:8]),
    .out_data(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h1d8;
    stim[1] = 11'h107;
    stim[2] = 11'h5cf;
    stim[3] = 11'h6c8;
    stim[4] = 11'h635;
    stim[5] = 11'h59f;
    stim[6] = 11'h40f;
    stim[7] = 11'h603;
    stim[8] = 11'h59d;
    stim[9] = 11'h69f;
    stim[10] = 11'h6eb;
    stim[11] = 11'h5eb;
    stim[12] = 11'h64b;
    stim[13] = 11'h5a8;
    stim[14] = 11'h4d8;
    stim[15] = 11'h588;
    stim[16] = 11'h664;
    stim[17] = 11'h4fb;
    stim[18] = 11'h725;
    stim[19] = 11'h68f;
    stim[20] = 11'h6e8;
    stim[21] = 11'h5dc;
    stim[22] = 11'h4d7;
    stim[23] = 11'h5ba;
    stim[24] = 11'h4b9;
    stim[25] = 11'h4fc;
    stim[26] = 11'h46f;
    stim[27] = 11'h618;
    stim[28] = 11'h56b;
    stim[29] = 11'h6ad;
    stim[30] = 11'h4f4;
    stim[31] = 11'h7e9;
    stim[32] = 11'h4f3;
    stim[33] = 11'h6c8;
    stim[34] = 11'h65b;
    stim[35] = 11'h66e;
    stim[36] = 11'h44f;
    stim[37] = 11'h503;
    stim[38] = 11'h746;
    stim[39] = 11'h75a;
    stim[40] = 11'h7cd;
    stim[41] = 11'h4de;
    stim[42] = 11'h55b;
    stim[43] = 11'h4d6;
    stim[44] = 11'h73f;
    stim[45] = 11'h6f8;
    stim[46] = 11'h7fd;
    stim[47] = 11'h6f2;
    stim[48] = 11'h63e;
    stim[49] = 11'h67d;
    stim[50] = 11'h605;
    stim[51] = 11'h483;
    stim[52] = 11'h55a;
    stim[53] = 11'h715;
    stim[54] = 11'h7d9;
    stim[55] = 11'h4a9;
    stim[56] = 11'h513;
    stim[57] = 11'h45a;
    stim[58] = 11'h468;
    stim[59] = 11'h60d;
    stim[60] = 11'h419;
    stim[61] = 11'h51a;
    stim[62] = 11'h4c0;
    stim[63] = 11'h6b7;
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
      expv[0] = 10'h14a;
      expv[1] = 10'h34a;
      expv[2] = 10'h34a;
      expv[3] = 10'h164;
      expv[4] = 10'h31a;
      expv[5] = 10'h34a;
      expv[6] = 10'h34a;
      expv[7] = 10'h301;
      expv[8] = 10'h34a;
      expv[9] = 10'h34f;
      expv[10] = 10'h375;
      expv[11] = 10'h34a;
      expv[12] = 10'h325;
      expv[13] = 10'h14a;
      expv[14] = 10'h14a;
      expv[15] = 10'h14a;
      expv[16] = 10'h132;
      expv[17] = 10'h34a;
      expv[18] = 10'h392;
      expv[19] = 10'h347;
      expv[20] = 10'h174;
      expv[21] = 10'h14a;
      expv[22] = 10'h34a;
      expv[23] = 10'h14a;
      expv[24] = 10'h34a;
      expv[25] = 10'h14a;
      expv[26] = 10'h34a;
      expv[27] = 10'h10c;
      expv[28] = 10'h34a;
      expv[29] = 10'h356;
      expv[30] = 10'h14a;
      expv[31] = 10'h3f4;
      expv[32] = 10'h34a;
      expv[33] = 10'h164;
      expv[34] = 10'h32d;
      expv[35] = 10'h137;
      expv[36] = 10'h34a;
      expv[37] = 10'h34a;
      expv[38] = 10'h1a3;
      expv[39] = 10'h1ad;
      expv[40] = 10'h3e6;
      expv[41] = 10'h14a;
      expv[42] = 10'h34a;
      expv[43] = 10'h14a;
      expv[44] = 10'h39f;
      expv[45] = 10'h17c;
      expv[46] = 10'h3fe;
      expv[47] = 10'h179;
      expv[48] = 10'h11f;
      expv[49] = 10'h33e;
      expv[50] = 10'h302;
      expv[51] = 10'h34a;
      expv[52] = 10'h14a;
      expv[53] = 10'h38a;
      expv[54] = 10'h3ec;
      expv[55] = 10'h34a;
      expv[56] = 10'h34a;
      expv[57] = 10'h14a;
      expv[58] = 10'h14a;
      expv[59] = 10'h306;
      expv[60] = 10'h34a;
      expv[61] = 10'h14a;
      expv[62] = 10'h14a;
      expv[63] = 10'h35b;
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
