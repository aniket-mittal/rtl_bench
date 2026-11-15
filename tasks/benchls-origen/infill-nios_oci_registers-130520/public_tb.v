// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 47;
  localparam OW = 68;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_130520 dut (
    .clk(clk),
    .address(in_vec[46:38]),
    .debugaccess(in_vec[37:37]),
    .monitor_error(in_vec[36:36]),
    .monitor_go(in_vec[35:35]),
    .monitor_ready(in_vec[34:34]),
    .reset_n(in_vec[33:33]),
    .write(in_vec[32:32]),
    .writedata(in_vec[31:0]),
    .oci_ienable(out_vec[67:36]),
    .oci_reg_readdata(out_vec[35:4]),
    .oci_single_step_mode(out_vec[3:3]),
    .ocireg_ers(out_vec[2:2]),
    .ocireg_mrs(out_vec[1:1]),
    .take_action_ocireg(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 47'h2a65c62cd9eb;
    stim[1] = 47'h08b0546cfc18;
    stim[2] = 47'h708a6d03ccbd;
    stim[3] = 47'h28eba470b0f8;
    stim[4] = 47'h3b8e42e207b7;
    stim[5] = 47'h4682261c7422;
    stim[6] = 47'h4f0f6c2cc0d2;
    stim[7] = 47'h3f4af755d3e1;
    stim[8] = 47'h3c6e6763a2d8;
    stim[9] = 47'h5602a4d3a53e;
    stim[10] = 47'h396bb1de3e0b;
    stim[11] = 47'h004b8529075e;
    stim[12] = 47'h270e2c8b64ed;
    stim[13] = 47'h3bee17e4ebd9;
    stim[14] = 47'h123fad38be5c;
    stim[15] = 47'h68fb02c8f4d7;
    stim[16] = 47'h60670ba8df64;
    stim[17] = 47'h6f6be8d78666;
    stim[18] = 47'h34d327301546;
    stim[19] = 47'h6be64c3e249f;
    stim[20] = 47'h2dcbeb119c55;
    stim[21] = 47'h13d94751505b;
    stim[22] = 47'h29ff613c8b26;
    stim[23] = 47'h7e6771027609;
    stim[24] = 47'h26866ca7eb75;
    stim[25] = 47'h17af4e429cb5;
    stim[26] = 47'h0dcf564a98a6;
    stim[27] = 47'h50b2ef27e6a5;
    stim[28] = 47'h69129c75e462;
    stim[29] = 47'h08ba34d455fa;
    stim[30] = 47'h0abab60a3dd1;
    stim[31] = 47'h56b2539aa67b;
    stim[32] = 47'h447b22ea0c8e;
    stim[33] = 47'h011b183da657;
    stim[34] = 47'h333af8e39c70;
    stim[35] = 47'h1222a93244db;
    stim[36] = 47'h5386db2ef234;
    stim[37] = 47'h0b3ab91cfe8d;
    stim[38] = 47'h4b0ee43ef0dd;
    stim[39] = 47'h459fb9660765;
    stim[40] = 47'h5003045bf087;
    stim[41] = 47'h1a47621b3fe9;
    stim[42] = 47'h1a374520de1a;
    stim[43] = 47'h3206ed3efa5a;
    stim[44] = 47'h5bfe72701860;
    stim[45] = 47'h0baa2d0dbeb4;
    stim[46] = 47'h590e7ba1f7e1;
    stim[47] = 47'h0c57fa8afa2c;
    stim[48] = 47'h2b822ec9fcf7;
    stim[49] = 47'h717bf7d330e3;
    stim[50] = 47'h15ff396fa33c;
    stim[51] = 47'h1e03db08f252;
    stim[52] = 47'h205769baa5c8;
    stim[53] = 47'h3e7256c74e10;
    stim[54] = 47'h30ceb97ba4c4;
    stim[55] = 47'h264e79c550d6;
    stim[56] = 47'h7ca2b8a2dea4;
    stim[57] = 47'h1f531c8c76c1;
    stim[58] = 47'h441e6217bb31;
    stim[59] = 47'h2d4289c2a0a9;
    stim[60] = 47'h26a697ae58f4;
    stim[61] = 47'h33eae7d30eff;
    stim[62] = 47'h3c7f842e39b9;
    stim[63] = 47'h1c5320d39a25;
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
      expv[0] = 68'h00000000000000000;
      expv[1] = 68'h00000000000000000;
      expv[2] = 68'h00000000000000000;
      expv[3] = 68'h00000000000000000;
      expv[4] = 68'h00000000000000000;
      expv[5] = 68'h00000000000000000;
      expv[6] = 68'h00000000000000000;
      expv[7] = 68'h00000000000000000;
      expv[8] = 68'h00000000000000000;
      expv[9] = 68'h00000000000000000;
      expv[10] = 68'h00000000000000000;
      expv[11] = 68'h00000000000000000;
      expv[12] = 68'h00000000000000000;
      expv[13] = 68'h00000000000000000;
      expv[14] = 68'h00000000000000000;
      expv[15] = 68'h00000000000000000;
      expv[16] = 68'h00000000000000000;
      expv[17] = 68'h00000000000000000;
      expv[18] = 68'h00000000000000000;
      expv[19] = 68'h00000000000000000;
      expv[20] = 68'h00000000000000000;
      expv[21] = 68'h00000000000000000;
      expv[22] = 68'h00000000000000000;
      expv[23] = 68'h00000000000000000;
      expv[24] = 68'h00000000000000000;
      expv[25] = 68'h00000000000000000;
      expv[26] = 68'h00000000000000000;
      expv[27] = 68'h00000000000000000;
      expv[28] = 68'h00000000000000000;
      expv[29] = 68'h00000000000000000;
      expv[30] = 68'h00000000000000000;
      expv[31] = 68'h00000000000000000;
      expv[32] = 68'h00000000000000000;
      expv[33] = 68'h00000000000000000;
      expv[34] = 68'h00000000000000000;
      expv[35] = 68'h00000000000000000;
      expv[36] = 68'h00000000000000000;
      expv[37] = 68'h00000000000000000;
      expv[38] = 68'h00000000000000000;
      expv[39] = 68'h00000000000000000;
      expv[40] = 68'h00000000000000000;
      expv[41] = 68'h00000000000000000;
      expv[42] = 68'h00000000000000000;
      expv[43] = 68'h00000000000000000;
      expv[44] = 68'h00000000000000000;
      expv[45] = 68'h00000000000000000;
      expv[46] = 68'h00000000000000000;
      expv[47] = 68'h00000000000000000;
      expv[48] = 68'h00000000000000000;
      expv[49] = 68'h00000000000000000;
      expv[50] = 68'h00000000000000000;
      expv[51] = 68'h00000000000000000;
      expv[52] = 68'h00000000000000000;
      expv[53] = 68'h00000000000000000;
      expv[54] = 68'h00000000000000000;
      expv[55] = 68'h00000000000000000;
      expv[56] = 68'h00000000000000000;
      expv[57] = 68'h00000000000000000;
      expv[58] = 68'h00000000000000000;
      expv[59] = 68'h00000000000000000;
      expv[60] = 68'h00000000000000000;
      expv[61] = 68'h00000000000000000;
      expv[62] = 68'h00000000000000000;
      expv[63] = 68'h00000000000000000;
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
