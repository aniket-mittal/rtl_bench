// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 35;
  localparam OW = 35;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_120065 dut (
    .ap_clk(clk),
    .ap_rst(in_vec[34:34]),
    .data_in(in_vec[33:2]),
    .vld_in(in_vec[1:1]),
    .ack_out(in_vec[0:0]),
    .ack_in(out_vec[34:34]),
    .data_out(out_vec[33:2]),
    .vld_out(out_vec[1:1]),
    .apdone_blk(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 35'h7e920f5ef;
    stim[1] = 35'h63d1d0c57;
    stim[2] = 35'h0a7d484f9;
    stim[3] = 35'h3e7430959;
    stim[4] = 35'h330f88df5;
    stim[5] = 35'h010daabc1;
    stim[6] = 35'h027bfe1cb;
    stim[7] = 35'h026be186f;
    stim[8] = 35'h22adbf7b6;
    stim[9] = 35'h057e36155;
    stim[10] = 35'h169fa1773;
    stim[11] = 35'h21fe28e00;
    stim[12] = 35'h06f1844b7;
    stim[13] = 35'h1f1f181a3;
    stim[14] = 35'h3153f8e5b;
    stim[15] = 35'h2a0c53176;
    stim[16] = 35'h3a14eb866;
    stim[17] = 35'h354c3d7df;
    stim[18] = 35'h2b8a171a8;
    stim[19] = 35'h31ba03da5;
    stim[20] = 35'h0d22f8c84;
    stim[21] = 35'h0580b80df;
    stim[22] = 35'h07d24ccbe;
    stim[23] = 35'h104911a06;
    stim[24] = 35'h162ae9a15;
    stim[25] = 35'h212977e8d;
    stim[26] = 35'h6d5c5de32;
    stim[27] = 35'h0de104af4;
    stim[28] = 35'h27988b574;
    stim[29] = 35'h0a49e8387;
    stim[30] = 35'h37ad8ebce;
    stim[31] = 35'h097fd0dc7;
    stim[32] = 35'h1eaa45a8a;
    stim[33] = 35'h0e1181047;
    stim[34] = 35'h04705517e;
    stim[35] = 35'h3155ac12f;
    stim[36] = 35'h0d1852621;
    stim[37] = 35'h15b5f2787;
    stim[38] = 35'h138fd898e;
    stim[39] = 35'h0ec71e53c;
    stim[40] = 35'h3d28b475a;
    stim[41] = 35'h1f0eb4900;
    stim[42] = 35'h0f7a7ce2d;
    stim[43] = 35'h09bf12d7d;
    stim[44] = 35'h3c874c4a3;
    stim[45] = 35'h24d3a0535;
    stim[46] = 35'h3f281c0ab;
    stim[47] = 35'h39c0890d3;
    stim[48] = 35'h044264576;
    stim[49] = 35'h02b8da836;
    stim[50] = 35'h00e2d5214;
    stim[51] = 35'h254664e81;
    stim[52] = 35'h1b3c08527;
    stim[53] = 35'h015b80826;
    stim[54] = 35'h1a0c6b8a7;
    stim[55] = 35'h375dcae23;
    stim[56] = 35'h2e3f45bff;
    stim[57] = 35'h2c3f0d09e;
    stim[58] = 35'h0fd2b6b60;
    stim[59] = 35'h1352ceb8c;
    stim[60] = 35'h063a2ef65;
    stim[61] = 35'h12baaa5fa;
    stim[62] = 35'h1963d044f;
    stim[63] = 35'h15577a0ab;
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
      expv[0] = 35'hxxxxxxxxx;
      expv[1] = 35'hxxxxxxxxx;
      expv[2] = 35'h23d1d0c54;
      expv[3] = 35'h4a7d484f8;
      expv[4] = 35'h7e7430958;
      expv[5] = 35'h730f88df4;
      expv[6] = 35'h410daabc0;
      expv[7] = 35'h427bfe1ca;
      expv[8] = 35'h426be186f;
      expv[9] = 35'h026be186f;
      expv[10] = 35'h62adbf7b6;
      expv[11] = 35'h569fa1773;
      expv[12] = 35'h569fa1772;
      expv[13] = 35'h46f1844b6;
      expv[14] = 35'h5f1f181a2;
      expv[15] = 35'h7153f8e5b;
      expv[16] = 35'h3153f8e5b;
      expv[17] = 35'h3153f8e5b;
      expv[18] = 35'h6a0c53177;
      expv[19] = 35'h6a0c53176;
      expv[20] = 35'h71ba03da4;
      expv[21] = 35'h4d22f8c84;
      expv[22] = 35'h4580b80df;
      expv[23] = 35'h0580b80df;
      expv[24] = 35'h0580b80df;
      expv[25] = 35'h47d24ccbe;
      expv[26] = 35'h612977e8c;
      expv[27] = 35'h2d5c5de30;
      expv[28] = 35'h4de104af4;
      expv[29] = 35'h67988b574;
      expv[30] = 35'h4a49e8387;
      expv[31] = 35'h0a49e8387;
      expv[32] = 35'h77ad8ebcf;
      expv[33] = 35'h37ad8ebcf;
      expv[34] = 35'h5eaa45a8b;
      expv[35] = 35'h1eaa45a8b;
      expv[36] = 35'h44705517e;
      expv[37] = 35'h4d1852620;
      expv[38] = 35'h55b5f2787;
      expv[39] = 35'h15b5f2787;
      expv[40] = 35'h15b5f2787;
      expv[41] = 35'h15b5f2787;
      expv[42] = 35'h15b5f2787;
      expv[43] = 35'h538fd898e;
      expv[44] = 35'h49bf12d7c;
      expv[45] = 35'h7c874c4a2;
      expv[46] = 35'h64d3a0534;
      expv[47] = 35'h7f281c0aa;
      expv[48] = 35'h79c0890d3;
      expv[49] = 35'h39c0890d3;
      expv[50] = 35'h39c0890d3;
      expv[51] = 35'h39c0890d3;
      expv[52] = 35'h444264576;
      expv[53] = 35'h5b3c08527;
      expv[54] = 35'h1b3c08527;
      expv[55] = 35'h415b80826;
      expv[56] = 35'h775dcae22;
      expv[57] = 35'h6e3f45bff;
      expv[58] = 35'h2e3f45bff;
      expv[59] = 35'h2e3f45bff;
      expv[60] = 35'h2e3f45bff;
      expv[61] = 35'h6c3f0d09f;
      expv[62] = 35'h2c3f0d09f;
      expv[63] = 35'h52baaa5fa;
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
