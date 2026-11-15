// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 21;
  localparam OW = 40;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_08778 dut (
    .clk(clk),
    .rst(in_vec[20:20]),
    .target_angle(in_vec[19:0]),
    .x_res(out_vec[39:20]),
    .y_res(out_vec[19:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 21'h18d487;
    stim[1] = 21'h1e3ab9;
    stim[2] = 21'h0b000a;
    stim[3] = 21'h0411d4;
    stim[4] = 21'h026f52;
    stim[5] = 21'h07e356;
    stim[6] = 21'h030ecf;
    stim[7] = 21'h076792;
    stim[8] = 21'h0bdb26;
    stim[9] = 21'h0858c5;
    stim[10] = 21'h0ece64;
    stim[11] = 21'h0ed54f;
    stim[12] = 21'h036ed0;
    stim[13] = 21'h001f9d;
    stim[14] = 21'h03dcb6;
    stim[15] = 21'h0d08a9;
    stim[16] = 21'h082e90;
    stim[17] = 21'h039052;
    stim[18] = 21'h03fc86;
    stim[19] = 21'h040fb8;
    stim[20] = 21'h0cb64d;
    stim[21] = 21'h0372ca;
    stim[22] = 21'h0dc965;
    stim[23] = 21'h0fc3f3;
    stim[24] = 21'h0262f4;
    stim[25] = 21'h09d74c;
    stim[26] = 21'h093e68;
    stim[27] = 21'h07238e;
    stim[28] = 21'h01cea0;
    stim[29] = 21'h0492e3;
    stim[30] = 21'h0c3128;
    stim[31] = 21'h081b0d;
    stim[32] = 21'h06acfd;
    stim[33] = 21'h0cf758;
    stim[34] = 21'h03fa43;
    stim[35] = 21'h05b6e1;
    stim[36] = 21'h054286;
    stim[37] = 21'h055d15;
    stim[38] = 21'h0f8d10;
    stim[39] = 21'h0f64b4;
    stim[40] = 21'h083759;
    stim[41] = 21'h04c96a;
    stim[42] = 21'h02b767;
    stim[43] = 21'h0cbcbb;
    stim[44] = 21'h0d519b;
    stim[45] = 21'h0271c8;
    stim[46] = 21'h0eedfc;
    stim[47] = 21'h04015b;
    stim[48] = 21'h0b5591;
    stim[49] = 21'h05ea29;
    stim[50] = 21'h0e01af;
    stim[51] = 21'h0c626d;
    stim[52] = 21'h0fb88c;
    stim[53] = 21'h073d16;
    stim[54] = 21'h0759a7;
    stim[55] = 21'h0d39c4;
    stim[56] = 21'h02e194;
    stim[57] = 21'h08d62d;
    stim[58] = 21'h00c427;
    stim[59] = 21'h064355;
    stim[60] = 21'h0d2e0b;
    stim[61] = 21'h06fe57;
    stim[62] = 21'h02265a;
    stim[63] = 21'h0f00ef;
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
      expv[0] = 40'h0000000000;
      expv[1] = 40'h00713ffa2d;
      expv[2] = 40'h0000000000;
      expv[3] = 40'h0000000000;
      expv[4] = 40'h0000000000;
      expv[5] = 40'h0000000000;
      expv[6] = 40'h0000000000;
      expv[7] = 40'h0000000000;
      expv[8] = 40'h0000000000;
      expv[9] = 40'h0000000000;
      expv[10] = 40'h0000000000;
      expv[11] = 40'h0000000000;
      expv[12] = 40'h0000000000;
      expv[13] = 40'h0000000000;
      expv[14] = 40'h0000000000;
      expv[15] = 40'h0000000000;
      expv[16] = 40'h0000000000;
      expv[17] = 40'h0000000000;
      expv[18] = 40'h0000000000;
      expv[19] = 40'h0000000000;
      expv[20] = 40'h0000000000;
      expv[21] = 40'h0000000000;
      expv[22] = 40'h0000000000;
      expv[23] = 40'h0000000000;
      expv[24] = 40'h0000000000;
      expv[25] = 40'h0000000000;
      expv[26] = 40'h0000000000;
      expv[27] = 40'h0000000000;
      expv[28] = 40'h0000000000;
      expv[29] = 40'h0000000000;
      expv[30] = 40'h0000000000;
      expv[31] = 40'h0000000000;
      expv[32] = 40'h0000000000;
      expv[33] = 40'h0000000000;
      expv[34] = 40'h0000000000;
      expv[35] = 40'h0000000000;
      expv[36] = 40'h0000000000;
      expv[37] = 40'h0000000000;
      expv[38] = 40'h0000000000;
      expv[39] = 40'h0000000000;
      expv[40] = 40'h0000000000;
      expv[41] = 40'h0000000000;
      expv[42] = 40'h0000000000;
      expv[43] = 40'h0000000000;
      expv[44] = 40'h0000000000;
      expv[45] = 40'h0000000000;
      expv[46] = 40'h0000000000;
      expv[47] = 40'h0000000000;
      expv[48] = 40'h0000000000;
      expv[49] = 40'h0000000000;
      expv[50] = 40'h0000000000;
      expv[51] = 40'h0000000000;
      expv[52] = 40'h0000000000;
      expv[53] = 40'h0000000000;
      expv[54] = 40'h0000000000;
      expv[55] = 40'h0000000000;
      expv[56] = 40'h0000000000;
      expv[57] = 40'h0000000000;
      expv[58] = 40'h0000000000;
      expv[59] = 40'h0000000000;
      expv[60] = 40'h0000000000;
      expv[61] = 40'h0000000000;
      expv[62] = 40'h0000000000;
      expv[63] = 40'h0000000000;
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
