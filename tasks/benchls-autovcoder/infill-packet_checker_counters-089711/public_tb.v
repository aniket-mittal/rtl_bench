// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 35;
  localparam OW = 96;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_089711 dut (
    .i_pac_chek_clk(clk),
    .i_rst_n(in_vec[34:34]),
    .i_pac_chek_data(in_vec[33:2]),
    .i_pac_chek_data_valid(in_vec[1:1]),
    .i_pac_chek_sof(in_vec[0:0]),
    .o_good_word_num(out_vec[95:64]),
    .o_good_frame_num(out_vec[63:32]),
    .o_frame_num(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 35'h3cc6253bd;
    stim[1] = 35'h267c727ac;
    stim[2] = 35'h5d25e6af9;
    stim[3] = 35'h422e2f955;
    stim[4] = 35'h50c585589;
    stim[5] = 35'h4ae492dca;
    stim[6] = 35'h557327c08;
    stim[7] = 35'h523563bfb;
    stim[8] = 35'h750da0561;
    stim[9] = 35'h6a0555fa2;
    stim[10] = 35'h0f6720b92;
    stim[11] = 35'h7de7231fa;
    stim[12] = 35'h4f6921c21;
    stim[13] = 35'h617aa7d03;
    stim[14] = 35'h56dff0353;
    stim[15] = 35'h4351870d8;
    stim[16] = 35'h67699722b;
    stim[17] = 35'h5d15f1574;
    stim[18] = 35'h49626f29d;
    stim[19] = 35'h7ef3e62ab;
    stim[20] = 35'h6c5158e8f;
    stim[21] = 35'h7adef3b43;
    stim[22] = 35'h649087c1e;
    stim[23] = 35'h6e01c6bec;
    stim[24] = 35'h667b1c322;
    stim[25] = 35'h5b95a1f6a;
    stim[26] = 35'h47589499d;
    stim[27] = 35'h41297d79f;
    stim[28] = 35'h722daa691;
    stim[29] = 35'h7fb3391f0;
    stim[30] = 35'h646e7b8a7;
    stim[31] = 35'h6f596789f;
    stim[32] = 35'h5f442f763;
    stim[33] = 35'h7ef1e67e2;
    stim[34] = 35'h709f62459;
    stim[35] = 35'h537feca07;
    stim[36] = 35'h4242d8733;
    stim[37] = 35'h45647c191;
    stim[38] = 35'h5d61d415d;
    stim[39] = 35'h691ddca93;
    stim[40] = 35'h4dafa2b80;
    stim[41] = 35'h6063ee5ac;
    stim[42] = 35'h67a686254;
    stim[43] = 35'h4cd3555cd;
    stim[44] = 35'h6e442bd3f;
    stim[45] = 35'h55d3100ba;
    stim[46] = 35'h7f65747a9;
    stim[47] = 35'h6dc4dbe37;
    stim[48] = 35'h6a11420ad;
    stim[49] = 35'h7cb1d24cb;
    stim[50] = 35'h6d4102dd3;
    stim[51] = 35'h58f89c92a;
    stim[52] = 35'h727b9bd11;
    stim[53] = 35'h454046cbf;
    stim[54] = 35'h51c279306;
    stim[55] = 35'h471c0b5c8;
    stim[56] = 35'h4177a6d2f;
    stim[57] = 35'h7ac4865c7;
    stim[58] = 35'h5be169c00;
    stim[59] = 35'h636a7d9fd;
    stim[60] = 35'h4fd4d8462;
    stim[61] = 35'h708b25a89;
    stim[62] = 35'h5d1c1cc46;
    stim[63] = 35'h69ef89e51;
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
      expv[0] = 96'h000000000000000000000000;
      expv[1] = 96'h000000000000000000000000;
      expv[2] = 96'h000000000000000000000000;
      expv[3] = 96'h000000000000000000000000;
      expv[4] = 96'h000000000000000000000000;
      expv[5] = 96'h000000000000000000000000;
      expv[6] = 96'h000000000000000000000000;
      expv[7] = 96'h000000000000000000000000;
      expv[8] = 96'h000000000000000000000000;
      expv[9] = 96'h000000000000000000000000;
      expv[10] = 96'h000000000000000000000000;
      expv[11] = 96'h000000000000000000000000;
      expv[12] = 96'h000000000000000000000000;
      expv[13] = 96'h000000000000000000000000;
      expv[14] = 96'h000000000000000000000000;
      expv[15] = 96'h000000000000000000000000;
      expv[16] = 96'h000000000000000000000000;
      expv[17] = 96'h000000000000000000000000;
      expv[18] = 96'h000000000000000000000000;
      expv[19] = 96'h000000000000000000000000;
      expv[20] = 96'h000000000000000000000000;
      expv[21] = 96'h000000000000000000000000;
      expv[22] = 96'h000000000000000000000000;
      expv[23] = 96'h000000000000000000000000;
      expv[24] = 96'h000000000000000000000000;
      expv[25] = 96'h000000000000000000000000;
      expv[26] = 96'h000000000000000000000000;
      expv[27] = 96'h000000000000000000000000;
      expv[28] = 96'h000000000000000000000000;
      expv[29] = 96'h000000000000000000000000;
      expv[30] = 96'h000000000000000000000000;
      expv[31] = 96'h000000000000000000000000;
      expv[32] = 96'h000000000000000000000000;
      expv[33] = 96'h000000000000000000000000;
      expv[34] = 96'h000000000000000000000000;
      expv[35] = 96'h000000000000000000000000;
      expv[36] = 96'h000000000000000000000000;
      expv[37] = 96'h000000000000000000000000;
      expv[38] = 96'h000000000000000000000000;
      expv[39] = 96'h000000000000000000000000;
      expv[40] = 96'h000000000000000000000000;
      expv[41] = 96'h000000000000000000000000;
      expv[42] = 96'h000000000000000000000000;
      expv[43] = 96'h000000000000000000000000;
      expv[44] = 96'h000000000000000000000000;
      expv[45] = 96'h000000000000000000000000;
      expv[46] = 96'h000000000000000000000000;
      expv[47] = 96'h000000000000000000000000;
      expv[48] = 96'h000000000000000000000000;
      expv[49] = 96'h000000000000000000000000;
      expv[50] = 96'h000000000000000000000000;
      expv[51] = 96'h000000000000000000000000;
      expv[52] = 96'h000000000000000000000000;
      expv[53] = 96'h000000000000000000000000;
      expv[54] = 96'h000000000000000000000000;
      expv[55] = 96'h000000000000000000000000;
      expv[56] = 96'h000000000000000000000000;
      expv[57] = 96'h000000000000000000000000;
      expv[58] = 96'h000000000000000000000000;
      expv[59] = 96'h000000000000000000000000;
      expv[60] = 96'h000000000000000000000000;
      expv[61] = 96'h000000000000000000000000;
      expv[62] = 96'h000000000000000000000000;
      expv[63] = 96'h000000000000000000000000;
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
