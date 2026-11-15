// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 41;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_10862 dut (
    .clk(clk),
    .address(in_vec[40:39]),
    .chipselect(in_vec[38:38]),
    .in_port(in_vec[37:34]),
    .reset_n(in_vec[33:33]),
    .write_n(in_vec[32:32]),
    .writedata(in_vec[31:0]),
    .irq(out_vec[32:32]),
    .readdata(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 41'h17cf912d67b;
    stim[1] = 41'h1d455baeaa8;
    stim[2] = 41'h0beb183db59;
    stim[3] = 41'h0475baa1dc7;
    stim[4] = 41'h0ae24103568;
    stim[5] = 41'h0effa8286ec;
    stim[6] = 41'h0fb48470379;
    stim[7] = 41'h08630e39179;
    stim[8] = 41'h18aeeafd629;
    stim[9] = 41'h07a9f84000f;
    stim[10] = 41'h1cb57be3826;
    stim[11] = 41'h00719d50477;
    stim[12] = 41'h1d78d359876;
    stim[13] = 41'h06f9a75bc6e;
    stim[14] = 41'h14a39b0eab9;
    stim[15] = 41'h0ab096decef;
    stim[16] = 41'h07fbc743fa3;
    stim[17] = 41'h14ad29d0997;
    stim[18] = 41'h12ea8f0fb7e;
    stim[19] = 41'h0f226fa241e;
    stim[20] = 41'h187dc1b433c;
    stim[21] = 41'h1dee7533c80;
    stim[22] = 41'h1a2cb1384eb;
    stim[23] = 41'h0e3fdf41df1;
    stim[24] = 41'h12777adfe8c;
    stim[25] = 41'h17296d992bd;
    stim[26] = 41'h136c410a057;
    stim[27] = 41'h0d74a6a1b84;
    stim[28] = 41'h0abc8fdd0b1;
    stim[29] = 41'h07bfad0beb1;
    stim[30] = 41'h096a9a0669e;
    stim[31] = 41'h16b0cb0b821;
    stim[32] = 41'h14363c39688;
    stim[33] = 41'h1fe236e81bb;
    stim[34] = 41'h1b606ab335f;
    stim[35] = 41'h09b811be980;
    stim[36] = 41'h1c3d0a7875d;
    stim[37] = 41'h05729d42fe5;
    stim[38] = 41'h1f28e449f63;
    stim[39] = 41'h15f7fefd679;
    stim[40] = 41'h1621751dc8e;
    stim[41] = 41'h19b7979cab6;
    stim[42] = 41'h1f6d21455be;
    stim[43] = 41'h1f7d06a7120;
    stim[44] = 41'h1ae29b329aa;
    stim[45] = 41'h123351be13f;
    stim[46] = 41'h03be0b932bb;
    stim[47] = 41'h1bf11709723;
    stim[48] = 41'h1d7b99bee54;
    stim[49] = 41'h127b36d98c1;
    stim[50] = 41'h07a2c981523;
    stim[51] = 41'h10375cb9004;
    stim[52] = 41'h12b7c69a589;
    stim[53] = 41'h193eb3240f5;
    stim[54] = 41'h0473e22987d;
    stim[55] = 41'h07b9d921fc8;
    stim[56] = 41'h122fb8944db;
    stim[57] = 41'h0fa749fa230;
    stim[58] = 41'h13e2aca0cd7;
    stim[59] = 41'h13660ddcd3a;
    stim[60] = 41'h1f31854dfce;
    stim[61] = 41'h1d7a7e7ad60;
    stim[62] = 41'h16a3e145b39;
    stim[63] = 41'h05e55d0b620;
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
      expv[0] = 33'h000000000;
      expv[1] = 33'h000000000;
      expv[2] = 33'h000000000;
      expv[3] = 33'h000000000;
      expv[4] = 33'h000000001;
      expv[5] = 33'h000000000;
      expv[6] = 33'h000000000;
      expv[7] = 33'h000000000;
      expv[8] = 33'h000000000;
      expv[9] = 33'h00000000f;
      expv[10] = 33'h00000000e;
      expv[11] = 33'h00000000f;
      expv[12] = 33'h000000001;
      expv[13] = 33'h00000000f;
      expv[14] = 33'h00000000b;
      expv[15] = 33'h100000000;
      expv[16] = 33'h100000000;
      expv[17] = 33'h10000000f;
      expv[18] = 33'h100000009;
      expv[19] = 33'h100000007;
      expv[20] = 33'h100000000;
      expv[21] = 33'h10000000f;
      expv[22] = 33'h10000000f;
      expv[23] = 33'h10000000f;
      expv[24] = 33'h100000000;
      expv[25] = 33'h100000007;
      expv[26] = 33'h100000007;
      expv[27] = 33'h10000000d;
      expv[28] = 33'h100000000;
      expv[29] = 33'h100000000;
      expv[30] = 33'h10000000e;
      expv[31] = 33'h100000000;
      expv[32] = 33'h10000000d;
      expv[33] = 33'h10000000d;
      expv[34] = 33'h10000000f;
      expv[35] = 33'h100000004;
      expv[36] = 33'h100000000;
      expv[37] = 33'h10000000f;
      expv[38] = 33'h100000005;
      expv[39] = 33'h10000000f;
      expv[40] = 33'h10000000d;
      expv[41] = 33'h10000000d;
      expv[42] = 33'h10000000f;
      expv[43] = 33'h00000000f;
      expv[44] = 33'h100000001;
      expv[45] = 33'h10000000b;
      expv[46] = 33'h10000000e;
      expv[47] = 33'h10000000e;
      expv[48] = 33'h10000000f;
      expv[49] = 33'h10000000f;
      expv[50] = 33'h10000000e;
      expv[51] = 33'h10000000e;
      expv[52] = 33'h10000000e;
      expv[53] = 33'h10000000e;
      expv[54] = 33'h10000000f;
      expv[55] = 33'h100000001;
      expv[56] = 33'h10000000e;
      expv[57] = 33'h10000000e;
      expv[58] = 33'h100000000;
      expv[59] = 33'h10000000e;
      expv[60] = 33'h10000000e;
      expv[61] = 33'h10000000f;
      expv[62] = 33'h10000000f;
      expv[63] = 33'h10000000e;
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
