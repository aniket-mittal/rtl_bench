// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 36;
  localparam OW = 36;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_080276 dut (
    .addr(in_vec[35:34]),
    .MF_RT_M(in_vec[33:2]),
    .S_SEL(in_vec[1:0]),
    .wdata(out_vec[35:4]),
    .BE(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 36'h1b72db124;
    stim[1] = 36'he27fd15d3;
    stim[2] = 36'hc7d22dd8f;
    stim[3] = 36'hd8c4cf9a0;
    stim[4] = 36'h5c3e38c73;
    stim[5] = 36'hff69e3044;
    stim[6] = 36'h46e2baaf7;
    stim[7] = 36'hd11748bca;
    stim[8] = 36'h809c08d62;
    stim[9] = 36'h0e9d04862;
    stim[10] = 36'h1bea81164;
    stim[11] = 36'h08652b85c;
    stim[12] = 36'h315a9c69a;
    stim[13] = 36'h3359dfca2;
    stim[14] = 36'h33839089e;
    stim[15] = 36'h52095a5c4;
    stim[16] = 36'h7eeb16014;
    stim[17] = 36'h860050dd5;
    stim[18] = 36'h2fab8b32c;
    stim[19] = 36'h1a35895f1;
    stim[20] = 36'h89c86eb90;
    stim[21] = 36'h54249d52b;
    stim[22] = 36'h0250759f7;
    stim[23] = 36'h56c44b644;
    stim[24] = 36'hda02e6b8f;
    stim[25] = 36'h1bc909046;
    stim[26] = 36'h5cfe94f09;
    stim[27] = 36'h0e7a4a482;
    stim[28] = 36'ha6d715565;
    stim[29] = 36'h9d5a854cd;
    stim[30] = 36'hc2e00c195;
    stim[31] = 36'h721ff7ef6;
    stim[32] = 36'h081da0e06;
    stim[33] = 36'hbec96af85;
    stim[34] = 36'hb269d8937;
    stim[35] = 36'h422304196;
    stim[36] = 36'h7c40b4e72;
    stim[37] = 36'h1f7f3e476;
    stim[38] = 36'h32acf4916;
    stim[39] = 36'h4412e0971;
    stim[40] = 36'h30e1ee2ad;
    stim[41] = 36'h0212ce6aa;
    stim[42] = 36'h467631e1a;
    stim[43] = 36'h825224f54;
    stim[44] = 36'h6056d457d;
    stim[45] = 36'h17287bb4e;
    stim[46] = 36'hbf41e1a8d;
    stim[47] = 36'h70323f460;
    stim[48] = 36'h148951dfb;
    stim[49] = 36'hec14657f2;
    stim[50] = 36'h2cac0f31f;
    stim[51] = 36'h2411c5bfe;
    stim[52] = 36'ha3b369de6;
    stim[53] = 36'hed817840c;
    stim[54] = 36'h9e121668b;
    stim[55] = 36'h00dfbb10f;
    stim[56] = 36'h2a59b6c53;
    stim[57] = 36'h9f2f9df12;
    stim[58] = 36'h8d1085d9e;
    stim[59] = 36'h077ca1ce1;
    stim[60] = 36'h07e10a94b;
    stim[61] = 36'h904825f3b;
    stim[62] = 36'hb89e7eba9;
    stim[63] = 36'hd6d8e1ec4;
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
      expv[0] = 36'h6dcb6c49f;
      expv[1] = 36'h6dcb6c49f;
      expv[2] = 36'h6dcb6c49f;
      expv[3] = 36'h63133e68f;
      expv[4] = 36'h63133e68f;
      expv[5] = 36'hfda78c11f;
      expv[6] = 36'hfda78c11f;
      expv[7] = 36'hf20000008;
      expv[8] = 36'h005800004;
      expv[9] = 36'h000000181;
      expv[10] = 36'h6faa0459f;
      expv[11] = 36'h2194ae17f;
      expv[12] = 36'h000000a61;
      expv[13] = 36'h000000281;
      expv[14] = 36'h000000271;
      expv[15] = 36'h48256971f;
      expv[16] = 36'hfbac5805f;
      expv[17] = 36'h43750000c;
      expv[18] = 36'hbeae2ccbf;
      expv[19] = 36'h0000257c3;
      expv[20] = 36'h2721bae4f;
      expv[21] = 36'h2721bae4f;
      expv[22] = 36'h2721bae4f;
      expv[23] = 36'h5b112d91f;
      expv[24] = 36'h5b112d91f;
      expv[25] = 36'h000000111;
      expv[26] = 36'h000053c23;
      expv[27] = 36'h000000201;
      expv[28] = 36'h55590000c;
      expv[29] = 36'h15330000c;
      expv[30] = 36'h30650000c;
      expv[31] = 36'h0000bd002;
      expv[32] = 36'h000000811;
      expv[33] = 36'habe10000c;
      expv[34] = 36'habe10000c;
      expv[35] = 36'h000065002;
      expv[36] = 36'h00009c002;
      expv[37] = 36'h0000001d1;
      expv[38] = 36'h000000451;
      expv[39] = 36'h0000825c3;
      expv[40] = 36'h0000b8ab3;
      expv[41] = 36'h000000aa1;
      expv[42] = 36'h000086002;
      expv[43] = 36'h094893d5f;
      expv[44] = 36'h0000515f3;
      expv[45] = 36'h000000d31;
      expv[46] = 36'h86a30000c;
      expv[47] = 36'hc0c8fd18f;
      expv[48] = 36'hc0c8fd18f;
      expv[49] = 36'hfc0000008;
      expv[50] = 36'hfc0000008;
      expv[51] = 36'h000000ff1;
      expv[52] = 36'h007900004;
      expv[53] = 36'hb605e103f;
      expv[54] = 36'hb605e103f;
      expv[55] = 36'hb605e103f;
      expv[56] = 36'hb605e103f;
      expv[57] = 36'h00c400004;
      expv[58] = 36'h006700004;
      expv[59] = 36'h000087383;
      expv[60] = 36'h000087383;
      expv[61] = 36'h000087383;
      expv[62] = 36'hfaea0000c;
      expv[63] = 36'h5b6387b1f;
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
