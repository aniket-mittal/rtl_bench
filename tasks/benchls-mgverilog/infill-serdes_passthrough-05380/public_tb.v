// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 20;
  localparam OW = 19;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_05380 dut (
    .ser_tx_clk(clk),
    .ser_tkmsb(in_vec[19:19]),
    .ser_tklsb(in_vec[18:18]),
    .ser_t(in_vec[17:2]),
    .even(in_vec[1:1]),
    .error(in_vec[0:0]),
    .ser_rx_clk(out_vec[18:18]),
    .ser_rkmsb(out_vec[17:17]),
    .ser_rklsb(out_vec[16:16]),
    .ser_r(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 20'h70865;
    stim[1] = 20'h59f4f;
    stim[2] = 20'hf75be;
    stim[3] = 20'h7fc91;
    stim[4] = 20'hd5431;
    stim[5] = 20'h09f55;
    stim[6] = 20'h4fb0a;
    stim[7] = 20'h84853;
    stim[8] = 20'h28b17;
    stim[9] = 20'h74f07;
    stim[10] = 20'h23759;
    stim[11] = 20'h64908;
    stim[12] = 20'h277f3;
    stim[13] = 20'h79c8f;
    stim[14] = 20'h44308;
    stim[15] = 20'h679b6;
    stim[16] = 20'h3c328;
    stim[17] = 20'h8c02f;
    stim[18] = 20'hd947d;
    stim[19] = 20'h7c2b2;
    stim[20] = 20'hec314;
    stim[21] = 20'h569cc;
    stim[22] = 20'he1ea5;
    stim[23] = 20'hd43e3;
    stim[24] = 20'hbfdc5;
    stim[25] = 20'hca5df;
    stim[26] = 20'ha611a;
    stim[27] = 20'h0f7c0;
    stim[28] = 20'ha50fe;
    stim[29] = 20'h0ebc4;
    stim[30] = 20'hb6058;
    stim[31] = 20'he2840;
    stim[32] = 20'h50a95;
    stim[33] = 20'hd84e9;
    stim[34] = 20'hffb62;
    stim[35] = 20'h627ab;
    stim[36] = 20'h8da75;
    stim[37] = 20'h7f4b3;
    stim[38] = 20'h8a1e6;
    stim[39] = 20'hfc963;
    stim[40] = 20'h9956c;
    stim[41] = 20'h52244;
    stim[42] = 20'h67931;
    stim[43] = 20'h3b96a;
    stim[44] = 20'hc4794;
    stim[45] = 20'h80ea3;
    stim[46] = 20'hc47d9;
    stim[47] = 20'h458ee;
    stim[48] = 20'h096f5;
    stim[49] = 20'h7fd1c;
    stim[50] = 20'h96d3a;
    stim[51] = 20'h04246;
    stim[52] = 20'h65ce9;
    stim[53] = 20'hef7cb;
    stim[54] = 20'h81aea;
    stim[55] = 20'hdc29d;
    stim[56] = 20'h349d5;
    stim[57] = 20'h9c80d;
    stim[58] = 20'h27619;
    stim[59] = 20'h2ccbf;
    stim[60] = 20'hcca63;
    stim[61] = 20'h098c5;
    stim[62] = 20'hfd297;
    stim[63] = 20'h8da56;
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
      expv[0] = 19'hx19xx;
      expv[1] = 19'h167d2;
      expv[2] = 19'h3dd6f;
      expv[3] = 19'h324dc;
      expv[4] = 19'h30cfe;
      expv[5] = 19'h1d554;
      expv[6] = 19'h13ec2;
      expv[7] = 19'h21215;
      expv[8] = 19'h0a2c4;
      expv[9] = 19'h1d3c0;
      expv[10] = 19'h1d6d2;
      expv[11] = 19'h2428d;
      expv[12] = 19'h09dfd;
      expv[13] = 19'h1e722;
      expv[14] = 19'h3c2e7;
      expv[15] = 19'h19e6d;
      expv[16] = 19'h1ca9e;
      expv[17] = 19'h2300a;
      expv[18] = 19'h21f31;
      expv[19] = 19'h1f0ac;
      expv[20] = 19'h3c5f0;
      expv[21] = 19'h373b0;
      expv[22] = 19'h3a95b;
      expv[23] = 19'h350f9;
      expv[24] = 19'h17151;
      expv[25] = 19'h32976;
      expv[26] = 19'h29846;
      expv[27] = 19'h0f098;
      expv[28] = 19'h2943f;
      expv[29] = 19'h0f194;
      expv[30] = 19'h0163a;
      expv[31] = 19'h210d8;
      expv[32] = 19'h3a58b;
      expv[33] = 19'h33a43;
      expv[34] = 19'h3fed8;
      expv[35] = 19'h189eb;
      expv[36] = 19'h19d88;
      expv[37] = 19'h1fd2d;
      expv[38] = 19'h22879;
      expv[39] = 19'h3f259;
      expv[40] = 19'h15bf2;
      expv[41] = 19'h29165;
      expv[42] = 19'h34c49;
      expv[43] = 19'h0ee5a;
      expv[44] = 19'h2e5ee;
      expv[45] = 19'h203a9;
      expv[46] = 19'h2f602;
      expv[47] = 19'h1163b;
      expv[48] = 19'h1bd17;
      expv[49] = 19'h24725;
      expv[50] = 19'h25b4e;
      expv[51] = 19'h01091;
      expv[52] = 19'h23a11;
      expv[53] = 19'h3bdf3;
      expv[54] = 19'h206ba;
      expv[55] = 19'h2a707;
      expv[56] = 19'h17571;
      expv[57] = 19'h003d3;
      expv[58] = 19'h08673;
      expv[59] = 19'h0b32e;
      expv[60] = 19'h33299;
      expv[61] = 19'h13133;
      expv[62] = 19'h3f4a4;
      expv[63] = 19'h23695;
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
