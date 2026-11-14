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

  dut dut (
    .d(in_vec[12:12]),
    .done_counting(in_vec[11:11]),
    .ack(in_vec[10:10]),
    .state(in_vec[9:0]),
    .B3_next(out_vec[7:7]),
    .S_next(out_vec[6:6]),
    .S1_next(out_vec[5:5]),
    .Count_next(out_vec[4:4]),
    .Wait_next(out_vec[3:3]),
    .done(out_vec[2:2]),
    .counting(out_vec[1:1]),
    .shift_ena(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 13'h021a;
    stim[1] = 13'h17c3;
    stim[2] = 13'h01df;
    stim[3] = 13'h146d;
    stim[4] = 13'h1d6f;
    stim[5] = 13'h0b33;
    stim[6] = 13'h18ed;
    stim[7] = 13'h056a;
    stim[8] = 13'h1680;
    stim[9] = 13'h1082;
    stim[10] = 13'h0dcc;
    stim[11] = 13'h0f96;
    stim[12] = 13'h1349;
    stim[13] = 13'h14e8;
    stim[14] = 13'h1032;
    stim[15] = 13'h1a3f;
    stim[16] = 13'h11a7;
    stim[17] = 13'h1472;
    stim[18] = 13'h1de3;
    stim[19] = 13'h1134;
    stim[20] = 13'h15af;
    stim[21] = 13'h1df6;
    stim[22] = 13'h06cb;
    stim[23] = 13'h0213;
    stim[24] = 13'h1696;
    stim[25] = 13'h0afe;
    stim[26] = 13'h02f6;
    stim[27] = 13'h13ae;
    stim[28] = 13'h0b2d;
    stim[29] = 13'h1c70;
    stim[30] = 13'h0eb2;
    stim[31] = 13'h122a;
    stim[32] = 13'h1b71;
    stim[33] = 13'h079c;
    stim[34] = 13'h0e7d;
    stim[35] = 13'h0846;
    stim[36] = 13'h0781;
    stim[37] = 13'h08d0;
    stim[38] = 13'h03a7;
    stim[39] = 13'h1995;
    stim[40] = 13'h12a8;
    stim[41] = 13'h0026;
    stim[42] = 13'h1cd2;
    stim[43] = 13'h169f;
    stim[44] = 13'h0279;
    stim[45] = 13'h1c1d;
    stim[46] = 13'h0973;
    stim[47] = 13'h0e3e;
    stim[48] = 13'h085d;
    stim[49] = 13'h0d11;
    stim[50] = 13'h07e0;
    stim[51] = 13'h1a30;
    stim[52] = 13'h0ca9;
    stim[53] = 13'h1bbd;
    stim[54] = 13'h0c57;
    stim[55] = 13'h0cf1;
    stim[56] = 13'h0966;
    stim[57] = 13'h1cec;
    stim[58] = 13'h13bb;
    stim[59] = 13'h030c;
    stim[60] = 13'h075a;
    stim[61] = 13'h129b;
    stim[62] = 13'h09e1;
    stim[63] = 13'h14c5;
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
      expv[0] = 8'h4d;
      expv[1] = 8'hb7;
      expv[2] = 8'hd3;
      expv[3] = 8'ha1;
      expv[4] = 8'hab;
      expv[5] = 8'h4f;
      expv[6] = 8'hb1;
      expv[7] = 8'hd3;
      expv[8] = 8'h15;
      expv[9] = 8'h11;
      expv[10] = 8'hdb;
      expv[11] = 8'h5f;
      expv[12] = 8'hbf;
      expv[13] = 8'h91;
      expv[14] = 8'h01;
      expv[15] = 8'h2d;
      expv[16] = 8'h33;
      expv[17] = 8'h81;
      expv[18] = 8'hbb;
      expv[19] = 8'h13;
      expv[20] = 8'h33;
      expv[21] = 8'h9b;
      expv[22] = 8'hd5;
      expv[23] = 8'h4d;
      expv[24] = 8'h15;
      expv[25] = 8'hdd;
      expv[26] = 8'hdd;
      expv[27] = 8'h1f;
      expv[28] = 8'h4f;
      expv[29] = 8'h81;
      expv[30] = 8'h55;
      expv[31] = 8'h0d;
      expv[32] = 8'haf;
      expv[33] = 8'h57;
      expv[34] = 8'hc5;
      expv[35] = 8'hc1;
      expv[36] = 8'h57;
      expv[37] = 8'h91;
      expv[38] = 8'h5f;
      expv[39] = 8'h3b;
      expv[40] = 8'h1d;
      expv[41] = 8'h41;
      expv[42] = 8'h91;
      expv[43] = 8'h35;
      expv[44] = 8'hcd;
      expv[45] = 8'h21;
      expv[46] = 8'hcb;
      expv[47] = 8'h45;
      expv[48] = 8'hc1;
      expv[49] = 8'h4b;
      expv[50] = 8'h97;
      expv[51] = 8'h0d;
      expv[52] = 8'h51;
      expv[53] = 8'h3f;
      expv[54] = 8'hc1;
      expv[55] = 8'hd1;
      expv[56] = 8'hcb;
      expv[57] = 8'h91;
      expv[58] = 8'h3f;
      expv[59] = 8'h5e;
      expv[60] = 8'hd7;
      expv[61] = 8'h3d;
      expv[62] = 8'hdb;
      expv[63] = 8'hb1;
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
