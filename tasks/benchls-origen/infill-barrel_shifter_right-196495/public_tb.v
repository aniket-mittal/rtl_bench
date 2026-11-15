// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 37;
  localparam OW = 36;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_196495 dut (
    .T(in_vec[36:5]),
    .shamt(in_vec[4:0]),
    .Y_lo(out_vec[35:4]),
    .C(out_vec[3:3]),
    .V(out_vec[2:2]),
    .N(out_vec[1:1]),
    .Z(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 37'h056a333c87;
    stim[1] = 37'h19bf6a2615;
    stim[2] = 37'h14926bbcfc;
    stim[3] = 37'h0fe5b5bb49;
    stim[4] = 37'h1581a90982;
    stim[5] = 37'h0366ec2e41;
    stim[6] = 37'h184722c21b;
    stim[7] = 37'h17ea4b03c8;
    stim[8] = 37'h08ffea78b5;
    stim[9] = 37'h04088de441;
    stim[10] = 37'h138c6ab813;
    stim[11] = 37'h04a3cd4217;
    stim[12] = 37'h0a5637119a;
    stim[13] = 37'h01f48ae6ea;
    stim[14] = 37'h10c8d944b2;
    stim[15] = 37'h0aa7095c9d;
    stim[16] = 37'h0f22bde39a;
    stim[17] = 37'h0a93f2ed21;
    stim[18] = 37'h08d4922c62;
    stim[19] = 37'h1b10ac4615;
    stim[20] = 37'h080490c5df;
    stim[21] = 37'h098aa9391c;
    stim[22] = 37'h0f6af16fca;
    stim[23] = 37'h1bbe564b32;
    stim[24] = 37'h1e73703605;
    stim[25] = 37'h1ffd482819;
    stim[26] = 37'h0c5f9c66c2;
    stim[27] = 37'h072b3e67e7;
    stim[28] = 37'h0f96b94142;
    stim[29] = 37'h0228c01ad9;
    stim[30] = 37'h1ccd92cfab;
    stim[31] = 37'h15318396b0;
    stim[32] = 37'h014a5e029b;
    stim[33] = 37'h1af63f44b4;
    stim[34] = 37'h0ef4e2d239;
    stim[35] = 37'h13ec6e2275;
    stim[36] = 37'h0e6f9db78e;
    stim[37] = 37'h0d17ed114f;
    stim[38] = 37'h11e4609f62;
    stim[39] = 37'h107618b7cf;
    stim[40] = 37'h01ff7b12fd;
    stim[41] = 37'h1e6262ff51;
    stim[42] = 37'h18ab40bc4d;
    stim[43] = 37'h1c11e9b583;
    stim[44] = 37'h1d9519d175;
    stim[45] = 37'h1bb9d8720a;
    stim[46] = 37'h04c0817b3b;
    stim[47] = 37'h0f3aa45a4d;
    stim[48] = 37'h0e4fb7e54c;
    stim[49] = 37'h0b431e9e1e;
    stim[50] = 37'h0f9c29f590;
    stim[51] = 37'h0b7503c962;
    stim[52] = 37'h1eb8e59b53;
    stim[53] = 37'h1e6e2e0c18;
    stim[54] = 37'h113ed0bdfc;
    stim[55] = 37'h1d5bd9bab6;
    stim[56] = 37'h02aa25bbf3;
    stim[57] = 37'h1ddc8f4dfb;
    stim[58] = 37'h07ec4d386c;
    stim[59] = 37'h1a40bbfa55;
    stim[60] = 37'h0fbf942a60;
    stim[61] = 37'h1f9010543c;
    stim[62] = 37'h0ba0375527;
    stim[63] = 37'h014376af0b;
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
      expv[0] = 36'h0256a333x;
      expv[1] = 36'h00000e6fx;
      expv[2] = 36'h0000000ax;
      expv[3] = 36'h00bf96d6x;
      expv[4] = 36'h2b035213x;
      expv[5] = 36'h0d9bb0b9x;
      expv[6] = 36'h00000018x;
      expv[7] = 36'h00bf5258x;
      expv[8] = 36'h00000a3fx;
      expv[9] = 36'h10223791x;
      expv[10] = 36'h0000138cx;
      expv[11] = 36'h0000004ax;
      expv[12] = 36'h00000054x;
      expv[13] = 36'h0043e915x;
      expv[14] = 36'h00006191x;
      expv[15] = 36'h0000000ax;
      expv[16] = 36'h0000001ex;
      expv[17] = 36'haa4fcbb4x;
      expv[18] = 36'h51a92458x;
      expv[19] = 36'h000006c4x;
      expv[20] = 36'h00000002x;
      expv[21] = 36'h00000014x;
      expv[22] = 36'h005ed5e2x;
      expv[23] = 36'h0000777cx;
      expv[24] = 36'h0f9cdc0dx;
      expv[25] = 36'h000000ffx;
      expv[26] = 36'h58bf38cdx;
      expv[27] = 36'h0072b3e6x;
      expv[28] = 36'h5f2d7282x;
      expv[29] = 36'h00000088x;
      expv[30] = 36'h003ccd92x;
      expv[31] = 36'h0000a98cx;
      expv[32] = 36'h00000001x;
      expv[33] = 36'h00000d7bx;
      expv[34] = 36'h000000bbx;
      expv[35] = 36'h000004fbx;
      expv[36] = 36'h0005cdf3x;
      expv[37] = 36'h0002d17ex;
      expv[38] = 36'h63c8c13ex;
      expv[39] = 36'h00030761x;
      expv[40] = 36'h00000000x;
      expv[41] = 36'h0000f989x;
      expv[42] = 36'h00062ad0x;
      expv[43] = 36'h3c11e9b5x;
      expv[44] = 36'h00000765x;
      expv[45] = 36'h007773b0x;
      expv[46] = 36'h00000024x;
      expv[47] = 36'h0003cea9x;
      expv[48] = 36'h001727dbx;
      expv[49] = 36'h00000001x;
      expv[50] = 36'h00007ce1x;
      expv[51] = 36'h56ea0792x;
      expv[52] = 36'h00003eb8x;
      expv[53] = 36'h000000f3x;
      expv[54] = 36'h00000018x;
      expv[55] = 36'h000003abx;
      expv[56] = 36'h000002aax;
      expv[57] = 36'h0000003dx;
      expv[58] = 36'h0013f626x;
      expv[59] = 36'h00000690x;
      expv[60] = 36'hbefe50a9x;
      expv[61] = 36'h0000001fx;
      expv[62] = 36'h00ba0375x;
      expv[63] = 36'h00214376x;
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
