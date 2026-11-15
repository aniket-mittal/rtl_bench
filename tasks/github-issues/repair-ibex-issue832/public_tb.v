// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 108;
  localparam OW = 144;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  ibex_load_store_unit dut (
    .clk_i(clk),
    .rst_ni(in_vec[107:107]),
    .data_gnt_i(in_vec[106:106]),
    .data_rvalid_i(in_vec[105:105]),
    .data_err_i(in_vec[104:104]),
    .data_pmp_err_i(in_vec[103:103]),
    .data_rdata_i(in_vec[102:71]),
    .lsu_we_i(in_vec[70:70]),
    .lsu_type_i(in_vec[69:68]),
    .lsu_wdata_i(in_vec[67:36]),
    .lsu_sign_ext_i(in_vec[35:35]),
    .lsu_req_i(in_vec[34:34]),
    .adder_result_ex_i(in_vec[33:2]),
    .illegal_insn_id_i(in_vec[1:1]),
    .instr_valid_id_i(in_vec[0:0]),
    .data_req_o(out_vec[143:143]),
    .data_addr_o(out_vec[142:111]),
    .data_we_o(out_vec[110:110]),
    .data_be_o(out_vec[109:106]),
    .data_wdata_o(out_vec[105:74]),
    .lsu_rdata_o(out_vec[73:42]),
    .lsu_rdata_valid_o(out_vec[41:41]),
    .addr_incr_req_o(out_vec[40:40]),
    .addr_last_o(out_vec[39:8]),
    .lsu_req_done_o(out_vec[7:7]),
    .lsu_resp_valid_o(out_vec[6:6]),
    .load_err_o(out_vec[5:5]),
    .store_err_o(out_vec[4:4]),
    .load_o(out_vec[3:3]),
    .busy_o(out_vec[2:2]),
    .perf_load_o(out_vec[1:1]),
    .perf_store_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 108'h59f7acf79a2b60b1823ab0c379f;
    stim[1] = 108'h2cf8eeb713f36b78e3e3643a874;
    stim[2] = 108'hd6918ffc136aacdc393527b4a44;
    stim[3] = 108'ha66041c2cecd3b9aa437fad3cea;
    stim[4] = 108'hd995fd8bd9d56d04cb3082b3466;
    stim[5] = 108'h98ae7c89bb4724a2e9063fab754;
    stim[6] = 108'hf8b5c8ca2508cb6f47d9853a1dd;
    stim[7] = 108'hc4499d95a3188e690ea13a1c319;
    stim[8] = 108'hbfc927d83dfc6d951aff569a3f3;
    stim[9] = 108'h8091195f78cff41256499402dc7;
    stim[10] = 108'hca2098fca24c8ed8422930d483f;
    stim[11] = 108'ha8a4ae49244fdff76a4bfabcbd6;
    stim[12] = 108'h97becba3f147071a18d691887cf;
    stim[13] = 108'hd92f191c248269d395afa3a535d;
    stim[14] = 108'h9efe1151fc73e1d537549733465;
    stim[15] = 108'h87b0e696b1ff62c1afa9567090b;
    stim[16] = 108'hdb93c445f45b109fa3407fe3d3d;
    stim[17] = 108'hb90f83496221eeec7d1ecce69b3;
    stim[18] = 108'hbbf580eb22073fd35433bad3652;
    stim[19] = 108'habf16ba6c242ce7a09155d3aa2b;
    stim[20] = 108'hd0b2b03904f05b8f46e21d094d9;
    stim[21] = 108'hca0abecf9f339cf67a8ad1b7260;
    stim[22] = 108'h336d8873b1cd9778cbc884cb358;
    stim[23] = 108'hdc73a3225f75a99bff66403147f;
    stim[24] = 108'h8e87ef2844bf210097d20255c0e;
    stim[25] = 108'h8c80883c8f96d5d6626f90b2e62;
    stim[26] = 108'h91f369c038637987eacfa173c6a;
    stim[27] = 108'hbd26ccdba8b3a47b6b5b11e08fe;
    stim[28] = 108'h88f21746322f7b58e409636e6e5;
    stim[29] = 108'hc903bfd95c6791935bf170ce453;
    stim[30] = 108'hbf829786618817fa4e305954d7a;
    stim[31] = 108'hca731bd33748d9c636889b91cce;
    stim[32] = 108'ha889164dd8f4a379e939f0013a1;
    stim[33] = 108'hb1d7c56b3205e8180aac09dd8e7;
    stim[34] = 108'h9713d8189b29a280eb5ad7d38b2;
    stim[35] = 108'hd94aed84537bbdc87b0d736070c;
    stim[36] = 108'ha9579a7d6d43f800c704ae5697a;
    stim[37] = 108'hb3fd691982f3eec889abc886470;
    stim[38] = 108'hbb63bef6d4998fbfeede7e3369f;
    stim[39] = 108'hf527e72058bc38b61e4c892af60;
    stim[40] = 108'h8b598783f3d9cc31f22170f4226;
    stim[41] = 108'hcad03744238ae6bcb759ad70230;
    stim[42] = 108'hfe30c094c44951aa44d491cbf69;
    stim[43] = 108'hf375f322983c6623365675a4d93;
    stim[44] = 108'ha04cc4178af58b042a82d0f6961;
    stim[45] = 108'hb3047d775cdf35f2e4c7daac1d3;
    stim[46] = 108'hc685606c2f33c6fd93b1d381d82;
    stim[47] = 108'h8dadfaa9527389d7090ae4aebef;
    stim[48] = 108'hceb651d1306a7b88e22c37cabef;
    stim[49] = 108'hdb29c57e9ac6467585852647148;
    stim[50] = 108'h9330742d7c9579e687b49538a7c;
    stim[51] = 108'ha43bc68f084ff6cb83f01031bd2;
    stim[52] = 108'h91ebbf35b8a7ae3251c213db77c;
    stim[53] = 108'hde981e635ca580e9d7eb9cd964c;
    stim[54] = 108'hbb127287f0e4ec017a64bc7131b;
    stim[55] = 108'he0b75fde8f6a983cb90a1411983;
    stim[56] = 108'habb8b57135e88d194ec7e352c26;
    stim[57] = 108'h9146be36819ce743fab2d0b5d6d;
    stim[58] = 108'hb8cb9dc5bb9d8a8460311349771;
    stim[59] = 108'hf8e4f244066378c0a3e599f5272;
    stim[60] = 108'hbfcf1554ac76b5a4c8ad606bc67;
    stim[61] = 108'h80380769087562a8c9ab6c257f3;
    stim[62] = 108'hae36c2a16ca62f0d579578dabad;
    stim[63] = 108'h9a80fbcd0e66ce2aa3e8513b316;
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
      expv[0] = 144'h756186f22208ad82c4fbd67bcc0000000008;
      expv[1] = 144'hc6c8750e09ade38fce7c775b8a000000004a;
      expv[2] = 144'h6a4f69480ab370e5ab48c7fe080000000008;
      expv[3] = 144'h6ff5a79c526a9334ef3020e1660000000048;
      expv[4] = 144'h6105668c19b4132f54cafec5ec0000000008;
      expv[5] = 144'h0c7f56ea08928ba51c573e44dc0000000008;
      expv[6] = 144'hb30a743a611c232dbc5ae465100000000069;
      expv[7] = 144'hc274386211a438623bfffed0016614e87784;
      expv[8] = 144'hfead347e4ff1b6546800001c006614e87751;
      expv[9] = 144'h932805b83bd0495b3fffffbc006614e87784;
      expv[10] = 144'h5261a9062109323b625000000026500b7168;
      expv[11] = 144'h97f5797a7b7fdda93c9000000226500b7149;
      expv[12] = 144'had2310f820611c1c69f800000026500b710c;
      expv[13] = 144'hdf474a6a5e5609a74ffffe10015a4621f38c;
      expv[14] = 144'ha92e668c7b8754ddcc0000fc945a4621f369;
      expv[15] = 144'hd2ace1203306bffd8bffff58945a4621f30c;
      expv[16] = 144'h80ffc7a65e8d6c427c0001c9e1a559c2428c;
      expv[17] = 144'h3d99cd360487bbb1f4000087c0a559c24268;
      expv[18] = 144'h6775a6ca041cff4d500001fac0a559c24268;
      expv[19] = 144'h2aba754411e8250b380001f8b4a559c24268;
      expv[20] = 144'hc43a129a723d1bc16c00005958a559c24209;
      expv[21] = 144'h95a36e4c44ce73d9eb67cdc9e18874253604;
      expv[22] = 144'h9109966a31e32f365db6c439d8000000006a;
      expv[23] = 144'hcc80628e63fdd6a66e39d1912c0000000089;
      expv[24] = 144'ha404ab80625efc8400000003409900c51f51;
      expv[25] = 144'hdf2165cc465b575988000002409900c51f04;
      expv[26] = 144'h9f42e78c0e1fa98de40000001dbe42cb9804;
      expv[27] = 144'hb623c11e1daece91ec000001d5be42cb9804;
      expv[28] = 144'h92c6dcdc09ed6390bc00000319be42cb9804;
      expv[29] = 144'he2e19c8a419e464d6c000000adbe42cb9884;
      expv[30] = 144'h60b2a9ae33e93a205fc14bc330be42cb9850;
      expv[31] = 144'h1137239860d9236719398de998be42cb9800;
      expv[32] = 144'h73e002743fd28de7a4448b26ecbe42cb9850;
      expv[33] = 144'h5813bb1c0ba0602814ebe2b598be42cb9850;
      expv[34] = 144'hb5afa71604a68a03af89ec0c4cbe42cb9802;
      expv[35] = 144'h9ae6c0e021edeef720a576c228be42cb9884;
      expv[36] = 144'h095cad2e70031d0fe0000000aa35cd81c348;
      expv[37] = 144'h57910c8e07cfbb2224000001fc35cd81c368;
      expv[38] = 144'hbcfc66d263ba663efc000001b035cd81c369;
      expv[39] = 144'h991255ec3ef0e2d8780000029035cd81c30c;
      expv[40] = 144'hc2e1e8440b30c7cb65acc3c1f93224abd80c;
      expv[41] = 144'hb35ae046062b9af2dd681ba2113224abd88c;
      expv[42] = 144'ha92397ec72a9112544000002603224abd869;
      expv[43] = 144'haceb49b200f1988cd9914dacc152472fda84;
      expv[44] = 144'h05a1ed2c07d62c10aa0bc5acc052472fda50;
      expv[45] = 144'h8fb5583a7f7cd7cb92bbadacc052472fda51;
      expv[46] = 144'he3a703b044cf1bf64c3615acc052472fda84;
      expv[47] = 144'h15c95d7c2025ce275c000000a8c74e076000;
      expv[48] = 144'h586f957c2389a9ee2000000098c74e076000;
      expv[49] = 144'h0a4c8e2811d617191bffffff4cc74e076000;
      expv[50] = 144'h692a714e621e55e79bfffffebcc74e076000;
      expv[51] = 144'he020637a3d3fdb2e0fffffff84c74e076042;
      expv[52] = 144'h8427b6ee21469eb8cbfffffedcc74e076004;
      expv[53] = 144'hd739b2c8635e9603a4000001acc74e076084;
      expv[54] = 144'hc978e2623005eb93b13943f9acae73659352;
      expv[55] = 144'h9428233045aa60f2e7afef45acae73659304;
      expv[56] = 144'h8fc6a5844634653ba0000000992850466004;
      expv[57] = 144'he5a16bac07ea739d0c000003412850466084;
      expv[58] = 144'h622692ee06762a1183fffeddac2850466068;
      expv[59] = 144'hcb33ea4e458de3028ffffe01ac28504660e9;
      expv[60] = 144'h5ac0d78c7ad69321dbfffffe549667d49c50;
      expv[61] = 144'h56d84afe3dd58aa324000000849667d49c00;
      expv[62] = 144'h2af1b574615e98bc34000000b49667d49c40;
      expv[63] = 144'hd0a276624b38aa8d9bfffffe849667d49c01;
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
