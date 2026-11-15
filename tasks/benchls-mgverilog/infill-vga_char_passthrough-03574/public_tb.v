// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 35;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_03574 dut (
    .clk(clk),
    .reset_n(in_vec[34:34]),
    .video_character_buffer_with_dma_0_avalon_char_source_data(in_vec[33:4]),
    .video_character_buffer_with_dma_0_avalon_char_source_endofpacket(in_vec[3:3]),
    .video_character_buffer_with_dma_0_avalon_char_source_startofpacket(in_vec[2:2]),
    .video_character_buffer_with_dma_0_avalon_char_source_valid(in_vec[1:1]),
    .video_vga_controller_0_avalon_vga_sink_ready_from_sa(in_vec[0:0]),
    .video_character_buffer_with_dma_0_avalon_char_source_ready(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 35'h095c6ee04;
    stim[1] = 35'h15ce559d3;
    stim[2] = 35'h5ccb2e865;
    stim[3] = 35'h5bd50ba0e;
    stim[4] = 35'h6d4eb0c46;
    stim[5] = 35'h4725f9d15;
    stim[6] = 35'h60106c8ee;
    stim[7] = 35'h73fc3c440;
    stim[8] = 35'h74aa79835;
    stim[9] = 35'h632c42270;
    stim[10] = 35'h7a1728245;
    stim[11] = 35'h6df668ea6;
    stim[12] = 35'h6a7056ba7;
    stim[13] = 35'h5e65f7473;
    stim[14] = 35'h4302b12dd;
    stim[15] = 35'h6d192db90;
    stim[16] = 35'h733d6d6e7;
    stim[17] = 35'h603215203;
    stim[18] = 35'h612119ea1;
    stim[19] = 35'h6d3601615;
    stim[20] = 35'h5b73372f8;
    stim[21] = 35'h41eb95547;
    stim[22] = 35'h478a75ccd;
    stim[23] = 35'h63862d888;
    stim[24] = 35'h49049beca;
    stim[25] = 35'h4c32ff08f;
    stim[26] = 35'h496174f74;
    stim[27] = 35'h7b3bfe00e;
    stim[28] = 35'h6c7dfab6c;
    stim[29] = 35'h750eeca97;
    stim[30] = 35'h6291610b6;
    stim[31] = 35'h777dd371f;
    stim[32] = 35'h623a4da27;
    stim[33] = 35'h778c1f40c;
    stim[34] = 35'h6eac7d9ae;
    stim[35] = 35'h6b4ca9654;
    stim[36] = 35'h4141f0ec7;
    stim[37] = 35'h41779a489;
    stim[38] = 35'h767f1acfa;
    stim[39] = 35'h67dc20a17;
    stim[40] = 35'h5cdc5afb5;
    stim[41] = 35'h695b18e18;
    stim[42] = 35'h606b2218b;
    stim[43] = 35'h74caafd47;
    stim[44] = 35'h540b9b08d;
    stim[45] = 35'h4eb9b26f5;
    stim[46] = 35'h783e4efb1;
    stim[47] = 35'h517623bf9;
    stim[48] = 35'h475ad3bff;
    stim[49] = 35'h614d36373;
    stim[50] = 35'h61f4e9140;
    stim[51] = 35'h6cc4966e0;
    stim[52] = 35'h4bea77c8d;
    stim[53] = 35'h4ff525b73;
    stim[54] = 35'h6d8299dc0;
    stim[55] = 35'h64a3b9960;
    stim[56] = 35'h52675d31a;
    stim[57] = 35'h4c902d4a4;
    stim[58] = 35'h5a906a039;
    stim[59] = 35'h46e5ea88a;
    stim[60] = 35'h54c32d9aa;
    stim[61] = 35'h509454142;
    stim[62] = 35'h51eaba707;
    stim[63] = 35'h6c4582253;
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
      expv[0] = 1'h0;
      expv[1] = 1'h1;
      expv[2] = 1'h1;
      expv[3] = 1'h0;
      expv[4] = 1'h0;
      expv[5] = 1'h1;
      expv[6] = 1'h0;
      expv[7] = 1'h0;
      expv[8] = 1'h1;
      expv[9] = 1'h0;
      expv[10] = 1'h1;
      expv[11] = 1'h0;
      expv[12] = 1'h1;
      expv[13] = 1'h1;
      expv[14] = 1'h1;
      expv[15] = 1'h0;
      expv[16] = 1'h1;
      expv[17] = 1'h1;
      expv[18] = 1'h1;
      expv[19] = 1'h1;
      expv[20] = 1'h0;
      expv[21] = 1'h1;
      expv[22] = 1'h1;
      expv[23] = 1'h0;
      expv[24] = 1'h0;
      expv[25] = 1'h1;
      expv[26] = 1'h0;
      expv[27] = 1'h0;
      expv[28] = 1'h0;
      expv[29] = 1'h1;
      expv[30] = 1'h0;
      expv[31] = 1'h1;
      expv[32] = 1'h1;
      expv[33] = 1'h0;
      expv[34] = 1'h0;
      expv[35] = 1'h0;
      expv[36] = 1'h1;
      expv[37] = 1'h1;
      expv[38] = 1'h0;
      expv[39] = 1'h1;
      expv[40] = 1'h1;
      expv[41] = 1'h0;
      expv[42] = 1'h1;
      expv[43] = 1'h1;
      expv[44] = 1'h1;
      expv[45] = 1'h1;
      expv[46] = 1'h1;
      expv[47] = 1'h1;
      expv[48] = 1'h1;
      expv[49] = 1'h1;
      expv[50] = 1'h0;
      expv[51] = 1'h0;
      expv[52] = 1'h1;
      expv[53] = 1'h1;
      expv[54] = 1'h0;
      expv[55] = 1'h0;
      expv[56] = 1'h0;
      expv[57] = 1'h0;
      expv[58] = 1'h1;
      expv[59] = 1'h0;
      expv[60] = 1'h0;
      expv[61] = 1'h0;
      expv[62] = 1'h1;
      expv[63] = 1'h1;
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
