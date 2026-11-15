// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 13;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_011410 dut (
    .data_13(in_vec[12:0]),
    .data_8_out(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 13'h0c39;
    stim[1] = 13'h1a28;
    stim[2] = 13'h19a0;
    stim[3] = 13'h19de;
    stim[4] = 13'h1c27;
    stim[5] = 13'h1b00;
    stim[6] = 13'h1c47;
    stim[7] = 13'h0fad;
    stim[8] = 13'h03c4;
    stim[9] = 13'h0dfc;
    stim[10] = 13'h1a99;
    stim[11] = 13'h09fd;
    stim[12] = 13'h03a2;
    stim[13] = 13'h0498;
    stim[14] = 13'h16c7;
    stim[15] = 13'h1410;
    stim[16] = 13'h0691;
    stim[17] = 13'h1b21;
    stim[18] = 13'h158a;
    stim[19] = 13'h02e9;
    stim[20] = 13'h11d4;
    stim[21] = 13'h1af3;
    stim[22] = 13'h000c;
    stim[23] = 13'h197b;
    stim[24] = 13'h01e3;
    stim[25] = 13'h0a34;
    stim[26] = 13'h0958;
    stim[27] = 13'h13fc;
    stim[28] = 13'h1a85;
    stim[29] = 13'h012b;
    stim[30] = 13'h08a1;
    stim[31] = 13'h0c25;
    stim[32] = 13'h1cdc;
    stim[33] = 13'h147f;
    stim[34] = 13'h1765;
    stim[35] = 13'h19c4;
    stim[36] = 13'h088a;
    stim[37] = 13'h1208;
    stim[38] = 13'h0a3f;
    stim[39] = 13'h08cb;
    stim[40] = 13'h1e91;
    stim[41] = 13'h1295;
    stim[42] = 13'h08fc;
    stim[43] = 13'h04b6;
    stim[44] = 13'h1838;
    stim[45] = 13'h0a20;
    stim[46] = 13'h0e23;
    stim[47] = 13'h1a69;
    stim[48] = 13'h13a4;
    stim[49] = 13'h032c;
    stim[50] = 13'h143e;
    stim[51] = 13'h15ca;
    stim[52] = 13'h02a2;
    stim[53] = 13'h0410;
    stim[54] = 13'h16a1;
    stim[55] = 13'h1775;
    stim[56] = 13'h1ac6;
    stim[57] = 13'h128b;
    stim[58] = 13'h18c6;
    stim[59] = 13'h1774;
    stim[60] = 13'h128b;
    stim[61] = 13'h1018;
    stim[62] = 13'h0e23;
    stim[63] = 13'h046c;
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
      expv[0] = 8'h78;
      expv[1] = 8'hf4;
      expv[2] = 8'hf3;
      expv[3] = 8'hf3;
      expv[4] = 8'hf8;
      expv[5] = 8'hf6;
      expv[6] = 8'hf8;
      expv[7] = 8'h7f;
      expv[8] = 8'h5e;
      expv[9] = 8'h7b;
      expv[10] = 8'hf5;
      expv[11] = 8'h73;
      expv[12] = 8'h5d;
      expv[13] = 8'h62;
      expv[14] = 8'heb;
      expv[15] = 8'he0;
      expv[16] = 8'h6a;
      expv[17] = 8'hf6;
      expv[18] = 8'he6;
      expv[19] = 8'h57;
      expv[20] = 8'hcd;
      expv[21] = 8'hf5;
      expv[22] = 8'h06;
      expv[23] = 8'hf2;
      expv[24] = 8'h4e;
      expv[25] = 8'h74;
      expv[26] = 8'h72;
      expv[27] = 8'hdf;
      expv[28] = 8'hf5;
      expv[29] = 8'h42;
      expv[30] = 8'h71;
      expv[31] = 8'h78;
      expv[32] = 8'hf9;
      expv[33] = 8'he1;
      expv[34] = 8'hed;
      expv[35] = 8'hf3;
      expv[36] = 8'h71;
      expv[37] = 8'hd0;
      expv[38] = 8'h74;
      expv[39] = 8'h71;
      expv[40] = 8'hfd;
      expv[41] = 8'hd4;
      expv[42] = 8'h71;
      expv[43] = 8'h62;
      expv[44] = 8'hf0;
      expv[45] = 8'h74;
      expv[46] = 8'h7c;
      expv[47] = 8'hf4;
      expv[48] = 8'hdd;
      expv[49] = 8'h59;
      expv[50] = 8'he0;
      expv[51] = 8'he7;
      expv[52] = 8'h55;
      expv[53] = 8'h60;
      expv[54] = 8'hea;
      expv[55] = 8'hed;
      expv[56] = 8'hf5;
      expv[57] = 8'hd4;
      expv[58] = 8'hf1;
      expv[59] = 8'hed;
      expv[60] = 8'hd4;
      expv[61] = 8'h8c;
      expv[62] = 8'h7c;
      expv[63] = 8'h61;
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
