// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_01557 dut (
    .clk(clk),
    .rstn(in_vec[9:9]),
    .sample(in_vec[8:8]),
    .raw_data_in(in_vec[7:0]),
    .ave_data_out(out_vec[8:1]),
    .data_out_valid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h1d0;
    stim[1] = 10'h1e5;
    stim[2] = 10'h3f4;
    stim[3] = 10'h22e;
    stim[4] = 10'h346;
    stim[5] = 10'h26d;
    stim[6] = 10'h39c;
    stim[7] = 10'h3c5;
    stim[8] = 10'h3f1;
    stim[9] = 10'h3bc;
    stim[10] = 10'h35b;
    stim[11] = 10'h3fd;
    stim[12] = 10'h3fe;
    stim[13] = 10'h2fa;
    stim[14] = 10'h27e;
    stim[15] = 10'h2d6;
    stim[16] = 10'h316;
    stim[17] = 10'h2ff;
    stim[18] = 10'h2be;
    stim[19] = 10'h281;
    stim[20] = 10'h378;
    stim[21] = 10'h374;
    stim[22] = 10'h3a5;
    stim[23] = 10'h33c;
    stim[24] = 10'h397;
    stim[25] = 10'h2f0;
    stim[26] = 10'h316;
    stim[27] = 10'h3b4;
    stim[28] = 10'h2fc;
    stim[29] = 10'h213;
    stim[30] = 10'h357;
    stim[31] = 10'h225;
    stim[32] = 10'h33a;
    stim[33] = 10'h2b8;
    stim[34] = 10'h239;
    stim[35] = 10'h243;
    stim[36] = 10'h205;
    stim[37] = 10'h202;
    stim[38] = 10'h304;
    stim[39] = 10'h2b4;
    stim[40] = 10'h37b;
    stim[41] = 10'h330;
    stim[42] = 10'h2b5;
    stim[43] = 10'h31f;
    stim[44] = 10'h289;
    stim[45] = 10'h222;
    stim[46] = 10'h28d;
    stim[47] = 10'h24d;
    stim[48] = 10'h203;
    stim[49] = 10'h319;
    stim[50] = 10'h271;
    stim[51] = 10'h277;
    stim[52] = 10'h354;
    stim[53] = 10'h385;
    stim[54] = 10'h204;
    stim[55] = 10'h394;
    stim[56] = 10'h333;
    stim[57] = 10'h2bb;
    stim[58] = 10'h26a;
    stim[59] = 10'h2c6;
    stim[60] = 10'h28c;
    stim[61] = 10'h08d;
    stim[62] = 10'h2bf;
    stim[63] = 10'h307;
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
      expv[0] = 9'h000;
      expv[1] = 9'h000;
      expv[2] = 9'h000;
      expv[3] = 9'h000;
      expv[4] = 9'h001;
      expv[5] = 9'h000;
      expv[6] = 9'h000;
      expv[7] = 9'h000;
      expv[8] = 9'h000;
      expv[9] = 9'h000;
      expv[10] = 9'h000;
      expv[11] = 9'h000;
      expv[12] = 9'h000;
      expv[13] = 9'h000;
      expv[14] = 9'h000;
      expv[15] = 9'h000;
      expv[16] = 9'h000;
      expv[17] = 9'h000;
      expv[18] = 9'h000;
      expv[19] = 9'h000;
      expv[20] = 9'h000;
      expv[21] = 9'h000;
      expv[22] = 9'h000;
      expv[23] = 9'h000;
      expv[24] = 9'h000;
      expv[25] = 9'h000;
      expv[26] = 9'h000;
      expv[27] = 9'h000;
      expv[28] = 9'h000;
      expv[29] = 9'h000;
      expv[30] = 9'h000;
      expv[31] = 9'h000;
      expv[32] = 9'h000;
      expv[33] = 9'h000;
      expv[34] = 9'h000;
      expv[35] = 9'h000;
      expv[36] = 9'h000;
      expv[37] = 9'h000;
      expv[38] = 9'h000;
      expv[39] = 9'h000;
      expv[40] = 9'h000;
      expv[41] = 9'h000;
      expv[42] = 9'h000;
      expv[43] = 9'h000;
      expv[44] = 9'h000;
      expv[45] = 9'h000;
      expv[46] = 9'h000;
      expv[47] = 9'h000;
      expv[48] = 9'h000;
      expv[49] = 9'h000;
      expv[50] = 9'h000;
      expv[51] = 9'h000;
      expv[52] = 9'h000;
      expv[53] = 9'h000;
      expv[54] = 9'h000;
      expv[55] = 9'h000;
      expv[56] = 9'h000;
      expv[57] = 9'h000;
      expv[58] = 9'h000;
      expv[59] = 9'h000;
      expv[60] = 9'h000;
      expv[61] = 9'h000;
      expv[62] = 9'h000;
      expv[63] = 9'h000;
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
