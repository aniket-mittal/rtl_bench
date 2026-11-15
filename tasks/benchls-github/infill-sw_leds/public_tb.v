// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  sw_leds dut (
    .wb_clk_i(clk),
    .wb_rst_i(in_vec[32:32]),
    .wb_adr_i(in_vec[31:31]),
    .wb_dat_i(in_vec[30:15]),
    .wb_sel_i(in_vec[14:13]),
    .wb_we_i(in_vec[12:12]),
    .wb_stb_i(in_vec[11:11]),
    .wb_cyc_i(in_vec[10:10]),
    .sw_(in_vec[9:2]),
    .pb_(in_vec[1:1]),
    .tick(in_vec[0:0]),
    .wb_dat_o(out_vec[31:16]),
    .wb_ack_o(out_vec[15:15]),
    .leds_(out_vec[14:1]),
    .nmi_pb(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h119732172;
    stim[1] = 33'h133906852;
    stim[2] = 33'h00399b2e4;
    stim[3] = 33'h0083132c0;
    stim[4] = 33'h0e0f6efbf;
    stim[5] = 33'h0e9a2c2f6;
    stim[6] = 33'h0c3c15d78;
    stim[7] = 33'h08cec1ecc;
    stim[8] = 33'h0216a4d71;
    stim[9] = 33'h01a63905d;
    stim[10] = 33'h0b16b233b;
    stim[11] = 33'h0433b92f2;
    stim[12] = 33'h0004005ca;
    stim[13] = 33'h07532751c;
    stim[14] = 33'h0795233eb;
    stim[15] = 33'h03a778488;
    stim[16] = 33'h01a2fd744;
    stim[17] = 33'h05f79ed06;
    stim[18] = 33'h0c796282e;
    stim[19] = 33'h0223435e6;
    stim[20] = 33'h0be77dcc2;
    stim[21] = 33'h0ccbcbd5e;
    stim[22] = 33'h03525c53c;
    stim[23] = 33'h02a99560f;
    stim[24] = 33'h011bbb5fb;
    stim[25] = 33'h04b44c52d;
    stim[26] = 33'h00050b46b;
    stim[27] = 33'h043a9fbbe;
    stim[28] = 33'h0b30e5860;
    stim[29] = 33'h0d442d4ff;
    stim[30] = 33'h0b594b558;
    stim[31] = 33'h01dfece6f;
    stim[32] = 33'h02cdd7ed9;
    stim[33] = 33'h0e913c0bf;
    stim[34] = 33'h1cb94bf7f;
    stim[35] = 33'h0f33a3bbc;
    stim[36] = 33'h00e826639;
    stim[37] = 33'h0af4e9aca;
    stim[38] = 33'h0f4ddb87e;
    stim[39] = 33'h084d146df;
    stim[40] = 33'h0eeff72d6;
    stim[41] = 33'h001eccabd;
    stim[42] = 33'h01a55227e;
    stim[43] = 33'h03671f064;
    stim[44] = 33'h00d65b5d8;
    stim[45] = 33'h004e59f86;
    stim[46] = 33'h00cd05eff;
    stim[47] = 33'h0c2f2dc64;
    stim[48] = 33'h031944740;
    stim[49] = 33'h03fc8a90d;
    stim[50] = 33'h00974b94e;
    stim[51] = 33'h0f335ab77;
    stim[52] = 33'h09f10bd96;
    stim[53] = 33'h05907fe78;
    stim[54] = 33'h0a580f7a7;
    stim[55] = 33'h081bd14a2;
    stim[56] = 33'h0c5e33d0a;
    stim[57] = 33'h0d95b8446;
    stim[58] = 33'h08cbd0592;
    stim[59] = 33'h07af9a912;
    stim[60] = 33'h0f860df85;
    stim[61] = 33'h0dcfc4e17;
    stim[62] = 33'h07aeb4251;
    stim[63] = 33'h094f8e6df;
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
      expv[0] = 32'h005cxxxx;
      expv[1] = 32'h00140000;
      expv[2] = 32'h00b90000;
      expv[3] = 32'h00b00000;
      expv[4] = 32'h00008001;
      expv[5] = 32'h00000001;
      expv[6] = 32'h00008001;
      expv[7] = 32'h07828f05;
      expv[8] = 32'h005cb3b1;
      expv[9] = 32'h001733b1;
      expv[10] = 32'h19d833b1;
      expv[11] = 32'h00bc33b1;
      expv[12] = 32'h007233b1;
      expv[13] = 32'h004733b1;
      expv[14] = 32'h00fa33b1;
      expv[15] = 32'h002233b1;
      expv[16] = 32'h00d133b1;
      expv[17] = 32'h0041b3b1;
      expv[18] = 32'h19d833b1;
      expv[19] = 32'h007933b1;
      expv[20] = 32'h19d8b3b1;
      expv[21] = 32'h3ceff9df;
      expv[22] = 32'h004f32f3;
      expv[23] = 32'h008332f3;
      expv[24] = 32'h007e32f3;
      expv[25] = 32'h004b32f3;
      expv[26] = 32'h001a32f3;
      expv[27] = 32'h00ef32f3;
      expv[28] = 32'h197932f3;
      expv[29] = 32'h197932f3;
      expv[30] = 32'h197932f3;
      expv[31] = 32'h009bb2f3;
      expv[32] = 32'h00b6b2f3;
      expv[33] = 32'h197932f3;
      expv[34] = 32'h1979b2f3;
      expv[35] = 32'h00000000;
      expv[36] = 32'h008e0000;
      expv[37] = 32'h00000001;
      expv[38] = 32'h00000001;
      expv[39] = 32'h00000001;
      expv[40] = 32'h00000001;
      expv[41] = 32'h00af0001;
      expv[42] = 32'h009f0001;
      expv[43] = 32'h00190001;
      expv[44] = 32'h00760001;
      expv[45] = 32'h00e18001;
      expv[46] = 32'h00bf8001;
      expv[47] = 32'h00008001;
      expv[48] = 32'h00d00bcb;
      expv[49] = 32'h00430bcb;
      expv[50] = 32'h00530bcb;
      expv[51] = 32'h05e50bcb;
      expv[52] = 32'h05e58bcb;
      expv[53] = 32'h009efc43;
      expv[54] = 32'h3e217c43;
      expv[55] = 32'h3e217c43;
      expv[56] = 32'h3e21fc43;
      expv[57] = 32'h0bc6178c;
      expv[58] = 32'h0bc6178c;
      expv[59] = 32'h0044178c;
      expv[60] = 32'h0bc6978c;
      expv[61] = 32'h30c1e182;
      expv[62] = 32'h00946182;
      expv[63] = 32'h30c16182;
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
