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

  rtlpp_11223 dut (
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
    stim[0] = 21'h1e85f0;
    stim[1] = 21'h1aee36;
    stim[2] = 21'h134fbc;
    stim[3] = 21'h077bce;
    stim[4] = 21'h0ac710;
    stim[5] = 21'h05b115;
    stim[6] = 21'h07469a;
    stim[7] = 21'h0fb039;
    stim[8] = 21'h03a8f2;
    stim[9] = 21'h0b5a32;
    stim[10] = 21'h07ad57;
    stim[11] = 21'h0b5590;
    stim[12] = 21'h01a72c;
    stim[13] = 21'h0700c1;
    stim[14] = 21'h05721c;
    stim[15] = 21'h0f3288;
    stim[16] = 21'h04da01;
    stim[17] = 21'h097814;
    stim[18] = 21'h018bec;
    stim[19] = 21'h0acf65;
    stim[20] = 21'h0f29e1;
    stim[21] = 21'h08d1ad;
    stim[22] = 21'h0edf35;
    stim[23] = 21'h0c5da1;
    stim[24] = 21'h080a85;
    stim[25] = 21'h0dbb14;
    stim[26] = 21'h005dcb;
    stim[27] = 21'h040817;
    stim[28] = 21'h1ce29e;
    stim[29] = 21'h05fb93;
    stim[30] = 21'h0c89d0;
    stim[31] = 21'h064c4e;
    stim[32] = 21'h04b619;
    stim[33] = 21'h05237a;
    stim[34] = 21'h00276a;
    stim[35] = 21'h091c5c;
    stim[36] = 21'h0ba3db;
    stim[37] = 21'h0bac3d;
    stim[38] = 21'h0285ca;
    stim[39] = 21'h03e804;
    stim[40] = 21'h01e762;
    stim[41] = 21'h0ffee2;
    stim[42] = 21'h0f0128;
    stim[43] = 21'h04997f;
    stim[44] = 21'h0bc86e;
    stim[45] = 21'h09f0d8;
    stim[46] = 21'h0ab627;
    stim[47] = 21'h042822;
    stim[48] = 21'h065e57;
    stim[49] = 21'h0edf05;
    stim[50] = 21'h00aed3;
    stim[51] = 21'h00be51;
    stim[52] = 21'h05c280;
    stim[53] = 21'h000a76;
    stim[54] = 21'h017005;
    stim[55] = 21'h0bbd32;
    stim[56] = 21'h087e72;
    stim[57] = 21'h0f9946;
    stim[58] = 21'h07b935;
    stim[59] = 21'h0fa78a;
    stim[60] = 21'h03462f;
    stim[61] = 21'h084e0f;
    stim[62] = 21'h03fbc3;
    stim[63] = 21'h0daec3;
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
      expv[3] = 53'hxxxxxxxxx00800;
      expv[4] = 53'hxxxxxxxxx00a00;
      expv[5] = 53'hxxxxxxxxx00a00;
      expv[6] = 53'hxxxxxxxxx2b000;
      expv[7] = 53'hxxxxxxxxx2a200;
      expv[8] = 53'hxxxxxxxxx2a200;
      expv[9] = 53'hxxxxxxxxxe5000;
      expv[10] = 53'hxxxxxxxxxe4dad;
      expv[11] = 53'hxxxxxxxxxe59ad;
      expv[12] = 53'hxxxxxxxxxe4dab;
      expv[13] = 53'hxxxxxxxxxe51ab;
      expv[14] = 53'hxxxxxxxxxe43aa;
      expv[15] = 53'hxxxxxxxxxe43aa;
      expv[16] = 53'hxxxxxxxxx111aa;
      expv[17] = 53'hxxxxxxxxx103aa;
      expv[18] = 53'hxxxxxxxxx10baa;
      expv[19] = 53'hxxxxxxxxxd99aa;
      expv[20] = 53'hxxxxxxxxxd8d67;
      expv[21] = 53'hxxxxxxxxxd9967;
      expv[22] = 53'hxxxxxxxxxd8c69;
      expv[23] = 53'hxxxxxxxxxd9869;
      expv[24] = 53'hxxxxxxxxxd842f;
      expv[25] = 53'hxxxxxxxxxd982f;
      expv[26] = 53'hxxxxxxxxxd8cdd;
      expv[27] = 53'hxxxxxxxxxd90dd;
      expv[28] = 53'hxxxxxxxxx00000;
      expv[29] = 53'hxxxxxxxxx00800;
      expv[30] = 53'hxxxxxxxxx00a00;
      expv[31] = 53'hxxxxxxxxx00200;
      expv[32] = 53'hxxxxxxxxx9d000;
      expv[33] = 53'hxxxxxxxxx9ca00;
      expv[34] = 53'hxxxxxxxxx9ca00;
      expv[35] = 53'hxxxxxxxxxd5000;
      expv[36] = 53'hxxxxxxxxxd4c8f;
      expv[37] = 53'hxxxxxxxxxd508f;
      expv[38] = 53'hxxxxxxxxxd4dd7;
      expv[39] = 53'hxxxxxxxxxd51d7;
      expv[40] = 53'hxxxxxxxxxd49d6;
      expv[41] = 53'hxxxxxxxxxd41d6;
      expv[42] = 53'hxxxxxxxxxd4dff;
      expv[43] = 53'hxxxxxxxxxd59ff;
      expv[44] = 53'hxxxxxxxxxd43fe;
      expv[45] = 53'hxxxxxxxxxd43fe;
      expv[46] = 53'hxxxxxxxxxb11fe;
      expv[47] = 53'hxxxxxxxxxb055b;
      expv[48] = 53'hxxxxxxxxxb115b;
      expv[49] = 53'hxxxxxxxxxb0b5a;
      expv[50] = 53'hxxxxxxxxxb035a;
      expv[51] = 53'hxxxxxxxxxa715a;
      expv[52] = 53'hxxxxxxxxxa615a;
      expv[53] = 53'hxxxxxxxxxa635a;
      expv[54] = 53'hxxxxxxxxxa635a;
      expv[55] = 53'hxxxxxxxxx0b95a;
      expv[56] = 53'hxxxxxxxxx0a5df;
      expv[57] = 53'hxxxxxxxxx0b9df;
      expv[58] = 53'hxxxxxxxxx0adcd;
      expv[59] = 53'hxxxxxxxxx0b9cd;
      expv[60] = 53'hxxxxxxxxx0a5d3;
      expv[61] = 53'hxxxxxxxxx0b1d3;
      expv[62] = 53'hxxxxxxxxx0ac27;
      expv[63] = 53'hxxxxxxxxx0b027;
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
