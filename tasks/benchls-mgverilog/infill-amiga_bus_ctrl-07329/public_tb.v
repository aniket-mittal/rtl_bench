// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 130;
  localparam OW = 78;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_07329 dut (
    .clk(clk),
    .clk7_en(in_vec[129:129]),
    .clk7n_en(in_vec[128:128]),
    .blk(in_vec[127:127]),
    .c1(in_vec[126:126]),
    .c3(in_vec[125:125]),
    .eclk(in_vec[124:115]),
    .vpa(in_vec[114:114]),
    .dbr(in_vec[113:113]),
    .dbs(in_vec[112:112]),
    .xbs(in_vec[111:111]),
    .nrdy(in_vec[110:110]),
    .cck(in_vec[109:109]),
    .cpu_speed(in_vec[108:108]),
    .memory_config(in_vec[107:104]),
    ._as(in_vec[103:103]),
    ._lds(in_vec[102:102]),
    ._uds(in_vec[101:101]),
    .r_w(in_vec[100:100]),
    .address(in_vec[99:77]),
    .cpudatain(in_vec[76:61]),
    .data_in(in_vec[60:45]),
    ._cpu_reset(in_vec[44:44]),
    .cpu_halt(in_vec[43:43]),
    .host_cs(in_vec[42:42]),
    .host_adr(in_vec[41:19]),
    .host_we(in_vec[18:18]),
    .host_bs(in_vec[17:16]),
    .host_wdat(in_vec[15:0]),
    .bls(out_vec[77:77]),
    .turbo(out_vec[76:76]),
    ._dtack(out_vec[75:75]),
    .rd(out_vec[74:74]),
    .hwr(out_vec[73:73]),
    .lwr(out_vec[72:72]),
    .address_out(out_vec[71:49]),
    .data(out_vec[48:33]),
    .data_out(out_vec[32:17]),
    .host_rdat(out_vec[16:1]),
    .host_ack(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 130'h16aa82d1c76d0d70c62a9171f775879c5;
    stim[1] = 130'h012f3436a567e32eaba3e5f27304e9c97;
    stim[2] = 130'h33e0d6cb3437a97a039a3e9b23a64cc3c;
    stim[3] = 130'h3bff94726c2c185826bc4612db556ed73;
    stim[4] = 130'h0b47ac8d63725912556158beb6437c88e;
    stim[5] = 130'h26ff4b4aff081d1dbc1942e0470b407cc;
    stim[6] = 130'h372f26a0cf8c53ea0dca9c264392d3172;
    stim[7] = 130'h049276658111c08498f452cd22791bf41;
    stim[8] = 130'h3e2af85462c31e3a466035318a69841e7;
    stim[9] = 130'h0ad31d33a3dea2bdba9cf6a4a61893a59;
    stim[10] = 130'h1fbc267b2451ce6a9b88b0b77a13fcfdd;
    stim[11] = 130'h1e5d46dfd295fb210a9b9663fa9c40ef8;
    stim[12] = 130'h0c85368956042d6b3843b481989c7d1d7;
    stim[13] = 130'h2c411de90b2ccf9876fc9006e03c61ebc;
    stim[14] = 130'h3b354fecd2d8403a4bf8be147532c2be1;
    stim[15] = 130'h2abf7d073ad3c4186c733099cf4bc01ec;
    stim[16] = 130'h08cbdcd91bd7e592232692e788b192f73;
    stim[17] = 130'h1d392ca33be6224fe680fad338a9649ec;
    stim[18] = 130'h015a3fef6eddcd7d2755664a242aedeaf;
    stim[19] = 130'h1743d08a50cc4b5a92a5e0c3340edc4a8;
    stim[20] = 130'h3b136c161c4b9510d08cdcfd8aa270da4;
    stim[21] = 130'h341715c54d369160ed5d22144d850f798;
    stim[22] = 130'h1662190fd045f972b45c82a2ed75e778c;
    stim[23] = 130'h335f7ed608f64913d775baa08df9e6da7;
    stim[24] = 130'h11ecb2610074fd67a95122a9cdb7ca7e1;
    stim[25] = 130'h0a4372800a703d2319354294c2220b4cb;
    stim[26] = 130'h3f2daec0fe60de952a32fa2a066989c03;
    stim[27] = 130'h3a744b1e98d83c9776b552c670129bf7e;
    stim[28] = 130'h16dac55349cf7acb02e664e2bbd6dec12;
    stim[29] = 130'h3de76522f520e30ebaf7e4c12d45d9e30;
    stim[30] = 130'h1224fa3b8a5ebe6769b8709bf0598dbdf;
    stim[31] = 130'h18e091c574fc3e12f863cc14dc5ff12c1;
    stim[32] = 130'h295e64b15bb832254028241e0727b74e0;
    stim[33] = 130'h33b7718f819f1131fa6f8e2323a27acd5;
    stim[34] = 130'h006dc14132cef81d89c192410a81f04c6;
    stim[35] = 130'h1b9c0c69c599433a4682b4a7093593d32;
    stim[36] = 130'h36031404375032075e3384dc30d34f18e;
    stim[37] = 130'h3a9f0dfed2133fd6fb431e9f4a1ed395f;
    stim[38] = 130'h2234eeb71402c639076d2669356256c2e;
    stim[39] = 130'h1dae28fe2f1ace655b1f80195da12e112;
    stim[40] = 130'h0f37f3c0fff67ea41ddcee0068ba43e83;
    stim[41] = 130'h39bb94a7581443c49c7f2005d8305d500;
    stim[42] = 130'h2527b3018e72a55c779decb12167132f4;
    stim[43] = 130'h0d41d50656d601a9a23678552d130a9bc;
    stim[44] = 130'h2d92df48d291c42008b68851a0dd356ab;
    stim[45] = 130'h14b962d087e37b11d479ca8a814ba1a19;
    stim[46] = 130'h30df45d6cac99049a979705196911d49e;
    stim[47] = 130'h0af871951c99756def6c8c938937e1ca6;
    stim[48] = 130'h0b7b9b0d1f4cbdcaa2e9264e7a9a9d08b;
    stim[49] = 130'h28d9880f818d14dcf39056493713f0e4e;
    stim[50] = 130'h396ce2cc5dea4b27081e2082e30fb9992;
    stim[51] = 130'h297c976229ee4f6ad7c95209be98e6f92;
    stim[52] = 130'h2e5eb8da89dee21d553a0c38bb3014961;
    stim[53] = 130'h2252c7ed9fed761c291d587df62ca450c;
    stim[54] = 130'h1ff8ef0159084633aedc32bb029cb2050;
    stim[55] = 130'h0a9f61d077c695aa4874dcab1af6c6158;
    stim[56] = 130'h2a5b3a78fffb7ef91f99a6f114595bb1e;
    stim[57] = 130'h38257802fe6771104a35641b590d59c3e;
    stim[58] = 130'h00fc7ef045aa0396693f383222b3fe44c;
    stim[59] = 130'h15b93b1816dc0c6c5e705c9241eb1b15d;
    stim[60] = 130'h05b48f5dbc5de0b8ea9554a7b62d3da0b;
    stim[61] = 130'h0b3f7bbffcdfc319779b3203530082627;
    stim[62] = 130'h0a7368be0a31ccd67ff15235bd72f3168;
    stim[63] = 130'h384df9630f75ea99da0b28cec63ee52f3;
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
      expv[0] = 78'hxxc76d0xxxxx70cxxxxx;
      expv[1] = 78'hxxa567exxxxx2eaxxxxx;
      expv[2] = 78'hx83437axxxxx7a0xxxxx;
      expv[3] = 78'h084b6d5xxxxxdaexxxxx;
      expv[4] = 78'h08fad90xxxxx911xxxxx;
      expv[5] = 78'h08811c2xxxxx0f9xxxxx;
      expv[6] = 78'h18990e4xxxxx62exxxxx;
      expv[7] = 78'h183489exxxxx7e8xxxxx;
      expv[8] = 78'h18c629axxxxx83cxxxxx;
      expv[9] = 78'h1892986xxxxx74bxxxxx;
      expv[10] = 78'h18dde84xxxxx9fbxxxxx;
      expv[11] = 78'h188fea7xxxxx1dfxxxxx;
      expv[12] = 78'h1806627xxxxxa3axxxxx;
      expv[13] = 78'h181b80fxxxxx3d7xxxxx;
      expv[14] = 78'h18d2d84xxxxx3a4xxxxx;
      expv[15] = 78'h183ad3cxxxxx186xxxxx;
      expv[16] = 78'h381bd7exxxxx922xxxxx;
      expv[17] = 78'h183be62xxxxx4fexxxxx;
      expv[18] = 78'h386eddcxxxxx7d2xxxxx;
      expv[19] = 78'h3850cc4xxxxx5a9xxxxx;
      expv[20] = 78'h181c4b9xxxxx10dxxxxx;
      expv[21] = 78'h384d369xxxxx60exxxxx;
      expv[22] = 78'h3cd045fxxxxx72bxxxxx;
      expv[23] = 78'h3808f64xxxxx13dxxxxx;
      expv[24] = 78'h380074fxxxxx67axxxxx;
      expv[25] = 78'h380a703xxxxx231xxxxx;
      expv[26] = 78'h18fe60dxxxxx952xxxxx;
      expv[27] = 78'h1b98d83xxxxx977xxxxx;
      expv[28] = 78'h188aef5ab553d824b552;
      expv[29] = 78'h1804b516b5533c60b552;
      expv[30] = 78'h386fc166b553b7beb552;
      expv[31] = 78'h3853717eb5522582b552;
      expv[32] = 78'h18781c9eb552e9c0b552;
      expv[33] = 78'h188c8e88b55359aab552;
      expv[34] = 78'h1832cef8b5521d88b552;
      expv[35] = 78'h18c59942b5533a46b552;
      expv[36] = 78'h18375032b552075eb552;
      expv[37] = 78'h18d2133eb553d6fab552;
      expv[38] = 78'h18a4d588b552d85cb552;
      expv[39] = 78'h18657684b553c224b552;
      expv[40] = 78'h3801a2e8b5527d06b552;
      expv[41] = 78'h381760c0b553aa00b552;
      expv[42] = 78'h18c4859cb55265e8b552;
      expv[43] = 78'h1854b44cb5535378b552;
      expv[44] = 78'h18468374b552ad56b552;
      expv[45] = 78'h1c87e37ab55311d4b552;
      expv[46] = 78'h18cac990b55249a8b552;
      expv[47] = 78'h381c9974b5536deeb552;
      expv[48] = 78'h3a1f4cbd6c8dcaa36c8c;
      expv[49] = 78'h1a818d14e926dcf2e926;
      expv[50] = 78'h085dea4ae9272708e926;
      expv[51] = 78'h0826fa62e926df24e926;
      expv[52] = 78'h08e2ecc0e92692c2e926;
      expv[53] = 78'h089fed76e9261c28e926;
      expv[54] = 78'h18590846e92633aee926;
      expv[55] = 78'h1877c694e927aa48e926;
      expv[56] = 78'h18fffb7ee926f91ee926;
      expv[57] = 78'h086d6434e927387ce926;
      expv[58] = 78'h08c88acee927c898e926;
      expv[59] = 78'h084907ace92762bae926;
      expv[60] = 78'h089ed8b4e927b416e926;
      expv[61] = 78'h080d4c02e9264c4ee926;
      expv[62] = 78'h08d6f5cae92662d0e926;
      expv[63] = 78'h083b18fae926a5e6e926;
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
