// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04524 dut (
    .ps2_clk_tx_1(in_vec[7:7]),
    .ps2_clk_tx_2(in_vec[6:6]),
    .ps2_d_tx_1(in_vec[5:5]),
    .ps2_d_tx_2(in_vec[4:4]),
    .ps2_mouse_clk_I(in_vec[3:3]),
    .ps2_mouse_data_I(in_vec[2:2]),
    .ps2_keyb_clk_I(in_vec[1:1]),
    .ps2_keyb_data_I(in_vec[0:0]),
    .ps2_clk_rx_1(out_vec[11:11]),
    .ps2_clk_rx_2(out_vec[10:10]),
    .ps2_d_rx_1(out_vec[9:9]),
    .ps2_d_rx_2(out_vec[8:8]),
    .ps2_mouse_clk_O(out_vec[7:7]),
    .ps2_mouse_clk_T(out_vec[6:6]),
    .ps2_mouse_data_O(out_vec[5:5]),
    .ps2_mouse_data_T(out_vec[4:4]),
    .ps2_keyb_clk_O(out_vec[3:3]),
    .ps2_keyb_clk_T(out_vec[2:2]),
    .ps2_keyb_data_O(out_vec[1:1]),
    .ps2_keyb_data_T(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'h62;
    stim[1] = 8'h2b;
    stim[2] = 8'h53;
    stim[3] = 8'h5e;
    stim[4] = 8'h96;
    stim[5] = 8'h23;
    stim[6] = 8'hf6;
    stim[7] = 8'h68;
    stim[8] = 8'hfe;
    stim[9] = 8'hda;
    stim[10] = 8'h25;
    stim[11] = 8'h24;
    stim[12] = 8'h26;
    stim[13] = 8'h45;
    stim[14] = 8'h48;
    stim[15] = 8'h1f;
    stim[16] = 8'h77;
    stim[17] = 8'h6a;
    stim[18] = 8'he2;
    stim[19] = 8'h96;
    stim[20] = 8'heb;
    stim[21] = 8'h89;
    stim[22] = 8'h44;
    stim[23] = 8'h8c;
    stim[24] = 8'h6b;
    stim[25] = 8'he2;
    stim[26] = 8'h26;
    stim[27] = 8'hfc;
    stim[28] = 8'h52;
    stim[29] = 8'hb2;
    stim[30] = 8'hd8;
    stim[31] = 8'h28;
    stim[32] = 8'h3a;
    stim[33] = 8'h8d;
    stim[34] = 8'h93;
    stim[35] = 8'hf4;
    stim[36] = 8'h18;
    stim[37] = 8'h08;
    stim[38] = 8'he7;
    stim[39] = 8'ha9;
    stim[40] = 8'h80;
    stim[41] = 8'h86;
    stim[42] = 8'ha8;
    stim[43] = 8'h9e;
    stim[44] = 8'h9d;
    stim[45] = 8'he3;
    stim[46] = 8'h46;
    stim[47] = 8'h6b;
    stim[48] = 8'h4a;
    stim[49] = 8'h98;
    stim[50] = 8'h04;
    stim[51] = 8'hac;
    stim[52] = 8'h2c;
    stim[53] = 8'h95;
    stim[54] = 8'h03;
    stim[55] = 8'h26;
    stim[56] = 8'ha9;
    stim[57] = 8'h45;
    stim[58] = 8'h1d;
    stim[59] = 8'h60;
    stim[60] = 8'h85;
    stim[61] = 8'hdf;
    stim[62] = 8'h15;
    stim[63] = 8'h62;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 12'h441;
      expv[1] = 12'hd45;
      expv[2] = 12'h550;
      expv[3] = 12'he50;
      expv[4] = 12'h614;
      expv[5] = 12'h545;
      expv[6] = 12'h600;
      expv[7] = 12'h841;
      expv[8] = 12'he00;
      expv[9] = 12'hc10;
      expv[10] = 12'h345;
      expv[11] = 12'h245;
      expv[12] = 12'h645;
      expv[13] = 12'h351;
      expv[14] = 12'h851;
      expv[15] = 12'hf54;
      expv[16] = 12'h740;
      expv[17] = 12'hc41;
      expv[18] = 12'h401;
      expv[19] = 12'h614;
      expv[20] = 12'hd01;
      expv[21] = 12'h915;
      expv[22] = 12'h251;
      expv[23] = 12'ha15;
      expv[24] = 12'hd41;
      expv[25] = 12'h401;
      expv[26] = 12'h645;
      expv[27] = 12'ha00;
      expv[28] = 12'h450;
      expv[29] = 12'h404;
      expv[30] = 12'h810;
      expv[31] = 12'h845;
      expv[32] = 12'hc44;
      expv[33] = 12'hb15;
      expv[34] = 12'h514;
      expv[35] = 12'h200;
      expv[36] = 12'h854;
      expv[37] = 12'h855;
      expv[38] = 12'h701;
      expv[39] = 12'h905;
      expv[40] = 12'h015;
      expv[41] = 12'h615;
      expv[42] = 12'h805;
      expv[43] = 12'he14;
      expv[44] = 12'hb14;
      expv[45] = 12'h501;
      expv[46] = 12'h651;
      expv[47] = 12'hd41;
      expv[48] = 12'hc51;
      expv[49] = 12'h814;
      expv[50] = 12'h255;
      expv[51] = 12'ha05;
      expv[52] = 12'ha45;
      expv[53] = 12'h314;
      expv[54] = 12'h555;
      expv[55] = 12'h645;
      expv[56] = 12'h905;
      expv[57] = 12'h351;
      expv[58] = 12'hb54;
      expv[59] = 12'h041;
      expv[60] = 12'h315;
      expv[61] = 12'hf10;
      expv[62] = 12'h354;
      expv[63] = 12'h441;
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
