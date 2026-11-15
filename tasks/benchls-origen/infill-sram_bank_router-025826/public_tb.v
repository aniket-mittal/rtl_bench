// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 53;
  localparam OW = 89;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_025826 dut (
    .ReadClockIn(clk),
    .WriteClockIn(in_vec[52:52]),
    .ReadAddressIn(in_vec[51:42]),
    .WriteAddressIn(in_vec[41:32]),
    .WriteAddressIn_TLC(in_vec[31:22]),
    .WriteDataIn(in_vec[21:13]),
    .WriteDataIn_TLC(in_vec[12:4]),
    .ReadSelectIn(in_vec[3:3]),
    .WriteSelectIn(in_vec[2:2]),
    .WriteSelectIn_TLC(in_vec[1:1]),
    .SMBusyIn(in_vec[0:0]),
    .ReadDataOut(out_vec[88:71]),
    .ReadAddressOut(out_vec[70:61]),
    .WriteAddressOut(out_vec[60:51]),
    .WriteDataOut(out_vec[50:42]),
    .ReadSelectOut(out_vec[41:41]),
    .WriteSelectOut(out_vec[40:40]),
    .ReadSelect_RAM0(out_vec[39:39]),
    .ReadSelect_RAM1(out_vec[38:38]),
    .WriteSelect_RAM0(out_vec[37:37]),
    .WriteSelect_RAM1(out_vec[36:36]),
    .ReadDataOut_SRAM(out_vec[35:18]),
    .ReadDataOut_SRAM_1(out_vec[17:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 53'h021513240b6ef8;
    stim[1] = 53'h17866127e3f200;
    stim[2] = 53'h09e74cac2883d0;
    stim[3] = 53'h17b7dc5c185354;
    stim[4] = 53'h12eec6afbb47ee;
    stim[5] = 53'h05a2ae8a88a3dc;
    stim[6] = 53'h01d53cc32c933a;
    stim[7] = 53'h11a90937c3485c;
    stim[8] = 53'h10f78eaa71f018;
    stim[9] = 53'h17ea1e659acec9;
    stim[10] = 53'h133988e4898a79;
    stim[11] = 53'h0cd0a4a9f6fc57;
    stim[12] = 53'h0b29f57147a9f2;
    stim[13] = 53'h1e18a895dc5888;
    stim[14] = 53'h0bc7b962f214f4;
    stim[15] = 53'h145001bf3f4901;
    stim[16] = 53'h008246c167376a;
    stim[17] = 53'h0d0ff110cb4cec;
    stim[18] = 53'h0d154b456baf8b;
    stim[19] = 53'h06ae3ea8d919ac;
    stim[20] = 53'h05818b7d2d9e7f;
    stim[21] = 53'h04d95847a9ec68;
    stim[22] = 53'h0fc482cf701db6;
    stim[23] = 53'h1a925307508b70;
    stim[24] = 53'h1a1799a7b0d9ac;
    stim[25] = 53'h1f0d97c891b007;
    stim[26] = 53'h0be7eb5344334b;
    stim[27] = 53'h02a975b4f32de5;
    stim[28] = 53'h198ef963e764e0;
    stim[29] = 53'h10b56974df7a70;
    stim[30] = 53'h090aa140c93175;
    stim[31] = 53'h18bd0dd4d5221c;
    stim[32] = 53'h191f76ba63c1d7;
    stim[33] = 53'h166f1686365c14;
    stim[34] = 53'h1d039c5c3185ce;
    stim[35] = 53'h0aab59e70402d1;
    stim[36] = 53'h1df14c1b64f55b;
    stim[37] = 53'h003b07a19954c7;
    stim[38] = 53'h0cf7c77385ad41;
    stim[39] = 53'h0a45f0d22a9f03;
    stim[40] = 53'h00971194953e9b;
    stim[41] = 53'h1036443b038b80;
    stim[42] = 53'h0747fa05c5af43;
    stim[43] = 53'h10354d6d952e58;
    stim[44] = 53'h0d370928d0349c;
    stim[45] = 53'h18389d4cfb7c7d;
    stim[46] = 53'h0f1ad24bc953d9;
    stim[47] = 53'h1562c7521c7d24;
    stim[48] = 53'h01e3b36df42d68;
    stim[49] = 53'h1f84b4872b6e69;
    stim[50] = 53'h0a01f67aa85ade;
    stim[51] = 53'h1352547f5d87b5;
    stim[52] = 53'h0ad60b50db3149;
    stim[53] = 53'h093fe93b93f494;
    stim[54] = 53'h0ae27382846e61;
    stim[55] = 53'h13534403cd7b8c;
    stim[56] = 53'h0f34b6117dde86;
    stim[57] = 53'h02918837b87a81;
    stim[58] = 53'h09542980661701;
    stim[59] = 53'h0ff9c6646c620f;
    stim[60] = 53'h04d17f902633b1;
    stim[61] = 53'h0029a8d73a021c;
    stim[62] = 53'h1b546aeec64fb4;
    stim[63] = 53'h12ab38ff019d4a;
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
      expv[0] = 89'hxxxxxx0a483be8xxxxxxxxx;
      expv[1] = 89'hxxxxxxc24fc800xxxxxxxxx;
      expv[2] = 89'hxxxxxxf3580f40xxxxxxxxx;
      expv[3] = 89'hxxxxxxdbee3091xxxxxxxxx;
      expv[4] = 89'hxxxxxx776376b9xxxxxxxxx;
      expv[5] = 89'hxxxxxxd1571179xxxxxxxxx;
      expv[6] = 89'hxxxxxxeb864cf9xxxxxxxxx;
      expv[7] = 89'hxxxxxxd48486baxxxxxxxxx;
      expv[8] = 89'hxxxxxx7b54c068xxxxxxxxx;
      expv[9] = 89'hxxxxxxf4cb3b28xxxxxxxxx;
      expv[10] = 89'hxxxxxx9dc929e8xxxxxxxxx;
      expv[11] = 89'hxxxxxx68526dd3xxxxxxxxx;
      expv[12] = 89'hxxxxxx94e2a7d2xxxxxxxxx;
      expv[13] = 89'hxxxxxx0d2be224xxxxxxxxx;
      expv[14] = 89'hxxxxxxe3dce411xxxxxxxxx;
      expv[15] = 89'hxxxxxx297e2400xxxxxxxxx;
      expv[16] = 89'hxxxxxx4182ddb9xxxxxxxxx;
      expv[17] = 89'hxxxxxx87f896b5xxxxxxxxx;
      expv[18] = 89'hxxxxxx8a8abe36xxxxxxxxx;
      expv[19] = 89'hxxxxxx571f3239xxxxxxxxx;
      expv[20] = 89'hxxxxxxc0c5db3axxxxxxxxx;
      expv[21] = 89'hxxxxxx6c8f31a8xxxxxxxxx;
      expv[22] = 89'hxxxxxxe2416013xxxxxxxxx;
      expv[23] = 89'hxxxxxx480eadc0xxxxxxxxx;
      expv[24] = 89'hxxxxxx0bcce1b5xxxxxxxxx;
      expv[25] = 89'hxxxxxx86cba353xxxxxxxxx;
      expv[26] = 89'hxxxxxxf2a6cd36xxxxxxxxx;
      expv[27] = 89'hxxxxxx54bae652xxxxxxxxx;
      expv[28] = 89'hxxxxxxc6c79380xxxxxxxxx;
      expv[29] = 89'hxxxxxx5ae9e9c0xxxxxxxxx;
      expv[30] = 89'hxxxxxx85509251xxxxxxxxx;
      expv[31] = 89'hxxxxxx5e86aa76xxxxxxxxx;
      expv[32] = 89'hxxxxxx8fbb4791xxxxxxxxx;
      expv[33] = 89'hxxxxxx378b6c91xxxxxxxxx;
      expv[34] = 89'hxxxxxx81ce6337xxxxxxxxx;
      expv[35] = 89'hxxxxxx55ce0b40xxxxxxxxx;
      expv[36] = 89'hxxxxxxf836d576xxxxxxxxx;
      expv[37] = 89'hxxxxxx1d83b291xxxxxxxxx;
      expv[38] = 89'hxxxxxx7ae73500xxxxxxxxx;
      expv[39] = 89'hxxxxxx23a47c11xxxxxxxxx;
      expv[40] = 89'hxxxxxx4b297a79xxxxxxxxx;
      expv[41] = 89'hxxxxxx1a762e00xxxxxxxxx;
      expv[42] = 89'hxxxxxxa20bbd12xxxxxxxxx;
      expv[43] = 89'hxxxxxx1adb3968xxxxxxxxx;
      expv[44] = 89'hxxxxxx9b84a075xxxxxxxxx;
      expv[45] = 89'hxxxxxx1c4ef6f6xxxxxxxxx;
      expv[46] = 89'hxxxxxx8c97cf64xxxxxxxxx;
      expv[47] = 89'hxxxxxxb163b8d1xxxxxxxxx;
      expv[48] = 89'hxxxxxxf0dbb5a8xxxxxxxxx;
      expv[49] = 89'hxxxxxxc30e39a4xxxxxxxxx;
      expv[50] = 89'hxxxxxx00fb50b6xxxxxxxxx;
      expv[51] = 89'hxxxxxxa92a3b11xxxxxxxxx;
      expv[52] = 89'hxxxxxx6aa1c524xxxxxxxxx;
      expv[53] = 89'hxxxxxx9ff4a7d1xxxxxxxxx;
      expv[54] = 89'hxxxxxx71053980xxxxxxxxx;
      expv[55] = 89'hxxxxxxa9a21af9xxxxxxxxx;
      expv[56] = 89'hxxxxxx9a5b7b92xxxxxxxxx;
      expv[57] = 89'hxxxxxx486f6a00xxxxxxxxx;
      expv[58] = 89'hxxxxxxab00dc00xxxxxxxxx;
      expv[59] = 89'hxxxxxxfce358f6xxxxxxxxx;
      expv[60] = 89'hxxxxxx69204ec0xxxxxxxxx;
      expv[61] = 89'hxxxxxx14d4743axxxxxxxxx;
      expv[62] = 89'hxxxxxxaa350c92xxxxxxxxx;
      expv[63] = 89'hxxxxxx55fe7539xxxxxxxxx;
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
