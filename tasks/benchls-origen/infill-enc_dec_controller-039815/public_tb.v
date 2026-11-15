// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 7;
  localparam OW = 7;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_039815 dut (
    .I_clk(clk),
    .I_mode(in_vec[6:5]),
    .I_start(in_vec[4:4]),
    .I_en(in_vec[3:3]),
    .I_meas_v(in_vec[2:2]),
    .I_enc_ready(in_vec[1:1]),
    .I_dec_ready(in_vec[0:0]),
    .O_clk(out_vec[6:6]),
    .O_meas_rst(out_vec[5:5]),
    .O_enc_en(out_vec[4:4]),
    .O_enc_start(out_vec[3:3]),
    .O_dec_en(out_vec[2:2]),
    .O_dec_start(out_vec[1:1]),
    .O_ready(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 7'h00;
    stim[1] = 7'h62;
    stim[2] = 7'h48;
    stim[3] = 7'h7d;
    stim[4] = 7'h1f;
    stim[5] = 7'h0b;
    stim[6] = 7'h3e;
    stim[7] = 7'h79;
    stim[8] = 7'h0c;
    stim[9] = 7'h2e;
    stim[10] = 7'h3b;
    stim[11] = 7'h2d;
    stim[12] = 7'h2f;
    stim[13] = 7'h7b;
    stim[14] = 7'h7a;
    stim[15] = 7'h07;
    stim[16] = 7'h6f;
    stim[17] = 7'h6a;
    stim[18] = 7'h5c;
    stim[19] = 7'h28;
    stim[20] = 7'h4f;
    stim[21] = 7'h58;
    stim[22] = 7'h3a;
    stim[23] = 7'h0e;
    stim[24] = 7'h1f;
    stim[25] = 7'h1d;
    stim[26] = 7'h0d;
    stim[27] = 7'h69;
    stim[28] = 7'h3a;
    stim[29] = 7'h1c;
    stim[30] = 7'h15;
    stim[31] = 7'h28;
    stim[32] = 7'h6a;
    stim[33] = 7'h69;
    stim[34] = 7'h18;
    stim[35] = 7'h3b;
    stim[36] = 7'h7e;
    stim[37] = 7'h3d;
    stim[38] = 7'h0a;
    stim[39] = 7'h08;
    stim[40] = 7'h28;
    stim[41] = 7'h1e;
    stim[42] = 7'h3e;
    stim[43] = 7'h5d;
    stim[44] = 7'h0c;
    stim[45] = 7'h7f;
    stim[46] = 7'h4e;
    stim[47] = 7'h3f;
    stim[48] = 7'h4d;
    stim[49] = 7'h58;
    stim[50] = 7'h08;
    stim[51] = 7'h7e;
    stim[52] = 7'h2f;
    stim[53] = 7'h39;
    stim[54] = 7'h2e;
    stim[55] = 7'h6b;
    stim[56] = 7'h4f;
    stim[57] = 7'h3c;
    stim[58] = 7'h7c;
    stim[59] = 7'h4f;
    stim[60] = 7'h31;
    stim[61] = 7'h69;
    stim[62] = 7'h59;
    stim[63] = 7'h6c;
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
      expv[0] = 7'h00;
      expv[1] = 7'h00;
      expv[2] = 7'h00;
      expv[3] = 7'h00;
      expv[4] = 7'h00;
      expv[5] = 7'h20;
      expv[6] = 7'h20;
      expv[7] = 7'h20;
      expv[8] = 7'h00;
      expv[9] = 7'h00;
      expv[10] = 7'h18;
      expv[11] = 7'h01;
      expv[12] = 7'h20;
      expv[13] = 7'h20;
      expv[14] = 7'h20;
      expv[15] = 7'h00;
      expv[16] = 7'h00;
      expv[17] = 7'h00;
      expv[18] = 7'h00;
      expv[19] = 7'h00;
      expv[20] = 7'h20;
      expv[21] = 7'h20;
      expv[22] = 7'h20;
      expv[23] = 7'h00;
      expv[24] = 7'h00;
      expv[25] = 7'h00;
      expv[26] = 7'h20;
      expv[27] = 7'h20;
      expv[28] = 7'h20;
      expv[29] = 7'h20;
      expv[30] = 7'h00;
      expv[31] = 7'h00;
      expv[32] = 7'h00;
      expv[33] = 7'h00;
      expv[34] = 7'h00;
      expv[35] = 7'h00;
      expv[36] = 7'h20;
      expv[37] = 7'h20;
      expv[38] = 7'h00;
      expv[39] = 7'h00;
      expv[40] = 7'h00;
      expv[41] = 7'h00;
      expv[42] = 7'h00;
      expv[43] = 7'h18;
      expv[44] = 7'h18;
      expv[45] = 7'h18;
      expv[46] = 7'h01;
      expv[47] = 7'h20;
      expv[48] = 7'h20;
      expv[49] = 7'h00;
      expv[50] = 7'h06;
      expv[51] = 7'h06;
      expv[52] = 7'h06;
      expv[53] = 7'h01;
      expv[54] = 7'h01;
      expv[55] = 7'h20;
      expv[56] = 7'h20;
      expv[57] = 7'h20;
      expv[58] = 7'h20;
      expv[59] = 7'h00;
      expv[60] = 7'h00;
      expv[61] = 7'h00;
      expv[62] = 7'h00;
      expv[63] = 7'h00;
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
