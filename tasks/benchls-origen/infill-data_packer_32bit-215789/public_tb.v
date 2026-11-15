// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_215789 dut (
    .clk(clk),
    .mux_in_1(in_vec[16:9]),
    .mux_in_2(in_vec[8:1]),
    .rst(in_vec[0:0]),
    .ext_data_1(out_vec[63:32]),
    .ext_data_2(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h0e3eb;
    stim[1] = 17'h0a077;
    stim[2] = 17'h169d4;
    stim[3] = 17'h0c6e4;
    stim[4] = 17'h1f830;
    stim[5] = 17'h1c376;
    stim[6] = 17'h0caee;
    stim[7] = 17'h01f7e;
    stim[8] = 17'h0cbba;
    stim[9] = 17'h08d64;
    stim[10] = 17'h040a6;
    stim[11] = 17'h096ee;
    stim[12] = 17'h1bfb2;
    stim[13] = 17'h09db8;
    stim[14] = 17'h0af78;
    stim[15] = 17'h016f4;
    stim[16] = 17'h071ce;
    stim[17] = 17'h1c62e;
    stim[18] = 17'h0df78;
    stim[19] = 17'h0f046;
    stim[20] = 17'h071c0;
    stim[21] = 17'h1d71c;
    stim[22] = 17'h17d18;
    stim[23] = 17'h06426;
    stim[24] = 17'h07dc2;
    stim[25] = 17'h0eaf2;
    stim[26] = 17'h10392;
    stim[27] = 17'h1b218;
    stim[28] = 17'h014c8;
    stim[29] = 17'h1cd44;
    stim[30] = 17'h03bf2;
    stim[31] = 17'h07c94;
    stim[32] = 17'h1d6ec;
    stim[33] = 17'h05baf;
    stim[34] = 17'h0f81a;
    stim[35] = 17'h01d5a;
    stim[36] = 17'h0a0a2;
    stim[37] = 17'h1f252;
    stim[38] = 17'h07e78;
    stim[39] = 17'h1981c;
    stim[40] = 17'h0a142;
    stim[41] = 17'h1c4e4;
    stim[42] = 17'h1bdf4;
    stim[43] = 17'h101a4;
    stim[44] = 17'h1c864;
    stim[45] = 17'h10422;
    stim[46] = 17'h1f3fc;
    stim[47] = 17'h180e8;
    stim[48] = 17'h15d6e;
    stim[49] = 17'h1b954;
    stim[50] = 17'h0bcde;
    stim[51] = 17'h078ec;
    stim[52] = 17'h1b2ce;
    stim[53] = 17'h06926;
    stim[54] = 17'h1f494;
    stim[55] = 17'h12106;
    stim[56] = 17'h1d710;
    stim[57] = 17'h10a4f;
    stim[58] = 17'h1f340;
    stim[59] = 17'h11f78;
    stim[60] = 17'h1b9fa;
    stim[61] = 17'h142a2;
    stim[62] = 17'h10c32;
    stim[63] = 17'h16e42;
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
      expv[1] = 64'h0000000000000000;
      expv[2] = 64'h0000000000000000;
      expv[3] = 64'h0000000000000000;
      expv[4] = 64'hb4b4b4b4eaeaeaea;
      expv[5] = 64'hb4b4b4b4eaeaeaea;
      expv[6] = 64'hfcfcfcfc18181818;
      expv[7] = 64'hfcfcfcfc18181818;
      expv[8] = 64'h6565656577777777;
      expv[9] = 64'h6565656577777777;
      expv[10] = 64'h65656565dddddddd;
      expv[11] = 64'h65656565dddddddd;
      expv[12] = 64'h2020202053535353;
      expv[13] = 64'h2020202053535353;
      expv[14] = 64'hdfdfdfdfd9d9d9d9;
      expv[15] = 64'hdfdfdfdfd9d9d9d9;
      expv[16] = 64'h57575757bcbcbcbc;
      expv[17] = 64'h57575757bcbcbcbc;
      expv[18] = 64'h38383838e7e7e7e7;
      expv[19] = 64'h38383838e7e7e7e7;
      expv[20] = 64'h6f6f6f6fbcbcbcbc;
      expv[21] = 64'h6f6f6f6fbcbcbcbc;
      expv[22] = 64'h38383838e0e0e0e0;
      expv[23] = 64'h38383838e0e0e0e0;
      expv[24] = 64'hbebebebe8c8c8c8c;
      expv[25] = 64'hbebebebe8c8c8c8c;
      expv[26] = 64'h3e3e3e3ee1e1e1e1;
      expv[27] = 64'h3e3e3e3ee1e1e1e1;
      expv[28] = 64'h81818181c9c9c9c9;
      expv[29] = 64'h81818181c9c9c9c9;
      expv[30] = 64'h0a0a0a0a64646464;
      expv[31] = 64'h0a0a0a0a64646464;
      expv[32] = 64'h1d1d1d1df9f9f9f9;
      expv[33] = 64'h1d1d1d1df9f9f9f9;
      expv[34] = 64'h0000000000000000;
      expv[35] = 64'h0000000000000000;
      expv[36] = 64'h7c7c7c7c0d0d0d0d;
      expv[37] = 64'h7c7c7c7c0d0d0d0d;
      expv[38] = 64'h5050505051515151;
      expv[39] = 64'h5050505051515151;
      expv[40] = 64'h3f3f3f3f3c3c3c3c;
      expv[41] = 64'h3f3f3f3f3c3c3c3c;
      expv[42] = 64'h50505050a1a1a1a1;
      expv[43] = 64'h50505050a1a1a1a1;
      expv[44] = 64'hdedededefafafafa;
      expv[45] = 64'hdedededefafafafa;
      expv[46] = 64'he4e4e4e432323232;
      expv[47] = 64'he4e4e4e432323232;
      expv[48] = 64'hf9f9f9f9fefefefe;
      expv[49] = 64'hf9f9f9f9fefefefe;
      expv[50] = 64'haeaeaeaeb7b7b7b7;
      expv[51] = 64'haeaeaeaeb7b7b7b7;
      expv[52] = 64'h5e5e5e5e6f6f6f6f;
      expv[53] = 64'h5e5e5e5e6f6f6f6f;
      expv[54] = 64'hd9d9d9d967676767;
      expv[55] = 64'hd9d9d9d967676767;
      expv[56] = 64'hfafafafa4a4a4a4a;
      expv[57] = 64'hfafafafa4a4a4a4a;
      expv[58] = 64'h0000000000000000;
      expv[59] = 64'h0000000000000000;
      expv[60] = 64'hf9f9f9f9a0a0a0a0;
      expv[61] = 64'hf9f9f9f9a0a0a0a0;
      expv[62] = 64'hdcdcdcdcfdfdfdfd;
      expv[63] = 64'hdcdcdcdcfdfdfdfd;
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
