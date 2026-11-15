// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 47;
  localparam OW = 19;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_002980 dut (
    .adc_clk(clk),
    .rst(in_vec[46:46]),
    .adc_data(in_vec[45:34]),
    .sample_len(in_vec[33:2]),
    .ad_sample_req(in_vec[1:1]),
    .write_req_ack(in_vec[0:0]),
    .adc_buf_wr(out_vec[18:18]),
    .adc_buf_data(out_vec[17:2]),
    .ad_sample_ack(out_vec[1:1]),
    .write_req(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 47'h771d8433915a;
    stim[1] = 47'h5ded78206906;
    stim[2] = 47'h183e17f0cf06;
    stim[3] = 47'h207cea048193;
    stim[4] = 47'h2413fc775fea;
    stim[5] = 47'h1e6065087461;
    stim[6] = 47'h052d68f0eea4;
    stim[7] = 47'h16cef05a5319;
    stim[8] = 47'h391f1bad8ba8;
    stim[9] = 47'h132e53898a3b;
    stim[10] = 47'h3e2602f109ef;
    stim[11] = 47'h2ee4842a01e7;
    stim[12] = 47'h0ea2cc26e98c;
    stim[13] = 47'h339f075ab91f;
    stim[14] = 47'h052076ece072;
    stim[15] = 47'h2537cb7f79c8;
    stim[16] = 47'h1c47f11af280;
    stim[17] = 47'h176e861c20ce;
    stim[18] = 47'h25e1a33de30a;
    stim[19] = 47'h19ab3637d64d;
    stim[20] = 47'h0be29f010a63;
    stim[21] = 47'h303786083acb;
    stim[22] = 47'h18150d5c719a;
    stim[23] = 47'h04369fda86f8;
    stim[24] = 47'h1cd83f3aa58d;
    stim[25] = 47'h2bb8434560b2;
    stim[26] = 47'h1ebca9f9f777;
    stim[27] = 47'h18aded8bb770;
    stim[28] = 47'h09e558cbd924;
    stim[29] = 47'h030dd49e8de0;
    stim[30] = 47'h335f28421dbf;
    stim[31] = 47'h3163ce3425f7;
    stim[32] = 47'h3da3fe7cc3ac;
    stim[33] = 47'h3d7bded14dc5;
    stim[34] = 47'h3d0b76d02da7;
    stim[35] = 47'h2be46f7a5d01;
    stim[36] = 47'h363185d02631;
    stim[37] = 47'h2c49cda055cf;
    stim[38] = 47'h3741e3338d8a;
    stim[39] = 47'h1544f53f14e2;
    stim[40] = 47'h2416307f4f32;
    stim[41] = 47'h3b6336262dd6;
    stim[42] = 47'h007df1f3e754;
    stim[43] = 47'h331c650ee9b7;
    stim[44] = 47'h14975cb3321d;
    stim[45] = 47'h2fb2e0eea658;
    stim[46] = 47'h251f8ae7e573;
    stim[47] = 47'h2b903fab096c;
    stim[48] = 47'h188e67b47f0d;
    stim[49] = 47'h3fdf61f62846;
    stim[50] = 47'h15d14d4fe802;
    stim[51] = 47'h14869aff7e8f;
    stim[52] = 47'h345adfe69915;
    stim[53] = 47'h1b4464464f34;
    stim[54] = 47'h025a1808d85b;
    stim[55] = 47'h2f616739b714;
    stim[56] = 47'h1467b2ad0dae;
    stim[57] = 47'h3683a0534727;
    stim[58] = 47'h2facd52de29c;
    stim[59] = 47'h3555ff30649c;
    stim[60] = 47'h1fa27951c731;
    stim[61] = 47'h0037f2cc925c;
    stim[62] = 47'h0e70e04577cb;
    stim[63] = 47'h0de657249833;
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
      expv[0] = 19'h0000x;
      expv[1] = 19'h0000x;
      expv[2] = 19'h0000x;
      expv[3] = 19'h0000x;
      expv[4] = 19'h0000x;
      expv[5] = 19'h3f83x;
      expv[6] = 19'h0007d;
      expv[7] = 19'h00411;
      expv[8] = 19'h3fe60;
      expv[9] = 19'h3e52c;
      expv[10] = 19'h3f6cc;
      expv[11] = 19'h0191c;
      expv[12] = 19'h3f32c;
      expv[13] = 19'h01e24;
      expv[14] = 19'h00ee4;
      expv[15] = 19'h3eea0;
      expv[16] = 19'h0139c;
      expv[17] = 19'h3e520;
      expv[18] = 19'h00534;
      expv[19] = 19'h3fc44;
      expv[20] = 19'h3f76c;
      expv[21] = 19'h005e0;
      expv[22] = 19'h3f9a8;
      expv[23] = 19'h3ebe0;
      expv[24] = 19'h01034;
      expv[25] = 19'h3f814;
      expv[26] = 19'h3e434;
      expv[27] = 19'h3fcd8;
      expv[28] = 19'h00bb8;
      expv[29] = 19'h3febc;
      expv[30] = 19'h3f8ac;
      expv[31] = 19'h3e9e4;
      expv[32] = 19'h3e30c;
      expv[33] = 19'h0135c;
      expv[34] = 19'h01160;
      expv[35] = 19'h01da0;
      expv[36] = 19'h01d78;
      expv[37] = 19'h01d08;
      expv[38] = 19'h00be4;
      expv[39] = 19'h01630;
      expv[40] = 19'h00c48;
      expv[41] = 19'h01740;
      expv[42] = 19'h3f544;
      expv[43] = 19'h00414;
      expv[44] = 19'h01b60;
      expv[45] = 19'h3e07c;
      expv[46] = 19'h0131c;
      expv[47] = 19'h3f494;
      expv[48] = 19'h00fb0;
      expv[49] = 19'h0051c;
      expv[50] = 19'h40b92;
      expv[51] = 19'h7f88e;
      expv[52] = 19'h41fde;
      expv[53] = 19'h7f5d2;
      expv[54] = 19'h7f486;
      expv[55] = 19'h4145a;
      expv[56] = 19'h7fb46;
      expv[57] = 19'h7e25a;
      expv[58] = 19'h40f62;
      expv[59] = 19'h7f466;
      expv[60] = 19'h41682;
      expv[61] = 19'h40fae;
      expv[62] = 19'h41556;
      expv[63] = 19'h7ffa2;
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
