// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 28;
  localparam OW = 22;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_073054 dut (
    .mclk(clk),
    .rst(in_vec[27:27]),
    .en(in_vec[26:26]),
    .usb_en(in_vec[25:25]),
    .yes(in_vec[24:24]),
    .x(in_vec[23:14]),
    .y(in_vec[13:4]),
    .button_up(in_vec[3:3]),
    .button_down(in_vec[2:2]),
    .button_left(in_vec[1:1]),
    .button_right(in_vec[0:0]),
    .knief_x(out_vec[21:12]),
    .knief_y(out_vec[11:2]),
    .kind(out_vec[1:1]),
    .state(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 28'haa4f04e;
    stim[1] = 28'hb361ad3;
    stim[2] = 28'h6911c6d;
    stim[3] = 28'h5c70354;
    stim[4] = 28'h2748178;
    stim[5] = 28'h4775ab5;
    stim[6] = 28'h56c3e51;
    stim[7] = 28'h5511420;
    stim[8] = 28'h233179a;
    stim[9] = 28'h1456948;
    stim[10] = 28'h7b7f656;
    stim[11] = 28'h28a58a1;
    stim[12] = 28'h11a269d;
    stim[13] = 28'he922055;
    stim[14] = 28'h26244a7;
    stim[15] = 28'h395832e;
    stim[16] = 28'h3c66d32;
    stim[17] = 28'h05ae3b0;
    stim[18] = 28'h604ba13;
    stim[19] = 28'h337d6ce;
    stim[20] = 28'h0a62946;
    stim[21] = 28'h70e9193;
    stim[22] = 28'h03f7490;
    stim[23] = 28'h0c6e3d7;
    stim[24] = 28'h223543a;
    stim[25] = 28'h1b5a7ed;
    stim[26] = 28'h1c65879;
    stim[27] = 28'h1e2d183;
    stim[28] = 28'h5cfa247;
    stim[29] = 28'h76fbac9;
    stim[30] = 28'h287ac3f;
    stim[31] = 28'h1602c15;
    stim[32] = 28'h2a0221a;
    stim[33] = 28'h6a65013;
    stim[34] = 28'h34f592a;
    stim[35] = 28'h5985f50;
    stim[36] = 28'h1e7af06;
    stim[37] = 28'h15520a1;
    stim[38] = 28'h2dc4966;
    stim[39] = 28'h70b4f3f;
    stim[40] = 28'h3692471;
    stim[41] = 28'h37939e1;
    stim[42] = 28'h23cf895;
    stim[43] = 28'h6c05d9b;
    stim[44] = 28'h3bcf052;
    stim[45] = 28'h2c80a13;
    stim[46] = 28'h586fb8c;
    stim[47] = 28'h6fcd858;
    stim[48] = 28'h5b0355b;
    stim[49] = 28'h2e09822;
    stim[50] = 28'h20fb3f8;
    stim[51] = 28'h47c90c1;
    stim[52] = 28'h75e266b;
    stim[53] = 28'h4c1782e;
    stim[54] = 28'h02aa2ea;
    stim[55] = 28'h06eef0e;
    stim[56] = 28'h1aff193;
    stim[57] = 28'h7523a9d;
    stim[58] = 28'h30c6fac;
    stim[59] = 28'h48cdd3c;
    stim[60] = 28'h5a0c4dc;
    stim[61] = 28'h3a86435;
    stim[62] = 28'h638755c;
    stim[63] = 28'h7b93fd5;
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
      expv[0] = 22'h1f9640;
      expv[1] = 22'h1f9640;
      expv[2] = 22'h1f9640;
      expv[3] = 22'h1f963c;
      expv[4] = 22'h1f963c;
      expv[5] = 22'h1f963c;
      expv[6] = 22'h1f963c;
      expv[7] = 22'h1f963c;
      expv[8] = 22'h1f963c;
      expv[9] = 22'h1f963c;
      expv[10] = 22'h1f963c;
      expv[11] = 22'h1f863c;
      expv[12] = 22'h1f863c;
      expv[13] = 22'h1f9640;
      expv[14] = 22'h1f9640;
      expv[15] = 22'h1f9642;
      expv[16] = 22'h1f9642;
      expv[17] = 22'h1f9642;
      expv[18] = 22'h1f9642;
      expv[19] = 22'h1f8642;
      expv[20] = 22'h1f8642;
      expv[21] = 22'h1f8642;
      expv[22] = 22'h1f7642;
      expv[23] = 22'h1f7642;
      expv[24] = 22'h1f7642;
      expv[25] = 22'h1f7642;
      expv[26] = 22'h1f7642;
      expv[27] = 22'h1f7642;
      expv[28] = 22'h1f7642;
      expv[29] = 22'h1f7642;
      expv[30] = 22'h1f763e;
      expv[31] = 22'h1f763e;
      expv[32] = 22'h1f763e;
      expv[33] = 22'h1f763e;
      expv[34] = 22'h1f663e;
      expv[35] = 22'h1f663e;
      expv[36] = 22'h1f663e;
      expv[37] = 22'h1f663e;
      expv[38] = 22'h1f663e;
      expv[39] = 22'h1f663e;
      expv[40] = 22'h1f663a;
      expv[41] = 22'h1f663a;
      expv[42] = 22'h1f663a;
      expv[43] = 22'h1f663a;
      expv[44] = 22'h1f6636;
      expv[45] = 22'h1f6636;
      expv[46] = 22'h1f6636;
      expv[47] = 22'h1f6636;
      expv[48] = 22'h1f6632;
      expv[49] = 22'h1f6632;
      expv[50] = 22'h1f6632;
      expv[51] = 22'h1f6632;
      expv[52] = 22'h1f6632;
      expv[53] = 22'h1f662e;
      expv[54] = 22'h1f662e;
      expv[55] = 22'h1f662e;
      expv[56] = 22'h1f662e;
      expv[57] = 22'h1f662e;
      expv[58] = 22'h1f662a;
      expv[59] = 22'h1f662a;
      expv[60] = 22'h1f662a;
      expv[61] = 22'h1f662a;
      expv[62] = 22'h1f662a;
      expv[63] = 22'h1f6626;
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
