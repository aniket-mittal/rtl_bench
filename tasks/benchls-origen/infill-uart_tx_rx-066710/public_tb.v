// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 21;
  localparam OW = 2;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_066710 dut (
    .i_clk(clk),
    .i_reset_n(in_vec[20:20]),
    .i_pop(in_vec[19:19]),
    .i_parity(in_vec[18:18]),
    .i_serial(in_vec[17:17]),
    .i_enable(in_vec[16:16]),
    .i_baud(in_vec[15:0]),
    .o_tx_enable(out_vec[1:1]),
    .o_rx_enable(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 21'h094e35;
    stim[1] = 21'h0b3051;
    stim[2] = 21'h124319;
    stim[3] = 21'h155e6a;
    stim[4] = 21'h1d54fc;
    stim[5] = 21'h107f73;
    stim[6] = 21'h19c814;
    stim[7] = 21'h1749af;
    stim[8] = 21'h10ddc5;
    stim[9] = 21'h10b73a;
    stim[10] = 21'h1ca3bd;
    stim[11] = 21'h1841b5;
    stim[12] = 21'h1fff7c;
    stim[13] = 21'h1dabbb;
    stim[14] = 21'h136e63;
    stim[15] = 21'h1260b6;
    stim[16] = 21'h136eb0;
    stim[17] = 21'h1125de;
    stim[18] = 21'h15399d;
    stim[19] = 21'h138d51;
    stim[20] = 21'h198957;
    stim[21] = 21'h135bf2;
    stim[22] = 21'h141cc9;
    stim[23] = 21'h1c043f;
    stim[24] = 21'h1e588f;
    stim[25] = 21'h1d008c;
    stim[26] = 21'h1efb26;
    stim[27] = 21'h1f7d63;
    stim[28] = 21'h15ca54;
    stim[29] = 21'h181ac1;
    stim[30] = 21'h13b587;
    stim[31] = 21'h1c08e9;
    stim[32] = 21'h1315b1;
    stim[33] = 21'h18b5b2;
    stim[34] = 21'h1a1c89;
    stim[35] = 21'h1531f5;
    stim[36] = 21'h1e8a13;
    stim[37] = 21'h1204dd;
    stim[38] = 21'h18403e;
    stim[39] = 21'h13bd1e;
    stim[40] = 21'h13b903;
    stim[41] = 21'h1f62f5;
    stim[42] = 21'h13eee4;
    stim[43] = 21'h1f6f60;
    stim[44] = 21'h196583;
    stim[45] = 21'h19253a;
    stim[46] = 21'h13da43;
    stim[47] = 21'h1b3bb2;
    stim[48] = 21'h1ff204;
    stim[49] = 21'h13d87c;
    stim[50] = 21'h11d3c4;
    stim[51] = 21'h1c722d;
    stim[52] = 21'h1ca1ba;
    stim[53] = 21'h1cf15b;
    stim[54] = 21'h1d25d3;
    stim[55] = 21'h1b81cf;
    stim[56] = 21'h111bd8;
    stim[57] = 21'h15c1e0;
    stim[58] = 21'h14f044;
    stim[59] = 21'h104cee;
    stim[60] = 21'h12b99f;
    stim[61] = 21'h1c71a5;
    stim[62] = 21'h10e55b;
    stim[63] = 21'h1378b3;
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
      expv[0] = 2'h0;
      expv[1] = 2'h0;
      expv[2] = 2'h0;
      expv[3] = 2'h0;
      expv[4] = 2'h0;
      expv[5] = 2'h0;
      expv[6] = 2'h0;
      expv[7] = 2'h0;
      expv[8] = 2'h0;
      expv[9] = 2'h0;
      expv[10] = 2'h0;
      expv[11] = 2'h0;
      expv[12] = 2'h0;
      expv[13] = 2'h0;
      expv[14] = 2'h0;
      expv[15] = 2'h0;
      expv[16] = 2'h0;
      expv[17] = 2'h0;
      expv[18] = 2'h0;
      expv[19] = 2'h0;
      expv[20] = 2'h0;
      expv[21] = 2'h0;
      expv[22] = 2'h0;
      expv[23] = 2'h0;
      expv[24] = 2'h0;
      expv[25] = 2'h0;
      expv[26] = 2'h0;
      expv[27] = 2'h0;
      expv[28] = 2'h0;
      expv[29] = 2'h0;
      expv[30] = 2'h0;
      expv[31] = 2'h0;
      expv[32] = 2'h0;
      expv[33] = 2'h0;
      expv[34] = 2'h0;
      expv[35] = 2'h0;
      expv[36] = 2'h0;
      expv[37] = 2'h0;
      expv[38] = 2'h0;
      expv[39] = 2'h0;
      expv[40] = 2'h0;
      expv[41] = 2'h0;
      expv[42] = 2'h0;
      expv[43] = 2'h0;
      expv[44] = 2'h0;
      expv[45] = 2'h0;
      expv[46] = 2'h0;
      expv[47] = 2'h0;
      expv[48] = 2'h0;
      expv[49] = 2'h0;
      expv[50] = 2'h0;
      expv[51] = 2'h0;
      expv[52] = 2'h0;
      expv[53] = 2'h0;
      expv[54] = 2'h0;
      expv[55] = 2'h0;
      expv[56] = 2'h0;
      expv[57] = 2'h0;
      expv[58] = 2'h0;
      expv[59] = 2'h0;
      expv[60] = 2'h0;
      expv[61] = 2'h0;
      expv[62] = 2'h0;
      expv[63] = 2'h0;
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
