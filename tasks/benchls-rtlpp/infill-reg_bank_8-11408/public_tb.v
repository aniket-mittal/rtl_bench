// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_11408 dut (
    .CLK(clk),
    .RST_N(in_vec[16:16]),
    .write_0(in_vec[15:15]),
    .EN_write_0(in_vec[14:14]),
    .write_1(in_vec[13:13]),
    .EN_write_1(in_vec[12:12]),
    .write_2(in_vec[11:11]),
    .EN_write_2(in_vec[10:10]),
    .write_3(in_vec[9:9]),
    .EN_write_3(in_vec[8:8]),
    .write_4(in_vec[7:7]),
    .EN_write_4(in_vec[6:6]),
    .write_5(in_vec[5:5]),
    .EN_write_5(in_vec[4:4]),
    .write_6(in_vec[3:3]),
    .EN_write_6(in_vec[2:2]),
    .write_7(in_vec[1:1]),
    .EN_write_7(in_vec[0:0]),
    .read_0(out_vec[7:7]),
    .read_1(out_vec[6:6]),
    .read_2(out_vec[5:5]),
    .read_3(out_vec[4:4]),
    .read_4(out_vec[3:3]),
    .read_5(out_vec[2:2]),
    .read_6(out_vec[1:1]),
    .read_7(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h0d91c;
    stim[1] = 17'h02f18;
    stim[2] = 17'h1af20;
    stim[3] = 17'h10aef;
    stim[4] = 17'h176ec;
    stim[5] = 17'h14851;
    stim[6] = 17'h1a59f;
    stim[7] = 17'h10cde;
    stim[8] = 17'h11cd5;
    stim[9] = 17'h135c4;
    stim[10] = 17'h10287;
    stim[11] = 17'h17b45;
    stim[12] = 17'h13859;
    stim[13] = 17'h15cd7;
    stim[14] = 17'h1f84b;
    stim[15] = 17'h1e516;
    stim[16] = 17'h18a9b;
    stim[17] = 17'h1835a;
    stim[18] = 17'h1b83d;
    stim[19] = 17'h1dd3e;
    stim[20] = 17'h1a43b;
    stim[21] = 17'h12bea;
    stim[22] = 17'h15160;
    stim[23] = 17'h12c1c;
    stim[24] = 17'h1b66f;
    stim[25] = 17'h100e3;
    stim[26] = 17'h1d6b7;
    stim[27] = 17'h16356;
    stim[28] = 17'h17933;
    stim[29] = 17'h177ff;
    stim[30] = 17'h15731;
    stim[31] = 17'h1a07a;
    stim[32] = 17'h1a153;
    stim[33] = 17'h1a0b1;
    stim[34] = 17'h10ff8;
    stim[35] = 17'h13662;
    stim[36] = 17'h1e4ff;
    stim[37] = 17'h11071;
    stim[38] = 17'h1cb55;
    stim[39] = 17'h15450;
    stim[40] = 17'h1b839;
    stim[41] = 17'h1d074;
    stim[42] = 17'h1e91d;
    stim[43] = 17'h1f9f4;
    stim[44] = 17'h1ae46;
    stim[45] = 17'h17f57;
    stim[46] = 17'h19f47;
    stim[47] = 17'h1cf55;
    stim[48] = 17'h15475;
    stim[49] = 17'h19ef7;
    stim[50] = 17'h1e447;
    stim[51] = 17'h1ad9b;
    stim[52] = 17'h19c87;
    stim[53] = 17'h19e0d;
    stim[54] = 17'h1c7bc;
    stim[55] = 17'h1b187;
    stim[56] = 17'h176a0;
    stim[57] = 17'h1fa62;
    stim[58] = 17'h1a629;
    stim[59] = 17'h17b68;
    stim[60] = 17'h1dafa;
    stim[61] = 17'h12390;
    stim[62] = 17'h1a2ee;
    stim[63] = 17'h1d0fd;
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
      expv[0] = 8'h41;
      expv[1] = 8'h1c;
      expv[2] = 8'h1f;
      expv[3] = 8'hff;
      expv[4] = 8'ha7;
      expv[5] = 8'h80;
      expv[6] = 8'h01;
      expv[7] = 8'hfd;
      expv[8] = 8'hdc;
      expv[9] = 8'h26;
      expv[10] = 8'h00;
      expv[11] = 8'hb8;
      expv[12] = 8'h38;
      expv[13] = 8'h1c;
      expv[14] = 8'hf8;
      expv[15] = 8'he0;
      expv[16] = 8'h00;
      expv[17] = 8'hf8;
      expv[18] = 8'h3f;
      expv[19] = 8'h53;
      expv[20] = 8'he3;
      expv[21] = 8'hff;
      expv[22] = 8'h80;
      expv[23] = 8'h1d;
      expv[24] = 8'he1;
      expv[25] = 8'hff;
      expv[26] = 8'hc2;
      expv[27] = 8'h88;
      expv[28] = 8'h33;
      expv[29] = 8'haf;
      expv[30] = 8'h8f;
      expv[31] = 8'h03;
      expv[32] = 8'hf0;
      expv[33] = 8'hff;
      expv[34] = 8'h1f;
      expv[35] = 8'he0;
      expv[36] = 8'h67;
      expv[37] = 8'hc3;
      expv[38] = 8'h78;
      expv[39] = 8'h00;
      expv[40] = 8'h3f;
      expv[41] = 8'h42;
      expv[42] = 8'h71;
      expv[43] = 8'h76;
      expv[44] = 8'h18;
      expv[45] = 8'h38;
      expv[46] = 8'hd8;
      expv[47] = 8'hf8;
      expv[48] = 8'h02;
      expv[49] = 8'h1e;
      expv[50] = 8'he0;
      expv[51] = 8'hf0;
      expv[52] = 8'hde;
      expv[53] = 8'hdf;
      expv[54] = 8'h6f;
      expv[55] = 8'hf0;
      expv[56] = 8'ha0;
      expv[57] = 8'h78;
      expv[58] = 8'h00;
      expv[59] = 8'h38;
      expv[60] = 8'h47;
      expv[61] = 8'hfc;
      expv[62] = 8'h07;
      expv[63] = 8'hc7;
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
