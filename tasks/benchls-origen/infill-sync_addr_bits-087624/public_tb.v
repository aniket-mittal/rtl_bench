// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_087624 dut (
    .clk(clk),
    .aclr_n(in_vec[10:10]),
    .cfg_inc_sync(in_vec[9:9]),
    .cfg_sync_mode(in_vec[8:8]),
    .async_input(in_vec[7:0]),
    .sync_output(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h17e;
    stim[1] = 11'h350;
    stim[2] = 11'h4f1;
    stim[3] = 11'h5f4;
    stim[4] = 11'h6f9;
    stim[5] = 11'h7cd;
    stim[6] = 11'h69d;
    stim[7] = 11'h607;
    stim[8] = 11'h7ad;
    stim[9] = 11'h5e3;
    stim[10] = 11'h655;
    stim[11] = 11'h4cd;
    stim[12] = 11'h757;
    stim[13] = 11'h7db;
    stim[14] = 11'h47e;
    stim[15] = 11'h7f3;
    stim[16] = 11'h762;
    stim[17] = 11'h49f;
    stim[18] = 11'h4c6;
    stim[19] = 11'h7a3;
    stim[20] = 11'h4a3;
    stim[21] = 11'h447;
    stim[22] = 11'h517;
    stim[23] = 11'h588;
    stim[24] = 11'h479;
    stim[25] = 11'h547;
    stim[26] = 11'h511;
    stim[27] = 11'h492;
    stim[28] = 11'h78c;
    stim[29] = 11'h625;
    stim[30] = 11'h5ff;
    stim[31] = 11'h538;
    stim[32] = 11'h797;
    stim[33] = 11'h41f;
    stim[34] = 11'h5e2;
    stim[35] = 11'h530;
    stim[36] = 11'h7ec;
    stim[37] = 11'h7fb;
    stim[38] = 11'h7ca;
    stim[39] = 11'h4aa;
    stim[40] = 11'h771;
    stim[41] = 11'h6fe;
    stim[42] = 11'h7a8;
    stim[43] = 11'h518;
    stim[44] = 11'h70c;
    stim[45] = 11'h513;
    stim[46] = 11'h468;
    stim[47] = 11'h631;
    stim[48] = 11'h79f;
    stim[49] = 11'h636;
    stim[50] = 11'h417;
    stim[51] = 11'h526;
    stim[52] = 11'h46d;
    stim[53] = 11'h426;
    stim[54] = 11'h61a;
    stim[55] = 11'h429;
    stim[56] = 11'h56e;
    stim[57] = 11'h66e;
    stim[58] = 11'h6be;
    stim[59] = 11'h7ae;
    stim[60] = 11'h577;
    stim[61] = 11'h5d7;
    stim[62] = 11'h63e;
    stim[63] = 11'h58e;
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
      expv[0] = 8'h7e;
      expv[1] = 8'h50;
      expv[2] = 8'h00;
      expv[3] = 8'hf4;
      expv[4] = 8'h00;
      expv[5] = 8'hcd;
      expv[6] = 8'hf4;
      expv[7] = 8'hf9;
      expv[8] = 8'had;
      expv[9] = 8'he3;
      expv[10] = 8'h07;
      expv[11] = 8'he3;
      expv[12] = 8'h57;
      expv[13] = 8'hdb;
      expv[14] = 8'h57;
      expv[15] = 8'hf3;
      expv[16] = 8'h62;
      expv[17] = 8'hf3;
      expv[18] = 8'h62;
      expv[19] = 8'ha3;
      expv[20] = 8'hc6;
      expv[21] = 8'ha3;
      expv[22] = 8'h17;
      expv[23] = 8'h88;
      expv[24] = 8'h17;
      expv[25] = 8'h47;
      expv[26] = 8'h11;
      expv[27] = 8'h47;
      expv[28] = 8'h8c;
      expv[29] = 8'h11;
      expv[30] = 8'hff;
      expv[31] = 8'h38;
      expv[32] = 8'h97;
      expv[33] = 8'h38;
      expv[34] = 8'he2;
      expv[35] = 8'h30;
      expv[36] = 8'hec;
      expv[37] = 8'hfb;
      expv[38] = 8'hca;
      expv[39] = 8'hfb;
      expv[40] = 8'h71;
      expv[41] = 8'hca;
      expv[42] = 8'ha8;
      expv[43] = 8'h18;
      expv[44] = 8'h0c;
      expv[45] = 8'h13;
      expv[46] = 8'h0c;
      expv[47] = 8'h0c;
      expv[48] = 8'h9f;
      expv[49] = 8'h68;
      expv[50] = 8'h9f;
      expv[51] = 8'h26;
      expv[52] = 8'h17;
      expv[53] = 8'h26;
      expv[54] = 8'h26;
      expv[55] = 8'h26;
      expv[56] = 8'h6e;
      expv[57] = 8'h1a;
      expv[58] = 8'h29;
      expv[59] = 8'hae;
      expv[60] = 8'h77;
      expv[61] = 8'hd7;
      expv[62] = 8'hae;
      expv[63] = 8'h8e;
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
