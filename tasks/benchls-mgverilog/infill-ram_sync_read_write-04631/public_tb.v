// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 30;
  localparam OW = 20;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04631 dut (
    .clk_i(clk),
    .rst_i(in_vec[29:29]),
    .addr_i(in_vec[28:21]),
    .data_i(in_vec[20:1]),
    .wr_i(in_vec[0:0]),
    .data_o(out_vec[19:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 30'h36d6e9c4;
    stim[1] = 30'h33e6a036;
    stim[2] = 30'h1f172222;
    stim[3] = 30'h102ea43d;
    stim[4] = 30'h09e548c5;
    stim[5] = 30'h1893c6f4;
    stim[6] = 30'h07788532;
    stim[7] = 30'h0882f82d;
    stim[8] = 30'h0284cd2c;
    stim[9] = 30'h1f0ed24e;
    stim[10] = 30'h06282d92;
    stim[11] = 30'h0f55a470;
    stim[12] = 30'h18774c35;
    stim[13] = 30'h1e214ade;
    stim[14] = 30'h1c087a65;
    stim[15] = 30'h00c211c7;
    stim[16] = 30'h1147869d;
    stim[17] = 30'h11d0f82e;
    stim[18] = 30'h1c4f1fdb;
    stim[19] = 30'h19f34ce6;
    stim[20] = 30'h0ac91e9b;
    stim[21] = 30'h18d20e7f;
    stim[22] = 30'h1decdd29;
    stim[23] = 30'h117e5923;
    stim[24] = 30'h15c89150;
    stim[25] = 30'h02be23c5;
    stim[26] = 30'h11677694;
    stim[27] = 30'h1dd56aed;
    stim[28] = 30'h0f314bf9;
    stim[29] = 30'h0967039b;
    stim[30] = 30'h007ce5f6;
    stim[31] = 30'h0342bf60;
    stim[32] = 30'h0393b161;
    stim[33] = 30'h2179c9cf;
    stim[34] = 30'h0a76bec2;
    stim[35] = 30'h14ce2dbc;
    stim[36] = 30'h0a0e2f95;
    stim[37] = 30'h172b4039;
    stim[38] = 30'h0c753de5;
    stim[39] = 30'h0de90db3;
    stim[40] = 30'h04cce4c9;
    stim[41] = 30'h0b235dea;
    stim[42] = 30'h04f60a36;
    stim[43] = 30'h02697066;
    stim[44] = 30'h1dcccf77;
    stim[45] = 30'h056b2067;
    stim[46] = 30'h12a11a80;
    stim[47] = 30'h183b4517;
    stim[48] = 30'h151e6459;
    stim[49] = 30'h03fdd3d8;
    stim[50] = 30'h128214e0;
    stim[51] = 30'h007275a1;
    stim[52] = 30'h1f63c402;
    stim[53] = 30'h10ae7214;
    stim[54] = 30'h1950e5a3;
    stim[55] = 30'h0df3f05c;
    stim[56] = 30'h08a50741;
    stim[57] = 30'h190aa7fa;
    stim[58] = 30'h00fad668;
    stim[59] = 30'h130c086b;
    stim[60] = 30'h098a7c61;
    stim[61] = 30'h1a7ca24a;
    stim[62] = 30'h0e1601d8;
    stim[63] = 30'h16e9da22;
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
      expv[0] = 20'hxxxxx;
      expv[1] = 20'hxxxxx;
      expv[2] = 20'hxxxxx;
      expv[3] = 20'hxxxxx;
      expv[4] = 20'hxxxxx;
      expv[5] = 20'hxxxxx;
      expv[6] = 20'hxxxxx;
      expv[7] = 20'hxxxxx;
      expv[8] = 20'hxxxxx;
      expv[9] = 20'hxxxxx;
      expv[10] = 20'hxxxxx;
      expv[11] = 20'hxxxxx;
      expv[12] = 20'hxxxxx;
      expv[13] = 20'hxxxxx;
      expv[14] = 20'hxxxxx;
      expv[15] = 20'hxxxxx;
      expv[16] = 20'hxxxxx;
      expv[17] = 20'hxxxxx;
      expv[18] = 20'hxxxxx;
      expv[19] = 20'hxxxxx;
      expv[20] = 20'hxxxxx;
      expv[21] = 20'hxxxxx;
      expv[22] = 20'hxxxxx;
      expv[23] = 20'hxxxxx;
      expv[24] = 20'hxxxxx;
      expv[25] = 20'hxxxxx;
      expv[26] = 20'hxxxxx;
      expv[27] = 20'hf2c91;
      expv[28] = 20'hxxxxx;
      expv[29] = 20'hxxxxx;
      expv[30] = 20'hxxxxx;
      expv[31] = 20'hxxxxx;
      expv[32] = 20'hxxxxx;
      expv[33] = 20'hxxxxx;
      expv[34] = 20'hxxxxx;
      expv[35] = 20'hxxxxx;
      expv[36] = 20'hxxxxx;
      expv[37] = 20'hxxxxx;
      expv[38] = 20'hxxxxx;
      expv[39] = 20'hxxxxx;
      expv[40] = 20'hxxxxx;
      expv[41] = 20'hxxxxx;
      expv[42] = 20'hxxxxx;
      expv[43] = 20'hxxxxx;
      expv[44] = 20'hxxxxx;
      expv[45] = 20'hab576;
      expv[46] = 20'hxxxxx;
      expv[47] = 20'hxxxxx;
      expv[48] = 20'hxxxxx;
      expv[49] = 20'hxxxxx;
      expv[50] = 20'hxxxxx;
      expv[51] = 20'hxxxxx;
      expv[52] = 20'hxxxxx;
      expv[53] = 20'hxxxxx;
      expv[54] = 20'hxxxxx;
      expv[55] = 20'hxxxxx;
      expv[56] = 20'h486d9;
      expv[57] = 20'hxxxxx;
      expv[58] = 20'hxxxxx;
      expv[59] = 20'hxxxxx;
      expv[60] = 20'hxxxxx;
      expv[61] = 20'hxxxxx;
      expv[62] = 20'hxxxxx;
      expv[63] = 20'hxxxxx;
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
