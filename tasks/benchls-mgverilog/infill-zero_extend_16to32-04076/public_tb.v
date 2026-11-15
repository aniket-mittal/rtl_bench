// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 16;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04076 dut (
    .string16(in_vec[15:0]),
    .string32(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 16'h182c;
    stim[1] = 16'hcf8c;
    stim[2] = 16'h5110;
    stim[3] = 16'h01d8;
    stim[4] = 16'hab46;
    stim[5] = 16'hf4ba;
    stim[6] = 16'h132f;
    stim[7] = 16'h8f66;
    stim[8] = 16'h34f9;
    stim[9] = 16'h9b15;
    stim[10] = 16'hbba7;
    stim[11] = 16'hd77d;
    stim[12] = 16'hd0fb;
    stim[13] = 16'h91c4;
    stim[14] = 16'h43a2;
    stim[15] = 16'h6904;
    stim[16] = 16'h01d0;
    stim[17] = 16'hc909;
    stim[18] = 16'h32e4;
    stim[19] = 16'h81fa;
    stim[20] = 16'hc37a;
    stim[21] = 16'ha7c3;
    stim[22] = 16'h30db;
    stim[23] = 16'hcc70;
    stim[24] = 16'h1d3c;
    stim[25] = 16'h9332;
    stim[26] = 16'hc30b;
    stim[27] = 16'hca68;
    stim[28] = 16'h59f2;
    stim[29] = 16'h1ac3;
    stim[30] = 16'h4826;
    stim[31] = 16'hb203;
    stim[32] = 16'he4a8;
    stim[33] = 16'hdb01;
    stim[34] = 16'h5f77;
    stim[35] = 16'h92c1;
    stim[36] = 16'h795d;
    stim[37] = 16'he2af;
    stim[38] = 16'hf672;
    stim[39] = 16'h11cd;
    stim[40] = 16'he55a;
    stim[41] = 16'h4b06;
    stim[42] = 16'hbd82;
    stim[43] = 16'h3e76;
    stim[44] = 16'hf4b5;
    stim[45] = 16'h1506;
    stim[46] = 16'h573f;
    stim[47] = 16'h3d54;
    stim[48] = 16'hab14;
    stim[49] = 16'hadb7;
    stim[50] = 16'h16e1;
    stim[51] = 16'hb2e0;
    stim[52] = 16'hb233;
    stim[53] = 16'hc63d;
    stim[54] = 16'h803d;
    stim[55] = 16'h5c3e;
    stim[56] = 16'h15b5;
    stim[57] = 16'h649b;
    stim[58] = 16'h0778;
    stim[59] = 16'hed70;
    stim[60] = 16'h7173;
    stim[61] = 16'h84e7;
    stim[62] = 16'h764b;
    stim[63] = 16'hb5ed;
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
      expv[0] = 32'h182c0000;
      expv[1] = 32'hcf8c0000;
      expv[2] = 32'h51100000;
      expv[3] = 32'h01d80000;
      expv[4] = 32'hab460000;
      expv[5] = 32'hf4ba0000;
      expv[6] = 32'h132f0000;
      expv[7] = 32'h8f660000;
      expv[8] = 32'h34f90000;
      expv[9] = 32'h9b150000;
      expv[10] = 32'hbba70000;
      expv[11] = 32'hd77d0000;
      expv[12] = 32'hd0fb0000;
      expv[13] = 32'h91c40000;
      expv[14] = 32'h43a20000;
      expv[15] = 32'h69040000;
      expv[16] = 32'h01d00000;
      expv[17] = 32'hc9090000;
      expv[18] = 32'h32e40000;
      expv[19] = 32'h81fa0000;
      expv[20] = 32'hc37a0000;
      expv[21] = 32'ha7c30000;
      expv[22] = 32'h30db0000;
      expv[23] = 32'hcc700000;
      expv[24] = 32'h1d3c0000;
      expv[25] = 32'h93320000;
      expv[26] = 32'hc30b0000;
      expv[27] = 32'hca680000;
      expv[28] = 32'h59f20000;
      expv[29] = 32'h1ac30000;
      expv[30] = 32'h48260000;
      expv[31] = 32'hb2030000;
      expv[32] = 32'he4a80000;
      expv[33] = 32'hdb010000;
      expv[34] = 32'h5f770000;
      expv[35] = 32'h92c10000;
      expv[36] = 32'h795d0000;
      expv[37] = 32'he2af0000;
      expv[38] = 32'hf6720000;
      expv[39] = 32'h11cd0000;
      expv[40] = 32'he55a0000;
      expv[41] = 32'h4b060000;
      expv[42] = 32'hbd820000;
      expv[43] = 32'h3e760000;
      expv[44] = 32'hf4b50000;
      expv[45] = 32'h15060000;
      expv[46] = 32'h573f0000;
      expv[47] = 32'h3d540000;
      expv[48] = 32'hab140000;
      expv[49] = 32'hadb70000;
      expv[50] = 32'h16e10000;
      expv[51] = 32'hb2e00000;
      expv[52] = 32'hb2330000;
      expv[53] = 32'hc63d0000;
      expv[54] = 32'h803d0000;
      expv[55] = 32'h5c3e0000;
      expv[56] = 32'h15b50000;
      expv[57] = 32'h649b0000;
      expv[58] = 32'h07780000;
      expv[59] = 32'hed700000;
      expv[60] = 32'h71730000;
      expv[61] = 32'h84e70000;
      expv[62] = 32'h764b0000;
      expv[63] = 32'hb5ed0000;
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
