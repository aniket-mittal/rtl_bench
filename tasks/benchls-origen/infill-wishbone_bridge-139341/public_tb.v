// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 61;
  localparam OW = 59;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_139341 dut (
    .wbs_clk_i(clk),
    .sys_rst(in_vec[60:60]),
    .wbs_adr_i(in_vec[59:40]),
    .wbs_dat_i(in_vec[39:24]),
    .wbs_sel_i(in_vec[23:22]),
    .wbs_tga_i(in_vec[21:21]),
    .wbs_stb_i(in_vec[20:20]),
    .wbs_cyc_i(in_vec[19:19]),
    .wbs_we_i(in_vec[18:18]),
    .wbm_clk_i(in_vec[17:17]),
    .wbm_dat_i(in_vec[16:1]),
    .wbm_ack_i(in_vec[0:0]),
    .wbs_dat_o(out_vec[58:43]),
    .wbs_ack_o(out_vec[42:42]),
    .wbm_adr_o(out_vec[41:22]),
    .wbm_dat_o(out_vec[21:6]),
    .wbm_sel_o(out_vec[5:4]),
    .wbm_tga_o(out_vec[3:3]),
    .wbm_stb_o(out_vec[2:2]),
    .wbm_cyc_o(out_vec[1:1]),
    .wbm_we_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 61'h1ff110b2657268cc;
    stim[1] = 61'h1afecac5b85b6b3b;
    stim[2] = 61'h0a8efadce4058880;
    stim[3] = 61'h0c35e7ba433c9136;
    stim[4] = 61'h0d7d0861f8c7cb59;
    stim[5] = 61'h01614cb4cca5b28a;
    stim[6] = 61'h032cd369f0ce5490;
    stim[7] = 61'h0612c4904ceadff3;
    stim[8] = 61'h035980239d5f0e0e;
    stim[9] = 61'h0b71bc52d1edce42;
    stim[10] = 61'h078cc1d288df9aa4;
    stim[11] = 61'h068d2e2115ce244e;
    stim[12] = 61'h0e141caf3308c6ad;
    stim[13] = 61'h017973f25e49b1b7;
    stim[14] = 61'h021223b98644d72c;
    stim[15] = 61'h08ddf9128ff2afa7;
    stim[16] = 61'h00a9a2ce6baf52c5;
    stim[17] = 61'h04beb4a88cd0dc41;
    stim[18] = 61'h0f4b2c266bc26790;
    stim[19] = 61'h0cac6d365a823a32;
    stim[20] = 61'h080387c299540b2c;
    stim[21] = 61'h0a8ac1fd6177c475;
    stim[22] = 61'h0a113cddcdf8cb36;
    stim[23] = 61'h0f362aa91399f88d;
    stim[24] = 61'h0d2c55170fa5a249;
    stim[25] = 61'h0ce54df53aac057e;
    stim[26] = 61'h079983c0a1424cb2;
    stim[27] = 61'h078ff4c5d7ec7446;
    stim[28] = 61'h0d38adbc523c33ac;
    stim[29] = 61'h0064783f0c8ac4e1;
    stim[30] = 61'h023307433f294473;
    stim[31] = 61'h0acefae4131b25d6;
    stim[32] = 61'h18c7278793819668;
    stim[33] = 61'h0869dc14a9180e24;
    stim[34] = 61'h15274e4fac1b1e6f;
    stim[35] = 61'h0be65a3bf58f53ff;
    stim[36] = 61'h08fa4054fd4a3920;
    stim[37] = 61'h08668b1a5497ed0a;
    stim[38] = 61'h06c7d078b8b6a345;
    stim[39] = 61'h087e173a4012ea08;
    stim[40] = 61'h0d2375d3acbc9e9a;
    stim[41] = 61'h019a6fbcb9919335;
    stim[42] = 61'h03104c5685900070;
    stim[43] = 61'h08c143cb018f46a2;
    stim[44] = 61'h05c6bd2d9bab72e0;
    stim[45] = 61'h08c48a5e71d9dadb;
    stim[46] = 61'h020e73a6d35d7cb8;
    stim[47] = 61'h0a356ea3af280e60;
    stim[48] = 61'h0dd91f555bdbdfe4;
    stim[49] = 61'h0e5fd19d83528631;
    stim[50] = 61'h055d975121a0fac7;
    stim[51] = 61'h0cbfc4ebed6adb45;
    stim[52] = 61'h0f50862dc544a0bd;
    stim[53] = 61'h0f652ee60b3cdbed;
    stim[54] = 61'h05ee2c0270e87679;
    stim[55] = 61'h0b377bdc2fdd7a3d;
    stim[56] = 61'h01cebff284e10ffd;
    stim[57] = 61'h00daf7a9ded4eca5;
    stim[58] = 61'h027cde2d153b6c1d;
    stim[59] = 61'h0620030a01278080;
    stim[60] = 61'h0d05fa8fa50d5ce0;
    stim[61] = 61'h0647058ca92635ce;
    stim[62] = 61'h03d749eb54f52991;
    stim[63] = 61'h01c0328a309f4a97;
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
      expv[0] = 59'h000000000000000;
      expv[1] = 59'h000000000000000;
      expv[2] = 59'h000000000000000;
      expv[3] = 59'h000000000000000;
      expv[4] = 59'h000035f42187e31;
      expv[5] = 59'h30fc75f42187e31;
      expv[6] = 59'h000000000000000;
      expv[7] = 59'h000000000000000;
      expv[8] = 59'h000000000000000;
      expv[9] = 59'h000000000000000;
      expv[10] = 59'h2968c0000000000;
      expv[11] = 59'h000000000000000;
      expv[12] = 59'h108ac0000000000;
      expv[13] = 59'h000000000000000;
      expv[14] = 59'h000000000000000;
      expv[15] = 59'h000000000000000;
      expv[16] = 59'h000000000000000;
      expv[17] = 59'h000000000000000;
      expv[18] = 59'h000000000000000;
      expv[19] = 59'h000000000000000;
      expv[20] = 59'h000000000000000;
      expv[21] = 59'h000000000000000;
      expv[22] = 59'h000000000000000;
      expv[23] = 59'h000000000000000;
      expv[24] = 59'h7e2340000000000;
      expv[25] = 59'h0b87c0000000000;
      expv[26] = 59'h000000000000000;
      expv[27] = 59'h000000000000000;
      expv[28] = 59'h000000000000000;
      expv[29] = 59'h00000191e0fc322;
      expv[30] = 59'h31384191e0fc322;
      expv[31] = 59'h000000000000000;
      expv[32] = 59'h000000000000000;
      expv[33] = 59'h000000000000000;
      expv[34] = 59'h000000000000000;
      expv[35] = 59'h000000000000000;
      expv[36] = 59'h000000000000000;
      expv[37] = 59'h000000000000000;
      expv[38] = 59'h000000000000000;
      expv[39] = 59'h000000000000000;
      expv[40] = 59'h000000000000000;
      expv[41] = 59'h000000000000000;
      expv[42] = 59'h64cd40000000000;
      expv[43] = 59'h000000000000000;
      expv[44] = 59'h000000000000000;
      expv[45] = 59'h000000000000000;
      expv[46] = 59'h000000000000000;
      expv[47] = 59'h5369c0000000000;
      expv[48] = 59'h039840000000000;
      expv[49] = 59'h000000000000000;
      expv[50] = 59'h218c40000000000;
      expv[51] = 59'h000000000000000;
      expv[52] = 59'h000000000000000;
      expv[53] = 59'h000000000000000;
      expv[54] = 59'h000000000000000;
      expv[55] = 59'h1d9e40000000000;
      expv[56] = 59'h000000000000000;
      expv[57] = 59'h43ff40000000000;
      expv[58] = 59'h000000000000000;
      expv[59] = 59'h000000000000000;
      expv[60] = 59'h0500c0000000000;
      expv[61] = 59'h000000000000000;
      expv[62] = 59'h000000000000000;
      expv[63] = 59'h000000000000000;
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
