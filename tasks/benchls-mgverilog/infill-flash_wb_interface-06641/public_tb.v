// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 31;
  localparam OW = 44;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_06641 dut (
    .wb_clk_i(clk),
    .wb_rst_i(in_vec[30:30]),
    .wb_dat_i(in_vec[29:14]),
    .wb_we_i(in_vec[13:13]),
    .wb_adr_i(in_vec[12:12]),
    .wb_sel_i(in_vec[11:10]),
    .wb_stb_i(in_vec[9:9]),
    .wb_cyc_i(in_vec[8:8]),
    .flash_data_(in_vec[7:0]),
    .wb_dat_o(out_vec[43:28]),
    .wb_ack_o(out_vec[27:27]),
    .flash_addr_(out_vec[26:4]),
    .flash_we_n_(out_vec[3:3]),
    .flash_oe_n_(out_vec[2:2]),
    .flash_ce_n_(out_vec[1:1]),
    .flash_rst_n_(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 31'h498cfdca;
    stim[1] = 31'h40cfa398;
    stim[2] = 31'h2feb9258;
    stim[3] = 31'h05f16a88;
    stim[4] = 31'h03767acd;
    stim[5] = 31'h0a63c830;
    stim[6] = 31'h357cb57a;
    stim[7] = 31'h0034dfa4;
    stim[8] = 31'h3bc57a0c;
    stim[9] = 31'h2fe4e1ea;
    stim[10] = 31'h2102ec8a;
    stim[11] = 31'h0e228be6;
    stim[12] = 31'h0677f40a;
    stim[13] = 31'h3384b676;
    stim[14] = 31'h0fc5e86c;
    stim[15] = 31'h08480df2;
    stim[16] = 31'h23a5782e;
    stim[17] = 31'h04e1b54b;
    stim[18] = 31'h2f691969;
    stim[19] = 31'h26fb7b0f;
    stim[20] = 31'h27f81a2e;
    stim[21] = 31'h75ec0934;
    stim[22] = 31'h2462b8af;
    stim[23] = 31'h33874eb6;
    stim[24] = 31'h1806da25;
    stim[25] = 31'h22c06247;
    stim[26] = 31'h0be49128;
    stim[27] = 31'h0a3934f1;
    stim[28] = 31'h06dbfcdd;
    stim[29] = 31'h20548f9b;
    stim[30] = 31'h1e9e73dd;
    stim[31] = 31'h3a3c0f80;
    stim[32] = 31'h0a6fbc47;
    stim[33] = 31'h3a029586;
    stim[34] = 31'h00435fe4;
    stim[35] = 31'h03f118a9;
    stim[36] = 31'h3354dcce;
    stim[37] = 31'h3c63ce4e;
    stim[38] = 31'h1aa35b25;
    stim[39] = 31'h2f829a5a;
    stim[40] = 31'h253e88f6;
    stim[41] = 31'h1741b810;
    stim[42] = 31'h209e5422;
    stim[43] = 31'h1b771385;
    stim[44] = 31'h350a61fe;
    stim[45] = 31'h12640b66;
    stim[46] = 31'h15aa9ed3;
    stim[47] = 31'h08032f9b;
    stim[48] = 31'h1b6febc3;
    stim[49] = 31'h101d1992;
    stim[50] = 31'h32a48ce1;
    stim[51] = 31'h0b528850;
    stim[52] = 31'h36c19e53;
    stim[53] = 31'h2ee9db2f;
    stim[54] = 31'h129759cb;
    stim[55] = 31'h35899033;
    stim[56] = 31'h01591b53;
    stim[57] = 31'h0a004a1b;
    stim[58] = 31'h08c4dfc1;
    stim[59] = 31'h3c82723a;
    stim[60] = 31'h3f650b92;
    stim[61] = 31'h1d00cab8;
    stim[62] = 31'h01d5f44f;
    stim[63] = 31'h0eea0387;
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
      expv[0] = 44'hxxxxxxxxxxx;
      expv[1] = 44'h0000xxxxxxf;
      expv[2] = 44'h0000000000f;
      expv[3] = 44'h0000000000f;
      expv[4] = 44'h0000000001f;
      expv[5] = 44'h0000000001f;
      expv[6] = 44'h0000000001f;
      expv[7] = 44'h0000000000f;
      expv[8] = 44'h00000000009;
      expv[9] = 44'h0000000001f;
      expv[10] = 44'h0000000000f;
      expv[11] = 44'h8a00000001f;
      expv[12] = 44'h8a000000019;
      expv[13] = 44'h8a00000000f;
      expv[14] = 44'h8a00000000f;
      expv[15] = 44'h8a00000001f;
      expv[16] = 44'h8a00000000f;
      expv[17] = 44'h8a00000001f;
      expv[18] = 44'h8a00000000f;
      expv[19] = 44'h8a00000001f;
      expv[20] = 44'h8a00800001f;
      expv[21] = 44'h2e005a0001f;
      expv[22] = 44'h00005a0001f;
      expv[23] = 44'h0000000001f;
      expv[24] = 44'h0000000000f;
      expv[25] = 44'h0000000001f;
      expv[26] = 44'h0000000000f;
      expv[27] = 44'h0000000000f;
      expv[28] = 44'h0000000000f;
      expv[29] = 44'h0000000000f;
      expv[30] = 44'h00000000009;
      expv[31] = 44'h0000800000f;
      expv[32] = 44'h00007200019;
      expv[33] = 44'h4780720001f;
      expv[34] = 44'h4780720000f;
      expv[35] = 44'h47807200009;
      expv[36] = 44'h4780720001f;
      expv[37] = 44'h4780720001f;
      expv[38] = 44'h4e00720001f;
      expv[39] = 44'h4e007200019;
      expv[40] = 44'h4e00720001f;
      expv[41] = 44'h4e00720001f;
      expv[42] = 44'h4e00720001f;
      expv[43] = 44'h4e00720000f;
      expv[44] = 44'h4e007200009;
      expv[45] = 44'h00fe720000f;
      expv[46] = 44'h00fe7200019;
      expv[47] = 44'h00fe720000f;
      expv[48] = 44'h00fef20000f;
      expv[49] = 44'h00fe724019f;
      expv[50] = 44'h00fe72db7ff;
      expv[51] = 44'he10072db7ff;
      expv[52] = 44'he10072db7ff;
      expv[53] = 44'he10072db7ef;
      expv[54] = 44'he10072db7f9;
      expv[55] = 44'hcb0072db7ff;
      expv[56] = 44'hcb0072db7ef;
      expv[57] = 44'hcb0072db7f9;
      expv[58] = 44'h1b0072db7ff;
      expv[59] = 44'h1b0072db7e9;
      expv[60] = 44'h1b0072db7ef;
      expv[61] = 44'h1b0072db7f9;
      expv[62] = 44'hb80072db7ff;
      expv[63] = 44'hb80072db7ef;
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
