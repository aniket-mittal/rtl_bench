// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 19;
  localparam OW = 13;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02458 dut (
    .clk(clk),
    .rst(in_vec[18:18]),
    .we(in_vec[17:17]),
    .incr(in_vec[16:16]),
    .wr(in_vec[15:0]),
    .rd(out_vec[12:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 19'h583bc;
    stim[1] = 19'h5fa91;
    stim[2] = 19'h2c711;
    stim[3] = 19'h397a5;
    stim[4] = 19'h17c4b;
    stim[5] = 19'h02f80;
    stim[6] = 19'h3bbf0;
    stim[7] = 19'h0100a;
    stim[8] = 19'h0b80a;
    stim[9] = 19'h44087;
    stim[10] = 19'h15910;
    stim[11] = 19'h15350;
    stim[12] = 19'h3b6b1;
    stim[13] = 19'h15f16;
    stim[14] = 19'h18414;
    stim[15] = 19'h0fad9;
    stim[16] = 19'h371eb;
    stim[17] = 19'h15833;
    stim[18] = 19'h12ec3;
    stim[19] = 19'h3a1b4;
    stim[20] = 19'h18151;
    stim[21] = 19'h32758;
    stim[22] = 19'h2f57e;
    stim[23] = 19'h1fe29;
    stim[24] = 19'h11677;
    stim[25] = 19'h31ac6;
    stim[26] = 19'h324c9;
    stim[27] = 19'h06b74;
    stim[28] = 19'h34ed7;
    stim[29] = 19'h24163;
    stim[30] = 19'h38ced;
    stim[31] = 19'h1b717;
    stim[32] = 19'h10c8c;
    stim[33] = 19'h0ce23;
    stim[34] = 19'h1232c;
    stim[35] = 19'h12a7e;
    stim[36] = 19'h2cc3b;
    stim[37] = 19'h49eba;
    stim[38] = 19'h29ecf;
    stim[39] = 19'h3ae10;
    stim[40] = 19'h2152c;
    stim[41] = 19'h4f3a5;
    stim[42] = 19'h29170;
    stim[43] = 19'h15dd1;
    stim[44] = 19'h15afd;
    stim[45] = 19'h13337;
    stim[46] = 19'h2323c;
    stim[47] = 19'h0e96d;
    stim[48] = 19'h3da8f;
    stim[49] = 19'h1a628;
    stim[50] = 19'h0ecb4;
    stim[51] = 19'h14a58;
    stim[52] = 19'h08b4f;
    stim[53] = 19'h0e68e;
    stim[54] = 19'h17e5c;
    stim[55] = 19'h14c0a;
    stim[56] = 19'h3cf34;
    stim[57] = 19'h06899;
    stim[58] = 19'h178cd;
    stim[59] = 19'h0e038;
    stim[60] = 19'h38e8a;
    stim[61] = 19'h35563;
    stim[62] = 19'h1ecd8;
    stim[63] = 19'h3c50e;
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
      expv[0] = 13'hxxxx;
      expv[1] = 13'h0000;
      expv[2] = 13'h0000;
      expv[3] = 13'h0711;
      expv[4] = 13'h17a5;
      expv[5] = 13'h17a6;
      expv[6] = 13'h17a6;
      expv[7] = 13'h1bf0;
      expv[8] = 13'h1bf0;
      expv[9] = 13'h1bf0;
      expv[10] = 13'h0000;
      expv[11] = 13'h0001;
      expv[12] = 13'h0002;
      expv[13] = 13'h16b1;
      expv[14] = 13'h16b2;
      expv[15] = 13'h16b3;
      expv[16] = 13'h16b3;
      expv[17] = 13'h11eb;
      expv[18] = 13'h11ec;
      expv[19] = 13'h11ed;
      expv[20] = 13'h01b4;
      expv[21] = 13'h01b5;
      expv[22] = 13'h0758;
      expv[23] = 13'h157e;
      expv[24] = 13'h157f;
      expv[25] = 13'h1580;
      expv[26] = 13'h1ac6;
      expv[27] = 13'h04c9;
      expv[28] = 13'h04c9;
      expv[29] = 13'h0ed7;
      expv[30] = 13'h0163;
      expv[31] = 13'h0ced;
      expv[32] = 13'h0cee;
      expv[33] = 13'h0cef;
      expv[34] = 13'h0cef;
      expv[35] = 13'h0cf0;
      expv[36] = 13'h0cf1;
      expv[37] = 13'h0c3b;
      expv[38] = 13'h0000;
      expv[39] = 13'h1ecf;
      expv[40] = 13'h0e10;
      expv[41] = 13'h152c;
      expv[42] = 13'h0000;
      expv[43] = 13'h1170;
      expv[44] = 13'h1171;
      expv[45] = 13'h1172;
      expv[46] = 13'h1173;
      expv[47] = 13'h123c;
      expv[48] = 13'h123c;
      expv[49] = 13'h1a8f;
      expv[50] = 13'h1a90;
      expv[51] = 13'h1a90;
      expv[52] = 13'h1a91;
      expv[53] = 13'h1a91;
      expv[54] = 13'h1a91;
      expv[55] = 13'h1a92;
      expv[56] = 13'h1a93;
      expv[57] = 13'h0f34;
      expv[58] = 13'h0f34;
      expv[59] = 13'h0f35;
      expv[60] = 13'h0f35;
      expv[61] = 13'h0e8a;
      expv[62] = 13'h1563;
      expv[63] = 13'h1564;
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
