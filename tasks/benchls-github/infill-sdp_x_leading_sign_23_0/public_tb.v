// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 23;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  SDP_X_leading_sign_23_0 dut (
    .mantissa(in_vec[22:0]),
    .rtn(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 23'h48de6f;
    stim[1] = 23'h2185c5;
    stim[2] = 23'h327f54;
    stim[3] = 23'h0f666f;
    stim[4] = 23'h0b85a7;
    stim[5] = 23'h00392c;
    stim[6] = 23'h584e2e;
    stim[7] = 23'h5a5046;
    stim[8] = 23'h546372;
    stim[9] = 23'h506140;
    stim[10] = 23'h52a7d4;
    stim[11] = 23'h1ab606;
    stim[12] = 23'h7731a7;
    stim[13] = 23'h2189e3;
    stim[14] = 23'h5168e4;
    stim[15] = 23'h29f554;
    stim[16] = 23'h4bfeb5;
    stim[17] = 23'h41985f;
    stim[18] = 23'h00e939;
    stim[19] = 23'h162dd9;
    stim[20] = 23'h0d552e;
    stim[21] = 23'h1f3379;
    stim[22] = 23'h020945;
    stim[23] = 23'h109d83;
    stim[24] = 23'h0ebd4f;
    stim[25] = 23'h58c67f;
    stim[26] = 23'h5808a4;
    stim[27] = 23'h63ee77;
    stim[28] = 23'h2a91f5;
    stim[29] = 23'h5ae10f;
    stim[30] = 23'h5ee7c6;
    stim[31] = 23'h0d5365;
    stim[32] = 23'h6364c0;
    stim[33] = 23'h63e5b9;
    stim[34] = 23'h324362;
    stim[35] = 23'h611b01;
    stim[36] = 23'h2c58d0;
    stim[37] = 23'h031223;
    stim[38] = 23'h48c226;
    stim[39] = 23'h6d0af4;
    stim[40] = 23'h008ba1;
    stim[41] = 23'h1b7e65;
    stim[42] = 23'h7672b7;
    stim[43] = 23'h65929e;
    stim[44] = 23'h6daa27;
    stim[45] = 23'h2e8884;
    stim[46] = 23'h07b788;
    stim[47] = 23'h6e4293;
    stim[48] = 23'h13a3d5;
    stim[49] = 23'h6c8ffd;
    stim[50] = 23'h379e66;
    stim[51] = 23'h54df65;
    stim[52] = 23'h79d5a8;
    stim[53] = 23'h2cf296;
    stim[54] = 23'h119ef7;
    stim[55] = 23'h202986;
    stim[56] = 23'h47ed18;
    stim[57] = 23'h4fe9b3;
    stim[58] = 23'h4c16a7;
    stim[59] = 23'h4f6b8e;
    stim[60] = 23'h27dfc1;
    stim[61] = 23'h562744;
    stim[62] = 23'h60af7a;
    stim[63] = 23'h5726e0;
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
      expv[0] = 5'h00;
      expv[1] = 5'h01;
      expv[2] = 5'h01;
      expv[3] = 5'h03;
      expv[4] = 5'h03;
      expv[5] = 5'h09;
      expv[6] = 5'h00;
      expv[7] = 5'h00;
      expv[8] = 5'h00;
      expv[9] = 5'h00;
      expv[10] = 5'h00;
      expv[11] = 5'h02;
      expv[12] = 5'h00;
      expv[13] = 5'h01;
      expv[14] = 5'h00;
      expv[15] = 5'h01;
      expv[16] = 5'h00;
      expv[17] = 5'h00;
      expv[18] = 5'h07;
      expv[19] = 5'h02;
      expv[20] = 5'h03;
      expv[21] = 5'h02;
      expv[22] = 5'h05;
      expv[23] = 5'h02;
      expv[24] = 5'h03;
      expv[25] = 5'h00;
      expv[26] = 5'h00;
      expv[27] = 5'h00;
      expv[28] = 5'h01;
      expv[29] = 5'h00;
      expv[30] = 5'h00;
      expv[31] = 5'h03;
      expv[32] = 5'h00;
      expv[33] = 5'h00;
      expv[34] = 5'h01;
      expv[35] = 5'h00;
      expv[36] = 5'h01;
      expv[37] = 5'h05;
      expv[38] = 5'h00;
      expv[39] = 5'h00;
      expv[40] = 5'h07;
      expv[41] = 5'h02;
      expv[42] = 5'h00;
      expv[43] = 5'h00;
      expv[44] = 5'h00;
      expv[45] = 5'h01;
      expv[46] = 5'h04;
      expv[47] = 5'h00;
      expv[48] = 5'h02;
      expv[49] = 5'h00;
      expv[50] = 5'h01;
      expv[51] = 5'h00;
      expv[52] = 5'h00;
      expv[53] = 5'h01;
      expv[54] = 5'h02;
      expv[55] = 5'h01;
      expv[56] = 5'h00;
      expv[57] = 5'h00;
      expv[58] = 5'h00;
      expv[59] = 5'h00;
      expv[60] = 5'h01;
      expv[61] = 5'h00;
      expv[62] = 5'h00;
      expv[63] = 5'h00;
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
