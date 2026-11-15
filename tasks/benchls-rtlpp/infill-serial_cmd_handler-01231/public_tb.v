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

  rtlpp_01231 dut (
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
    stim[0] = 21'h1f5329;
    stim[1] = 21'h1d340a;
    stim[2] = 21'h0b67e2;
    stim[3] = 21'h09fef1;
    stim[4] = 21'h09fc49;
    stim[5] = 21'h095d24;
    stim[6] = 21'h08a5ab;
    stim[7] = 21'h03afcb;
    stim[8] = 21'h0bf0e5;
    stim[9] = 21'h051307;
    stim[10] = 21'h0ad130;
    stim[11] = 21'h016eda;
    stim[12] = 21'h064f95;
    stim[13] = 21'h0a2c89;
    stim[14] = 21'h0aaf8b;
    stim[15] = 21'h0a7254;
    stim[16] = 21'h09b410;
    stim[17] = 21'h043789;
    stim[18] = 21'h023c9a;
    stim[19] = 21'h0fbee5;
    stim[20] = 21'h0dd714;
    stim[21] = 21'h099fb8;
    stim[22] = 21'h0d3265;
    stim[23] = 21'h08bf4d;
    stim[24] = 21'h08c764;
    stim[25] = 21'h10494a;
    stim[26] = 21'h0622c9;
    stim[27] = 21'h090eb8;
    stim[28] = 21'h0554e1;
    stim[29] = 21'h0624bd;
    stim[30] = 21'h0951b2;
    stim[31] = 21'h0ea42d;
    stim[32] = 21'h033dd0;
    stim[33] = 21'h0f829b;
    stim[34] = 21'h0aeb38;
    stim[35] = 21'h0d89fb;
    stim[36] = 21'h00c357;
    stim[37] = 21'h03987f;
    stim[38] = 21'h0fcea2;
    stim[39] = 21'h080d6e;
    stim[40] = 21'h084a64;
    stim[41] = 21'h02f034;
    stim[42] = 21'h01e78c;
    stim[43] = 21'h04d77b;
    stim[44] = 21'h08dfb0;
    stim[45] = 21'h0ce428;
    stim[46] = 21'h0d7b3f;
    stim[47] = 21'h0920fd;
    stim[48] = 21'h0d08c3;
    stim[49] = 21'h0b5142;
    stim[50] = 21'h047f29;
    stim[51] = 21'h0dfc7f;
    stim[52] = 21'h0ae0fd;
    stim[53] = 21'h07cc07;
    stim[54] = 21'h00b6ce;
    stim[55] = 21'h065df6;
    stim[56] = 21'h0775d1;
    stim[57] = 21'h0c74af;
    stim[58] = 21'h0e42d8;
    stim[59] = 21'h045449;
    stim[60] = 21'h0a4ea5;
    stim[61] = 21'h0254e8;
    stim[62] = 21'h0b9c4d;
    stim[63] = 21'h0e10ad;
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
      expv[3] = 53'hxxxxxxxxx005b3;
      expv[4] = 53'hxxxxxxxxx011b3;
      expv[5] = 53'hxxxxxxxxx00cff;
      expv[6] = 53'hxxxxxxxxx018ff;
      expv[7] = 53'hxxxxxxxxx00c53;
      expv[8] = 53'hxxxxxxxxx01053;
      expv[9] = 53'hxxxxxxxxx00df9;
      expv[10] = 53'hxxxxxxxxx019f9;
      expv[11] = 53'hxxxxxxxxx00569;
      expv[12] = 53'hxxxxxxxxx01969;
      expv[13] = 53'hxxxxxxxxx00368;
      expv[14] = 53'hxxxxxxxxx00b68;
      expv[15] = 53'hxxxxxxxxx17168;
      expv[16] = 53'hxxxxxxxxx16539;
      expv[17] = 53'hxxxxxxxxx17939;
      expv[18] = 53'hxxxxxxxxx16338;
      expv[19] = 53'hxxxxxxxxx16338;
      expv[20] = 53'hxxxxxxxxxcb938;
      expv[21] = 53'hxxxxxxxxxcaceb;
      expv[22] = 53'hxxxxxxxxxcb0eb;
      expv[23] = 53'hxxxxxxxxxcac99;
      expv[24] = 53'hxxxxxxxxxcb899;
      expv[25] = 53'hxxxxxxxxx00800;
      expv[26] = 53'hxxxxxxxxx00000;
      expv[27] = 53'hxxxxxxxxx00200;
      expv[28] = 53'hxxxxxxxxx00200;
      expv[29] = 53'hxxxxxxxxxc3000;
      expv[30] = 53'hxxxxxxxxxc2a00;
      expv[31] = 53'hxxxxxxxxxc2200;
      expv[32] = 53'hxxxxxxxxx5b800;
      expv[33] = 53'hxxxxxxxxx5a000;
      expv[34] = 53'hxxxxxxxxx5adc1;
      expv[35] = 53'hxxxxxxxxx5b9c1;
      expv[36] = 53'hxxxxxxxxx5acc5;
      expv[37] = 53'hxxxxxxxxx5b0c5;
      expv[38] = 53'hxxxxxxxxx5a0c4;
      expv[39] = 53'hxxxxxxxxx5ade7;
      expv[40] = 53'hxxxxxxxxx5b1e7;
      expv[41] = 53'hxxxxxxxxx5a425;
      expv[42] = 53'hxxxxxxxxx5b825;
      expv[43] = 53'hxxxxxxxxx5a824;
      expv[44] = 53'hxxxxxxxxx5aa24;
      expv[45] = 53'hxxxxxxxxx5a224;
      expv[46] = 53'hxxxxxxxxx51824;
      expv[47] = 53'hxxxxxxxxx504bd;
      expv[48] = 53'hxxxxxxxxx510bd;
      expv[49] = 53'hxxxxxxxxx50c85;
      expv[50] = 53'hxxxxxxxxx51885;
      expv[51] = 53'hxxxxxxxxx50284;
      expv[52] = 53'hxxxxxxxxx50284;
      expv[53] = 53'hxxxxxxxxxfb084;
      expv[54] = 53'hxxxxxxxxxfa284;
      expv[55] = 53'hxxxxxxxxxfaa84;
      expv[56] = 53'hxxxxxxxxxed884;
      expv[57] = 53'hxxxxxxxxxec284;
      expv[58] = 53'hxxxxxxxxxec284;
      expv[59] = 53'hxxxxxxxxxb1084;
      expv[60] = 53'hxxxxxxxxxb0284;
      expv[61] = 53'hxxxxxxxxxb0284;
      expv[62] = 53'hxxxxxxxxxd1084;
      expv[63] = 53'hxxxxxxxxxd05cf;
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
