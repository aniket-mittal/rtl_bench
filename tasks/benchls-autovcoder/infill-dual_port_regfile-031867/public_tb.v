// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 77;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_031867 dut (
    .clk(clk),
    .rst(in_vec[76:76]),
    .memWriteA(in_vec[75:75]),
    .memWriteB(in_vec[74:74]),
    .addrA(in_vec[73:69]),
    .addrB(in_vec[68:64]),
    .dataInA(in_vec[63:32]),
    .dataInB(in_vec[31:0]),
    .dataOutA(out_vec[63:32]),
    .dataOutB(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 77'h10df89dffbcda04b4e6e;
    stim[1] = 77'h197d1f8adbdeb5c5a160;
    stim[2] = 77'h0b00bcfd63b176acbc34;
    stim[3] = 77'h06a8df0f0ee6763d809d;
    stim[4] = 77'h02160a0a3ff91646892d;
    stim[5] = 77'h069cfb3c5dbd1fe9f727;
    stim[6] = 77'h067d09475d3118d22a53;
    stim[7] = 77'h00e83791c8ba6b173973;
    stim[8] = 77'h05cebc35ead3abfbe920;
    stim[9] = 77'h0c20c63c8062376e4b5f;
    stim[10] = 77'h0ccd9b6fc73857b27aae;
    stim[11] = 77'h1ee7ad191dbb87824984;
    stim[12] = 77'h029ed26023982bcde0f3;
    stim[13] = 77'h012529283f1791d992f2;
    stim[14] = 77'h08dd0c4f617d5fd2852f;
    stim[15] = 77'h0025593ddbec5ef6379d;
    stim[16] = 77'h0772216b2d3eca8e45b5;
    stim[17] = 77'h0a1a74b63c39ca421c3c;
    stim[18] = 77'h0be7952e09422623871c;
    stim[19] = 77'h0e68f306fc65807d86b8;
    stim[20] = 77'h0ce5f48794f27836e7d3;
    stim[21] = 77'h028ace11740861c9775c;
    stim[22] = 77'h0bd05540e511f90c331e;
    stim[23] = 77'h013e73eb488560487317;
    stim[24] = 77'h0d42d2cf2c2a096c5b0b;
    stim[25] = 77'h09794d242105788367e1;
    stim[26] = 77'h0fc20e161a894450d412;
    stim[27] = 77'h0dfc388a1e4fdc8764eb;
    stim[28] = 77'h049b3782677647fb75d6;
    stim[29] = 77'h00093d0ea3502601de89;
    stim[30] = 77'h03f702f020d724aa593e;
    stim[31] = 77'h0370125987b09c44fc83;
    stim[32] = 77'h000a85abfbc49bffce42;
    stim[33] = 77'h0220648777fd7cd9b1f6;
    stim[34] = 77'h1f921c0605b24ea70b52;
    stim[35] = 77'h02bf39d742e624301ad7;
    stim[36] = 77'h0c0915716acfc1f621be;
    stim[37] = 77'h0940a5b82e1b2cee75d4;
    stim[38] = 77'h0fa53a729660f81b3f67;
    stim[39] = 77'h07ca528d1d75e226cc62;
    stim[40] = 77'h0deabd3e6344f244faf0;
    stim[41] = 77'h07a90e6bf82914049040;
    stim[42] = 77'h0d512fb0f6da4be8bee2;
    stim[43] = 77'h0b334120055e46302cf4;
    stim[44] = 77'h055b7f9735c820901170;
    stim[45] = 77'h07b1b33cb53bbeb39b2d;
    stim[46] = 77'h0cea490a6a55952b9c24;
    stim[47] = 77'h0bb8c907223e6bc09357;
    stim[48] = 77'h036e152d136d97912f0c;
    stim[49] = 77'h0d939269069498d436f0;
    stim[50] = 77'h0dce2af2003b36e6c32d;
    stim[51] = 77'h05495b52f179c70f2f1b;
    stim[52] = 77'h0c96b2d8fbcb88b281ab;
    stim[53] = 77'h0e90b1f7b121dbd6f933;
    stim[54] = 77'h0d8c01523cfb45b06dd3;
    stim[55] = 77'h09fe2627f91dd9b2129e;
    stim[56] = 77'h026bb89d1b9f538a0dbb;
    stim[57] = 77'h0f94ef6258396b01973d;
    stim[58] = 77'h0dc01f8efae9ec8fafd1;
    stim[59] = 77'h0a2dfd0b65547791b27e;
    stim[60] = 77'h0de6866722cb62f52718;
    stim[61] = 77'h0ed812f071a3fa84b334;
    stim[62] = 77'h0e47ef7fbcba464b6704;
    stim[63] = 77'h0d8f272bdd5c4d90a4b6;
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
      expv[0] = 64'hxxxxxxxxxxxxxxxx;
      expv[1] = 64'h00000000xxxxxxxx;
      expv[2] = 64'h0000000000000000;
      expv[3] = 64'hxxxxxxxx00000000;
      expv[4] = 64'hxxxxxxxxxxxxxxxx;
      expv[5] = 64'hxxxxxxxx00000000;
      expv[6] = 64'hxxxxxxxx00000000;
      expv[7] = 64'hxxxxxxxx763d809d;
      expv[8] = 64'hxxxxxxxx00000000;
      expv[9] = 64'h0000000000000000;
      expv[10] = 64'h0000000000000000;
      expv[11] = 64'h0000000000000000;
      expv[12] = 64'hxxxxxxxxxxxxxxxx;
      expv[13] = 64'hxxxxxxxxxxxxxxxx;
      expv[14] = 64'h0000000018d22a53;
      expv[15] = 64'hc63c8062xxxxxxxx;
      expv[16] = 64'hxxxxxxxx00000000;
      expv[17] = 64'h00000000xxxxxxxx;
      expv[18] = 64'h00000000xxxxxxxx;
      expv[19] = 64'h0000000000000000;
      expv[20] = 64'h0000000000000000;
      expv[21] = 64'hxxxxxxxxxxxxxxxx;
      expv[22] = 64'h0000000074b63c39;
      expv[23] = 64'hxxxxxxxx5540e511;
      expv[24] = 64'h0000000000000000;
      expv[25] = 64'h00000000xxxxxxxx;
      expv[26] = 64'h0000000000000000;
      expv[27] = 64'h0000000000000000;
      expv[28] = 64'hxxxxxxxx00000000;
      expv[29] = 64'h00000000xxxxxxxx;
      expv[30] = 64'h952e0942xxxxxxxx;
      expv[31] = 64'h47fb75d674b63c39;
      expv[32] = 64'h00000000d2cf2c2a;
      expv[33] = 64'hxxxxxxxx00000000;
      expv[34] = 64'h0000000000000000;
      expv[35] = 64'hxxxxxxxx952e0942;
      expv[36] = 64'h0000000000000000;
      expv[37] = 64'h0000000000000000;
      expv[38] = 64'h0000000000000000;
      expv[39] = 64'h0e161a8900000000;
      expv[40] = 64'h0000000000000000;
      expv[41] = 64'h3a72966000000000;
      expv[42] = 64'h0000000000000000;
      expv[43] = 64'h00000000f306fc65;
      expv[44] = 64'h2fb0f6da00000000;
      expv[45] = 64'h3a72966000000000;
      expv[46] = 64'h0000000000000000;
      expv[47] = 64'h00000000bcfd63b1;
      expv[48] = 64'h20901170abfbe920;
      expv[49] = 64'h0000000000000000;
      expv[50] = 64'h0000000000000000;
      expv[51] = 64'h952b9c2400000000;
      expv[52] = 64'h0000000000000000;
      expv[53] = 64'h0000000000000000;
      expv[54] = 64'h0000000000000000;
      expv[55] = 64'h000000000e161a89;
      expv[56] = 64'h98d436f04d242105;
      expv[57] = 64'h0000000000000000;
      expv[58] = 64'h0000000000000000;
      expv[59] = 64'h0000000057b27aae;
      expv[60] = 64'h0000000000000000;
      expv[61] = 64'h0000000000000000;
      expv[62] = 64'h0000000000000000;
      expv[63] = 64'h0000000000000000;
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
