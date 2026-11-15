// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 21;
  localparam OW = 53;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_05075 dut (
    .clk(clk),
    .rst(in_vec[20:20]),
    .i_cmd_write_stb(in_vec[19:19]),
    .i_cmd_read_stb(in_vec[18:18]),
    .i_cmd_data(in_vec[17:10]),
    .i_enable(in_vec[9:9]),
    .i_cmd_parameter(in_vec[8:8]),
    .i_data_in(in_vec[7:0]),
    .debug(out_vec[52:21]),
    .o_cmd_data(out_vec[20:13]),
    .o_cmd_finished(out_vec[12:12]),
    .o_cmd_mode(out_vec[11:11]),
    .o_write(out_vec[10:10]),
    .o_read(out_vec[9:9]),
    .o_data_out(out_vec[8:1]),
    .o_data_out_en(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 21'h1c8e15;
    stim[1] = 21'h1dc682;
    stim[2] = 21'h08071c;
    stim[3] = 21'h0d6ff4;
    stim[4] = 21'h06bd07;
    stim[5] = 21'h00bb7a;
    stim[6] = 21'h0f6121;
    stim[7] = 21'h0b76b3;
    stim[8] = 21'h0ce85a;
    stim[9] = 21'h0f6fd0;
    stim[10] = 21'h065f82;
    stim[11] = 21'h0aef42;
    stim[12] = 21'h0220f8;
    stim[13] = 21'h0883b5;
    stim[14] = 21'h00f7b1;
    stim[15] = 21'h0294cd;
    stim[16] = 21'h0c2153;
    stim[17] = 21'h06df38;
    stim[18] = 21'h09f932;
    stim[19] = 21'h06e7f1;
    stim[20] = 21'h0a3449;
    stim[21] = 21'h043f84;
    stim[22] = 21'h0f58c5;
    stim[23] = 21'h1bde8d;
    stim[24] = 21'h04d154;
    stim[25] = 21'h001fe1;
    stim[26] = 21'h066e3d;
    stim[27] = 21'h074979;
    stim[28] = 21'h062f62;
    stim[29] = 21'h050d1f;
    stim[30] = 21'h0dc712;
    stim[31] = 21'h00f55f;
    stim[32] = 21'h0f9210;
    stim[33] = 21'h09db85;
    stim[34] = 21'h02d4e3;
    stim[35] = 21'h0b52ec;
    stim[36] = 21'h10dd50;
    stim[37] = 21'h07f528;
    stim[38] = 21'h07d5ae;
    stim[39] = 21'h049841;
    stim[40] = 21'h01b9e2;
    stim[41] = 21'h01e14b;
    stim[42] = 21'h0680de;
    stim[43] = 21'h049cec;
    stim[44] = 21'h053fd0;
    stim[45] = 21'h0cd163;
    stim[46] = 21'h0a1341;
    stim[47] = 21'h0efdf4;
    stim[48] = 21'h0cc942;
    stim[49] = 21'h09b66f;
    stim[50] = 21'h0a6baa;
    stim[51] = 21'h09fc54;
    stim[52] = 21'h0968bd;
    stim[53] = 21'h0cc479;
    stim[54] = 21'h0f41c7;
    stim[55] = 21'h07a3f5;
    stim[56] = 21'h091946;
    stim[57] = 21'h055fdc;
    stim[58] = 21'h05eb34;
    stim[59] = 21'h02d13b;
    stim[60] = 21'h07ed76;
    stim[61] = 21'h009f82;
    stim[62] = 21'h0a4f5c;
    stim[63] = 21'h02a8c9;
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
      expv[0] = 53'hxxxxxxxxx00000;
      expv[1] = 53'hxxxxxxxxx00000;
      expv[2] = 53'hxxxxxxxxx00800;
      expv[3] = 53'hxxxxxxxxx00c03;
      expv[4] = 53'hxxxxxxxxx01803;
      expv[5] = 53'hxxxxxxxxx00a02;
      expv[6] = 53'hxxxxxxxxx00a02;
      expv[7] = 53'hxxxxxxxxx43002;
      expv[8] = 53'hxxxxxxxxx425bb;
      expv[9] = 53'hxxxxxxxxx439bb;
      expv[10] = 53'hxxxxxxxxx42db7;
      expv[11] = 53'hxxxxxxxxx439b7;
      expv[12] = 53'hxxxxxxxxx42577;
      expv[13] = 53'hxxxxxxxxx43977;
      expv[14] = 53'hxxxxxxxxx42c41;
      expv[15] = 53'hxxxxxxxxx43041;
      expv[16] = 53'hxxxxxxxxx42840;
      expv[17] = 53'hxxxxxxxxx42c11;
      expv[18] = 53'hxxxxxxxxx43811;
      expv[19] = 53'hxxxxxxxxx42cfd;
      expv[20] = 53'hxxxxxxxxx430fd;
      expv[21] = 53'hxxxxxxxxx42d1b;
      expv[22] = 53'hxxxxxxxxx4311b;
      expv[23] = 53'hxxxxxxxxx00000;
      expv[24] = 53'hxxxxxxxxx00800;
      expv[25] = 53'hxxxxxxxxx00a00;
      expv[26] = 53'hxxxxxxxxx00200;
      expv[27] = 53'hxxxxxxxxx7b800;
      expv[28] = 53'hxxxxxxxxx7aa00;
      expv[29] = 53'hxxxxxxxxx7aa00;
      expv[30] = 53'hxxxxxxxxx3f800;
      expv[31] = 53'hxxxxxxxxx3ece3;
      expv[32] = 53'hxxxxxxxxx3f0e3;
      expv[33] = 53'hxxxxxxxxx3edc9;
      expv[34] = 53'hxxxxxxxxx3f1c9;
      expv[35] = 53'hxxxxxxxxx3e1c8;
      expv[36] = 53'hxxxxxxxxx00800;
      expv[37] = 53'hxxxxxxxxx00800;
      expv[38] = 53'hxxxxxxxxx00a00;
      expv[39] = 53'hxxxxxxxxx00200;
      expv[40] = 53'hxxxxxxxxx83800;
      expv[41] = 53'hxxxxxxxxx82800;
      expv[42] = 53'hxxxxxxxxx82000;
      expv[43] = 53'hxxxxxxxxx82200;
      expv[44] = 53'hxxxxxxxxx82a00;
      expv[45] = 53'hxxxxxxxxxa1800;
      expv[46] = 53'hxxxxxxxxxa0c69;
      expv[47] = 53'hxxxxxxxxxa1869;
      expv[48] = 53'hxxxxxxxxxa0d7f;
      expv[49] = 53'hxxxxxxxxxa117f;
      expv[50] = 53'hxxxxxxxxxa0cdb;
      expv[51] = 53'hxxxxxxxxxa10db;
      expv[52] = 53'hxxxxxxxxxa04ff;
      expv[53] = 53'hxxxxxxxxxa10ff;
      expv[54] = 53'hxxxxxxxxxa0c63;
      expv[55] = 53'hxxxxxxxxxa1863;
      expv[56] = 53'hxxxxxxxxxa0a62;
      expv[57] = 53'hxxxxxxxxxa0a62;
      expv[58] = 53'hxxxxxxxxxb9862;
      expv[59] = 53'hxxxxxxxxxb8a62;
      expv[60] = 53'hxxxxxxxxxb8a62;
      expv[61] = 53'hxxxxxxxxxed862;
      expv[62] = 53'hxxxxxxxxxec862;
      expv[63] = 53'hxxxxxxxxxec527;
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
