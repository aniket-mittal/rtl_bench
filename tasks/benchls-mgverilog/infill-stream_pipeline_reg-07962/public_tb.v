// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 21;
  localparam OW = 20;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_07962 dut (
    .clk(clk),
    .reset(in_vec[20:20]),
    .stream_in_data(in_vec[19:4]),
    .stream_in_startofpacket(in_vec[3:3]),
    .stream_in_endofpacket(in_vec[2:2]),
    .stream_in_valid(in_vec[1:1]),
    .stream_out_ready(in_vec[0:0]),
    .stream_in_ready(out_vec[19:19]),
    .stream_out_data(out_vec[18:3]),
    .stream_out_startofpacket(out_vec[2:2]),
    .stream_out_endofpacket(out_vec[1:1]),
    .stream_out_valid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 21'h1ab6b2;
    stim[1] = 21'h155b2d;
    stim[2] = 21'h0e2df5;
    stim[3] = 21'h027039;
    stim[4] = 21'h0d4954;
    stim[5] = 21'h0a2cd2;
    stim[6] = 21'h0f01d2;
    stim[7] = 21'h01197b;
    stim[8] = 21'h0039b7;
    stim[9] = 21'h0cb64d;
    stim[10] = 21'h05d900;
    stim[11] = 21'h050c66;
    stim[12] = 21'h07dddc;
    stim[13] = 21'h00e5e8;
    stim[14] = 21'h0aaaff;
    stim[15] = 21'h061729;
    stim[16] = 21'h05c3b7;
    stim[17] = 21'h06518d;
    stim[18] = 21'h0abfe9;
    stim[19] = 21'h05415e;
    stim[20] = 21'h04dfda;
    stim[21] = 21'h0e9d9e;
    stim[22] = 21'h002258;
    stim[23] = 21'h0fc848;
    stim[24] = 21'h085dcc;
    stim[25] = 21'h0eb3a3;
    stim[26] = 21'h0c0e09;
    stim[27] = 21'h00c79c;
    stim[28] = 21'h00ac31;
    stim[29] = 21'h0a8086;
    stim[30] = 21'h06407a;
    stim[31] = 21'h0c6403;
    stim[32] = 21'h02b6ab;
    stim[33] = 21'h0eaa93;
    stim[34] = 21'h086242;
    stim[35] = 21'h0e09af;
    stim[36] = 21'h088859;
    stim[37] = 21'h0f2c6a;
    stim[38] = 21'h0d50c3;
    stim[39] = 21'h0444b5;
    stim[40] = 21'h16247b;
    stim[41] = 21'h024200;
    stim[42] = 21'h0389b1;
    stim[43] = 21'h0e7913;
    stim[44] = 21'h0a689e;
    stim[45] = 21'h0f0ce3;
    stim[46] = 21'h0caea9;
    stim[47] = 21'h086fde;
    stim[48] = 21'h16bf93;
    stim[49] = 21'h0a9ddf;
    stim[50] = 21'h031135;
    stim[51] = 21'h0b670b;
    stim[52] = 21'h09f9a6;
    stim[53] = 21'h0300a8;
    stim[54] = 21'h02cb22;
    stim[55] = 21'h0e85f9;
    stim[56] = 21'h07e8ae;
    stim[57] = 21'h0136f4;
    stim[58] = 21'h03b571;
    stim[59] = 21'h05106e;
    stim[60] = 21'h037c75;
    stim[61] = 21'h091462;
    stim[62] = 21'h0bc695;
    stim[63] = 21'h0fc08f;
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
      expv[0] = 20'hxxxxx;
      expv[1] = 20'h80000;
      expv[2] = 20'h80000;
      expv[3] = 20'h80000;
      expv[4] = 20'h80000;
      expv[5] = 20'h80000;
      expv[6] = 20'h80000;
      expv[7] = 20'hd1669;
      expv[8] = 20'hf80eb;
      expv[9] = 20'h88cbd;
      expv[10] = 20'h88cbc;
      expv[11] = 20'h88cbc;
      expv[12] = 20'h01cdb;
      expv[13] = 20'h01cdb;
      expv[14] = 20'h81cdb;
      expv[15] = 20'ha8633;
      expv[16] = 20'ha8632;
      expv[17] = 20'hd557f;
      expv[18] = 20'hd557e;
      expv[19] = 20'hd557e;
      expv[20] = 20'h2e1db;
      expv[21] = 20'h2e1db;
      expv[22] = 20'h2e1db;
      expv[23] = 20'h2e1db;
      expv[24] = 20'h2e1db;
      expv[25] = 20'hae1db;
      expv[26] = 20'haa0af;
      expv[27] = 20'haa0ae;
      expv[28] = 20'haa0ae;
      expv[29] = 20'haa0ae;
      expv[30] = 20'h759d1;
      expv[31] = 20'hf59d1;
      expv[32] = 20'hd4043;
      expv[33] = 20'he3203;
      expv[34] = 20'h15b55;
      expv[35] = 20'h95b55;
      expv[36] = 20'hf554b;
      expv[37] = 20'hf554a;
      expv[38] = 20'hf04d7;
      expv[39] = 20'hf9635;
      expv[40] = 20'hf9634;
      expv[41] = 20'h80000;
      expv[42] = 20'h80000;
      expv[43] = 20'h80000;
      expv[44] = 20'h80000;
      expv[45] = 20'hf3c8b;
      expv[46] = 20'hd344f;
      expv[47] = 20'hd344e;
      expv[48] = 20'hf8673;
      expv[49] = 20'h80000;
      expv[50] = 20'h80002;
      expv[51] = 20'h80002;
      expv[52] = 20'h54eef;
      expv[53] = 20'h54eef;
      expv[54] = 20'h54eef;
      expv[55] = 20'hd4eef;
      expv[56] = 20'hd4eee;
      expv[57] = 20'h5b387;
      expv[58] = 20'hdb387;
      expv[59] = 20'hdb386;
      expv[60] = 20'hbf457;
      expv[61] = 20'hbf456;
      expv[62] = 20'ha8837;
      expv[63] = 20'ha8836;
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
