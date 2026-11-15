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

  rtlpp_06563 dut (
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
    stim[0] = 17'h09556;
    stim[1] = 17'h09a43;
    stim[2] = 17'h1a4f3;
    stim[3] = 17'h1decc;
    stim[4] = 17'h15c00;
    stim[5] = 17'h12994;
    stim[6] = 17'h1d82a;
    stim[7] = 17'h12a5f;
    stim[8] = 17'h19775;
    stim[9] = 17'h1cf0c;
    stim[10] = 17'h1ee56;
    stim[11] = 17'h133ae;
    stim[12] = 17'h1dcfd;
    stim[13] = 17'h1a5cd;
    stim[14] = 17'h1d4da;
    stim[15] = 17'h19dac;
    stim[16] = 17'h1c6ec;
    stim[17] = 17'h16615;
    stim[18] = 17'h19e91;
    stim[19] = 17'h11d75;
    stim[20] = 17'h1331d;
    stim[21] = 17'h1a28f;
    stim[22] = 17'h10b39;
    stim[23] = 17'h1590f;
    stim[24] = 17'h1b856;
    stim[25] = 17'h1d9a4;
    stim[26] = 17'h1eb77;
    stim[27] = 17'h17155;
    stim[28] = 17'h12fef;
    stim[29] = 17'h1b637;
    stim[30] = 17'h1694a;
    stim[31] = 17'h19f32;
    stim[32] = 17'h1dcb3;
    stim[33] = 17'h191cd;
    stim[34] = 17'h05906;
    stim[35] = 17'h19dae;
    stim[36] = 17'h12d01;
    stim[37] = 17'h11b99;
    stim[38] = 17'h12c22;
    stim[39] = 17'h18826;
    stim[40] = 17'h1ae70;
    stim[41] = 17'h1de11;
    stim[42] = 17'h18aab;
    stim[43] = 17'h10e04;
    stim[44] = 17'h15319;
    stim[45] = 17'h1a536;
    stim[46] = 17'h16fc8;
    stim[47] = 17'h1f51e;
    stim[48] = 17'h1ea1a;
    stim[49] = 17'h1f4b0;
    stim[50] = 17'h0c2e9;
    stim[51] = 17'h1d95d;
    stim[52] = 17'h1083d;
    stim[53] = 17'h1a5f7;
    stim[54] = 17'h12517;
    stim[55] = 17'h11f94;
    stim[56] = 17'h138fa;
    stim[57] = 17'h184be;
    stim[58] = 17'h1d57b;
    stim[59] = 17'h1fca7;
    stim[60] = 17'h1feeb;
    stim[61] = 17'h1d36e;
    stim[62] = 17'h1de62;
    stim[63] = 17'h17fb1;
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
      expv[0] = 8'h00;
      expv[1] = 8'h00;
      expv[2] = 8'h07;
      expv[3] = 8'hdf;
      expv[4] = 8'h9f;
      expv[5] = 8'hf0;
      expv[6] = 8'h40;
      expv[7] = 8'h01;
      expv[8] = 8'hca;
      expv[9] = 8'h7f;
      expv[10] = 8'hf8;
      expv[11] = 8'h3f;
      expv[12] = 8'hdf;
      expv[13] = 8'h07;
      expv[14] = 8'h44;
      expv[15] = 8'h11;
      expv[16] = 8'he7;
      expv[17] = 8'h80;
      expv[18] = 8'h1c;
      expv[19] = 8'h12;
      expv[20] = 8'h3d;
      expv[21] = 8'h01;
      expv[22] = 8'hff;
      expv[23] = 8'h01;
      expv[24] = 8'hf8;
      expv[25] = 8'h40;
      expv[26] = 8'h7a;
      expv[27] = 8'hb0;
      expv[28] = 8'h1f;
      expv[29] = 8'he2;
      expv[30] = 8'h80;
      expv[31] = 8'h1f;
      expv[32] = 8'hdf;
      expv[33] = 8'hc7;
      expv[34] = 8'h00;
      expv[35] = 8'h11;
      expv[36] = 8'hf0;
      expv[37] = 8'h0c;
      expv[38] = 8'h1f;
      expv[39] = 8'hfe;
      expv[40] = 8'h1b;
      expv[41] = 8'hdc;
      expv[42] = 8'h00;
      expv[43] = 8'hfe;
      expv[44] = 8'h0c;
      expv[45] = 8'h02;
      expv[46] = 8'h1f;
      expv[47] = 8'he1;
      expv[48] = 8'hfc;
      expv[49] = 8'h63;
      expv[50] = 8'h7f;
      expv[51] = 8'h41;
      expv[52] = 8'h03;
      expv[53] = 8'h06;
      expv[54] = 8'he0;
      expv[55] = 8'hdc;
      expv[56] = 8'h3f;
      expv[57] = 8'he3;
      expv[58] = 8'hc3;
      expv[59] = 8'hfe;
      expv[60] = 8'hff;
      expv[61] = 8'hc9;
      expv[62] = 8'hd8;
      expv[63] = 8'h3f;
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
