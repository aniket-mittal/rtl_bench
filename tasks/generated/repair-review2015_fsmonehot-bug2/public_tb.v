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
    stim[0] = 13'h01e1;
    stim[1] = 13'h08a1;
    stim[2] = 13'h01eb;
    stim[3] = 13'h072e;
    stim[4] = 13'h1e87;
    stim[5] = 13'h15eb;
    stim[6] = 13'h1597;
    stim[7] = 13'h1886;
    stim[8] = 13'h1c14;
    stim[9] = 13'h155f;
    stim[10] = 13'h1913;
    stim[11] = 13'h1aed;
    stim[12] = 13'h1803;
    stim[13] = 13'h1ceb;
    stim[14] = 13'h10a5;
    stim[15] = 13'h1080;
    stim[16] = 13'h14bd;
    stim[17] = 13'h1ed8;
    stim[18] = 13'h0591;
    stim[19] = 13'h1779;
    stim[20] = 13'h1c36;
    stim[21] = 13'h0a7e;
    stim[22] = 13'h05cf;
    stim[23] = 13'h19c3;
    stim[24] = 13'h0858;
    stim[25] = 13'h0647;
    stim[26] = 13'h0130;
    stim[27] = 13'h1c6c;
    stim[28] = 13'h14f6;
    stim[29] = 13'h080a;
    stim[30] = 13'h125d;
    stim[31] = 13'h07e8;
    stim[32] = 13'h0ed2;
    stim[33] = 13'h1b45;
    stim[34] = 13'h0636;
    stim[35] = 13'h1825;
    stim[36] = 13'h1de8;
    stim[37] = 13'h015f;
    stim[38] = 13'h0b31;
    stim[39] = 13'h0404;
    stim[40] = 13'h11a2;
    stim[41] = 13'h12c3;
    stim[42] = 13'h0212;
    stim[43] = 13'h13e3;
    stim[44] = 13'h1706;
    stim[45] = 13'h15fc;
    stim[46] = 13'h0d13;
    stim[47] = 13'h0014;
    stim[48] = 13'h0aa8;
    stim[49] = 13'h041b;
    stim[50] = 13'h1abd;
    stim[51] = 13'h1f4c;
    stim[52] = 13'h02f0;
    stim[53] = 13'h1d05;
    stim[54] = 13'h0ec6;
    stim[55] = 13'h0dc5;
    stim[56] = 13'h1752;
    stim[57] = 13'h0c24;
    stim[58] = 13'h1ca4;
    stim[59] = 13'h1f8c;
    stim[60] = 13'h002c;
    stim[61] = 13'h0339;
    stim[62] = 13'h062d;
    stim[63] = 13'h1c9f;
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
      expv[0] = 8'hd2;
      expv[1] = 8'h50;
      expv[2] = 8'hd2;
      expv[3] = 8'h56;
      expv[4] = 8'h74;
      expv[5] = 8'hb2;
      expv[6] = 8'h32;
      expv[7] = 8'h10;
      expv[8] = 8'h00;
      expv[9] = 8'hb2;
      expv[10] = 8'h2a;
      expv[11] = 8'hbc;
      expv[12] = 8'h20;
      expv[13] = 8'hb0;
      expv[14] = 8'h30;
      expv[15] = 8'h10;
      expv[16] = 8'h30;
      expv[17] = 8'hd4;
      expv[18] = 8'h52;
      expv[19] = 8'hf6;
      expv[20] = 8'h00;
      expv[21] = 8'hcc;
      expv[22] = 8'hd2;
      expv[23] = 8'hba;
      expv[24] = 8'hc0;
      expv[25] = 8'hc4;
      expv[26] = 8'h12;
      expv[27] = 8'h80;
      expv[28] = 8'h91;
      expv[29] = 8'h40;
      expv[30] = 8'hac;
      expv[31] = 8'hd6;
      expv[32] = 8'hd4;
      expv[33] = 8'hae;
      expv[34] = 8'h44;
      expv[35] = 8'h20;
      expv[36] = 8'h9a;
      expv[37] = 8'hd2;
      expv[38] = 8'h4e;
      expv[39] = 8'h00;
      expv[40] = 8'h12;
      expv[41] = 8'hbc;
      expv[42] = 8'h4c;
      expv[43] = 8'hbe;
      expv[44] = 8'h56;
      expv[45] = 8'h93;
      expv[46] = 8'h4a;
      expv[47] = 8'h00;
      expv[48] = 8'h5c;
      expv[49] = 8'h40;
      expv[50] = 8'h3c;
      expv[51] = 8'hce;
      expv[52] = 8'h9d;
      expv[53] = 8'h2a;
      expv[54] = 8'hd4;
      expv[55] = 8'hda;
      expv[56] = 8'hd6;
      expv[57] = 8'h00;
      expv[58] = 8'h10;
      expv[59] = 8'h5e;
      expv[60] = 8'h40;
      expv[61] = 8'h5e;
      expv[62] = 8'h44;
      expv[63] = 8'h30;
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
