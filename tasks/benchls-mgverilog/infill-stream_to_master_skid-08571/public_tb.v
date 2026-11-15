// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 22;
  localparam OW = 20;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_08571 dut (
    .clk(clk),
    .reset(in_vec[21:21]),
    .stream_data(in_vec[20:5]),
    .stream_startofpacket(in_vec[4:4]),
    .stream_endofpacket(in_vec[3:3]),
    .stream_empty(in_vec[2:2]),
    .stream_valid(in_vec[1:1]),
    .master_waitrequest(in_vec[0:0]),
    .stream_ready(out_vec[19:19]),
    .master_write(out_vec[18:18]),
    .master_writedata(out_vec[17:2]),
    .inc_address(out_vec[1:1]),
    .reset_address(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 22'h3d0723;
    stim[1] = 22'h21e614;
    stim[2] = 22'h12bba6;
    stim[3] = 22'h1c609e;
    stim[4] = 22'h0c8778;
    stim[5] = 22'h17e364;
    stim[6] = 22'h1bbe4e;
    stim[7] = 22'h196388;
    stim[8] = 22'h17914d;
    stim[9] = 22'h124985;
    stim[10] = 22'h0d2801;
    stim[11] = 22'h0679c3;
    stim[12] = 22'h08b6e0;
    stim[13] = 22'h137edf;
    stim[14] = 22'h11955d;
    stim[15] = 22'h18f426;
    stim[16] = 22'h0f199b;
    stim[17] = 22'h091d17;
    stim[18] = 22'h1dff6b;
    stim[19] = 22'h00b234;
    stim[20] = 22'h03ca54;
    stim[21] = 22'h0ce565;
    stim[22] = 22'h0183c0;
    stim[23] = 22'h042f18;
    stim[24] = 22'h035629;
    stim[25] = 22'h158221;
    stim[26] = 22'h0339fd;
    stim[27] = 22'h1f3bec;
    stim[28] = 22'h0aa30f;
    stim[29] = 22'h1e99a0;
    stim[30] = 22'h11eab3;
    stim[31] = 22'h157f90;
    stim[32] = 22'h0db21c;
    stim[33] = 22'h0a8f71;
    stim[34] = 22'h0164ae;
    stim[35] = 22'h0a1f52;
    stim[36] = 22'h19706c;
    stim[37] = 22'h030772;
    stim[38] = 22'h05f8bf;
    stim[39] = 22'h138175;
    stim[40] = 22'h0e737a;
    stim[41] = 22'h06b547;
    stim[42] = 22'h16da0f;
    stim[43] = 22'h104781;
    stim[44] = 22'h070aaf;
    stim[45] = 22'h17ed8c;
    stim[46] = 22'h13c955;
    stim[47] = 22'h021478;
    stim[48] = 22'h03dbc1;
    stim[49] = 22'h1e4c58;
    stim[50] = 22'h16956f;
    stim[51] = 22'h157f7e;
    stim[52] = 22'h0465b8;
    stim[53] = 22'h02f6ee;
    stim[54] = 22'h070f75;
    stim[55] = 22'h09f7ad;
    stim[56] = 22'h0cad23;
    stim[57] = 22'h082c80;
    stim[58] = 22'h0a2c57;
    stim[59] = 22'h1c5470;
    stim[60] = 22'h023919;
    stim[61] = 22'h18a88f;
    stim[62] = 22'h1c61f3;
    stim[63] = 22'h0e2158;
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
      expv[1] = 20'hxxxxx;
      expv[2] = 20'h80002;
      expv[3] = 20'he5777;
      expv[4] = 20'hf8c10;
      expv[5] = 20'h990ec;
      expv[6] = 20'hafc6e;
      expv[7] = 20'hf77c8;
      expv[8] = 20'hb2c70;
      expv[9] = 20'haf228;
      expv[10] = 20'ha4930;
      expv[11] = 20'h9a502;
      expv[12] = 20'hccf38;
      expv[13] = 20'h916df;
      expv[14] = 20'h66fd8;
      expv[15] = 20'he6fda;
      expv[16] = 20'h71e84;
      expv[17] = 20'h71e84;
      expv[18] = 20'h71e84;
      expv[19] = 20'hf1e84;
      expv[20] = 20'h81644;
      expv[21] = 20'h87948;
      expv[22] = 20'h99cac;
      expv[23] = 20'h83078;
      expv[24] = 20'h885e0;
      expv[25] = 20'h86ac4;
      expv[26] = 20'hab044;
      expv[27] = 20'h8673c;
      expv[28] = 20'hbe77e;
      expv[29] = 20'hd5460;
      expv[30] = 20'hbd337;
      expv[31] = 20'he3d54;
      expv[32] = 20'haaff0;
      expv[33] = 20'h9b640;
      expv[34] = 20'h951ee;
      expv[35] = 20'hc2c97;
      expv[36] = 20'hd43e8;
      expv[37] = 20'hb2e0f;
      expv[38] = 20'h460ec;
      expv[39] = 20'h460ec;
      expv[40] = 20'hc60ef;
      expv[41] = 20'h5ce6c;
      expv[42] = 20'h5ce6c;
      expv[43] = 20'h5ce6c;
      expv[44] = 20'h5ce6c;
      expv[45] = 20'hdce6c;
      expv[46] = 20'hafdb0;
      expv[47] = 20'ha7928;
      expv[48] = 20'h8428c;
      expv[49] = 20'h87b78;
      expv[50] = 20'hbc98a;
      expv[51] = 20'hed2af;
      expv[52] = 20'heafec;
      expv[53] = 20'h88cb6;
      expv[54] = 20'h45edc;
      expv[55] = 20'h45edc;
      expv[56] = 20'h45edc;
      expv[57] = 20'hc5edc;
      expv[58] = 20'h90593;
      expv[59] = 20'hd4588;
      expv[60] = 20'hb8a8c;
      expv[61] = 20'h84722;
      expv[62] = 20'h71510;
      expv[63] = 20'hf1510;
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
