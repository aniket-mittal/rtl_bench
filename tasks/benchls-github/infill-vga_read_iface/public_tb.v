// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 49;
  localparam OW = 67;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  vga_read_iface dut (
    .wb_clk_i(clk),
    .wb_rst_i(in_vec[48:48]),
    .wbs_adr_i(in_vec[47:32]),
    .wbs_sel_i(in_vec[31:30]),
    .wbs_stb_i(in_vec[29:29]),
    .wbm_dat_i(in_vec[28:13]),
    .wbm_ack_i(in_vec[12:12]),
    .memory_mapping1(in_vec[11:11]),
    .read_mode(in_vec[10:10]),
    .read_map_select(in_vec[9:8]),
    .color_compare(in_vec[7:4]),
    .color_dont_care(in_vec[3:0]),
    .wbs_dat_o(out_vec[66:51]),
    .wbs_ack_o(out_vec[50:50]),
    .wbm_adr_o(out_vec[49:33]),
    .wbm_stb_o(out_vec[32:32]),
    .latch0(out_vec[31:24]),
    .latch1(out_vec[23:16]),
    .latch2(out_vec[15:8]),
    .latch3(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 49'h1fa88501990bc;
    stim[1] = 49'h17e40c35348e5;
    stim[2] = 49'h0be0793c4f7fa;
    stim[3] = 49'h0c9f31f059b28;
    stim[4] = 49'h08250bccf8394;
    stim[5] = 49'h045fed845c35b;
    stim[6] = 49'h02663d80850f8;
    stim[7] = 49'h0e95a7ba9aaa9;
    stim[8] = 49'h0258302200ee1;
    stim[9] = 49'h0e994db2666ae;
    stim[10] = 49'h0ab5845253a09;
    stim[11] = 49'h0a0ca47f57b37;
    stim[12] = 49'h017a9df453b6b;
    stim[13] = 49'h00faaf43dddb2;
    stim[14] = 49'h0dd21ee76fd1c;
    stim[15] = 49'h02036860c3358;
    stim[16] = 49'h0e6512e8ba055;
    stim[17] = 49'h0c3f0d7d20ecd;
    stim[18] = 49'h0e77689714c18;
    stim[19] = 49'h0c07b7d9f4866;
    stim[20] = 49'h011bbcefaa04f;
    stim[21] = 49'h0e01528bc49e4;
    stim[22] = 49'h04adac2aa88c0;
    stim[23] = 49'h002a766142339;
    stim[24] = 49'h0f4053727862a;
    stim[25] = 49'h00f898ba5703b;
    stim[26] = 49'h00a31c0345123;
    stim[27] = 49'h06d20047b7959;
    stim[28] = 49'h080be201aac06;
    stim[29] = 49'h0d1a5f2294d5f;
    stim[30] = 49'h0d483abc46196;
    stim[31] = 49'h0eb465152e67f;
    stim[32] = 49'h077b28022ca33;
    stim[33] = 49'h0ef114871c1ce;
    stim[34] = 49'h045a152a44c96;
    stim[35] = 49'h019abed774094;
    stim[36] = 49'h013c7b563d856;
    stim[37] = 49'h090eda2efacdc;
    stim[38] = 49'h0e0081318ecb5;
    stim[39] = 49'h0436fed7f4c34;
    stim[40] = 49'h0620628bcc487;
    stim[41] = 49'h05c5ecc69a0d5;
    stim[42] = 49'h0a2a6e285be5c;
    stim[43] = 49'h0055a6204643c;
    stim[44] = 49'h0ed7c63ea22a5;
    stim[45] = 49'h0ce498ddb88ba;
    stim[46] = 49'h05dd0e8045cb9;
    stim[47] = 49'h06dac19eb0adf;
    stim[48] = 49'h017547b000814;
    stim[49] = 49'h0d3a7c823b393;
    stim[50] = 49'h000d169b33088;
    stim[51] = 49'h0c93ae87a72f6;
    stim[52] = 49'h0bdaee8a6df13;
    stim[53] = 49'h0b977b39f78ff;
    stim[54] = 49'h0073e257f03af;
    stim[55] = 49'h09664fddb2e1b;
    stim[56] = 49'h0a60b6ec81589;
    stim[57] = 49'h0e28f6fb9de46;
    stim[58] = 49'h0b86cdf464798;
    stim[59] = 49'h0ccff6e5c0691;
    stim[60] = 49'h093c2316f0385;
    stim[61] = 49'h0edf27ecb1e81;
    stim[62] = 49'h0d0c6fb98e22b;
    stim[63] = 49'h053f56fcdafe5;
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
      expv[0] = 67'hxxxxxd44xxxxxxxxx;
      expv[1] = 67'h00001f20000000000;
      expv[2] = 67'h00001f03800000000;
      expv[3] = 67'h7c1604f9800000000;
      expv[4] = 67'h733e0128000000000;
      expv[5] = 67'h611722ff100000000;
      expv[6] = 67'h00001331900000000;
      expv[7] = 67'h000014ad1c0000000;
      expv[8] = 67'h1fde92c1942000000;
      expv[9] = 67'h000034ca142000000;
      expv[10] = 67'h000015ac142000000;
      expv[11] = 67'h1fd59065129000000;
      expv[12] = 67'h7d148bd49ab000000;
      expv[13] = 67'h000007d5129000000;
      expv[14] = 67'h46240e90ba1000000;
      expv[15] = 67'h1830901b5a1730000;
      expv[16] = 67'h50f73328da1733000;
      expv[17] = 67'h080001f85eeb76100;
      expv[18] = 67'h5a3a93bb5eeb76100;
      expv[19] = 67'h50f7003ddeeb76100;
      expv[20] = 67'h50f708dddeeb76100;
      expv[21] = 67'h39db900adeeb76100;
      expv[22] = 67'h50f7056d5eeb76100;
      expv[23] = 67'h18508153deeb76100;
      expv[24] = 67'h2141ba02deeb76100;
      expv[25] = 67'h50f707c4deeb76100;
      expv[26] = 67'h39db8518deeb72b00;
      expv[27] = 67'h39db96905eeb7a200;
      expv[28] = 67'h4600005f5eeb7db00;
      expv[29] = 67'h000008d2deeb7db00;
      expv[30] = 67'h39dbaa41da1732300;
      expv[31] = 67'h108035a35a1732300;
      expv[32] = 67'h11ed9bd95a1732300;
      expv[33] = 67'h39dbb788da1732300;
      expv[34] = 67'h460002d0da1732300;
      expv[35] = 67'h50f70cd5da1732300;
      expv[36] = 67'h50f709e3da1732300;
      expv[37] = 67'h018e0876fa173ab00;
      expv[38] = 67'h007010047a173ab00;
      expv[39] = 67'h2a7081b7fa173ab00;
      expv[40] = 67'h020031037a173ab00;
      expv[41] = 67'h50f72e2f7eeb71e00;
      expv[42] = 67'h558951537eeb71e00;
      expv[43] = 67'h226002ad0a173ab14;
      expv[44] = 67'h558f36be1eeb71e2d;
      expv[45] = 67'h50f707249eeb71e2d;
      expv[46] = 67'h00110ee81eeb71e2d;
      expv[47] = 67'h558f16d634073ab14;
      expv[48] = 67'h20110baa34073ab14;
      expv[49] = 67'h208ea9d3b22b71e2d;
      expv[50] = 67'h20110068b221d1e2d;
      expv[51] = 67'h558f249d522991e2d;
      expv[52] = 67'h00115ed77404d4314;
      expv[53] = 67'h20111cbb8404d4345;
      expv[54] = 67'h15fc039f3404d4345;
      expv[55] = 67'h00110b3232299d336;
      expv[56] = 67'h1b201305b404d4345;
      expv[57] = 67'h00c99147d2240d336;
      expv[58] = 67'h7d191c3672240ce36;
      expv[59] = 67'h2011267ff2240ce36;
      expv[60] = 67'h45bc09e172240ce36;
      expv[61] = 67'h5feed6f972240ce36;
      expv[62] = 67'h3ee7286302240ce58;
      expv[63] = 67'h1ee609fa940767df6;
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
