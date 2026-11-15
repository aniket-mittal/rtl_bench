// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 74;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_000581 dut (
    .clk(clk),
    .rst(in_vec[32:32]),
    .bus_in(in_vec[31:0]),
    .bus_A(out_vec[73:42]),
    .bus_out(out_vec[41:10]),
    .bus_WE(out_vec[9:9]),
    .bus_RE(out_vec[8:8]),
    .current_opcode(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h134d5d9ad;
    stim[1] = 33'h1709217a6;
    stim[2] = 33'h09c04dd76;
    stim[3] = 33'h002e5f1cf;
    stim[4] = 33'h0652e668a;
    stim[5] = 33'h069ae85d3;
    stim[6] = 33'h022018f3b;
    stim[7] = 33'h09551917f;
    stim[8] = 33'h036e58605;
    stim[9] = 33'h064c04b27;
    stim[10] = 33'h0e7c13d24;
    stim[11] = 33'h0bf37a7c8;
    stim[12] = 33'h0d3bcc751;
    stim[13] = 33'h02817e646;
    stim[14] = 33'h06aa29a9a;
    stim[15] = 33'h09d90396a;
    stim[16] = 33'h097d6498a;
    stim[17] = 33'h01222c0e0;
    stim[18] = 33'h05082b6bd;
    stim[19] = 33'h0e6021e17;
    stim[20] = 33'h0d2572112;
    stim[21] = 33'h0dfc096da;
    stim[22] = 33'h089c0cf32;
    stim[23] = 33'h009820553;
    stim[24] = 33'h0436ae844;
    stim[25] = 33'h00467c22d;
    stim[26] = 33'h1c2b1a193;
    stim[27] = 33'h030416660;
    stim[28] = 33'h057617b2a;
    stim[29] = 33'h04a1f05ec;
    stim[30] = 33'h0cf548312;
    stim[31] = 33'h06312de90;
    stim[32] = 33'h04dcc7735;
    stim[33] = 33'h00e03bac0;
    stim[34] = 33'h1540847be;
    stim[35] = 33'h094cd7e16;
    stim[36] = 33'h01047d47d;
    stim[37] = 33'h002be17d1;
    stim[38] = 33'h0ca44d62a;
    stim[39] = 33'h0a85b439d;
    stim[40] = 33'h0678e82e6;
    stim[41] = 33'h0cd3fb7cb;
    stim[42] = 33'h00c25e275;
    stim[43] = 33'h0db5274b1;
    stim[44] = 33'h0da1ad312;
    stim[45] = 33'h0e74ed4f6;
    stim[46] = 33'h0e4876170;
    stim[47] = 33'h0ba96a799;
    stim[48] = 33'h0fbf2d3eb;
    stim[49] = 33'h0849dceef;
    stim[50] = 33'h0e61c1d16;
    stim[51] = 33'h0dd3796a3;
    stim[52] = 33'h03554a88b;
    stim[53] = 33'h0bce94dcd;
    stim[54] = 33'h099cef12c;
    stim[55] = 33'h092ff7ec3;
    stim[56] = 33'h0fd7afd5f;
    stim[57] = 33'h07007a94c;
    stim[58] = 33'h074f36bdf;
    stim[59] = 33'h093072460;
    stim[60] = 33'h09b9b658a;
    stim[61] = 33'h0e9069ba6;
    stim[62] = 33'h013f11895;
    stim[63] = 33'h077f06090;
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
      expv[0] = 74'hxxxxxxxxxxxxxxxxxxx;
      expv[1] = 74'h00000000xxxxxxxxxxx;
      expv[2] = 74'h00000000xxxxxxxxxa6;
      expv[3] = 74'h00000000xxxxxxxxx76;
      expv[4] = 74'h00000000xxxxxxxxx76;
      expv[5] = 74'h0000000000000000076;
      expv[6] = 74'h0000000000000000076;
      expv[7] = 74'h0000000040000000176;
      expv[8] = 74'h000000000000000007f;
      expv[9] = 74'h000000000000000007f;
      expv[10] = 74'h000000000000000007f;
      expv[11] = 74'h000000000000000007f;
      expv[12] = 74'h000000008000000017f;
      expv[13] = 74'h0000000000000000051;
      expv[14] = 74'h0000000000000000051;
      expv[15] = 74'h0000000000000000051;
      expv[16] = 74'h0000000000000000051;
      expv[17] = 74'h00000000c0000000151;
      expv[18] = 74'h00000000000000000e0;
      expv[19] = 74'h00000000000000000e0;
      expv[20] = 74'h00000000000000000e0;
      expv[21] = 74'h00000000000000000e0;
      expv[22] = 74'h00000001000000001e0;
      expv[23] = 74'h0000000000000000032;
      expv[24] = 74'h0000000000000000032;
      expv[25] = 74'h0000000000000000032;
      expv[26] = 74'h0000000000000000032;
      expv[27] = 74'h0000000000000000132;
      expv[28] = 74'h0000000000000000060;
      expv[29] = 74'h0000000000000000060;
      expv[30] = 74'h0000000000000000060;
      expv[31] = 74'h0000000000000000060;
      expv[32] = 74'h0000000040000000160;
      expv[33] = 74'h0000000000000000035;
      expv[34] = 74'h0000000000000000035;
      expv[35] = 74'h0000000000000000135;
      expv[36] = 74'h0000000000000000016;
      expv[37] = 74'h0000000000000000016;
      expv[38] = 74'h0000000000000000016;
      expv[39] = 74'h0000000000000000016;
      expv[40] = 74'h0000000040000000116;
      expv[41] = 74'h00000000000000000e6;
      expv[42] = 74'h00000000000000000e6;
      expv[43] = 74'h00000000000000000e6;
      expv[44] = 74'h00000000000000000e6;
      expv[45] = 74'h00000000800000001e6;
      expv[46] = 74'h00000000000000000f6;
      expv[47] = 74'h00000000000000000f6;
      expv[48] = 74'h00000000000000000f6;
      expv[49] = 74'h00000000000000000f6;
      expv[50] = 74'h00000000c00000001f6;
      expv[51] = 74'h0000000000000000016;
      expv[52] = 74'h0000000000000000016;
      expv[53] = 74'h0000000000000000016;
      expv[54] = 74'h0000000000000000016;
      expv[55] = 74'h0000000100000000116;
      expv[56] = 74'h00000000000000000c3;
      expv[57] = 74'h00000000000000000c3;
      expv[58] = 74'h00000000000000000c3;
      expv[59] = 74'h00000000000000000c3;
      expv[60] = 74'h00000001400000001c3;
      expv[61] = 74'h000000000000000008a;
      expv[62] = 74'h000000000000000008a;
      expv[63] = 74'h000000000000000008a;
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
