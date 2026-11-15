// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 19;
  localparam OW = 19;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02032 dut (
    .CLK(clk),
    .input_IN(in_vec[18:18]),
    .wren_IN(in_vec[17:17]),
    .writeAd_IN(in_vec[16:14]),
    .ADR_MUX_IN(in_vec[13:13]),
    .write_IN(in_vec[12:12]),
    .PC_load_IN(in_vec[11:11]),
    .SPR_w_IN(in_vec[10:10]),
    .SPR_i_IN(in_vec[9:9]),
    .SPR_d_IN(in_vec[8:8]),
    .cond_IN(in_vec[7:5]),
    .op2_IN(in_vec[4:2]),
    .SW_IN(in_vec[1:1]),
    .MAD_MUX_IN(in_vec[0:0]),
    .input_OUT(out_vec[18:18]),
    .wren_OUT(out_vec[17:17]),
    .writeAd_OUT(out_vec[16:14]),
    .ADR_MUX_OUT(out_vec[13:13]),
    .write_OUT(out_vec[12:12]),
    .PC_load_OUT(out_vec[11:11]),
    .SPR_w_OUT(out_vec[10:10]),
    .SPR_i_OUT(out_vec[9:9]),
    .SPR_d_OUT(out_vec[8:8]),
    .cond_OUT(out_vec[7:5]),
    .op2_OUT(out_vec[4:2]),
    .SW_OUT(out_vec[1:1]),
    .MAD_MUX_OUT(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 19'h5d80c;
    stim[1] = 19'h5274c;
    stim[2] = 19'h2ca62;
    stim[3] = 19'h2e9c7;
    stim[4] = 19'h17d09;
    stim[5] = 19'h483ba;
    stim[6] = 19'h07fe9;
    stim[7] = 19'h3f596;
    stim[8] = 19'h3a3c1;
    stim[9] = 19'h612a2;
    stim[10] = 19'h2562c;
    stim[11] = 19'h1113c;
    stim[12] = 19'h73546;
    stim[13] = 19'h1c6f8;
    stim[14] = 19'h08e29;
    stim[15] = 19'h4d362;
    stim[16] = 19'h49164;
    stim[17] = 19'h7de38;
    stim[18] = 19'h53637;
    stim[19] = 19'h12c9d;
    stim[20] = 19'h39f7c;
    stim[21] = 19'h31a65;
    stim[22] = 19'h36cda;
    stim[23] = 19'h6ae02;
    stim[24] = 19'h7f4cc;
    stim[25] = 19'h67415;
    stim[26] = 19'h227f0;
    stim[27] = 19'h7962e;
    stim[28] = 19'h4a040;
    stim[29] = 19'h57ca5;
    stim[30] = 19'h5d67c;
    stim[31] = 19'h4eb0f;
    stim[32] = 19'h4aa1e;
    stim[33] = 19'h06250;
    stim[34] = 19'h1b3b0;
    stim[35] = 19'h693d8;
    stim[36] = 19'h2ba30;
    stim[37] = 19'h0078c;
    stim[38] = 19'h31b83;
    stim[39] = 19'h36f2c;
    stim[40] = 19'h4456c;
    stim[41] = 19'h1220b;
    stim[42] = 19'h0a4e1;
    stim[43] = 19'h60cbb;
    stim[44] = 19'h079e0;
    stim[45] = 19'h2491d;
    stim[46] = 19'h7075d;
    stim[47] = 19'h58236;
    stim[48] = 19'h69b18;
    stim[49] = 19'h47b2b;
    stim[50] = 19'h6390b;
    stim[51] = 19'h698be;
    stim[52] = 19'h51130;
    stim[53] = 19'h3160d;
    stim[54] = 19'h6f516;
    stim[55] = 19'h4e03c;
    stim[56] = 19'h38c0d;
    stim[57] = 19'h53cb6;
    stim[58] = 19'h435b1;
    stim[59] = 19'h30c4a;
    stim[60] = 19'h761c8;
    stim[61] = 19'h126fa;
    stim[62] = 19'h53ce0;
    stim[63] = 19'h73765;
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
      expv[0] = 19'hxxxxx;
      expv[1] = 19'h5d80c;
      expv[2] = 19'h5274c;
      expv[3] = 19'h2ca62;
      expv[4] = 19'h2e9c7;
      expv[5] = 19'h17d09;
      expv[6] = 19'h483ba;
      expv[7] = 19'h07fe9;
      expv[8] = 19'h3f596;
      expv[9] = 19'h3a3c1;
      expv[10] = 19'h612a2;
      expv[11] = 19'h2562c;
      expv[12] = 19'h1113c;
      expv[13] = 19'h73546;
      expv[14] = 19'h1c6f8;
      expv[15] = 19'h08e29;
      expv[16] = 19'h4d362;
      expv[17] = 19'h49164;
      expv[18] = 19'h7de38;
      expv[19] = 19'h53637;
      expv[20] = 19'h12c9d;
      expv[21] = 19'h39f7c;
      expv[22] = 19'h31a65;
      expv[23] = 19'h36cda;
      expv[24] = 19'h6ae02;
      expv[25] = 19'h7f4cc;
      expv[26] = 19'h67415;
      expv[27] = 19'h227f0;
      expv[28] = 19'h7962e;
      expv[29] = 19'h4a040;
      expv[30] = 19'h57ca5;
      expv[31] = 19'h5d67c;
      expv[32] = 19'h4eb0f;
      expv[33] = 19'h4aa1e;
      expv[34] = 19'h06250;
      expv[35] = 19'h1b3b0;
      expv[36] = 19'h693d8;
      expv[37] = 19'h2ba30;
      expv[38] = 19'h0078c;
      expv[39] = 19'h31b83;
      expv[40] = 19'h36f2c;
      expv[41] = 19'h4456c;
      expv[42] = 19'h1220b;
      expv[43] = 19'h0a4e1;
      expv[44] = 19'h60cbb;
      expv[45] = 19'h079e0;
      expv[46] = 19'h2491d;
      expv[47] = 19'h7075d;
      expv[48] = 19'h58236;
      expv[49] = 19'h69b18;
      expv[50] = 19'h47b2b;
      expv[51] = 19'h6390b;
      expv[52] = 19'h698be;
      expv[53] = 19'h51130;
      expv[54] = 19'h3160d;
      expv[55] = 19'h6f516;
      expv[56] = 19'h4e03c;
      expv[57] = 19'h38c0d;
      expv[58] = 19'h53cb6;
      expv[59] = 19'h435b1;
      expv[60] = 19'h30c4a;
      expv[61] = 19'h761c8;
      expv[62] = 19'h126fa;
      expv[63] = 19'h53ce0;
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
