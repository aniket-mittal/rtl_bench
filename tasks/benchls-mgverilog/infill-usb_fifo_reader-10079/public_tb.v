// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_10079 dut (
    .clk(clk),
    .rst_n(in_vec[10:10]),
    .usb_fifo_rxf_n(in_vec[9:9]),
    .usb_fifo_data(in_vec[8:1]),
    .usb_fifo_out_ack(in_vec[0:0]),
    .usb_fifo_rd_n(out_vec[9:9]),
    .usb_fifo_out_req(out_vec[8:8]),
    .usb_fifo_out_data(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h1d9;
    stim[1] = 11'h247;
    stim[2] = 11'h681;
    stim[3] = 11'h6d1;
    stim[4] = 11'h5ba;
    stim[5] = 11'h4ff;
    stim[6] = 11'h688;
    stim[7] = 11'h785;
    stim[8] = 11'h54b;
    stim[9] = 11'h722;
    stim[10] = 11'h020;
    stim[11] = 11'h7d1;
    stim[12] = 11'h6ce;
    stim[13] = 11'h4a2;
    stim[14] = 11'h582;
    stim[15] = 11'h653;
    stim[16] = 11'h014;
    stim[17] = 11'h429;
    stim[18] = 11'h7a9;
    stim[19] = 11'h4c9;
    stim[20] = 11'h6cb;
    stim[21] = 11'h4d3;
    stim[22] = 11'h7ab;
    stim[23] = 11'h410;
    stim[24] = 11'h513;
    stim[25] = 11'h698;
    stim[26] = 11'h464;
    stim[27] = 11'h570;
    stim[28] = 11'h461;
    stim[29] = 11'h4a7;
    stim[30] = 11'h7c4;
    stim[31] = 11'h789;
    stim[32] = 11'h6a1;
    stim[33] = 11'h5db;
    stim[34] = 11'h680;
    stim[35] = 11'h5d3;
    stim[36] = 11'h6b0;
    stim[37] = 11'h785;
    stim[38] = 11'h4c5;
    stim[39] = 11'h6f2;
    stim[40] = 11'h4ba;
    stim[41] = 11'h311;
    stim[42] = 11'h41e;
    stim[43] = 11'h683;
    stim[44] = 11'h6c7;
    stim[45] = 11'h5b0;
    stim[46] = 11'h558;
    stim[47] = 11'h7de;
    stim[48] = 11'h5d4;
    stim[49] = 11'h5fa;
    stim[50] = 11'h4b4;
    stim[51] = 11'h592;
    stim[52] = 11'h212;
    stim[53] = 11'h455;
    stim[54] = 11'h730;
    stim[55] = 11'h52a;
    stim[56] = 11'h614;
    stim[57] = 11'h647;
    stim[58] = 11'h6e1;
    stim[59] = 11'h46a;
    stim[60] = 11'h529;
    stim[61] = 11'h750;
    stim[62] = 11'h45e;
    stim[63] = 11'h6ab;
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
      expv[0] = 10'h200;
      expv[1] = 10'h200;
      expv[2] = 10'h200;
      expv[3] = 10'h200;
      expv[4] = 10'h240;
      expv[5] = 10'h268;
      expv[6] = 10'h2dd;
      expv[7] = 10'h07f;
      expv[8] = 10'h044;
      expv[9] = 10'h0c2;
      expv[10] = 10'h200;
      expv[11] = 10'h200;
      expv[12] = 10'h200;
      expv[13] = 10'h2e8;
      expv[14] = 10'h267;
      expv[15] = 10'h251;
      expv[16] = 10'h200;
      expv[17] = 10'h200;
      expv[18] = 10'h200;
      expv[19] = 10'h214;
      expv[20] = 10'h0d4;
      expv[21] = 10'h064;
      expv[22] = 10'h065;
      expv[23] = 10'h169;
      expv[24] = 10'h1d5;
      expv[25] = 10'h208;
      expv[26] = 10'h289;
      expv[27] = 10'h24c;
      expv[28] = 10'h232;
      expv[29] = 10'h0b8;
      expv[30] = 10'h030;
      expv[31] = 10'h053;
      expv[32] = 10'h1e2;
      expv[33] = 10'h2c4;
      expv[34] = 10'h250;
      expv[35] = 10'h2ed;
      expv[36] = 10'h040;
      expv[37] = 10'h0e9;
      expv[38] = 10'h058;
      expv[39] = 10'h1c2;
      expv[40] = 10'h162;
      expv[41] = 10'h200;
      expv[42] = 10'h200;
      expv[43] = 10'h200;
      expv[44] = 10'h20f;
      expv[45] = 10'h041;
      expv[46] = 10'h063;
      expv[47] = 10'h0d8;
      expv[48] = 10'h1ac;
      expv[49] = 10'h1ef;
      expv[50] = 10'h1ea;
      expv[51] = 10'h1fd;
      expv[52] = 10'h200;
      expv[53] = 10'h200;
      expv[54] = 10'h200;
      expv[55] = 10'h22a;
      expv[56] = 10'h098;
      expv[57] = 10'h095;
      expv[58] = 10'h00a;
      expv[59] = 10'h123;
      expv[60] = 10'h170;
      expv[61] = 10'h235;
      expv[62] = 10'h294;
      expv[63] = 10'h2a8;
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
