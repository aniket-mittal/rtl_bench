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

  rtlpp_05050 dut (
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
    stim[0] = 21'h1feb92;
    stim[1] = 21'h1712cf;
    stim[2] = 21'h0e79d8;
    stim[3] = 21'h0e7710;
    stim[4] = 21'h0fd374;
    stim[5] = 21'h00a77e;
    stim[6] = 21'h0331d6;
    stim[7] = 21'h0ee570;
    stim[8] = 21'h007864;
    stim[9] = 21'h0019f5;
    stim[10] = 21'h081955;
    stim[11] = 21'h0b633e;
    stim[12] = 21'h0ae3ed;
    stim[13] = 21'h0f6431;
    stim[14] = 21'h077c98;
    stim[15] = 21'h09497b;
    stim[16] = 21'h0db8dc;
    stim[17] = 21'h11c0e6;
    stim[18] = 21'h031810;
    stim[19] = 21'h0f591a;
    stim[20] = 21'h0b3358;
    stim[21] = 21'h0d388b;
    stim[22] = 21'h046f0f;
    stim[23] = 21'h0f8cf8;
    stim[24] = 21'h0608cf;
    stim[25] = 21'h0df37a;
    stim[26] = 21'h091fbb;
    stim[27] = 21'h032997;
    stim[28] = 21'h07abfa;
    stim[29] = 21'h0ab16a;
    stim[30] = 21'h025c3b;
    stim[31] = 21'h024d74;
    stim[32] = 21'h0ed1c9;
    stim[33] = 21'h079889;
    stim[34] = 21'h01d059;
    stim[35] = 21'h180250;
    stim[36] = 21'h0835d9;
    stim[37] = 21'h0b71ff;
    stim[38] = 21'h05b18d;
    stim[39] = 21'h029f40;
    stim[40] = 21'h00f0ec;
    stim[41] = 21'h07b083;
    stim[42] = 21'h0a56f5;
    stim[43] = 21'h016a8b;
    stim[44] = 21'h0ddce0;
    stim[45] = 21'h0b919e;
    stim[46] = 21'h0047d4;
    stim[47] = 21'h0e0bf6;
    stim[48] = 21'h0fece5;
    stim[49] = 21'h06cefd;
    stim[50] = 21'h04c666;
    stim[51] = 21'h02cafa;
    stim[52] = 21'h0b4774;
    stim[53] = 21'h0e365b;
    stim[54] = 21'h067239;
    stim[55] = 21'h08f1f7;
    stim[56] = 21'h03f03a;
    stim[57] = 21'h0c2afe;
    stim[58] = 21'h00954c;
    stim[59] = 21'h0b0370;
    stim[60] = 21'h08e7ed;
    stim[61] = 21'h080775;
    stim[62] = 21'h018a22;
    stim[63] = 21'h045c85;
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
      expv[0] = 53'hxxxxxxxxx00800;
      expv[1] = 53'hxxxxxxxxx00000;
      expv[2] = 53'hxxxxxxxxx00800;
      expv[3] = 53'hxxxxxxxxx00d3d;
      expv[4] = 53'hxxxxxxxxx0193d;
      expv[5] = 53'hxxxxxxxxx00de9;
      expv[6] = 53'hxxxxxxxxx019e9;
      expv[7] = 53'hxxxxxxxxx009e8;
      expv[8] = 53'hxxxxxxxxx00573;
      expv[9] = 53'hxxxxxxxxx01973;
      expv[10] = 53'hxxxxxxxxx00972;
      expv[11] = 53'hxxxxxxxxx00c0d;
      expv[12] = 53'hxxxxxxxxx0180d;
      expv[13] = 53'hxxxxxxxxx00571;
      expv[14] = 53'hxxxxxxxxx01171;
      expv[15] = 53'hxxxxxxxxx00b70;
      expv[16] = 53'hxxxxxxxxx00370;
      expv[17] = 53'hxxxxxxxxx00000;
      expv[18] = 53'hxxxxxxxxx00000;
      expv[19] = 53'hxxxxxxxxx00800;
      expv[20] = 53'hxxxxxxxxx00dad;
      expv[21] = 53'hxxxxxxxxx011ad;
      expv[22] = 53'hxxxxxxxxx00c9d;
      expv[23] = 53'hxxxxxxxxx0109d;
      expv[24] = 53'hxxxxxxxxx005c7;
      expv[25] = 53'hxxxxxxxxx019c7;
      expv[26] = 53'hxxxxxxxxx00cf9;
      expv[27] = 53'hxxxxxxxxx018f9;
      expv[28] = 53'hxxxxxxxxx008f8;
      expv[29] = 53'hxxxxxxxxx00af8;
      expv[30] = 53'hxxxxxxxxx002f8;
      expv[31] = 53'hxxxxxxxxx778f8;
      expv[32] = 53'hxxxxxxxxx768f8;
      expv[33] = 53'hxxxxxxxxx76569;
      expv[34] = 53'hxxxxxxxxx77169;
      expv[35] = 53'hxxxxxxxxx00000;
      expv[36] = 53'hxxxxxxxxx00800;
      expv[37] = 53'hxxxxxxxxx00c1b;
      expv[38] = 53'hxxxxxxxxx0181b;
      expv[39] = 53'hxxxxxxxxx00a1a;
      expv[40] = 53'hxxxxxxxxx0021a;
      expv[41] = 53'hxxxxxxxxxd901a;
      expv[42] = 53'hxxxxxxxxxd821a;
      expv[43] = 53'hxxxxxxxxxd821a;
      expv[44] = 53'hxxxxxxxxx1701a;
      expv[45] = 53'hxxxxxxxxx16cef;
      expv[46] = 53'hxxxxxxxxx178ef;
      expv[47] = 53'hxxxxxxxxx168ee;
      expv[48] = 53'hxxxxxxxxx16505;
      expv[49] = 53'hxxxxxxxxx17105;
      expv[50] = 53'hxxxxxxxxx16304;
      expv[51] = 53'hxxxxxxxxx16304;
      expv[52] = 53'hxxxxxxxxxf5904;
      expv[53] = 53'hxxxxxxxxxf45a3;
      expv[54] = 53'hxxxxxxxxxf51a3;
      expv[55] = 53'hxxxxxxxxxf4ba2;
      expv[56] = 53'hxxxxxxxxxf43a2;
      expv[57] = 53'hxxxxxxxxx751a2;
      expv[58] = 53'hxxxxxxxxx74c15;
      expv[59] = 53'hxxxxxxxxx75815;
      expv[60] = 53'hxxxxxxxxx74d81;
      expv[61] = 53'hxxxxxxxxx75981;
      expv[62] = 53'hxxxxxxxxx74403;
      expv[63] = 53'hxxxxxxxxx75003;
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
