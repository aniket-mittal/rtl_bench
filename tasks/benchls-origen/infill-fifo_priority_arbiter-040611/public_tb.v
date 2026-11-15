// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 27;
  localparam OW = 14;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_040611 dut (
    .clk_fsm(clk),
    .sending_clk_sync(in_vec[26:26]),
    .data_fifo_xcvr(in_vec[25:18]),
    .data_fifo_uart(in_vec[17:10]),
    .fifo_empty_xcvr(in_vec[9:9]),
    .fifo_empty_uart(in_vec[8:8]),
    .padding_char(in_vec[7:0]),
    .fifo_read_xcvr(out_vec[13:13]),
    .fifo_read_uart(out_vec[12:12]),
    .data_8b10(out_vec[11:4]),
    .is_control_char(out_vec[3:3]),
    .is_padding_char(out_vec[2:2]),
    .enable_data_out(out_vec[1:1]),
    .busy(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 27'h760f07c;
    stim[1] = 27'h13ca0c8;
    stim[2] = 27'h516f8cb;
    stim[3] = 27'h6f831dd;
    stim[4] = 27'h5d7dd29;
    stim[5] = 27'h3635e86;
    stim[6] = 27'h03d9139;
    stim[7] = 27'h7146cfb;
    stim[8] = 27'h00e23fc;
    stim[9] = 27'h4337474;
    stim[10] = 27'h4d2b7cf;
    stim[11] = 27'h6eb7048;
    stim[12] = 27'h7da63b4;
    stim[13] = 27'h081f738;
    stim[14] = 27'h6117d4c;
    stim[15] = 27'h1431aef;
    stim[16] = 27'h08381f1;
    stim[17] = 27'h39ad171;
    stim[18] = 27'h46ddd4c;
    stim[19] = 27'h2c3016b;
    stim[20] = 27'h15c32e9;
    stim[21] = 27'h18605f9;
    stim[22] = 27'h69f645c;
    stim[23] = 27'h06f7773;
    stim[24] = 27'h0a6d662;
    stim[25] = 27'h57c3506;
    stim[26] = 27'h0bed52a;
    stim[27] = 27'h2a2ea98;
    stim[28] = 27'h51dd832;
    stim[29] = 27'h2ef496e;
    stim[30] = 27'h2589398;
    stim[31] = 27'h4b35301;
    stim[32] = 27'h73d376a;
    stim[33] = 27'h0e0f1b5;
    stim[34] = 27'h05630ef;
    stim[35] = 27'h16feec0;
    stim[36] = 27'h08d4040;
    stim[37] = 27'h7208a18;
    stim[38] = 27'h1a9f5c3;
    stim[39] = 27'h3c3c9a4;
    stim[40] = 27'h25b91ce;
    stim[41] = 27'h3e6b82c;
    stim[42] = 27'h63cf9c9;
    stim[43] = 27'h1302fae;
    stim[44] = 27'h53ac2d5;
    stim[45] = 27'h44cb2b7;
    stim[46] = 27'h6642189;
    stim[47] = 27'h0c4bbc8;
    stim[48] = 27'h247fc8c;
    stim[49] = 27'h4ce1299;
    stim[50] = 27'h6140cc4;
    stim[51] = 27'h2d3adaa;
    stim[52] = 27'h60bbc23;
    stim[53] = 27'h48743fb;
    stim[54] = 27'h2f6acd1;
    stim[55] = 27'h6cae640;
    stim[56] = 27'h5eb0b8b;
    stim[57] = 27'h4e86b0b;
    stim[58] = 27'h5b93ac0;
    stim[59] = 27'h2d09c4c;
    stim[60] = 27'h164fae6;
    stim[61] = 27'h6eae059;
    stim[62] = 27'h787fca9;
    stim[63] = 27'h1dd7b08;
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
      expv[0] = 14'hxxxx;
      expv[1] = 14'h0xxx;
      expv[2] = 14'h0xxx;
      expv[3] = 14'h0xxx;
      expv[4] = 14'h2xxx;
      expv[5] = 14'h0be3;
      expv[6] = 14'h0be1;
      expv[7] = 14'h0be1;
      expv[8] = 14'h0be1;
      expv[9] = 14'h0be1;
      expv[10] = 14'h0be1;
      expv[11] = 14'h2be1;
      expv[12] = 14'h0343;
      expv[13] = 14'h0341;
      expv[14] = 14'h0341;
      expv[15] = 14'h0341;
      expv[16] = 14'h2341;
      expv[17] = 14'h0503;
      expv[18] = 14'h0501;
      expv[19] = 14'h0501;
      expv[20] = 14'h0501;
      expv[21] = 14'h0501;
      expv[22] = 14'h1501;
      expv[23] = 14'h0813;
      expv[24] = 14'h0811;
      expv[25] = 14'h0811;
      expv[26] = 14'h0811;
      expv[27] = 14'h0811;
      expv[28] = 14'h0811;
      expv[29] = 14'h1811;
      expv[30] = 14'h0763;
      expv[31] = 14'h0761;
      expv[32] = 14'h0761;
      expv[33] = 14'h0761;
      expv[34] = 14'h0761;
      expv[35] = 14'h0761;
      expv[36] = 14'h2761;
      expv[37] = 14'h05b3;
      expv[38] = 14'h05b1;
      expv[39] = 14'h05b1;
      expv[40] = 14'h05b1;
      expv[41] = 14'h25b1;
      expv[42] = 14'h0963;
      expv[43] = 14'h0961;
      expv[44] = 14'h0961;
      expv[45] = 14'h0961;
      expv[46] = 14'h1961;
      expv[47] = 14'h02c3;
      expv[48] = 14'h02c1;
      expv[49] = 14'h02c1;
      expv[50] = 14'h02c1;
      expv[51] = 14'h02c1;
      expv[52] = 14'h02c1;
      expv[53] = 14'h02c1;
      expv[54] = 14'h22c1;
      expv[55] = 14'h0213;
      expv[56] = 14'h0211;
      expv[57] = 14'h0211;
      expv[58] = 14'h0211;
      expv[59] = 14'h0211;
      expv[60] = 14'h0211;
      expv[61] = 14'h0211;
      expv[62] = 14'h1211;
      expv[63] = 14'h0b83;
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
