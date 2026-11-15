// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 37;
  localparam OW = 41;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_046344 dut (
    .clk(clk),
    .reset(in_vec[36:36]),
    .clear_start(in_vec[35:35]),
    .s_user(in_vec[34:34]),
    .s_enable(in_vec[33:33]),
    .s_addr(in_vec[32:1]),
    .s_valid(in_vec[0:0]),
    .clear_busy(out_vec[40:40]),
    .m_user(out_vec[39:39]),
    .m_enable(out_vec[38:38]),
    .m_addr(out_vec[37:6]),
    .m_tag(out_vec[5:2]),
    .m_hit(out_vec[1:1]),
    .m_valid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 37'h19b9ab997d;
    stim[1] = 37'h187184080d;
    stim[2] = 37'h07c8797e85;
    stim[3] = 37'h00fcbeaccf;
    stim[4] = 37'h02cd10e5a1;
    stim[5] = 37'h0e89ba421f;
    stim[6] = 37'h0751bcd83d;
    stim[7] = 37'h0466aa51fa;
    stim[8] = 37'h0bc66d9ce8;
    stim[9] = 37'h0391be26c7;
    stim[10] = 37'h0c56a446d1;
    stim[11] = 37'h170f66f509;
    stim[12] = 37'h0d2a4a438b;
    stim[13] = 37'h0d418346cd;
    stim[14] = 37'h064354badc;
    stim[15] = 37'h0e87dbb898;
    stim[16] = 37'h085baa6341;
    stim[17] = 37'h0097191e89;
    stim[18] = 37'h0bc131f77f;
    stim[19] = 37'h0ebb5e84b4;
    stim[20] = 37'h01d96940a3;
    stim[21] = 37'h08b4226e39;
    stim[22] = 37'h024c912212;
    stim[23] = 37'h0ac73135cd;
    stim[24] = 37'h06581470d7;
    stim[25] = 37'h0b1419765d;
    stim[26] = 37'h0028ad5973;
    stim[27] = 37'h0bfd8b0d4b;
    stim[28] = 37'h1938448469;
    stim[29] = 37'h055fbaf3e9;
    stim[30] = 37'h07270b3588;
    stim[31] = 37'h01d438a9f0;
    stim[32] = 37'h0ff502ef67;
    stim[33] = 37'h0de1282088;
    stim[34] = 37'h0252982662;
    stim[35] = 37'h0bb948d2a4;
    stim[36] = 37'h0bc5573f6a;
    stim[37] = 37'h042a6ec29d;
    stim[38] = 37'h04e7ab5d53;
    stim[39] = 37'h0c49cc8acb;
    stim[40] = 37'h1d6ba3d2f8;
    stim[41] = 37'h08e2c5e65c;
    stim[42] = 37'h0dc149a43c;
    stim[43] = 37'h0d0144aec5;
    stim[44] = 37'h0fc49b9429;
    stim[45] = 37'h027dc3ad1a;
    stim[46] = 37'h04a46ef19f;
    stim[47] = 37'h0ba4d8ad19;
    stim[48] = 37'h08ff347e20;
    stim[49] = 37'h0d7a11330a;
    stim[50] = 37'h0f137f2509;
    stim[51] = 37'h0702ed860c;
    stim[52] = 37'h0f7d61fac2;
    stim[53] = 37'h012f531ba1;
    stim[54] = 37'h0f5b46f161;
    stim[55] = 37'h0d25615a40;
    stim[56] = 37'h0925c0c4ba;
    stim[57] = 37'h0a905a6ec5;
    stim[58] = 37'h0c96762328;
    stim[59] = 37'h0954944c8d;
    stim[60] = 37'h061beef33c;
    stim[61] = 37'h06d7aeaa09;
    stim[62] = 37'h0c9ee67552;
    stim[63] = 37'h0905aa5e56;
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
      expv[0] = 41'hxxxxxxxxxxx;
      expv[1] = 41'h0xxxxxxxxx1;
      expv[2] = 41'h0xxxxxxxxx1;
      expv[3] = 41'h0390f2fd081;
      expv[4] = 41'h0790f2fd081;
      expv[5] = 41'h0d9a21cb401;
      expv[6] = 41'h1d1374843c1;
      expv[7] = 41'h191374843c0;
      expv[8] = 41'h151374843c0;
      expv[9] = 41'h151374843c1;
      expv[10] = 41'h191374843c1;
      expv[11] = 41'h1d1374843c1;
      expv[12] = 41'h091374843c1;
      expv[13] = 41'h191374843c1;
      expv[14] = 41'h1d1374843c0;
      expv[15] = 41'h1d1374843c0;
      expv[16] = 41'h111374843c1;
      expv[17] = 41'h111374843c1;
      expv[18] = 41'h151374843c1;
      expv[19] = 41'h1d1374843c0;
      expv[20] = 41'h111374843c1;
      expv[21] = 41'h111374843c1;
      expv[22] = 41'h151374843c0;
      expv[23] = 41'h151374843c1;
      expv[24] = 41'h1d1374843c1;
      expv[25] = 41'h151374843c1;
      expv[26] = 41'h111374843c1;
      expv[27] = 41'h151374843c1;
      expv[28] = 41'h111374843c1;
      expv[29] = 41'h091374843c1;
      expv[30] = 41'h0d1374843c0;
      expv[31] = 41'h011374843c0;
      expv[32] = 41'h0d1374843c1;
      expv[33] = 41'h1bea05decc0;
      expv[34] = 41'h17ea05decc0;
      expv[35] = 41'h17ea05decc0;
      expv[36] = 41'h17ea05decc0;
      expv[37] = 41'h1bea05decc1;
      expv[38] = 41'h1bea05decc1;
      expv[39] = 41'h1bea05decc1;
      expv[40] = 41'h1bea05decc0;
      expv[41] = 41'h03ea05decc0;
      expv[42] = 41'h1bea05decc0;
      expv[43] = 41'h1bea05decc1;
      expv[44] = 41'h1fea05decc1;
      expv[45] = 41'h17ea05decc0;
      expv[46] = 41'h1bea05decc1;
      expv[47] = 41'h17ea05decc1;
      expv[48] = 41'h13ea05decc0;
      expv[49] = 41'h1bea05decc0;
      expv[50] = 41'h1fea05decc1;
      expv[51] = 41'h1fea05decc0;
      expv[52] = 41'h1fea05decc0;
      expv[53] = 41'h13ea05decc1;
      expv[54] = 41'h1fea05decc1;
      expv[55] = 41'h1bea05decc0;
      expv[56] = 41'h13ea05decc0;
      expv[57] = 41'h17ea05decc1;
      expv[58] = 41'h1bea05decc0;
      expv[59] = 41'h13ea05decc1;
      expv[60] = 41'h1fea05decc0;
      expv[61] = 41'h1fea05decc1;
      expv[62] = 41'h1bea05decc0;
      expv[63] = 41'h13ea05decc0;
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
