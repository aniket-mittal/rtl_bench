// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 31;
  localparam OW = 36;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_01656 dut (
    .clk(clk),
    .rstn(in_vec[30:30]),
    .tic_enable(in_vec[29:29]),
    .f_control(in_vec[28:0]),
    .carrier_val(out_vec[35:4]),
    .i_sign(out_vec[3:3]),
    .i_mag(out_vec[2:2]),
    .q_sign(out_vec[1:1]),
    .q_mag(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 31'h27a65d94;
    stim[1] = 31'h239c053b;
    stim[2] = 31'h711ec633;
    stim[3] = 31'h63a29d03;
    stim[4] = 31'h67c8df46;
    stim[5] = 31'h441e20fc;
    stim[6] = 31'h55ee2c02;
    stim[7] = 31'h6076d23a;
    stim[8] = 31'h7e97e432;
    stim[9] = 31'h4b279282;
    stim[10] = 31'h5b71d229;
    stim[11] = 31'h47399ec0;
    stim[12] = 31'h7effeaac;
    stim[13] = 31'h6a32ea98;
    stim[14] = 31'h51044862;
    stim[15] = 31'h5c51febb;
    stim[16] = 31'h66205660;
    stim[17] = 31'h69e10536;
    stim[18] = 31'h603a1dcc;
    stim[19] = 31'h71a42196;
    stim[20] = 31'h557adc58;
    stim[21] = 31'h5c35b7d8;
    stim[22] = 31'h6957b97e;
    stim[23] = 31'h51082257;
    stim[24] = 31'h6335225c;
    stim[25] = 31'h61f3f804;
    stim[26] = 31'h754d39a3;
    stim[27] = 31'h527f4cc6;
    stim[28] = 31'h5d1a9dfe;
    stim[29] = 31'h621e8659;
    stim[30] = 31'h50c762e1;
    stim[31] = 31'h67cddb46;
    stim[32] = 31'h4beaedaa;
    stim[33] = 31'h666865cb;
    stim[34] = 31'h5c34493e;
    stim[35] = 31'h7eb6cb72;
    stim[36] = 31'h5bbbeb6c;
    stim[37] = 31'h46509c2b;
    stim[38] = 31'h6d1807a0;
    stim[39] = 31'h52f1020d;
    stim[40] = 31'h6d37fb0b;
    stim[41] = 31'h41725691;
    stim[42] = 31'h45b5c381;
    stim[43] = 31'h75d49141;
    stim[44] = 31'h7df24bc2;
    stim[45] = 31'h29a9857a;
    stim[46] = 31'h7b6cda9a;
    stim[47] = 31'h570d525e;
    stim[48] = 31'h6b49b1b7;
    stim[49] = 31'h5f6428df;
    stim[50] = 31'h6d1122e5;
    stim[51] = 31'h5413761d;
    stim[52] = 31'h5f978d1d;
    stim[53] = 31'h5d67cf6c;
    stim[54] = 31'h5c53abfa;
    stim[55] = 31'h4e927174;
    stim[56] = 31'h7a726795;
    stim[57] = 31'h42d2c4f0;
    stim[58] = 31'h5a470ae6;
    stim[59] = 31'h481ffa7e;
    stim[60] = 31'h587c2901;
    stim[61] = 31'h73f4c0a9;
    stim[62] = 31'h6cb565b6;
    stim[63] = 31'h5a52bb32;
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
      expv[0] = 36'hxxxxxxxxb;
      expv[1] = 36'hxxxxxxxx3;
      expv[2] = 36'hxxxxxxxxe;
      expv[3] = 36'h00000000c;
      expv[4] = 36'h000001119;
      expv[5] = 36'h0000014c9;
      expv[6] = 36'h0000014c6;
      expv[7] = 36'h0000014c6;
      expv[8] = 36'h00000369c;
      expv[9] = 36'h000003709;
      expv[10] = 36'h000003703;
      expv[11] = 36'h000003703;
      expv[12] = 36'h000003709;
      expv[13] = 36'h000004374;
      expv[14] = 36'h000002273;
      expv[15] = 36'h00000227c;
      expv[16] = 36'h000002279;
      expv[17] = 36'h000005a01;
      expv[18] = 36'h000002021;
      expv[19] = 36'h000002a06;
      expv[20] = 36'h000002a3e;
      expv[21] = 36'h000002a34;
      expv[22] = 36'h000002a36;
      expv[23] = 36'h000006d9b;
      expv[24] = 36'h000006d9b;
      expv[25] = 36'h0000047fe;
      expv[26] = 36'h000000b29;
      expv[27] = 36'h000000d16;
      expv[28] = 36'h000000d1e;
      expv[29] = 36'h000000d1c;
      expv[30] = 36'h000005201;
      expv[31] = 36'h000005204;
      expv[32] = 36'h0000024e6;
      expv[33] = 36'h0000024e3;
      expv[34] = 36'h0000038ac;
      expv[35] = 36'h0000038a6;
      expv[36] = 36'h000005b3c;
      expv[37] = 36'h000005b39;
      expv[38] = 36'h000005b31;
      expv[39] = 36'h000005c03;
      expv[40] = 36'h000005c0b;
      expv[41] = 36'h000003c0b;
      expv[42] = 36'h000003c0e;
      expv[43] = 36'h000003c01;
      expv[44] = 36'h00000106b;
      expv[45] = 36'h00000263b;
      expv[46] = 36'h00000263c;
      expv[47] = 36'h000000004;
      expv[48] = 36'h000000003;
      expv[49] = 36'h000003279;
      expv[50] = 36'h000003271;
      expv[51] = 36'h000005d23;
      expv[52] = 36'h000005d29;
      expv[53] = 36'h000005d26;
      expv[54] = 36'h000005d2c;
      expv[55] = 36'h000005d21;
      expv[56] = 36'h000005d23;
      expv[57] = 36'h00000a633;
      expv[58] = 36'h00000a639;
      expv[59] = 36'h00000a631;
      expv[60] = 36'h00000a633;
      expv[61] = 36'h00000a63e;
      expv[62] = 36'h000003e59;
      expv[63] = 36'h000001246;
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
