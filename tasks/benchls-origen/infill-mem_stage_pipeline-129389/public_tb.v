// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 42;
  localparam OW = 39;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_129389 dut (
    .clk_i(clk),
    .rst_i(in_vec[41:41]),
    .alu_i(in_vec[40:9]),
    .control_load_i(in_vec[8:8]),
    .control_store_i(in_vec[7:7]),
    .control_take_branch_i(in_vec[6:6]),
    .do_wb_i(in_vec[5:5]),
    .wb_reg_i(in_vec[4:0]),
    .stall_o(out_vec[38:38]),
    .do_wb_o(out_vec[37:37]),
    .wb_reg_o(out_vec[36:32]),
    .wb_val_o(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 42'h213f52c77e4;
    stim[1] = 42'h34f3641ca84;
    stim[2] = 42'h10eca0682ef;
    stim[3] = 42'h0414b32efcd;
    stim[4] = 42'h0acfa5a889d;
    stim[5] = 42'h1af3444d199;
    stim[6] = 42'h0a2344bcce5;
    stim[7] = 42'h1174b177875;
    stim[8] = 42'h0e7ba0b862a;
    stim[9] = 42'h16cfb7b90d0;
    stim[10] = 42'h041946a85b6;
    stim[11] = 42'h03c37789290;
    stim[12] = 42'h09912c7ecfa;
    stim[13] = 42'h03106aa0c7c;
    stim[14] = 42'h0be49c618f6;
    stim[15] = 42'h025a5b5d89a;
    stim[16] = 42'h08614e062fa;
    stim[17] = 42'h007553bb25e;
    stim[18] = 42'h0ff9b593773;
    stim[19] = 42'h05e8b9ddfb6;
    stim[20] = 42'h17a1b8c7f8f;
    stim[21] = 42'h1b17d095b0b;
    stim[22] = 42'h06d910e47ae;
    stim[23] = 42'h2c398be6aa0;
    stim[24] = 42'h11b2702c4f4;
    stim[25] = 42'h3d321b8f2ab;
    stim[26] = 42'h1ec3d6a0601;
    stim[27] = 42'h060b3135fc8;
    stim[28] = 42'h1a8651d9475;
    stim[29] = 42'h19f68629969;
    stim[30] = 42'h1847eca86c0;
    stim[31] = 42'h00b5d179f7f;
    stim[32] = 42'h08dbdefda3f;
    stim[33] = 42'h12ac5627f58;
    stim[34] = 42'h058713296af;
    stim[35] = 42'h0d0dbc3ccff;
    stim[36] = 42'h0d6b074ebac;
    stim[37] = 42'h3ce7da2602c;
    stim[38] = 42'h11b7dd466f0;
    stim[39] = 42'h1ece39933ed;
    stim[40] = 42'h1fa7c3bb8ed;
    stim[41] = 42'h1ab83916a01;
    stim[42] = 42'h01c2e862071;
    stim[43] = 42'h06235c7608e;
    stim[44] = 42'h0306f2c3b95;
    stim[45] = 42'h057a4ebe8e0;
    stim[46] = 42'h0d83631870a;
    stim[47] = 42'h1fd7a1800aa;
    stim[48] = 42'h1cbf8c312dd;
    stim[49] = 42'h0b1bc2cec84;
    stim[50] = 42'h016b2bd65b0;
    stim[51] = 42'h17783b703bf;
    stim[52] = 42'h102496b4d5b;
    stim[53] = 42'h18f46b9cae6;
    stim[54] = 42'h07c207611c4;
    stim[55] = 42'h0ff8a73fc19;
    stim[56] = 42'h0f9670a6b5c;
    stim[57] = 42'h182c7258de0;
    stim[58] = 42'h0ca133bfc28;
    stim[59] = 42'h1194c282645;
    stim[60] = 42'h156d24d0482;
    stim[61] = 42'h19bf47cc54a;
    stim[62] = 42'h08d720fc711;
    stim[63] = 42'h0a3d24a9bf8;
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
      expv[0] = 39'h0000000000;
      expv[1] = 39'h0000000000;
      expv[2] = 39'h0000000000;
      expv[3] = 39'h2f00000000;
      expv[4] = 39'h0000000000;
      expv[5] = 39'h0000000000;
      expv[6] = 39'h0000000000;
      expv[7] = 39'h2500000063;
      expv[8] = 39'h3500000063;
      expv[9] = 39'h2a8ba58bbc;
      expv[10] = 39'h0000000000;
      expv[11] = 39'h3673dd05c3;
      expv[12] = 39'h0000000000;
      expv[13] = 39'h3a00000063;
      expv[14] = 39'h3c00000063;
      expv[15] = 39'h3618835506;
      expv[16] = 39'h0000000000;
      expv[17] = 39'h3a18835506;
      expv[18] = 39'h0000000000;
      expv[19] = 39'h3303aa9dd9;
      expv[20] = 39'h3600000063;
      expv[21] = 39'h0000000000;
      expv[22] = 39'h0000000000;
      expv[23] = 39'h0000000000;
      expv[24] = 39'h0000000000;
      expv[25] = 39'h0000000000;
      expv[26] = 39'h0000000000;
      expv[27] = 39'h0000000000;
      expv[28] = 39'h0000000000;
      expv[29] = 39'h3500000063;
      expv[30] = 39'h29d4328eca;
      expv[31] = 39'h0000000000;
      expv[32] = 39'h3f00000063;
      expv[33] = 39'h3f00000063;
      expv[34] = 39'h0000000000;
      expv[35] = 39'h2f00000063;
      expv[36] = 39'h3f00000063;
      expv[37] = 39'h0000000000;
      expv[38] = 39'h0000000000;
      expv[39] = 39'h3000000000;
      expv[40] = 39'h2d00000000;
      expv[41] = 39'h2d00000063;
      expv[42] = 39'h0000000000;
      expv[43] = 39'h31d5c1c8b5;
      expv[44] = 39'h0000000000;
      expv[45] = 39'h0000000000;
      expv[46] = 39'h2000000063;
      expv[47] = 39'h0000000000;
      expv[48] = 39'h2a00000063;
      expv[49] = 39'h0000000000;
      expv[50] = 39'h0000000000;
      expv[51] = 39'h3000000063;
      expv[52] = 39'h3f00000063;
      expv[53] = 39'h0000000000;
      expv[54] = 39'h2600000063;
      expv[55] = 39'h0000000000;
      expv[56] = 39'h0000000000;
      expv[57] = 39'h0000000000;
      expv[58] = 39'h2000000063;
      expv[59] = 39'h2800000063;
      expv[60] = 39'h0000000000;
      expv[61] = 39'h0000000000;
      expv[62] = 39'h0000000000;
      expv[63] = 39'h0000000000;
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
