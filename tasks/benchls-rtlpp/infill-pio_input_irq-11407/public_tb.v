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

  rtlpp_11407 dut (
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
    stim[0] = 41'h0c8403b01d7;
    stim[1] = 41'h1007bcc8802;
    stim[2] = 41'h16e0c04e741;
    stim[3] = 41'h1cb4dd13e5a;
    stim[4] = 41'h1525ef43603;
    stim[5] = 41'h103f681bbd4;
    stim[6] = 41'h1b65475e657;
    stim[7] = 41'h1dabba2f4c3;
    stim[8] = 41'h1b7908c1efb;
    stim[9] = 41'h11b37b851a3;
    stim[10] = 41'h17b19128f4e;
    stim[11] = 41'h07ae8fdb38d;
    stim[12] = 41'h19e431f7e6c;
    stim[13] = 41'h0c30d21e934;
    stim[14] = 41'h082edb60a62;
    stim[15] = 41'h142ef1694f8;
    stim[16] = 41'h0f7c385ac84;
    stim[17] = 41'h11a536a3d1d;
    stim[18] = 41'h09210f02295;
    stim[19] = 41'h16a2365513d;
    stim[20] = 41'h0ced31e2ddc;
    stim[21] = 41'h11eda2e8019;
    stim[22] = 41'h0db4f020bc3;
    stim[23] = 41'h17255f487e0;
    stim[24] = 41'h197df1acd00;
    stim[25] = 41'h1c6d5755f75;
    stim[26] = 41'h0e3b793f107;
    stim[27] = 41'h05870acf342;
    stim[28] = 41'h11315d9777e;
    stim[29] = 41'h02eb351ee13;
    stim[30] = 41'h0fb40bd39fc;
    stim[31] = 41'h037a619d458;
    stim[32] = 41'h13b9198500a;
    stim[33] = 41'h1bef0d6a7ed;
    stim[34] = 41'h11b3a6ef2db;
    stim[35] = 41'h0d62276af3f;
    stim[36] = 41'h15b42667443;
    stim[37] = 41'h10ff533f2f1;
    stim[38] = 41'h1aa3f304f33;
    stim[39] = 41'h18bde779038;
    stim[40] = 41'h1b2994cbf62;
    stim[41] = 41'h116425d57b4;
    stim[42] = 41'h023ea0b4179;
    stim[43] = 41'h1bf6115dce9;
    stim[44] = 41'h0164d495c6e;
    stim[45] = 41'h0ab6bba2b87;
    stim[46] = 41'h1185bcb499b;
    stim[47] = 41'h0c2228262b5;
    stim[48] = 41'h0ceb8564535;
    stim[49] = 41'h0d3a9fe0622;
    stim[50] = 41'h0eb17745d2c;
    stim[51] = 41'h1d3168a7357;
    stim[52] = 41'h1de882bddd1;
    stim[53] = 41'h0a797c8041c;
    stim[54] = 41'h152781fc011;
    stim[55] = 41'h11f1c724606;
    stim[56] = 41'h117673f25ea;
    stim[57] = 41'h13ad16b048a;
    stim[58] = 41'h15af18136d1;
    stim[59] = 41'h17a43e3bf61;
    stim[60] = 41'h06f3b97fb11;
    stim[61] = 41'h106a516fdcd;
    stim[62] = 41'h1ce78b6005a;
    stim[63] = 41'h1f2f78e3bea;
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
      expv[4] = 33'h100000000;
      expv[5] = 33'h100000001;
      expv[6] = 33'h100000003;
      expv[7] = 33'h10000000f;
      expv[8] = 33'h00000000f;
      expv[9] = 33'h10000000c;
      expv[10] = 33'h100000003;
      expv[11] = 33'h100000003;
      expv[12] = 33'h10000000e;
      expv[13] = 33'h10000000f;
      expv[14] = 33'h100000000;
      expv[15] = 33'h100000000;
      expv[16] = 33'h100000003;
      expv[17] = 33'h100000000;
      expv[18] = 33'h100000008;
      expv[19] = 33'h100000000;
      expv[20] = 33'h100000008;
      expv[21] = 33'h100000000;
      expv[22] = 33'h10000000d;
      expv[23] = 33'h100000000;
      expv[24] = 33'h00000000d;
      expv[25] = 33'h00000000f;
      expv[26] = 33'h00000000f;
      expv[27] = 33'h000000000;
      expv[28] = 33'h000000000;
      expv[29] = 33'h000000000;
      expv[30] = 33'h00000000b;
      expv[31] = 33'h000000000;
      expv[32] = 33'h00000000d;
      expv[33] = 33'h000000000;
      expv[34] = 33'h00000000f;
      expv[35] = 33'h000000000;
      expv[36] = 33'h000000000;
      expv[37] = 33'h000000000;
      expv[38] = 33'h000000000;
      expv[39] = 33'h00000000f;
      expv[40] = 33'h00000000f;
      expv[41] = 33'h00000000f;
      expv[42] = 33'h000000000;
      expv[43] = 33'h000000008;
      expv[44] = 33'h00000000f;
      expv[45] = 33'h000000005;
      expv[46] = 33'h000000000;
      expv[47] = 33'h000000000;
      expv[48] = 33'h000000000;
      expv[49] = 33'h000000000;
      expv[50] = 33'h000000000;
      expv[51] = 33'h000000000;
      expv[52] = 33'h000000007;
      expv[53] = 33'h00000000f;
      expv[54] = 33'h000000000;
      expv[55] = 33'h100000000;
      expv[56] = 33'h100000001;
      expv[57] = 33'h100000001;
      expv[58] = 33'h100000001;
      expv[59] = 33'h100000001;
      expv[60] = 33'h100000001;
      expv[61] = 33'h10000000b;
      expv[62] = 33'h100000001;
      expv[63] = 33'h10000000f;
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
