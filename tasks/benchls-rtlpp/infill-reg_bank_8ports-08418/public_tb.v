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

  rtlpp_08418 dut (
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
    stim[0] = 17'h044ac;
    stim[1] = 17'h06731;
    stim[2] = 17'h185c7;
    stim[3] = 17'h1a2cb;
    stim[4] = 17'h1989b;
    stim[5] = 17'h17d98;
    stim[6] = 17'h12ebd;
    stim[7] = 17'h1bf1d;
    stim[8] = 17'h123d8;
    stim[9] = 17'h1fca6;
    stim[10] = 17'h15f36;
    stim[11] = 17'h1be10;
    stim[12] = 17'h17516;
    stim[13] = 17'h1f210;
    stim[14] = 17'h11633;
    stim[15] = 17'h1688e;
    stim[16] = 17'h1a89c;
    stim[17] = 17'h14513;
    stim[18] = 17'h11327;
    stim[19] = 17'h1e171;
    stim[20] = 17'h1b171;
    stim[21] = 17'h1a4cc;
    stim[22] = 17'h179c1;
    stim[23] = 17'h1c213;
    stim[24] = 17'h154dc;
    stim[25] = 17'h11dd4;
    stim[26] = 17'h12863;
    stim[27] = 17'h15c19;
    stim[28] = 17'h10e21;
    stim[29] = 17'h18b48;
    stim[30] = 17'h1fc89;
    stim[31] = 17'h107b3;
    stim[32] = 17'h1d310;
    stim[33] = 17'h12d15;
    stim[34] = 17'h14ce4;
    stim[35] = 17'h18a7d;
    stim[36] = 17'h186fd;
    stim[37] = 17'h1b755;
    stim[38] = 17'h1051c;
    stim[39] = 17'h06f34;
    stim[40] = 17'h18fb2;
    stim[41] = 17'h14e5f;
    stim[42] = 17'h154be;
    stim[43] = 17'h18ca8;
    stim[44] = 17'h1b2f8;
    stim[45] = 17'h11cc9;
    stim[46] = 17'h11802;
    stim[47] = 17'h1e7a8;
    stim[48] = 17'h1e0d6;
    stim[49] = 17'h17403;
    stim[50] = 17'h102ad;
    stim[51] = 17'h164d9;
    stim[52] = 17'h1371d;
    stim[53] = 17'h15c71;
    stim[54] = 17'h13a39;
    stim[55] = 17'h15544;
    stim[56] = 17'h12750;
    stim[57] = 17'h14651;
    stim[58] = 17'h1a9c9;
    stim[59] = 17'h1e81a;
    stim[60] = 17'h12830;
    stim[61] = 17'h19869;
    stim[62] = 17'h16aa1;
    stim[63] = 17'h18966;
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
      expv[0] = 8'h01;
      expv[1] = 8'h0f;
      expv[2] = 8'h06;
      expv[3] = 8'hff;
      expv[4] = 8'hc0;
      expv[5] = 8'hb0;
      expv[6] = 8'h1f;
      expv[7] = 8'h3d;
      expv[8] = 8'h0c;
      expv[9] = 8'h7e;
      expv[10] = 8'h1e;
      expv[11] = 8'h3c;
      expv[12] = 8'h20;
      expv[13] = 8'h7c;
      expv[14] = 8'h03;
      expv[15] = 8'h81;
      expv[16] = 8'hfd;
      expv[17] = 8'h80;
      expv[18] = 8'hce;
      expv[19] = 8'hf3;
      expv[20] = 8'h33;
      expv[21] = 8'h07;
      expv[22] = 8'hb7;
      expv[23] = 8'h7c;
      expv[24] = 8'h85;
      expv[25] = 8'hd4;
      expv[26] = 8'h00;
      expv[27] = 8'h9c;
      expv[28] = 8'h1f;
      expv[29] = 8'h08;
      expv[30] = 8'h7f;
      expv[31] = 8'h0f;
      expv[32] = 8'hcc;
      expv[33] = 8'h10;
      expv[34] = 8'h1e;
      expv[35] = 8'h03;
      expv[36] = 8'h07;
      expv[37] = 8'h28;
      expv[38] = 8'h01;
      expv[39] = 8'h1e;
      expv[40] = 8'h1f;
      expv[41] = 8'h99;
      expv[42] = 8'h83;
      expv[43] = 8'hff;
      expv[44] = 8'hff;
      expv[45] = 8'hdf;
      expv[46] = 8'h00;
      expv[47] = 8'h6f;
      expv[48] = 8'hfc;
      expv[49] = 8'h20;
      expv[50] = 8'hff;
      expv[51] = 8'h04;
      expv[52] = 8'h2d;
      expv[53] = 8'h1b;
      expv[54] = 8'h3f;
      expv[55] = 8'h00;
      expv[56] = 8'h08;
      expv[57] = 8'h00;
      expv[58] = 8'h07;
      expv[59] = 8'h7c;
      expv[60] = 8'h03;
      expv[61] = 8'hc0;
      expv[62] = 8'h00;
      expv[63] = 8'h00;
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
