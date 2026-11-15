// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 13;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_015657 dut (
    .sysclk(clk),
    .sysclk_bd(in_vec[12:12]),
    .sysclk_sam(in_vec[11:11]),
    .reset(in_vec[10:10]),
    .PC_Uart_rxd(in_vec[9:9]),
    .ctrl(in_vec[8:8]),
    .TX_DATA(in_vec[7:0]),
    .PC_Uart_txd(out_vec[10:10]),
    .RX_STATUS(out_vec[9:9]),
    .RX_DATA(out_vec[8:1]),
    .TX_STATUS(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 13'h065a;
    stim[1] = 13'h0d27;
    stim[2] = 13'h1a63;
    stim[3] = 13'h1177;
    stim[4] = 13'h02e3;
    stim[5] = 13'h1b3f;
    stim[6] = 13'h1b64;
    stim[7] = 13'h02d6;
    stim[8] = 13'h13d5;
    stim[9] = 13'h1fed;
    stim[10] = 13'h1a1e;
    stim[11] = 13'h0049;
    stim[12] = 13'h082e;
    stim[13] = 13'h13d9;
    stim[14] = 13'h0a82;
    stim[15] = 13'h0176;
    stim[16] = 13'h01b7;
    stim[17] = 13'h0a7f;
    stim[18] = 13'h0f2d;
    stim[19] = 13'h18aa;
    stim[20] = 13'h11af;
    stim[21] = 13'h021a;
    stim[22] = 13'h1963;
    stim[23] = 13'h1060;
    stim[24] = 13'h03c9;
    stim[25] = 13'h0aca;
    stim[26] = 13'h10b2;
    stim[27] = 13'h1207;
    stim[28] = 13'h0981;
    stim[29] = 13'h1900;
    stim[30] = 13'h1a42;
    stim[31] = 13'h0b60;
    stim[32] = 13'h013b;
    stim[33] = 13'h18ed;
    stim[34] = 13'h1809;
    stim[35] = 13'h128c;
    stim[36] = 13'h03b7;
    stim[37] = 13'h0ab1;
    stim[38] = 13'h187c;
    stim[39] = 13'h0182;
    stim[40] = 13'h0352;
    stim[41] = 13'h1b02;
    stim[42] = 13'h1189;
    stim[43] = 13'h08d1;
    stim[44] = 13'h121c;
    stim[45] = 13'h1905;
    stim[46] = 13'h0bd3;
    stim[47] = 13'h1b9a;
    stim[48] = 13'h1237;
    stim[49] = 13'h125d;
    stim[50] = 13'h12ee;
    stim[51] = 13'h19a9;
    stim[52] = 13'h1361;
    stim[53] = 13'h0467;
    stim[54] = 13'h0974;
    stim[55] = 13'h0933;
    stim[56] = 13'h02ee;
    stim[57] = 13'h1a3e;
    stim[58] = 13'h09a9;
    stim[59] = 13'h12a6;
    stim[60] = 13'h03fe;
    stim[61] = 13'h18c8;
    stim[62] = 13'h19ba;
    stim[63] = 13'h048b;
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
      expv[0] = 11'h400;
      expv[1] = 11'h400;
      expv[2] = 11'h400;
      expv[3] = 11'h400;
      expv[4] = 11'h400;
      expv[5] = 11'h400;
      expv[6] = 11'h000;
      expv[7] = 11'h000;
      expv[8] = 11'h000;
      expv[9] = 11'h400;
      expv[10] = 11'h400;
      expv[11] = 11'h400;
      expv[12] = 11'h400;
      expv[13] = 11'h400;
      expv[14] = 11'h400;
      expv[15] = 11'h400;
      expv[16] = 11'h400;
      expv[17] = 11'h400;
      expv[18] = 11'h400;
      expv[19] = 11'h400;
      expv[20] = 11'h400;
      expv[21] = 11'h400;
      expv[22] = 11'h400;
      expv[23] = 11'h000;
      expv[24] = 11'h000;
      expv[25] = 11'h000;
      expv[26] = 11'h000;
      expv[27] = 11'h400;
      expv[28] = 11'h400;
      expv[29] = 11'h400;
      expv[30] = 11'h000;
      expv[31] = 11'h000;
      expv[32] = 11'h000;
      expv[33] = 11'h000;
      expv[34] = 11'h400;
      expv[35] = 11'h000;
      expv[36] = 11'h400;
      expv[37] = 11'h400;
      expv[38] = 11'h400;
      expv[39] = 11'h401;
      expv[40] = 11'h400;
      expv[41] = 11'h400;
      expv[42] = 11'h000;
      expv[43] = 11'h400;
      expv[44] = 11'h400;
      expv[45] = 11'h000;
      expv[46] = 11'h400;
      expv[47] = 11'h400;
      expv[48] = 11'h400;
      expv[49] = 11'h400;
      expv[50] = 11'h000;
      expv[51] = 11'h400;
      expv[52] = 11'h400;
      expv[53] = 11'h400;
      expv[54] = 11'h400;
      expv[55] = 11'h400;
      expv[56] = 11'h400;
      expv[57] = 11'h400;
      expv[58] = 11'h000;
      expv[59] = 11'h000;
      expv[60] = 11'h000;
      expv[61] = 11'h000;
      expv[62] = 11'h000;
      expv[63] = 11'h400;
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
