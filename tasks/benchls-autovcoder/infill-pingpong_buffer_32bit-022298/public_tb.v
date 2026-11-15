// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 35;
  localparam OW = 35;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_022298 dut (
    .ap_clk(clk),
    .ap_rst(in_vec[34:34]),
    .data_in(in_vec[33:2]),
    .vld_in(in_vec[1:1]),
    .ack_out(in_vec[0:0]),
    .ack_in(out_vec[34:34]),
    .data_out(out_vec[33:2]),
    .vld_out(out_vec[1:1]),
    .apdone_blk(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 35'h5755174e6;
    stim[1] = 35'h44dc75e2b;
    stim[2] = 35'h0e7af7cac;
    stim[3] = 35'h0b28ce00e;
    stim[4] = 35'h001b3eeb2;
    stim[5] = 35'h10f507b09;
    stim[6] = 35'h1051e43e2;
    stim[7] = 35'h0a00d4100;
    stim[8] = 35'h3eab6f9c8;
    stim[9] = 35'h0e5adcd08;
    stim[10] = 35'h1346f2c5b;
    stim[11] = 35'h11d33e376;
    stim[12] = 35'h04dd435aa;
    stim[13] = 35'h18fe4be52;
    stim[14] = 35'h1aff3ed26;
    stim[15] = 35'h737b2903f;
    stim[16] = 35'h293d09437;
    stim[17] = 35'h0943ddc24;
    stim[18] = 35'h30d6946e1;
    stim[19] = 35'h3d3fafec5;
    stim[20] = 35'h2295971b3;
    stim[21] = 35'h3eca23ccd;
    stim[22] = 35'h36be546ca;
    stim[23] = 35'h1a5214333;
    stim[24] = 35'h0a21e431c;
    stim[25] = 35'h0ae86a801;
    stim[26] = 35'h1b8e05809;
    stim[27] = 35'h0a3a94ee1;
    stim[28] = 35'h220b9b385;
    stim[29] = 35'h3ca1ead3a;
    stim[30] = 35'h29385a812;
    stim[31] = 35'h253cfc3a9;
    stim[32] = 35'h3357823e2;
    stim[33] = 35'h11409ac89;
    stim[34] = 35'h2e5ba6464;
    stim[35] = 35'h02cf0077e;
    stim[36] = 35'h2eaba2af7;
    stim[37] = 35'h16ee2bf45;
    stim[38] = 35'h164256952;
    stim[39] = 35'h233bc8b4c;
    stim[40] = 35'h279863153;
    stim[41] = 35'h3c9dd2d2b;
    stim[42] = 35'h03079c74f;
    stim[43] = 35'h29235e3fd;
    stim[44] = 35'h19823ca91;
    stim[45] = 35'h22638f62b;
    stim[46] = 35'h1e86e22d7;
    stim[47] = 35'h0e45a06bf;
    stim[48] = 35'h0ce4e7571;
    stim[49] = 35'h197214fe4;
    stim[50] = 35'h1c5956b9e;
    stim[51] = 35'h0ad3e23d6;
    stim[52] = 35'h26182638e;
    stim[53] = 35'h14b2ebf0f;
    stim[54] = 35'h127d754c8;
    stim[55] = 35'h18c7e9356;
    stim[56] = 35'h2ce41b709;
    stim[57] = 35'h05f52d1f4;
    stim[58] = 35'h20557a0ec;
    stim[59] = 35'h0b2b8b37b;
    stim[60] = 35'h09c600318;
    stim[61] = 35'h33d239300;
    stim[62] = 35'h3aacbf88d;
    stim[63] = 35'h3a50e96c4;
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
      expv[0] = 35'hxxxxxxxxx;
      expv[1] = 35'hxxxxxxxxx;
      expv[2] = 35'h04dc75e28;
      expv[3] = 35'h4e7af7cac;
      expv[4] = 35'h4b28ce00f;
      expv[5] = 35'h0b28ce00f;
      expv[6] = 35'h401b3eeb3;
      expv[7] = 35'h001b3eeb3;
      expv[8] = 35'h001b3eeb3;
      expv[9] = 35'h001b3eeb3;
      expv[10] = 35'h001b3eeb3;
      expv[11] = 35'h5051e43e3;
      expv[12] = 35'h1051e43e3;
      expv[13] = 35'h1051e43e3;
      expv[14] = 35'h1051e43e3;
      expv[15] = 35'h1051e43e3;
      expv[16] = 35'h1051e43e0;
      expv[17] = 35'h693d09434;
      expv[18] = 35'h4943ddc24;
      expv[19] = 35'h70d6946e0;
      expv[20] = 35'h7d3fafec4;
      expv[21] = 35'h6295971b2;
      expv[22] = 35'h7eca23ccc;
      expv[23] = 35'h76be546ca;
      expv[24] = 35'h5a5214333;
      expv[25] = 35'h5a5214332;
      expv[26] = 35'h4ae86a800;
      expv[27] = 35'h5b8e05808;
      expv[28] = 35'h4a3a94ee0;
      expv[29] = 35'h620b9b384;
      expv[30] = 35'h7ca1ead3b;
      expv[31] = 35'h3ca1ead3b;
      expv[32] = 35'h69385a813;
      expv[33] = 35'h29385a813;
      expv[34] = 35'h7357823e3;
      expv[35] = 35'h7357823e3;
      expv[36] = 35'h3357823e3;
      expv[37] = 35'h42cf0077e;
      expv[38] = 35'h56ee2bf44;
      expv[39] = 35'h564256953;
      expv[40] = 35'h564256952;
      expv[41] = 35'h679863152;
      expv[42] = 35'h7c9dd2d2a;
      expv[43] = 35'h43079c74e;
      expv[44] = 35'h69235e3fc;
      expv[45] = 35'h59823ca90;
      expv[46] = 35'h62638f62a;
      expv[47] = 35'h5e86e22d6;
      expv[48] = 35'h4e45a06be;
      expv[49] = 35'h4ce4e7570;
      expv[50] = 35'h597214fe4;
      expv[51] = 35'h5c5956b9f;
      expv[52] = 35'h1c5956b9f;
      expv[53] = 35'h1c5956b9f;
      expv[54] = 35'h4ad3e23d7;
      expv[55] = 35'h4ad3e23d7;
      expv[56] = 35'h0ad3e23d7;
      expv[57] = 35'h58c7e9357;
      expv[58] = 35'h58c7e9357;
      expv[59] = 35'h58c7e9356;
      expv[60] = 35'h4b2b8b37b;
      expv[61] = 35'h4b2b8b37b;
      expv[62] = 35'h4b2b8b37a;
      expv[63] = 35'h7aacbf88c;
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
