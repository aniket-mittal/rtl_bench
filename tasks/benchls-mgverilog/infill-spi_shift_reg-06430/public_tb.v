// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 31;
  localparam OW = 21;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_06430 dut (
    .clk(clk),
    .rst(in_vec[30:30]),
    .len(in_vec[29:25]),
    .lsb(in_vec[24:24]),
    .go(in_vec[23:23]),
    .pos_edge(in_vec[22:22]),
    .neg_edge(in_vec[21:21]),
    .rx_negedge(in_vec[20:20]),
    .tx_negedge(in_vec[19:19]),
    .p_in(in_vec[18:1]),
    .s_clk(in_vec[0:0]),
    .tip(out_vec[20:20]),
    .last(out_vec[19:19]),
    .p_out(out_vec[18:1]),
    .s_out(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 31'h4b90305d;
    stim[1] = 31'h5d4c833d;
    stim[2] = 31'h35323219;
    stim[3] = 31'h034e5818;
    stim[4] = 31'h29d97f70;
    stim[5] = 31'h1a33624b;
    stim[6] = 31'h16d26fa1;
    stim[7] = 31'h096203b0;
    stim[8] = 31'h168cfdd0;
    stim[9] = 31'h07912796;
    stim[10] = 31'h37a82195;
    stim[11] = 31'h070681d8;
    stim[12] = 31'h02a862d7;
    stim[13] = 31'h3021503d;
    stim[14] = 31'h14a0c002;
    stim[15] = 31'h088a9ac4;
    stim[16] = 31'h2d75599e;
    stim[17] = 31'h0cfb63c5;
    stim[18] = 31'h3d0f45e8;
    stim[19] = 31'h33dff7cc;
    stim[20] = 31'h27a3c5e4;
    stim[21] = 31'h37b9cb31;
    stim[22] = 31'h1c6a1e73;
    stim[23] = 31'h2ff77c30;
    stim[24] = 31'h30cfdfa6;
    stim[25] = 31'h1fb94423;
    stim[26] = 31'h344d783a;
    stim[27] = 31'h1aa156db;
    stim[28] = 31'h3e3b8189;
    stim[29] = 31'h26b81336;
    stim[30] = 31'h1c1e894d;
    stim[31] = 31'h04434dfe;
    stim[32] = 31'h37514547;
    stim[33] = 31'h0a043c5b;
    stim[34] = 31'h2c33b82b;
    stim[35] = 31'h30477266;
    stim[36] = 31'h381e216e;
    stim[37] = 31'h1fa0ab21;
    stim[38] = 31'h085fc04b;
    stim[39] = 31'h11dda6a0;
    stim[40] = 31'h1b8633b8;
    stim[41] = 31'h25a74530;
    stim[42] = 31'h15b0e9bf;
    stim[43] = 31'h0fc3c4b4;
    stim[44] = 31'h3408e950;
    stim[45] = 31'h31992d0a;
    stim[46] = 31'h380d2aa8;
    stim[47] = 31'h2bf3cab8;
    stim[48] = 31'h1053602f;
    stim[49] = 31'h314bd38d;
    stim[50] = 31'h1b03a191;
    stim[51] = 31'h0d71bbd6;
    stim[52] = 31'h3e70026b;
    stim[53] = 31'h0be175f4;
    stim[54] = 31'h269381fe;
    stim[55] = 31'h14e0d3a9;
    stim[56] = 31'h2ab55858;
    stim[57] = 31'h3a586d33;
    stim[58] = 31'h02b94095;
    stim[59] = 31'h1ff59b63;
    stim[60] = 31'h217d26d9;
    stim[61] = 31'h02885425;
    stim[62] = 31'h3366b840;
    stim[63] = 31'h2d8bcfcb;
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
      expv[0] = 21'h0xxxxx;
      expv[1] = 21'h0xxxxx;
      expv[2] = 21'h0xxxxx;
      expv[3] = 21'h0xxxxx;
      expv[4] = 21'h0xxxxx;
      expv[5] = 21'h1xxxxx;
      expv[6] = 21'h1xxxxx;
      expv[7] = 21'h1xxxxx;
      expv[8] = 21'h1xxxxx;
      expv[9] = 21'h1xxxxx;
      expv[10] = 21'h1xxxxx;
      expv[11] = 21'h1xxxxx;
      expv[12] = 21'h1xxxxx;
      expv[13] = 21'h1xxxxx;
      expv[14] = 21'h1xxxxx;
      expv[15] = 21'h1xxxxx;
      expv[16] = 21'h1xxxxx;
      expv[17] = 21'h1xxxxx;
      expv[18] = 21'h1xxxxx;
      expv[19] = 21'h1xxxxx;
      expv[20] = 21'h1xxxxx;
      expv[21] = 21'h1xxxxx;
      expv[22] = 21'h1xxxxx;
      expv[23] = 21'h1xxxxx;
      expv[24] = 21'h1xxxxx;
      expv[25] = 21'h1xxxxx;
      expv[26] = 21'h1xxxxx;
      expv[27] = 21'h1xxxxx;
      expv[28] = 21'h1xxxxx;
      expv[29] = 21'h1xxxxx;
      expv[30] = 21'h1xxxxx;
      expv[31] = 21'h1xxxxx;
      expv[32] = 21'h1xxxxx;
      expv[33] = 21'h1xxxxx;
      expv[34] = 21'h1xxxxx;
      expv[35] = 21'h1xxxxx;
      expv[36] = 21'h1xxxxx;
      expv[37] = 21'h1xxxxx;
      expv[38] = 21'h1xxxxx;
      expv[39] = 21'h1xxxxx;
      expv[40] = 21'h1xxxxx;
      expv[41] = 21'h1xxxxx;
      expv[42] = 21'h1xxxxx;
      expv[43] = 21'h1xxxxx;
      expv[44] = 21'h1xxxxx;
      expv[45] = 21'h1xxxxx;
      expv[46] = 21'h1xxxxx;
      expv[47] = 21'h1xxxxx;
      expv[48] = 21'h1xxxxx;
      expv[49] = 21'h1xxxxx;
      expv[50] = 21'h1xxxxx;
      expv[51] = 21'h1xxxxx;
      expv[52] = 21'h1xxxxx;
      expv[53] = 21'h1xxxxx;
      expv[54] = 21'h0xxxxx;
      expv[55] = 21'h1xxxxx;
      expv[56] = 21'h1xxxxx;
      expv[57] = 21'h1xxxxx;
      expv[58] = 21'h1xxxxx;
      expv[59] = 21'h1xxxxx;
      expv[60] = 21'h1xxxxx;
      expv[61] = 21'h1xxxxx;
      expv[62] = 21'h1xxxxx;
      expv[63] = 21'h1xxxxx;
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
