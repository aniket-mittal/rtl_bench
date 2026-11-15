// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 25;
  localparam OW = 19;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_006784 dut (
    .clk(clk),
    .rst_n(in_vec[24:24]),
    .send_char(in_vec[23:16]),
    .send_en(in_vec[15:15]),
    .rx_rdata(in_vec[14:7]),
    .rx_fifo_full(in_vec[6:6]),
    .rx_fifo_dvalid(in_vec[5:5]),
    .rx_fifo_overrun(in_vec[4:4]),
    .rx_fifo_underrun(in_vec[3:3]),
    .tx_fifo_full(in_vec[2:2]),
    .tx_fifo_overrun(in_vec[1:1]),
    .tx_fifo_underrun(in_vec[0:0]),
    .rout(out_vec[18:11]),
    .rout_en(out_vec[10:10]),
    .rx_rden(out_vec[9:9]),
    .tx_wdata(out_vec[8:1]),
    .tx_wten(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 25'h07d6938;
    stim[1] = 25'h0f5ceca;
    stim[2] = 25'h13f9d04;
    stim[3] = 25'h164f670;
    stim[4] = 25'h15216f2;
    stim[5] = 25'h10368c0;
    stim[6] = 25'h11035c2;
    stim[7] = 25'h1bf3c41;
    stim[8] = 25'h1d6f892;
    stim[9] = 25'h1053a5e;
    stim[10] = 25'h1b592f4;
    stim[11] = 25'h159b36a;
    stim[12] = 25'h16b8d77;
    stim[13] = 25'h18a6c61;
    stim[14] = 25'h1048e3d;
    stim[15] = 25'h1bb0073;
    stim[16] = 25'h10104d0;
    stim[17] = 25'h16d7160;
    stim[18] = 25'h1b10e72;
    stim[19] = 25'h19f0a11;
    stim[20] = 25'h102a6f9;
    stim[21] = 25'h1cf353f;
    stim[22] = 25'h1781ac1;
    stim[23] = 25'h11055f7;
    stim[24] = 25'h15d207d;
    stim[25] = 25'h1b80354;
    stim[26] = 25'h1dcf0ae;
    stim[27] = 25'h1fb88cd;
    stim[28] = 25'h12bbdbf;
    stim[29] = 25'h1cd6507;
    stim[30] = 25'h15ff168;
    stim[31] = 25'h191306e;
    stim[32] = 25'h10ecff3;
    stim[33] = 25'h15ba755;
    stim[34] = 25'h1c17211;
    stim[35] = 25'h0e2d68b;
    stim[36] = 25'h1b1b3af;
    stim[37] = 25'h173194d;
    stim[38] = 25'h13d1f34;
    stim[39] = 25'h1925521;
    stim[40] = 25'h165b00f;
    stim[41] = 25'h173642c;
    stim[42] = 25'h125bce6;
    stim[43] = 25'h1bb1f76;
    stim[44] = 25'h1ecadc7;
    stim[45] = 25'h112c712;
    stim[46] = 25'h149b176;
    stim[47] = 25'h1bed037;
    stim[48] = 25'h1251acf;
    stim[49] = 25'h1bef404;
    stim[50] = 25'h1a676ee;
    stim[51] = 25'h1f6ac12;
    stim[52] = 25'h1070cf6;
    stim[53] = 25'h198aca6;
    stim[54] = 25'h133444c;
    stim[55] = 25'h116c798;
    stim[56] = 25'h1772440;
    stim[57] = 25'h1ac388a;
    stim[58] = 25'h10d9e97;
    stim[59] = 25'h1e2e565;
    stim[60] = 25'h126f852;
    stim[61] = 25'h119d1fa;
    stim[62] = 25'h172c1bf;
    stim[63] = 25'h1ceb711;
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
      expv[0] = 19'h00200;
      expv[1] = 19'h001eb;
      expv[2] = 19'h0007f;
      expv[3] = 19'h002c9;
      expv[4] = 19'h767d9;
      expv[5] = 19'h16c5b;
      expv[6] = 19'h1685a;
      expv[7] = 19'h1685a;
      expv[8] = 19'h169ad;
      expv[9] = 19'h1685a;
      expv[10] = 19'h16b6b;
      expv[11] = 19'h12eb3;
      expv[12] = 19'h336d7;
      expv[13] = 19'h0d635;
      expv[14] = 19'h6c609;
      expv[15] = 19'h0e639;
      expv[16] = 19'h00401;
      expv[17] = 19'h00200;
      expv[18] = 19'h717c5;
      expv[19] = 19'h0e439;
      expv[20] = 19'h0e205;
      expv[21] = 19'h26e9a;
      expv[22] = 19'h354d5;
      expv[23] = 19'h352d4;
      expv[24] = 19'h55f56;
      expv[25] = 19'h20480;
      expv[26] = 19'h203b9;
      expv[27] = 19'h70df7;
      expv[28] = 19'h70a57;
      expv[29] = 19'h3dcf6;
      expv[30] = 19'h3dabf;
      expv[31] = 19'h717c4;
      expv[32] = 19'h3061d;
      expv[33] = 19'h4fcb7;
      expv[34] = 19'h4f93e;
      expv[35] = 19'h001c5;
      expv[36] = 19'h00363;
      expv[37] = 19'h33cce;
      expv[38] = 19'h33ace;
      expv[39] = 19'h1f67d;
      expv[40] = 19'h554cb;
      expv[41] = 19'h55354;
      expv[42] = 19'h6464b;
      expv[43] = 19'h3cef2;
      expv[44] = 19'h1f5d9;
      expv[45] = 19'h1f025;
      expv[46] = 19'h1f293;
      expv[47] = 19'h3177d;
      expv[48] = 19'h50540;
      expv[49] = 19'h5017d;
      expv[50] = 19'h50340;
      expv[51] = 19'h76ded;
      expv[52] = 19'h76bda;
      expv[53] = 19'h0cf31;
      expv[54] = 19'h2ccb2;
      expv[55] = 19'h2c82d;
      expv[56] = 19'h2c8b2;
      expv[57] = 19'h2c8b2;
      expv[58] = 19'h2c81b;
      expv[59] = 19'h2cbc5;
      expv[60] = 19'h6544d;
      expv[61] = 19'h65233;
      expv[62] = 19'h51ee5;
      expv[63] = 19'h41d9d;
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
