// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_096702 dut (
    .clock(clk),
    .reset(in_vec[16:16]),
    .data_in(in_vec[15:0]),
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
    stim[0] = 17'h14de9;
    stim[1] = 17'h1ef93;
    stim[2] = 17'h09d8e;
    stim[3] = 17'h0bb8d;
    stim[4] = 17'h08090;
    stim[5] = 17'h0b122;
    stim[6] = 17'h003da;
    stim[7] = 17'h02751;
    stim[8] = 17'h0a36d;
    stim[9] = 17'h061bd;
    stim[10] = 17'h0eedf;
    stim[11] = 17'h092ae;
    stim[12] = 17'h05e39;
    stim[13] = 17'h0cd8e;
    stim[14] = 17'h01602;
    stim[15] = 17'h0498a;
    stim[16] = 17'h0a898;
    stim[17] = 17'h09ef4;
    stim[18] = 17'h0233d;
    stim[19] = 17'h0f5d0;
    stim[20] = 17'h0c8e2;
    stim[21] = 17'h06e91;
    stim[22] = 17'h08db6;
    stim[23] = 17'h006a7;
    stim[24] = 17'h00094;
    stim[25] = 17'h050aa;
    stim[26] = 17'h0d88e;
    stim[27] = 17'h0a9b7;
    stim[28] = 17'h036e8;
    stim[29] = 17'h0c331;
    stim[30] = 17'h0e05b;
    stim[31] = 17'h00d38;
    stim[32] = 17'h0f116;
    stim[33] = 17'h001b3;
    stim[34] = 17'h0253c;
    stim[35] = 17'h036bd;
    stim[36] = 17'h05b32;
    stim[37] = 17'h0629a;
    stim[38] = 17'h057dd;
    stim[39] = 17'h0e297;
    stim[40] = 17'h0019c;
    stim[41] = 17'h060c8;
    stim[42] = 17'h01dfd;
    stim[43] = 17'h11060;
    stim[44] = 17'h09f75;
    stim[45] = 17'h0de46;
    stim[46] = 17'h00d77;
    stim[47] = 17'h03ebf;
    stim[48] = 17'h0fc7d;
    stim[49] = 17'h00d41;
    stim[50] = 17'h02ea6;
    stim[51] = 17'h0d5f7;
    stim[52] = 17'h0a1f2;
    stim[53] = 17'h0910a;
    stim[54] = 17'h0c385;
    stim[55] = 17'h08f08;
    stim[56] = 17'h04691;
    stim[57] = 17'h03926;
    stim[58] = 17'h00ef5;
    stim[59] = 17'h0753a;
    stim[60] = 17'h0a3ad;
    stim[61] = 17'h0c191;
    stim[62] = 17'h0a015;
    stim[63] = 17'h0831d;
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
      expv[0] = 16'h0000;
      expv[1] = 16'h0000;
      expv[2] = 16'h0000;
      expv[3] = 16'h0000;
      expv[4] = 16'h0000;
      expv[5] = 16'h0000;
      expv[6] = 16'h9d8e;
      expv[7] = 16'hbb8d;
      expv[8] = 16'h8090;
      expv[9] = 16'hb122;
      expv[10] = 16'h03da;
      expv[11] = 16'h2751;
      expv[12] = 16'ha36d;
      expv[13] = 16'h61bd;
      expv[14] = 16'heedf;
      expv[15] = 16'h92ae;
      expv[16] = 16'h5e39;
      expv[17] = 16'hcd8e;
      expv[18] = 16'h1602;
      expv[19] = 16'h498a;
      expv[20] = 16'ha898;
      expv[21] = 16'h9ef4;
      expv[22] = 16'h233d;
      expv[23] = 16'hf5d0;
      expv[24] = 16'hc8e2;
      expv[25] = 16'h6e91;
      expv[26] = 16'h8db6;
      expv[27] = 16'h06a7;
      expv[28] = 16'h0094;
      expv[29] = 16'h50aa;
      expv[30] = 16'hd88e;
      expv[31] = 16'ha9b7;
      expv[32] = 16'h36e8;
      expv[33] = 16'hc331;
      expv[34] = 16'he05b;
      expv[35] = 16'h0d38;
      expv[36] = 16'hf116;
      expv[37] = 16'h01b3;
      expv[38] = 16'h253c;
      expv[39] = 16'h36bd;
      expv[40] = 16'h5b32;
      expv[41] = 16'h629a;
      expv[42] = 16'h57dd;
      expv[43] = 16'h0000;
      expv[44] = 16'h0000;
      expv[45] = 16'h0000;
      expv[46] = 16'h0000;
      expv[47] = 16'h0000;
      expv[48] = 16'h9f75;
      expv[49] = 16'hde46;
      expv[50] = 16'h0d77;
      expv[51] = 16'h3ebf;
      expv[52] = 16'hfc7d;
      expv[53] = 16'h0d41;
      expv[54] = 16'h2ea6;
      expv[55] = 16'hd5f7;
      expv[56] = 16'ha1f2;
      expv[57] = 16'h910a;
      expv[58] = 16'hc385;
      expv[59] = 16'h8f08;
      expv[60] = 16'h4691;
      expv[61] = 16'h3926;
      expv[62] = 16'h0ef5;
      expv[63] = 16'h753a;
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
