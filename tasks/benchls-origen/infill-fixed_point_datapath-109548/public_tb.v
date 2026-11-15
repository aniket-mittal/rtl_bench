// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 16;
  localparam OW = 25;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_109548 dut (
    .clk_i(clk),
    .dt_i(in_vec[15:8]),
    .restart_flag_i(in_vec[7:7]),
    .mux_ctrl1_i(in_vec[6:6]),
    .mux_ctrl2_i(in_vec[5:4]),
    .d_en_i(in_vec[3:3]),
    .s_en_i(in_vec[2:2]),
    .r_en_i(in_vec[1:1]),
    .op_en_i(in_vec[0:0]),
    .s_o(out_vec[24:16]),
    .x_o(out_vec[15:8]),
    .dt_o(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 16'h7e3d;
    stim[1] = 16'h8c4d;
    stim[2] = 16'h66b3;
    stim[3] = 16'hafdb;
    stim[4] = 16'h1b5b;
    stim[5] = 16'h9dd1;
    stim[6] = 16'h0b4b;
    stim[7] = 16'h011a;
    stim[8] = 16'he8c5;
    stim[9] = 16'h665b;
    stim[10] = 16'he548;
    stim[11] = 16'h916a;
    stim[12] = 16'hb70e;
    stim[13] = 16'h968c;
    stim[14] = 16'h5e6a;
    stim[15] = 16'h9bc1;
    stim[16] = 16'h21f9;
    stim[17] = 16'h1708;
    stim[18] = 16'h4500;
    stim[19] = 16'h2564;
    stim[20] = 16'hf219;
    stim[21] = 16'h28ed;
    stim[22] = 16'had94;
    stim[23] = 16'hf364;
    stim[24] = 16'hf737;
    stim[25] = 16'h7b57;
    stim[26] = 16'hcff9;
    stim[27] = 16'h668d;
    stim[28] = 16'haf84;
    stim[29] = 16'h5bd4;
    stim[30] = 16'ha22c;
    stim[31] = 16'ha7ca;
    stim[32] = 16'hbe52;
    stim[33] = 16'h933f;
    stim[34] = 16'h4291;
    stim[35] = 16'heecb;
    stim[36] = 16'hff5a;
    stim[37] = 16'ha2a3;
    stim[38] = 16'hd81c;
    stim[39] = 16'hbd0f;
    stim[40] = 16'hbaa2;
    stim[41] = 16'h741c;
    stim[42] = 16'h6bc3;
    stim[43] = 16'h8d1c;
    stim[44] = 16'hde58;
    stim[45] = 16'h4411;
    stim[46] = 16'h14d5;
    stim[47] = 16'hb979;
    stim[48] = 16'h8c3d;
    stim[49] = 16'h6f4c;
    stim[50] = 16'hbe02;
    stim[51] = 16'h95e9;
    stim[52] = 16'hbec4;
    stim[53] = 16'h0bbe;
    stim[54] = 16'h3fb2;
    stim[55] = 16'h1d32;
    stim[56] = 16'h7e35;
    stim[57] = 16'ha104;
    stim[58] = 16'hefb3;
    stim[59] = 16'h9276;
    stim[60] = 16'hdb63;
    stim[61] = 16'h4bfe;
    stim[62] = 16'hbd48;
    stim[63] = 16'h93f0;
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
      expv[0] = 25'hxxxxx0x;
      expv[1] = 25'hxxxxx0x;
      expv[2] = 25'hxxxxx0x;
      expv[3] = 25'h0046600;
      expv[4] = 25'h004af00;
      expv[5] = 25'h004af01;
      expv[6] = 25'h0049d00;
      expv[7] = 25'h0049d01;
      expv[8] = 25'h0049d02;
      expv[9] = 25'h004e800;
      expv[10] = 25'h004e801;
      expv[11] = 25'h004e801;
      expv[12] = 25'h004e802;
      expv[13] = 25'h005e802;
      expv[14] = 25'h0049600;
      expv[15] = 25'h0049601;
      expv[16] = 25'h0049b00;
      expv[17] = 25'h0042100;
      expv[18] = 25'h0042100;
      expv[19] = 25'h0042100;
      expv[20] = 25'h0042100;
      expv[21] = 25'h0042100;
      expv[22] = 25'h0042800;
      expv[23] = 25'h004ad00;
      expv[24] = 25'h006ad00;
      expv[25] = 25'h006ad01;
      expv[26] = 25'h002ad01;
      expv[27] = 25'h004cf00;
      expv[28] = 25'h0046600;
      expv[29] = 25'h004af00;
      expv[30] = 25'h0045b00;
      expv[31] = 25'h0045b00;
      expv[32] = 25'h004a700;
      expv[33] = 25'h004a701;
      expv[34] = 25'h004a701;
      expv[35] = 25'h0044200;
      expv[36] = 25'h004ee00;
      expv[37] = 25'h004ee01;
      expv[38] = 25'h004a200;
      expv[39] = 25'h008a200;
      expv[40] = 25'h008a204;
      expv[41] = 25'h004ba00;
      expv[42] = 25'h010ba00;
      expv[43] = 25'h0046b00;
      expv[44] = 25'h0206b00;
      expv[45] = 25'h0206b00;
      expv[46] = 25'h0206b00;
      expv[47] = 25'h0041400;
      expv[48] = 25'h0041400;
      expv[49] = 25'h0041400;
      expv[50] = 25'h0011400;
      expv[51] = 25'h0011400;
      expv[52] = 25'h0049500;
      expv[53] = 25'h004be00;
      expv[54] = 25'h0040b00;
      expv[55] = 25'h0043f00;
      expv[56] = 25'h0043f01;
      expv[57] = 25'h0033f01;
      expv[58] = 25'h0023f01;
      expv[59] = 25'h004ef00;
      expv[60] = 25'h002ef01;
      expv[61] = 25'h002ef01;
      expv[62] = 25'h0044b00;
      expv[63] = 25'h0044b00;
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
