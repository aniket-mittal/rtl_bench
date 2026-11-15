// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 39;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  fifo_to_packet dut (
    .clk(clk),
    .reset_n(in_vec[38:38]),
    .out_ready(in_vec[37:37]),
    .fifo_readdata(in_vec[36:1]),
    .fifo_empty(in_vec[0:0]),
    .out_valid(out_vec[11:11]),
    .out_data(out_vec[10:3]),
    .out_startofpacket(out_vec[2:2]),
    .out_endofpacket(out_vec[1:1]),
    .fifo_read(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 39'h383e264447;
    stim[1] = 39'h0e7c246cf0;
    stim[2] = 39'h56095aba58;
    stim[3] = 39'h7745a2896c;
    stim[4] = 39'h50020c8411;
    stim[5] = 39'h4a750261fb;
    stim[6] = 39'h6de6949b33;
    stim[7] = 39'h4444d72220;
    stim[8] = 39'h6342fc7d6b;
    stim[9] = 39'h77b098c631;
    stim[10] = 39'h71e7dde873;
    stim[11] = 39'h6f5823dc04;
    stim[12] = 39'h540760155b;
    stim[13] = 39'h71822b6b64;
    stim[14] = 39'h51c83ffe23;
    stim[15] = 39'h751d58fb03;
    stim[16] = 39'h643e95c27c;
    stim[17] = 39'h7d67e3f726;
    stim[18] = 39'h5006954838;
    stim[19] = 39'h4fa8e0c36d;
    stim[20] = 39'h5c874fdbcf;
    stim[21] = 39'h6d6647c121;
    stim[22] = 39'h5388f958a7;
    stim[23] = 39'h064cf48f07;
    stim[24] = 39'h45c825121a;
    stim[25] = 39'h5f441b28e5;
    stim[26] = 39'h71a49dcce0;
    stim[27] = 39'h4eae81997c;
    stim[28] = 39'h5afaccc94c;
    stim[29] = 39'h41a0787e58;
    stim[30] = 39'h6fcff56801;
    stim[31] = 39'h5a959f6ef3;
    stim[32] = 39'h72174f8e62;
    stim[33] = 39'h6e43428ba5;
    stim[34] = 39'h6551137068;
    stim[35] = 39'h6ec26533ee;
    stim[36] = 39'h41024bb08c;
    stim[37] = 39'h7942f3c9e5;
    stim[38] = 39'h69115a2433;
    stim[39] = 39'h4c656531f1;
    stim[40] = 39'h5e4a8b3749;
    stim[41] = 39'h70c7a6b27f;
    stim[42] = 39'h636c3c3b92;
    stim[43] = 39'h53256187f6;
    stim[44] = 39'h54bfea388c;
    stim[45] = 39'h65197ac8cc;
    stim[46] = 39'h6f40101d61;
    stim[47] = 39'h7573009310;
    stim[48] = 39'h6a8ea4b57b;
    stim[49] = 39'h7ef2340948;
    stim[50] = 39'h51b7c19a94;
    stim[51] = 39'h4e5378b344;
    stim[52] = 39'h6432ce07c9;
    stim[53] = 39'h4303fe7732;
    stim[54] = 39'h6692c08d38;
    stim[55] = 39'h4c760cf60e;
    stim[56] = 39'h75f3275733;
    stim[57] = 39'h48eb53636e;
    stim[58] = 39'h4d4f5aaa87;
    stim[59] = 39'h5798beaef0;
    stim[60] = 39'h4186000b35;
    stim[61] = 39'h47828f1fb3;
    stim[62] = 39'h51aec7d243;
    stim[63] = 39'h5952c014af;
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
      expv[0] = 12'h000;
      expv[1] = 12'h000;
      expv[2] = 12'h000;
      expv[3] = 12'h001;
      expv[4] = 12'h000;
      expv[5] = 12'h844;
      expv[6] = 12'h844;
      expv[7] = 12'h040;
      expv[8] = 12'h041;
      expv[9] = 12'h040;
      expv[10] = 12'h8c4;
      expv[11] = 12'hb18;
      expv[12] = 12'ha60;
      expv[13] = 12'ha60;
      expv[14] = 12'hec0;
      expv[15] = 12'hec0;
      expv[16] = 12'h6c0;
      expv[17] = 12'h6c1;
      expv[18] = 12'h6c0;
      expv[19] = 12'h8e4;
      expv[20] = 12'h8e4;
      expv[21] = 12'h8e4;
      expv[22] = 12'h0e0;
      expv[23] = 12'h000;
      expv[24] = 12'h000;
      expv[25] = 12'h001;
      expv[26] = 12'h000;
      expv[27] = 12'hb84;
      expv[28] = 12'hb84;
      expv[29] = 12'hb84;
      expv[30] = 12'hb84;
      expv[31] = 12'h380;
      expv[32] = 12'h380;
      expv[33] = 12'h381;
      expv[34] = 12'h380;
      expv[35] = 12'h9a0;
      expv[36] = 12'hdc0;
      expv[37] = 12'hdc0;
      expv[38] = 12'hc48;
      expv[39] = 12'h448;
      expv[40] = 12'h448;
      expv[41] = 12'h448;
      expv[42] = 12'h448;
      expv[43] = 12'h449;
      expv[44] = 12'h448;
      expv[45] = 12'ha34;
      expv[46] = 12'h8e0;
      expv[47] = 12'hfa8;
      expv[48] = 12'h7a8;
      expv[49] = 12'h7a8;
      expv[50] = 12'h7a9;
      expv[51] = 12'h7a8;
      expv[52] = 12'hd10;
      expv[53] = 12'hac8;
      expv[54] = 12'hac8;
      expv[55] = 12'hde0;
      expv[56] = 12'hde0;
      expv[57] = 12'h94a;
      expv[58] = 12'h94a;
      expv[59] = 12'h94a;
      expv[60] = 12'h94a;
      expv[61] = 12'h94a;
      expv[62] = 12'h94a;
      expv[63] = 12'h94a;
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
