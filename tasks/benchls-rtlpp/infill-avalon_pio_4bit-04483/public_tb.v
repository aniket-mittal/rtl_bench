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

  rtlpp_04483 dut (
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
    stim[0] = 41'h129d90eceb7;
    stim[1] = 41'h0696f650580;
    stim[2] = 41'h19a7d1b6e90;
    stim[3] = 41'h006b66be936;
    stim[4] = 41'h08bbe63e580;
    stim[5] = 41'h0aa12373ab9;
    stim[6] = 41'h056767e8e44;
    stim[7] = 41'h1563a9f980a;
    stim[8] = 41'h04291aec314;
    stim[9] = 41'h0579284f1a3;
    stim[10] = 41'h09aa1d5418b;
    stim[11] = 41'h117a151f04d;
    stim[12] = 41'h1cf4f38ab93;
    stim[13] = 41'h01e8c92e7ed;
    stim[14] = 41'h00235ab5663;
    stim[15] = 41'h0f22f235251;
    stim[16] = 41'h00fbed2b2ae;
    stim[17] = 41'h0697d7813c6;
    stim[18] = 41'h03f9759b5f1;
    stim[19] = 41'h1c749760778;
    stim[20] = 41'h00a33d338c1;
    stim[21] = 41'h16f5cf725da;
    stim[22] = 41'h1f388be23d0;
    stim[23] = 41'h18e61f18eca;
    stim[24] = 41'h11f41d5c7b2;
    stim[25] = 41'h0f7404378e7;
    stim[26] = 41'h192811d9d70;
    stim[27] = 41'h09b82b26070;
    stim[28] = 41'h06e44158f39;
    stim[29] = 41'h08249a4adb8;
    stim[30] = 41'h1133faef836;
    stim[31] = 41'h18f4e664dd6;
    stim[32] = 41'h00a738a0da8;
    stim[33] = 41'h1268a80059e;
    stim[34] = 41'h0cb879c027b;
    stim[35] = 41'h0e78faf3ea1;
    stim[36] = 41'h157bcfc82ea;
    stim[37] = 41'h13ec8a217df;
    stim[38] = 41'h0ca292a31e0;
    stim[39] = 41'h196027dd0ae;
    stim[40] = 41'h1676d4ec0e7;
    stim[41] = 41'h0d225cf18da;
    stim[42] = 41'h0727136e8a7;
    stim[43] = 41'h13bf8c389aa;
    stim[44] = 41'h1e61be9cf2a;
    stim[45] = 41'h042448c91c1;
    stim[46] = 41'h0fb66273917;
    stim[47] = 41'h17253198070;
    stim[48] = 41'h057ca7f99b9;
    stim[49] = 41'h176a6f98c3e;
    stim[50] = 41'h00b5f649983;
    stim[51] = 41'h0a69cbc1cee;
    stim[52] = 41'h0a24b656d2d;
    stim[53] = 41'h1fa8f19bb5e;
    stim[54] = 41'h0eb3e559529;
    stim[55] = 41'h15b9a867a44;
    stim[56] = 41'h107cb5ea89f;
    stim[57] = 41'h1ca4f5bb8a2;
    stim[58] = 41'h0ca17ab3fd6;
    stim[59] = 41'h0dbbb9c1d35;
    stim[60] = 41'h02e72818cde;
    stim[61] = 41'h0d22340fda6;
    stim[62] = 41'h0f39e2f924a;
    stim[63] = 41'h15ed9b18abe;
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
      expv[7] = 33'h000000005;
      expv[8] = 33'h100000000;
      expv[9] = 33'h100000000;
      expv[10] = 33'h100000005;
      expv[11] = 33'h100000000;
      expv[12] = 33'h10000000a;
      expv[13] = 33'h10000000f;
      expv[14] = 33'h100000007;
      expv[15] = 33'h100000000;
      expv[16] = 33'h100000000;
      expv[17] = 33'h000000000;
      expv[18] = 33'h000000000;
      expv[19] = 33'h00000000f;
      expv[20] = 33'h000000000;
      expv[21] = 33'h000000002;
      expv[22] = 33'h000000000;
      expv[23] = 33'h00000000f;
      expv[24] = 33'h00000000f;
      expv[25] = 33'h000000000;
      expv[26] = 33'h000000000;
      expv[27] = 33'h00000000f;
      expv[28] = 33'h000000000;
      expv[29] = 33'h00000000b;
      expv[30] = 33'h000000000;
      expv[31] = 33'h000000000;
      expv[32] = 33'h00000000f;
      expv[33] = 33'h000000002;
      expv[34] = 33'h000000000;
      expv[35] = 33'h000000000;
      expv[36] = 33'h000000000;
      expv[37] = 33'h000000000;
      expv[38] = 33'h000000000;
      expv[39] = 33'h000000000;
      expv[40] = 33'h00000000f;
      expv[41] = 33'h000000000;
      expv[42] = 33'h000000000;
      expv[43] = 33'h00000000c;
      expv[44] = 33'h000000000;
      expv[45] = 33'h00000000f;
      expv[46] = 33'h000000000;
      expv[47] = 33'h000000000;
      expv[48] = 33'h000000000;
      expv[49] = 33'h000000005;
      expv[50] = 33'h100000000;
      expv[51] = 33'h100000002;
      expv[52] = 33'h100000000;
      expv[53] = 33'h100000000;
      expv[54] = 33'h00000000f;
      expv[55] = 33'h000000000;
      expv[56] = 33'h10000000e;
      expv[57] = 33'h10000000e;
      expv[58] = 33'h00000000c;
      expv[59] = 33'h000000000;
      expv[60] = 33'h000000000;
      expv[61] = 33'h00000000b;
      expv[62] = 33'h100000000;
      expv[63] = 33'h100000000;
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
