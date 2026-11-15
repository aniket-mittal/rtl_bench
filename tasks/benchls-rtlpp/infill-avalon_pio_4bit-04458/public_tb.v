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

  rtlpp_04458 dut (
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
    stim[0] = 41'h1cddfd835f0;
    stim[1] = 41'h178d0455cd3;
    stim[2] = 41'h0ffeb7d3402;
    stim[3] = 41'h012f4d71a92;
    stim[4] = 41'h1362b64a5b3;
    stim[5] = 41'h1ea75aaca36;
    stim[6] = 41'h0d3c0e3cb5e;
    stim[7] = 41'h0ff41f02c6d;
    stim[8] = 41'h193ffcca321;
    stim[9] = 41'h063e514e1d1;
    stim[10] = 41'h0a2f8562f17;
    stim[11] = 41'h1668fe719c0;
    stim[12] = 41'h1ab77b21524;
    stim[13] = 41'h0fa9a081e18;
    stim[14] = 41'h16b25bc94dd;
    stim[15] = 41'h0ffc21ee793;
    stim[16] = 41'h1f316469147;
    stim[17] = 41'h18f77c91207;
    stim[18] = 41'h0e2ff73a3d5;
    stim[19] = 41'h0d7fc6a951a;
    stim[20] = 41'h1a26b42d40d;
    stim[21] = 41'h18f3fe74116;
    stim[22] = 41'h006dadbec47;
    stim[23] = 41'h016aa05e0ff;
    stim[24] = 41'h0abea7169a1;
    stim[25] = 41'h17a88a71802;
    stim[26] = 41'h1d380a7f84d;
    stim[27] = 41'h097dd67e359;
    stim[28] = 41'h06e8542c3e1;
    stim[29] = 41'h09e49911259;
    stim[30] = 41'h143bf60c5b5;
    stim[31] = 41'h17f2f09f907;
    stim[32] = 41'h0479e9a4491;
    stim[33] = 41'h063a1be21c4;
    stim[34] = 41'h07bf29eba4c;
    stim[35] = 41'h133bce3d0fb;
    stim[36] = 41'h1aa3522d3a1;
    stim[37] = 41'h09ed483dd43;
    stim[38] = 41'h0e290d7b5cc;
    stim[39] = 41'h156bf5ae018;
    stim[40] = 41'h0efcd7c4614;
    stim[41] = 41'h0464bbd88fb;
    stim[42] = 41'h0efd9094c9f;
    stim[43] = 41'h0665ae6418b;
    stim[44] = 41'h1378b479cf9;
    stim[45] = 41'h13714c2a1c6;
    stim[46] = 41'h0afc8a79de8;
    stim[47] = 41'h0baf5affae2;
    stim[48] = 41'h12f39d9ab0d;
    stim[49] = 41'h0f29f911002;
    stim[50] = 41'h04b7a324f78;
    stim[51] = 41'h1664b41e495;
    stim[52] = 41'h06666a2ea89;
    stim[53] = 41'h18f4d5828d5;
    stim[54] = 41'h16ac18fecf9;
    stim[55] = 41'h07feaaa6e58;
    stim[56] = 41'h13e830eb82a;
    stim[57] = 41'h0763f0e28eb;
    stim[58] = 41'h0564e9452f2;
    stim[59] = 41'h08b5c424868;
    stim[60] = 41'h1fbcc456d00;
    stim[61] = 41'h1025dd42cdc;
    stim[62] = 41'h086444c6c92;
    stim[63] = 41'h1b348a97e60;
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
      expv[4] = 33'h000000004;
      expv[5] = 33'h000000000;
      expv[6] = 33'h00000000f;
      expv[7] = 33'h000000000;
      expv[8] = 33'h000000000;
      expv[9] = 33'h00000000f;
      expv[10] = 33'h000000008;
      expv[11] = 33'h000000000;
      expv[12] = 33'h000000000;
      expv[13] = 33'h00000000f;
      expv[14] = 33'h000000000;
      expv[15] = 33'h000000000;
      expv[16] = 33'h000000000;
      expv[17] = 33'h00000000f;
      expv[18] = 33'h00000000f;
      expv[19] = 33'h000000000;
      expv[20] = 33'h000000000;
      expv[21] = 33'h00000000f;
      expv[22] = 33'h00000000f;
      expv[23] = 33'h000000001;
      expv[24] = 33'h000000005;
      expv[25] = 33'h000000000;
      expv[26] = 33'h100000000;
      expv[27] = 33'h10000000f;
      expv[28] = 33'h100000000;
      expv[29] = 33'h10000000b;
      expv[30] = 33'h100000000;
      expv[31] = 33'h100000002;
      expv[32] = 33'h100000002;
      expv[33] = 33'h100000001;
      expv[34] = 33'h100000008;
      expv[35] = 33'h10000000e;
      expv[36] = 33'h100000002;
      expv[37] = 33'h10000000f;
      expv[38] = 33'h100000000;
      expv[39] = 33'h100000000;
      expv[40] = 33'h100000002;
      expv[41] = 33'h100000000;
      expv[42] = 33'h100000001;
      expv[43] = 33'h100000000;
      expv[44] = 33'h100000009;
      expv[45] = 33'h100000008;
      expv[46] = 33'h100000008;
      expv[47] = 33'h100000000;
      expv[48] = 33'h100000000;
      expv[49] = 33'h100000008;
      expv[50] = 33'h100000000;
      expv[51] = 33'h100000002;
      expv[52] = 33'h100000008;
      expv[53] = 33'h100000009;
      expv[54] = 33'h10000000f;
      expv[55] = 33'h100000005;
      expv[56] = 33'h10000000f;
      expv[57] = 33'h100000009;
      expv[58] = 33'h10000000d;
      expv[59] = 33'h100000005;
      expv[60] = 33'h100000000;
      expv[61] = 33'h10000000f;
      expv[62] = 33'h100000009;
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
