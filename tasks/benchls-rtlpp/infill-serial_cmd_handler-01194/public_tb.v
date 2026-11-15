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

  rtlpp_01194 dut (
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
    stim[0] = 21'h164233;
    stim[1] = 21'h1993e7;
    stim[2] = 21'h181887;
    stim[3] = 21'h033f9c;
    stim[4] = 21'h0affb0;
    stim[5] = 21'h0a9398;
    stim[6] = 21'h079190;
    stim[7] = 21'h04b5b3;
    stim[8] = 21'h00cdaa;
    stim[9] = 21'h0e8510;
    stim[10] = 21'h09c9dc;
    stim[11] = 21'h0ffaae;
    stim[12] = 21'h0e9360;
    stim[13] = 21'h065829;
    stim[14] = 21'h05aff7;
    stim[15] = 21'h018a6a;
    stim[16] = 21'h0b8313;
    stim[17] = 21'h130f57;
    stim[18] = 21'h057f06;
    stim[19] = 21'h036010;
    stim[20] = 21'h096b91;
    stim[21] = 21'h064e44;
    stim[22] = 21'h0c686c;
    stim[23] = 21'h040022;
    stim[24] = 21'h03cd77;
    stim[25] = 21'h0ddf44;
    stim[26] = 21'h05f972;
    stim[27] = 21'h0694a6;
    stim[28] = 21'h00f5e4;
    stim[29] = 21'h08eef6;
    stim[30] = 21'h014404;
    stim[31] = 21'h048efd;
    stim[32] = 21'h027691;
    stim[33] = 21'h0a0edb;
    stim[34] = 21'h0cd041;
    stim[35] = 21'h078f42;
    stim[36] = 21'h06071b;
    stim[37] = 21'h078fc8;
    stim[38] = 21'h0fc9fc;
    stim[39] = 21'h0c8c39;
    stim[40] = 21'h04d226;
    stim[41] = 21'h0f55f8;
    stim[42] = 21'h09b5df;
    stim[43] = 21'h0d61fa;
    stim[44] = 21'h0640ea;
    stim[45] = 21'h0232c6;
    stim[46] = 21'h06b9da;
    stim[47] = 21'h031d8f;
    stim[48] = 21'h075055;
    stim[49] = 21'h0f7239;
    stim[50] = 21'h09a41c;
    stim[51] = 21'h0839e3;
    stim[52] = 21'h08a8a0;
    stim[53] = 21'h066429;
    stim[54] = 21'h09bd70;
    stim[55] = 21'h0a5224;
    stim[56] = 21'h050eb6;
    stim[57] = 21'h09b441;
    stim[58] = 21'h071baf;
    stim[59] = 21'h070759;
    stim[60] = 21'h0f8969;
    stim[61] = 21'h088eee;
    stim[62] = 21'h0e251d;
    stim[63] = 21'h02ca80;
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
      expv[1] = 53'hxxxxxxxxx00800;
      expv[2] = 53'hxxxxxxxxx00000;
      expv[3] = 53'hxxxxxxxxx00800;
      expv[4] = 53'hxxxxxxxxx00800;
      expv[5] = 53'hxxxxxxxxx00d7f;
      expv[6] = 53'hxxxxxxxxx0197f;
      expv[7] = 53'hxxxxxxxxx00b7e;
      expv[8] = 53'hxxxxxxxxx00b7e;
      expv[9] = 53'hxxxxxxxxx5597e;
      expv[10] = 53'hxxxxxxxxx54d43;
      expv[11] = 53'hxxxxxxxxx55143;
      expv[12] = 53'hxxxxxxxxx54dfd;
      expv[13] = 53'hxxxxxxxxx551fd;
      expv[14] = 53'hxxxxxxxxx54bfc;
      expv[15] = 53'hxxxxxxxxx543fc;
      expv[16] = 53'hxxxxxxxxxd59fc;
      expv[17] = 53'hxxxxxxxxx00800;
      expv[18] = 53'hxxxxxxxxx00800;
      expv[19] = 53'hxxxxxxxxx00200;
      expv[20] = 53'hxxxxxxxxx00a00;
      expv[21] = 53'hxxxxxxxxx23000;
      expv[22] = 53'hxxxxxxxxx22200;
      expv[23] = 53'hxxxxxxxxx22200;
      expv[24] = 53'hxxxxxxxxx45800;
      expv[25] = 53'hxxxxxxxxx44800;
      expv[26] = 53'hxxxxxxxxx44cef;
      expv[27] = 53'hxxxxxxxxx450ef;
      expv[28] = 53'hxxxxxxxxx44aee;
      expv[29] = 53'hxxxxxxxxx442ee;
      expv[30] = 53'hxxxxxxxxxed0ee;
      expv[31] = 53'hxxxxxxxxxec0ee;
      expv[32] = 53'hxxxxxxxxxec2ee;
      expv[33] = 53'hxxxxxxxxxec2ee;
      expv[34] = 53'hxxxxxxxxxb70ee;
      expv[35] = 53'hxxxxxxxxxb6c69;
      expv[36] = 53'hxxxxxxxxxb7869;
      expv[37] = 53'hxxxxxxxxxb6a68;
      expv[38] = 53'hxxxxxxxxxb6a68;
      expv[39] = 53'hxxxxxxxxxf9068;
      expv[40] = 53'hxxxxxxxxxf8447;
      expv[41] = 53'hxxxxxxxxxf9847;
      expv[42] = 53'hxxxxxxxxxf8dab;
      expv[43] = 53'hxxxxxxxxxf99ab;
      expv[44] = 53'hxxxxxxxxxf84b1;
      expv[45] = 53'hxxxxxxxxxf90b1;
      expv[46] = 53'hxxxxxxxxxf88b0;
      expv[47] = 53'hxxxxxxxxxf8ab0;
      expv[48] = 53'hxxxxxxxxxf82b0;
      expv[49] = 53'hxxxxxxxxxab0b0;
      expv[50] = 53'hxxxxxxxxxaa5b9;
      expv[51] = 53'hxxxxxxxxxab9b9;
      expv[52] = 53'hxxxxxxxxxaa41d;
      expv[53] = 53'hxxxxxxxxxab01d;
      expv[54] = 53'hxxxxxxxxxaaa1c;
      expv[55] = 53'hxxxxxxxxxaa21c;
      expv[56] = 53'hxxxxxxxxx4901c;
      expv[57] = 53'hxxxxxxxxx4821c;
      expv[58] = 53'hxxxxxxxxx48a1c;
      expv[59] = 53'hxxxxxxxxx5f81c;
      expv[60] = 53'hxxxxxxxxx5ea1c;
      expv[61] = 53'hxxxxxxxxx5e21c;
      expv[62] = 53'hxxxxxxxxxdd81c;
      expv[63] = 53'hxxxxxxxxxdc513;
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
