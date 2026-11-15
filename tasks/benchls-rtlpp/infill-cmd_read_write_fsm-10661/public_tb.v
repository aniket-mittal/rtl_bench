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

  rtlpp_10661 dut (
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
    stim[0] = 21'h1e4dac;
    stim[1] = 21'h134e03;
    stim[2] = 21'h06ffa4;
    stim[3] = 21'h09fe0f;
    stim[4] = 21'h07dfea;
    stim[5] = 21'h09aa8c;
    stim[6] = 21'h085cc5;
    stim[7] = 21'h00abc0;
    stim[8] = 21'h07aac6;
    stim[9] = 21'h093bd6;
    stim[10] = 21'h08fdcf;
    stim[11] = 21'h0abefe;
    stim[12] = 21'h00b498;
    stim[13] = 21'h0e527a;
    stim[14] = 21'h021749;
    stim[15] = 21'h0bcbb5;
    stim[16] = 21'h00abed;
    stim[17] = 21'h00bf7f;
    stim[18] = 21'h0d5d9c;
    stim[19] = 21'h0d5da8;
    stim[20] = 21'h01f718;
    stim[21] = 21'h01e5bd;
    stim[22] = 21'h0aa08d;
    stim[23] = 21'h05fbd2;
    stim[24] = 21'h070840;
    stim[25] = 21'h03b3bc;
    stim[26] = 21'h0a846d;
    stim[27] = 21'h0fbfaa;
    stim[28] = 21'h0a266d;
    stim[29] = 21'h0b35dd;
    stim[30] = 21'h0f1c60;
    stim[31] = 21'h095a2e;
    stim[32] = 21'h03b29d;
    stim[33] = 21'h006efe;
    stim[34] = 21'h0f2a77;
    stim[35] = 21'h06f0f4;
    stim[36] = 21'h05bfe6;
    stim[37] = 21'h0b834d;
    stim[38] = 21'h0bfc84;
    stim[39] = 21'h0b7640;
    stim[40] = 21'h06ca92;
    stim[41] = 21'h0c0d93;
    stim[42] = 21'h035205;
    stim[43] = 21'h0fa81d;
    stim[44] = 21'h099562;
    stim[45] = 21'h00a55f;
    stim[46] = 21'h04ee44;
    stim[47] = 21'h0f85a5;
    stim[48] = 21'h0d2ca7;
    stim[49] = 21'h0120d3;
    stim[50] = 21'h0563ae;
    stim[51] = 21'h09d57a;
    stim[52] = 21'h072df5;
    stim[53] = 21'h02dd49;
    stim[54] = 21'h07e241;
    stim[55] = 21'h0fecd0;
    stim[56] = 21'h07c1f4;
    stim[57] = 21'h0afbb0;
    stim[58] = 21'h086891;
    stim[59] = 21'h0010ef;
    stim[60] = 21'h03aa0e;
    stim[61] = 21'h0e52b5;
    stim[62] = 21'h0188ec;
    stim[63] = 21'h0b968e;
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
      expv[3] = 53'hxxxxxxxxx00200;
      expv[4] = 53'hxxxxxxxxx00a00;
      expv[5] = 53'hxxxxxxxxxd5000;
      expv[6] = 53'hxxxxxxxxxd44d5;
      expv[7] = 53'hxxxxxxxxxd58d5;
      expv[8] = 53'hxxxxxxxxxd40d4;
      expv[9] = 53'hxxxxxxxxxd4ad4;
      expv[10] = 53'hxxxxxxxxxd4ad4;
      expv[11] = 53'hxxxxxxxxx9f0d4;
      expv[12] = 53'hxxxxxxxxx9e55f;
      expv[13] = 53'hxxxxxxxxx9f15f;
      expv[14] = 53'hxxxxxxxxx9ed29;
      expv[15] = 53'hxxxxxxxxx9f929;
      expv[16] = 53'hxxxxxxxxx9ede5;
      expv[17] = 53'hxxxxxxxxx9f9e5;
      expv[18] = 53'hxxxxxxxxx9e9e4;
      expv[19] = 53'hxxxxxxxxx9ecaf;
      expv[20] = 53'hxxxxxxxxx9f8af;
      expv[21] = 53'hxxxxxxxxx9e8ae;
      expv[22] = 53'hxxxxxxxxx9e0ae;
      expv[23] = 53'hxxxxxxxxx9ed51;
      expv[24] = 53'hxxxxxxxxx9f151;
      expv[25] = 53'hxxxxxxxxx9eb50;
      expv[26] = 53'hxxxxxxxxx9e350;
      expv[27] = 53'hxxxxxxxxxdb950;
      expv[28] = 53'hxxxxxxxxxda5df;
      expv[29] = 53'hxxxxxxxxxdb9df;
      expv[30] = 53'hxxxxxxxxxda59b;
      expv[31] = 53'hxxxxxxxxxdb19b;
      expv[32] = 53'hxxxxxxxxxda4ad;
      expv[33] = 53'hxxxxxxxxxdb0ad;
      expv[34] = 53'hxxxxxxxxxda0ac;
      expv[35] = 53'hxxxxxxxxxda595;
      expv[36] = 53'hxxxxxxxxxdb995;
      expv[37] = 53'hxxxxxxxxxdab94;
      expv[38] = 53'hxxxxxxxxxda394;
      expv[39] = 53'hxxxxxxxxx09194;
      expv[40] = 53'hxxxxxxxxx085bb;
      expv[41] = 53'hxxxxxxxxx099bb;
      expv[42] = 53'hxxxxxxxxx08407;
      expv[43] = 53'hxxxxxxxxx09007;
      expv[44] = 53'hxxxxxxxxx08dd5;
      expv[45] = 53'hxxxxxxxxx099d5;
      expv[46] = 53'hxxxxxxxxx081d4;
      expv[47] = 53'hxxxxxxxxx08bd4;
      expv[48] = 53'hxxxxxxxxx083d4;
      expv[49] = 53'hxxxxxxxxx4f1d4;
      expv[50] = 53'hxxxxxxxxx4e9d4;
      expv[51] = 53'hxxxxxxxxx4ebd4;
      expv[52] = 53'hxxxxxxxxx4ebd4;
      expv[53] = 53'hxxxxxxxxxeb9d4;
      expv[54] = 53'hxxxxxxxxxea1d4;
      expv[55] = 53'hxxxxxxxxxea3d4;
      expv[56] = 53'hxxxxxxxxxeabd4;
      expv[57] = 53'hxxxxxxxxxe99d4;
      expv[58] = 53'hxxxxxxxxxe857d;
      expv[59] = 53'hxxxxxxxxxe917d;
      expv[60] = 53'hxxxxxxxxxe817c;
      expv[61] = 53'hxxxxxxxxxe817c;
      expv[62] = 53'hxxxxxxxxxe8529;
      expv[63] = 53'hxxxxxxxxxe9129;
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
