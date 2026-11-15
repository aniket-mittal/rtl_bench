// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 46;
  localparam OW = 86;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_131626 dut (
    .wr_clk(clk),
    .ram_full_i(in_vec[45:45]),
    .rst_full_ff_i(in_vec[44:44]),
    .RD_PNTR_WR(in_vec[43:36]),
    .wr_en(in_vec[35:35]),
    .\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[1] (in_vec[34:34]),
    .din(in_vec[33:2]),
    .rd_clk(in_vec[1:1]),
    .rd_en(in_vec[0:0]),
    .full(out_vec[85:85]),
    .ram_full_fb_i_reg(out_vec[84:84]),
    .Q(out_vec[83:52]),
    .WEBWE(out_vec[51:48]),
    .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram (out_vec[47:16]),
    .\gic0.gc0.count_d2_reg[7] (out_vec[15:8]),
    .wr_data_count(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 46'h3102d25f138f;
    stim[1] = 46'h3830a34a4425;
    stim[2] = 46'h00dd4c7afe3c;
    stim[3] = 46'h218084ac74ca;
    stim[4] = 46'h21624a7bfccd;
    stim[5] = 46'h2a537ae0f7ae;
    stim[6] = 46'h2ec1ca095ad3;
    stim[7] = 46'h261de4c59613;
    stim[8] = 46'h24a31de7704a;
    stim[9] = 46'h26c32ccd7661;
    stim[10] = 46'h039da90bd6dd;
    stim[11] = 46'h0d82aae70565;
    stim[12] = 46'h2082fbe4afd4;
    stim[13] = 46'h2ad076ebba31;
    stim[14] = 46'h2196f96483ab;
    stim[15] = 46'h2f1e1b05ec05;
    stim[16] = 46'h2410e65abd2f;
    stim[17] = 46'h216b327149e7;
    stim[18] = 46'h2beef0963fe4;
    stim[19] = 46'h0ad8c84c7bfe;
    stim[20] = 46'h09288393a2e2;
    stim[21] = 46'h0256847414e0;
    stim[22] = 46'h0b026eddb2dc;
    stim[23] = 46'h265b6ad78a0c;
    stim[24] = 46'h084a54d299fb;
    stim[25] = 46'h2f6ff26ccca1;
    stim[26] = 46'h2f53eb718106;
    stim[27] = 46'h0f2f97c86ba8;
    stim[28] = 46'h21c374b2a00d;
    stim[29] = 46'h00476bbdd787;
    stim[30] = 46'h276667f7dcc8;
    stim[31] = 46'h2d5940fe31d9;
    stim[32] = 46'h2bb9707d77a5;
    stim[33] = 46'h2e1aa5937533;
    stim[34] = 46'h0aace53a7f99;
    stim[35] = 46'h0020ca93a66e;
    stim[36] = 46'h0b188d8058ed;
    stim[37] = 46'h3d6a6d60e275;
    stim[38] = 46'h03131b29caca;
    stim[39] = 46'h0f943713be17;
    stim[40] = 46'h247d082afa3c;
    stim[41] = 46'h20ab5fc8f437;
    stim[42] = 46'h017d4515276c;
    stim[43] = 46'h27de019b8752;
    stim[44] = 46'h2daba1f0aa86;
    stim[45] = 46'h0e65e8b7b536;
    stim[46] = 46'h271327463ef2;
    stim[47] = 46'h29bfe3ce73e4;
    stim[48] = 46'h2a7cb8a4e06f;
    stim[49] = 46'h0879be037e69;
    stim[50] = 46'h073d46bdeef9;
    stim[51] = 46'h29c2f44cbd95;
    stim[52] = 46'h223928756010;
    stim[53] = 46'h339a54af3909;
    stim[54] = 46'h285538d38246;
    stim[55] = 46'h09651aeeeac8;
    stim[56] = 46'h053f81ae5179;
    stim[57] = 46'h2e4dfdbfd161;
    stim[58] = 46'h02ce2a466f74;
    stim[59] = 46'h069d6c418b6b;
    stim[60] = 46'h207f037d917f;
    stim[61] = 46'h270b1a9eed16;
    stim[62] = 46'h07a4b36992bd;
    stim[63] = 46'h0df1959d53cf;
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
      expv[0] = 86'h0xxxxxxxx0xxxxxxxxxxxx;
      expv[1] = 86'h0xxxxxxxx0xxxxxxxxxxxx;
      expv[2] = 86'h0xxxxxxxxfxxxxxxxxxx00;
      expv[3] = 86'h0xxxxxxxx0531ebf8f0000;
      expv[4] = 86'h0xxxxxxxx0531ebf8f0000;
      expv[5] = 86'h0xxxxxxxx0531ebf8f0000;
      expv[6] = 86'h0xxxxxxxx0531ebf8f0000;
      expv[7] = 86'h0xxxxxxxxf531ebf8f0000;
      expv[8] = 86'h0xxxxxxxx0793165840000;
      expv[9] = 86'h0xxxxxxxx0793165840000;
      expv[10] = 86'h0xxxxxxxxf793165840000;
      expv[11] = 86'h0xxxxxxxx06a42f5b70000;
      expv[12] = 86'h0xxxxxxxx06a42f5b70000;
      expv[13] = 86'h0xxxxxxxx06a42f5b70000;
      expv[14] = 86'h0xxxxxxxx06a42f5b70000;
      expv[15] = 86'h0xxxxxxxxf6a42f5b70000;
      expv[16] = 86'h0xxxxxxxx086c17b010000;
      expv[17] = 86'h0xxxxxxxxf86c17b010000;
      expv[18] = 86'h0xxxxxxxxfcc9c52790000;
      expv[19] = 86'h0xxxxxxxxfbc258ff90000;
      expv[20] = 86'h0xxxxxxxxf32131eff0000;
      expv[21] = 86'h0xxxxxxxx032131eff0100;
      expv[22] = 86'h0xxxxxxxx032131eff0000;
      expv[23] = 86'h0xxxxxxxxf32131eff0000;
      expv[24] = 86'h0xxxxxxxxfdab5e2830000;
      expv[25] = 86'h0xxxxxxxxfdab5e2830100;
      expv[26] = 86'h0xxxxxxxx0fc9b33280000;
      expv[27] = 86'h0xxxxxxxxffc9b33280000;
      expv[28] = 86'h0xxxxxxxx0e5f21aea0000;
      expv[29] = 86'h0xxxxxxxx0e5f21aea0000;
      expv[30] = 86'h0xxxxxxxx0e5f21aea0000;
      expv[31] = 86'h0xxxxxxxxfe5f21aea0000;
      expv[32] = 86'h0xxxxxxxxf503f8c760000;
      expv[33] = 86'h0xxxxxxxxf503f8c760101;
      expv[34] = 86'h0xxxxxxxxf503f8c760200;
      expv[35] = 86'h0xxxxxxxx0394e9fe60000;
      expv[36] = 86'h0xxxxxxxxf394e9fe60000;
      expv[37] = 86'h0xxxxxxxxf2360163b0000;
      expv[38] = 86'h0xxxxxxxx02360163b0101;
      expv[39] = 86'h0xxxxxxxx02360163b0200;
      expv[40] = 86'h0xxxxxxxxf2360163b0000;
      expv[41] = 86'h0xxxxxxxxf420abe8f0000;
      expv[42] = 86'h0xxxxxxxxfd7f23d0d0000;
      expv[43] = 86'h0xxxxxxxxf514549db0000;
      expv[44] = 86'h0xxxxxxxxf8066e1d40000;
      expv[45] = 86'h0xxxxxxxx0e87c2aa10000;
      expv[46] = 86'h0xxxxxxxx0e87c2aa10000;
      expv[47] = 86'h0xxxxxxxxfe87c2aa10000;
      expv[48] = 86'h0xxxxxxxxff8f39cf90000;
      expv[49] = 86'h0xxxxxxxxf2e29381b0000;
      expv[50] = 86'h0xxxxxxxxf6f80df9a0000;
      expv[51] = 86'h0xxxxxxxx051af7bbe0000;
      expv[52] = 86'h0xxxxxxxxf51af7bbe0000;
      expv[53] = 86'h0xxxxxxxxf4a1d58040000;
      expv[54] = 86'h0xxxxxxxx04a1d58040100;
      expv[55] = 86'h0xxxxxxxx04a1d58040000;
      expv[56] = 86'h0xxxxxxxxf4a1d58040000;
      expv[57] = 86'h0xxxxxxxxfe06b945e0000;
      expv[58] = 86'h0xxxxxxxxf7f6ff4580000;
      expv[59] = 86'h0xxxxxxxxf8a919bdd0000;
      expv[60] = 86'h0xxxxxxxxf5b1062da0000;
      expv[61] = 86'h0xxxxxxxxfc0df645f0000;
      expv[62] = 86'h0xxxxxxxx0c6a7bb450000;
      expv[63] = 86'h0xxxxxxxx0c6a7bb450000;
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
