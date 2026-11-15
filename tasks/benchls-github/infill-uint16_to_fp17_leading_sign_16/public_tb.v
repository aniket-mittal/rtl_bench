// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 16;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  UINT16_TO_FP17_leading_sign_16_0 dut (
    .mantissa(in_vec[15:0]),
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
    stim[0] = 16'h9060;
    stim[1] = 16'hd35e;
    stim[2] = 16'hb27f;
    stim[3] = 16'he4c5;
    stim[4] = 16'ha4d2;
    stim[5] = 16'h65c5;
    stim[6] = 16'h176a;
    stim[7] = 16'h9978;
    stim[8] = 16'had17;
    stim[9] = 16'h038a;
    stim[10] = 16'hec06;
    stim[11] = 16'hbd9a;
    stim[12] = 16'h59f8;
    stim[13] = 16'h0f1d;
    stim[14] = 16'hcc2b;
    stim[15] = 16'hd902;
    stim[16] = 16'had68;
    stim[17] = 16'h6bb1;
    stim[18] = 16'h8f5b;
    stim[19] = 16'ha199;
    stim[20] = 16'h2351;
    stim[21] = 16'h8cb7;
    stim[22] = 16'h5212;
    stim[23] = 16'h68ae;
    stim[24] = 16'hcffd;
    stim[25] = 16'heb64;
    stim[26] = 16'h7cc9;
    stim[27] = 16'hbf03;
    stim[28] = 16'hf76f;
    stim[29] = 16'hab86;
    stim[30] = 16'ha536;
    stim[31] = 16'hdbca;
    stim[32] = 16'h1830;
    stim[33] = 16'hf46b;
    stim[34] = 16'hdf86;
    stim[35] = 16'ha622;
    stim[36] = 16'hc167;
    stim[37] = 16'hae09;
    stim[38] = 16'he04d;
    stim[39] = 16'hb46e;
    stim[40] = 16'h9a67;
    stim[41] = 16'hb965;
    stim[42] = 16'h87ce;
    stim[43] = 16'h8cf2;
    stim[44] = 16'h9046;
    stim[45] = 16'h0810;
    stim[46] = 16'h9d86;
    stim[47] = 16'h08fe;
    stim[48] = 16'h9d3c;
    stim[49] = 16'h2908;
    stim[50] = 16'h027e;
    stim[51] = 16'h7a90;
    stim[52] = 16'h8b96;
    stim[53] = 16'h9486;
    stim[54] = 16'h5bfb;
    stim[55] = 16'h0274;
    stim[56] = 16'h99b0;
    stim[57] = 16'h1363;
    stim[58] = 16'h3492;
    stim[59] = 16'hbe50;
    stim[60] = 16'h57ab;
    stim[61] = 16'h3688;
    stim[62] = 16'hc937;
    stim[63] = 16'hf0b9;
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
      expv[1] = 5'h00;
      expv[2] = 5'h00;
      expv[3] = 5'h00;
      expv[4] = 5'h00;
      expv[5] = 5'h01;
      expv[6] = 5'h03;
      expv[7] = 5'h00;
      expv[8] = 5'h00;
      expv[9] = 5'h06;
      expv[10] = 5'h00;
      expv[11] = 5'h00;
      expv[12] = 5'h01;
      expv[13] = 5'h04;
      expv[14] = 5'h00;
      expv[15] = 5'h00;
      expv[16] = 5'h00;
      expv[17] = 5'h01;
      expv[18] = 5'h00;
      expv[19] = 5'h00;
      expv[20] = 5'h02;
      expv[21] = 5'h00;
      expv[22] = 5'h01;
      expv[23] = 5'h01;
      expv[24] = 5'h00;
      expv[25] = 5'h00;
      expv[26] = 5'h01;
      expv[27] = 5'h00;
      expv[28] = 5'h00;
      expv[29] = 5'h00;
      expv[30] = 5'h00;
      expv[31] = 5'h00;
      expv[32] = 5'h03;
      expv[33] = 5'h00;
      expv[34] = 5'h00;
      expv[35] = 5'h00;
      expv[36] = 5'h00;
      expv[37] = 5'h00;
      expv[38] = 5'h00;
      expv[39] = 5'h00;
      expv[40] = 5'h00;
      expv[41] = 5'h00;
      expv[42] = 5'h00;
      expv[43] = 5'h00;
      expv[44] = 5'h00;
      expv[45] = 5'h04;
      expv[46] = 5'h00;
      expv[47] = 5'h04;
      expv[48] = 5'h00;
      expv[49] = 5'h02;
      expv[50] = 5'h06;
      expv[51] = 5'h01;
      expv[52] = 5'h00;
      expv[53] = 5'h00;
      expv[54] = 5'h01;
      expv[55] = 5'h06;
      expv[56] = 5'h00;
      expv[57] = 5'h03;
      expv[58] = 5'h02;
      expv[59] = 5'h00;
      expv[60] = 5'h01;
      expv[61] = 5'h02;
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
