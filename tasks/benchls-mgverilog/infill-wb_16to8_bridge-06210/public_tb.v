// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 54;
  localparam OW = 54;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_06210 dut (
    .wb_clk_i(clk),
    .wb_rst_i(in_vec[53:53]),
    .wbs_adr_i(in_vec[52:37]),
    .wbs_sel_i(in_vec[36:35]),
    .wbs_we_i(in_vec[34:34]),
    .wbs_dat_i(in_vec[33:18]),
    .wbs_stb_i(in_vec[17:17]),
    .wbm_dat_i(in_vec[16:1]),
    .wbm_ack_i(in_vec[0:0]),
    .wbs_dat_o(out_vec[53:38]),
    .wbs_ack_o(out_vec[37:37]),
    .wbm_adr_o(out_vec[36:20]),
    .wbm_sel_o(out_vec[19:18]),
    .wbm_we_o(out_vec[17:17]),
    .wbm_dat_o(out_vec[16:1]),
    .wbm_stb_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 54'h33226c8dfc8dfc;
    stim[1] = 54'h3579b74423aaa0;
    stim[2] = 54'h03dbc71104995c;
    stim[3] = 54'h018b3bca48fd1f;
    stim[4] = 54'h13c0fa666484fb;
    stim[5] = 54'h00a0fb4aadeee3;
    stim[6] = 54'h1a23ba6f3d5aed;
    stim[7] = 54'h14f047c7c9b580;
    stim[8] = 54'h06a8f92d71a5d5;
    stim[9] = 54'h1d4cf4e8ae7083;
    stim[10] = 54'h163819c585c65e;
    stim[11] = 54'h12dd1b2f548fbb;
    stim[12] = 54'h06ea04bd43e9e2;
    stim[13] = 54'h11ee0538a8ed1a;
    stim[14] = 54'h1df4695b53853e;
    stim[15] = 54'h16ed77b2d8554c;
    stim[16] = 54'h06535364f9147d;
    stim[17] = 54'h12d0a14b214695;
    stim[18] = 54'h1c7b200207b0b4;
    stim[19] = 54'h14246f9111b582;
    stim[20] = 54'h0c2f7768b99f85;
    stim[21] = 54'h10548b5450de34;
    stim[22] = 54'h01978b797ddd0a;
    stim[23] = 54'h1961e48b98f42d;
    stim[24] = 54'h1c10e28fb35f9e;
    stim[25] = 54'h0d58adecd1d4dc;
    stim[26] = 54'h17b2bdd8adeae8;
    stim[27] = 54'h1bd45d0c4d12f7;
    stim[28] = 54'h19fdb413c23e55;
    stim[29] = 54'h13b78c264ef661;
    stim[30] = 54'h17c3da3c564fb7;
    stim[31] = 54'h1c0eb683e4ec76;
    stim[32] = 54'h0df4c147c0b9bd;
    stim[33] = 54'h0f6574a136137c;
    stim[34] = 54'h0db4b3db0a0dcf;
    stim[35] = 54'h07208bdada6e45;
    stim[36] = 54'h0e1319d2249a98;
    stim[37] = 54'h1de8bf681d5766;
    stim[38] = 54'h123a4e70fe22ef;
    stim[39] = 54'h1246fa01a5b4a0;
    stim[40] = 54'h162633aa63642d;
    stim[41] = 54'h0454ce89e1e73a;
    stim[42] = 54'h03555c2e310fb4;
    stim[43] = 54'h1b365f76e3a381;
    stim[44] = 54'h05bc2ffb448ea0;
    stim[45] = 54'h1eabb3f24e4459;
    stim[46] = 54'h016a5c5f5103cb;
    stim[47] = 54'h16079452e57c8d;
    stim[48] = 54'h00b6a7cfb2a13f;
    stim[49] = 54'h103a8858d45381;
    stim[50] = 54'h182215487ffc5f;
    stim[51] = 54'h0b344c14f97ba2;
    stim[52] = 54'h0d0badd62fc881;
    stim[53] = 54'h0acd4949165b60;
    stim[54] = 54'h0ef82eab1dd371;
    stim[55] = 54'h0b06b36322e779;
    stim[56] = 54'h2a5f8a8ccc6384;
    stim[57] = 54'h31215cfbdf9445;
    stim[58] = 54'h1f7cab3a779ad3;
    stim[59] = 54'h08855e7f0cfc8d;
    stim[60] = 54'h11250acfd19247;
    stim[61] = 54'h13743dc76f5e11;
    stim[62] = 54'h1febc94e761e84;
    stim[63] = 54'h1b48ed4b487b3f;
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
      expv[0] = 54'h3fxxx322xx00xx;
      expv[1] = 54'h14000579a40010;
      expv[2] = 54'h2b8003dbc40082;
      expv[3] = 54'h23c0018b240124;
      expv[4] = 54'h1f4003c0e40132;
      expv[5] = 54'h1c4000a0e40156;
      expv[6] = 54'h1d800a23a4019e;
      expv[7] = 54'h300004f04401e4;
      expv[8] = 54'h3a8006a8e400b8;
      expv[9] = 54'h10400d4ce40056;
      expv[10] = 54'h0bc006381400e3;
      expv[11] = 54'h374022dd140197;
      expv[12] = 54'h3c4006ea14005e;
      expv[13] = 54'h234001ee14009d;
      expv[14] = 54'h27c00df47400ad;
      expv[15] = 54'h298006ed7601d9;
      expv[16] = 54'h0f8026535401b3;
      expv[17] = 54'h128022d0b400a4;
      expv[18] = 54'h16800c7b340000;
      expv[19] = 54'h304004247401c9;
      expv[20] = 54'h30802c2f7601b5;
      expv[21] = 54'h068000549401aa;
      expv[22] = 54'h214001979401bc;
      expv[23] = 54'h05802961f40044;
      expv[24] = 54'h33c00c10f40146;
      expv[25] = 54'h1b800d58b400f7;
      expv[26] = 54'h1d0007b2b600ed;
      expv[27] = 54'h1ec02bd4560087;
      expv[28] = 54'h0a8029fdb60008;
      expv[29] = 54'h0c0003b7860127;
      expv[30] = 54'h36cc27c3d4011f;
      expv[31] = 54'h0ecc0c0ea401f2;
      expv[32] = 54'h378c0df4c401e0;
      expv[33] = 54'h2f8c0f6564009a;
      expv[34] = 54'h39cc0db4a40185;
      expv[35] = 54'h08b9e7209401ed;
      expv[36] = 54'h1339ce13040112;
      expv[37] = 54'h2cf9cde8a6000e;
      expv[38] = 54'h1df9c23a46007e;
      expv[39] = 54'h1439c246f40101;
      expv[40] = 54'h05b9e6263401d5;
      expv[41] = 54'h2779c454c600f0;
      expv[42] = 54'h36b9c355460118;
      expv[43] = 54'h3039cb36460170;
      expv[44] = 54'h1439c5bc3401fd;
      expv[45] = 54'h0b39eeabb401f9;
      expv[46] = 54'h3979c16a4601a8;
      expv[47] = 54'h11b9c607840172;
      expv[48] = 54'h27f9c0b6a401d8;
      expv[49] = 54'h3039e03a94002d;
      expv[50] = 54'h0bf9e8221600a4;
      expv[51] = 54'h3479cb3446007d;
      expv[52] = 54'h1039cd0ba60117;
      expv[53] = 54'h2c100acd5400a5;
      expv[54] = 54'h2e102ef8340155;
      expv[55] = 54'h2f102b06b401b0;
      expv[56] = 54'h30900a5f840067;
      expv[57] = 54'h088001214601ee;
      expv[58] = 54'h1a400f7ca4013a;
      expv[59] = 54'h1180288556013f;
      expv[60] = 54'h08c02125140166;
      expv[61] = 54'h020023743600e2;
      expv[62] = 54'h10800febc4013b;
      expv[63] = 54'h27c00b48e601a5;
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
