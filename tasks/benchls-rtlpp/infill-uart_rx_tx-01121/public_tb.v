// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 15;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_01121 dut (
    .clk(clk),
    .rst(in_vec[10:10]),
    .rx(in_vec[9:9]),
    .transmit(in_vec[8:8]),
    .tx_byte(in_vec[7:0]),
    .tx(out_vec[14:14]),
    .received(out_vec[13:13]),
    .rx_byte(out_vec[12:5]),
    .is_receiving(out_vec[4:4]),
    .is_transmitting(out_vec[3:3]),
    .recv_error(out_vec[2:2]),
    .state(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h6b1;
    stim[1] = 11'h525;
    stim[2] = 11'h0b0;
    stim[3] = 11'h332;
    stim[4] = 11'h3fd;
    stim[5] = 11'h1d1;
    stim[6] = 11'h27b;
    stim[7] = 11'h2a5;
    stim[8] = 11'h291;
    stim[9] = 11'h3a1;
    stim[10] = 11'h2da;
    stim[11] = 11'h080;
    stim[12] = 11'h35f;
    stim[13] = 11'h3b5;
    stim[14] = 11'h264;
    stim[15] = 11'h095;
    stim[16] = 11'h0ed;
    stim[17] = 11'h1e1;
    stim[18] = 11'h033;
    stim[19] = 11'h3b4;
    stim[20] = 11'h28a;
    stim[21] = 11'h2cf;
    stim[22] = 11'h392;
    stim[23] = 11'h2e9;
    stim[24] = 11'h091;
    stim[25] = 11'h29c;
    stim[26] = 11'h014;
    stim[27] = 11'h14a;
    stim[28] = 11'h091;
    stim[29] = 11'h39f;
    stim[30] = 11'h209;
    stim[31] = 11'h1d9;
    stim[32] = 11'h2fd;
    stim[33] = 11'h11a;
    stim[34] = 11'h182;
    stim[35] = 11'h3db;
    stim[36] = 11'h251;
    stim[37] = 11'h347;
    stim[38] = 11'h020;
    stim[39] = 11'h2d5;
    stim[40] = 11'h123;
    stim[41] = 11'h340;
    stim[42] = 11'h36d;
    stim[43] = 11'h1f8;
    stim[44] = 11'h37b;
    stim[45] = 11'h054;
    stim[46] = 11'h017;
    stim[47] = 11'h35a;
    stim[48] = 11'h005;
    stim[49] = 11'h0a6;
    stim[50] = 11'h2e2;
    stim[51] = 11'h394;
    stim[52] = 11'h1f8;
    stim[53] = 11'h2ed;
    stim[54] = 11'h19d;
    stim[55] = 11'h356;
    stim[56] = 11'h066;
    stim[57] = 11'h3e1;
    stim[58] = 11'h04a;
    stim[59] = 11'h3ef;
    stim[60] = 11'h34b;
    stim[61] = 11'h17b;
    stim[62] = 11'h208;
    stim[63] = 11'h1b4;
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
      expv[0] = 15'hxxx0;
      expv[1] = 15'hxxx0;
      expv[2] = 15'hxxx0;
      expv[3] = 15'hxxx0;
      expv[4] = 15'hxxx9;
      expv[5] = 15'hxxx9;
      expv[6] = 15'hxxx9;
      expv[7] = 15'hxxx9;
      expv[8] = 15'hxxx9;
      expv[9] = 15'hxxx9;
      expv[10] = 15'hxxx9;
      expv[11] = 15'hxxx9;
      expv[12] = 15'hxxx9;
      expv[13] = 15'hxxx9;
      expv[14] = 15'hxxx9;
      expv[15] = 15'hxxx9;
      expv[16] = 15'hxxx9;
      expv[17] = 15'hxxx9;
      expv[18] = 15'hxxx9;
      expv[19] = 15'hxxx9;
      expv[20] = 15'hxxx9;
      expv[21] = 15'hxxx9;
      expv[22] = 15'hxxx9;
      expv[23] = 15'hxxx9;
      expv[24] = 15'hxxx9;
      expv[25] = 15'hxxx9;
      expv[26] = 15'hxxx9;
      expv[27] = 15'hxxx9;
      expv[28] = 15'hxxx9;
      expv[29] = 15'hxxx9;
      expv[30] = 15'hxxx9;
      expv[31] = 15'hxxx9;
      expv[32] = 15'hxxx9;
      expv[33] = 15'hxxx9;
      expv[34] = 15'hxxx9;
      expv[35] = 15'hxxx9;
      expv[36] = 15'hxxx9;
      expv[37] = 15'hxxx9;
      expv[38] = 15'hxxx9;
      expv[39] = 15'hxxx9;
      expv[40] = 15'hxxx9;
      expv[41] = 15'hxxx9;
      expv[42] = 15'hxxx9;
      expv[43] = 15'hxxx9;
      expv[44] = 15'hxxx9;
      expv[45] = 15'hxxx9;
      expv[46] = 15'hxxx9;
      expv[47] = 15'hxxx9;
      expv[48] = 15'hxxx9;
      expv[49] = 15'hxxx9;
      expv[50] = 15'hxxx9;
      expv[51] = 15'hxxx9;
      expv[52] = 15'hxxx9;
      expv[53] = 15'hxxx9;
      expv[54] = 15'hxxx9;
      expv[55] = 15'hxxx9;
      expv[56] = 15'hxxx9;
      expv[57] = 15'hxxx9;
      expv[58] = 15'hxxx9;
      expv[59] = 15'hxxx9;
      expv[60] = 15'hxxx9;
      expv[61] = 15'hxxx9;
      expv[62] = 15'hxxx9;
      expv[63] = 15'hxxx9;
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
