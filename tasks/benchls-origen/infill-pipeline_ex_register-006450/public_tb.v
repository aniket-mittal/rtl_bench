// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 149;
  localparam OW = 148;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_006450 dut (
    .clk(clk),
    .clrn(in_vec[148:148]),
    .dwreg(in_vec[147:147]),
    .dm2reg(in_vec[146:146]),
    .dwmem(in_vec[145:145]),
    .djal(in_vec[144:144]),
    .D_WZ(in_vec[143:143]),
    .D_BRANCH(in_vec[142:142]),
    .daluc(in_vec[141:137]),
    .D_BDEPEND(in_vec[136:135]),
    .D_ADEPEND(in_vec[134:133]),
    .da(in_vec[132:101]),
    .db(in_vec[100:69]),
    .dimm(in_vec[68:37]),
    .dpc4(in_vec[36:5]),
    .drn(in_vec[4:0]),
    .ewreg(out_vec[147:147]),
    .em2reg(out_vec[146:146]),
    .ewmem(out_vec[145:145]),
    .ejal(out_vec[144:144]),
    .E_WZ(out_vec[143:143]),
    .DE_BRANCH(out_vec[142:142]),
    .ealuc(out_vec[141:137]),
    .E_BDEPEND(out_vec[136:135]),
    .E_ADEPEND(out_vec[134:133]),
    .ea(out_vec[132:101]),
    .eb(out_vec[100:69]),
    .eimm(out_vec[68:37]),
    .epc4(out_vec[36:5]),
    .ern(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 149'h0dfd21ea8a8f50578a40e2fee436f79ce44088;
    stim[1] = 149'h0b4006cdf6380179e3de9ec1fc51025213d48b;
    stim[2] = 149'h10fd36d33c054b6f46d45eb09e585f74b2927e;
    stim[3] = 149'h14d0f4ed16bd29730dd3fe85be7f7d0db7307d;
    stim[4] = 149'h19b8027a0dbcc30d91676c0181184de1f748ef;
    stim[5] = 149'h1cb90e35dafbd6ea829b4e6bbb335473ba08ce;
    stim[6] = 149'h152b61931a41e759aa905aad779cbfacc008a7;
    stim[7] = 149'h1f6fdaeb8e0975b962c578d0d3985ae0a2c375;
    stim[8] = 149'h1d79f65f2ffcf151b56592f34f62488b009c01;
    stim[9] = 149'h1079b4226b7c761c6fce12395fc144ed20f113;
    stim[10] = 149'h1a59ad032cc7d04a7c125987dad8b7e0f813aa;
    stim[11] = 149'h11f6647b8765c7df7c3fd5cb2deef637d7b7ff;
    stim[12] = 149'h107c35181fe42ebb4b8e46fb35d5f1f9991322;
    stim[13] = 149'h129fd61b0c4f8cd18a2ebd5d7fb581d4d8fda7;
    stim[14] = 149'h1ccc4e09866faeef9dc7d249f6612231092779;
    stim[15] = 149'h1b7607ad6f4895efbbd57ab9590423098641a1;
    stim[16] = 149'h1907672ed6972070082ed5fe1cdff4d527f2e6;
    stim[17] = 149'h1ad3f2e6a5d9e878b1b3643bdf4489cde01c18;
    stim[18] = 149'h1e88f933dd9dde48d945f717093e68ac67f0e9;
    stim[19] = 149'h1f78fc4c5f67e05006c81be8c9b31ca3fb6d12;
    stim[20] = 149'h1e294ba39e35c981b4912d431b54ca6235d879;
    stim[21] = 149'h152001e1c062ccd5a4ee53eef037be5f22bc7e;
    stim[22] = 149'h1e9df04771298ffe5693dffca78521c68abe2f;
    stim[23] = 149'h17a8c5918194d7eaafdea25eedebca25520718;
    stim[24] = 149'h1c55428c4991baa9f7acf60b8a85b7ebe6f414;
    stim[25] = 149'h19e86dd3c69f49e1965ec11c05046000d1cb3f;
    stim[26] = 149'h17242ab707726b577ef07c013e8fcd94dd430e;
    stim[27] = 149'h182c730a868080ce0a47df3b96a62054ce2a19;
    stim[28] = 149'h162fe313e2de4b097b260f263a710eefe9909a;
    stim[29] = 149'h12e00c53770bca8714e56cdf2d231fc3b0610a;
    stim[30] = 149'h180316b5487fe0161aa41d066496a1d5661020;
    stim[31] = 149'h16588483abefb37f66c391af70b1f694eb9c0f;
    stim[32] = 149'h18d9320c25935be865d08b7408dcb78d8d3491;
    stim[33] = 149'h18b4c3dbbdde1f424c3d1d9ba3d06545728909;
    stim[34] = 149'h1b7e623378b909b8f19060c07368a5510a3dc5;
    stim[35] = 149'h1adef454459a97f7212eab031bd32040271f2c;
    stim[36] = 149'h1fc382835ef71a1872c273d657de9bd0fa20af;
    stim[37] = 149'h1c3034982bac9a67a6aacd8bcffc4aa8e33a5f;
    stim[38] = 149'h10b13aedf5f8e39ff7d163fd3f955be7a9c5f5;
    stim[39] = 149'h122b3ec521498a89c8791ebb95ae69e64d6fa3;
    stim[40] = 149'h10eb27159811bb04459d6715a385a602c6c232;
    stim[41] = 149'h18a256ae7f2e05e344b5119c912a8eb6311c9f;
    stim[42] = 149'h1841d188a9aa0c1f95dc5cea5f30952ddeb009;
    stim[43] = 149'h18e38f47950ac1063a9f62b2d5354555007d0a;
    stim[44] = 149'h14c2fa7956fa03f279bd6e1ac8f654cadfffd7;
    stim[45] = 149'h1b7f2827923402ad55b3dfbb7c72a4f71c6b33;
    stim[46] = 149'h10cfb73125aa20f810bdabf7d7af568cec6c37;
    stim[47] = 149'h1fea6343176a0539e4a0d8fea9f94e07d4647f;
    stim[48] = 149'h160e7a17d9ce70e51194f68711dc2e9798a27a;
    stim[49] = 149'h1d9440b86ce5f4403c85ae587b1065330ca16d;
    stim[50] = 149'h1993daf4e331e4822a4389e0ffa4cdabb890e7;
    stim[51] = 149'h1dcf6c1334a7f3b5918dd0cac1208bcf88ad21;
    stim[52] = 149'h1086dfe7ee5a49aff87ee055bd07c63ca07fee;
    stim[53] = 149'h15af9b321b2a6d3d9581df6974589c68f87127;
    stim[54] = 149'h159654c151202be110787f3e29dd9aba54347c;
    stim[55] = 149'h167fca664a10b80abb4736177056532a7e5505;
    stim[56] = 149'h1b5c6bfdab5b0ab8c4af720749e6b74f59e95c;
    stim[57] = 149'h131735f66833fa262a101169c1cae578b76da1;
    stim[58] = 149'h1a367ca1ddbedcb205204bf059b977c164be38;
    stim[59] = 149'h19fcbb2e5ca943cb045460f66d16721c44c8a3;
    stim[60] = 149'h1018bc50d083ff4fa60f34ca2da57f78691f10;
    stim[61] = 149'h1dfe7ce6cabdb0ddc6910a55e424a6495b278f;
    stim[62] = 149'h1d23a72bf97e474955d192a465bc97c7c13265;
    stim[63] = 149'h1c0ba5155b81ef15cadb38b78bb8254b127917;
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
      expv[0] = 148'h0000000000000000000000000000000000000;
      expv[1] = 148'h0000000000000000000000000000000000000;
      expv[2] = 148'h0000000000000000000000000000000000000;
      expv[3] = 148'h0fd36d33c054b6f46d45eb09e585f74b2927e;
      expv[4] = 148'h4d0f4ed16bd29730dd3fe85be7f7d0db7307d;
      expv[5] = 148'h9b8027a0dbcc30d91676c0181184de1f748ef;
      expv[6] = 148'hcb90e35dafbd6ea829b4e6bbb335473ba08ce;
      expv[7] = 148'h52b61931a41e759aa905aad779cbfacc008a7;
      expv[8] = 148'hf6fdaeb8e0975b962c578d0d3985ae0a2c375;
      expv[9] = 148'hd79f65f2ffcf151b56592f34f62488b009c01;
      expv[10] = 148'h079b4226b7c761c6fce12395fc144ed20f113;
      expv[11] = 148'ha59ad032cc7d04a7c125987dad8b7e0f813aa;
      expv[12] = 148'h1f6647b8765c7df7c3fd5cb2deef637d7b7ff;
      expv[13] = 148'h07c35181fe42ebb4b8e46fb35d5f1f9991322;
      expv[14] = 148'h29fd61b0c4f8cd18a2ebd5d7fb581d4d8fda7;
      expv[15] = 148'hccc4e09866faeef9dc7d249f6612231092779;
      expv[16] = 148'hb7607ad6f4895efbbd57ab9590423098641a1;
      expv[17] = 148'h907672ed6972070082ed5fe1cdff4d527f2e6;
      expv[18] = 148'had3f2e6a5d9e878b1b3643bdf4489cde01c18;
      expv[19] = 148'he88f933dd9dde48d945f717093e68ac67f0e9;
      expv[20] = 148'hf78fc4c5f67e05006c81be8c9b31ca3fb6d12;
      expv[21] = 148'he294ba39e35c981b4912d431b54ca6235d879;
      expv[22] = 148'h52001e1c062ccd5a4ee53eef037be5f22bc7e;
      expv[23] = 148'he9df04771298ffe5693dffca78521c68abe2f;
      expv[24] = 148'h7a8c5918194d7eaafdea25eedebca25520718;
      expv[25] = 148'hc55428c4991baa9f7acf60b8a85b7ebe6f414;
      expv[26] = 148'h9e86dd3c69f49e1965ec11c05046000d1cb3f;
      expv[27] = 148'h7242ab707726b577ef07c013e8fcd94dd430e;
      expv[28] = 148'h82c730a868080ce0a47df3b96a62054ce2a19;
      expv[29] = 148'h62fe313e2de4b097b260f263a710eefe9909a;
      expv[30] = 148'h2e00c53770bca8714e56cdf2d231fc3b0610a;
      expv[31] = 148'h80316b5487fe0161aa41d066496a1d5661020;
      expv[32] = 148'h6588483abefb37f66c391af70b1f694eb9c0f;
      expv[33] = 148'h8d9320c25935be865d08b7408dcb78d8d3491;
      expv[34] = 148'h8b4c3dbbdde1f424c3d1d9ba3d06545728909;
      expv[35] = 148'hb7e623378b909b8f19060c07368a5510a3dc5;
      expv[36] = 148'hadef454459a97f7212eab031bd32040271f2c;
      expv[37] = 148'hfc382835ef71a1872c273d657de9bd0fa20af;
      expv[38] = 148'hc3034982bac9a67a6aacd8bcffc4aa8e33a5f;
      expv[39] = 148'h0b13aedf5f8e39ff7d163fd3f955be7a9c5f5;
      expv[40] = 148'h22b3ec521498a89c8791ebb95ae69e64d6fa3;
      expv[41] = 148'h0eb27159811bb04459d6715a385a602c6c232;
      expv[42] = 148'h8a256ae7f2e05e344b5119c912a8eb6311c9f;
      expv[43] = 148'h841d188a9aa0c1f95dc5cea5f30952ddeb009;
      expv[44] = 148'h8e38f47950ac1063a9f62b2d5354555007d0a;
      expv[45] = 148'h4c2fa7956fa03f279bd6e1ac8f654cadfffd7;
      expv[46] = 148'hb7f2827923402ad55b3dfbb7c72a4f71c6b33;
      expv[47] = 148'h0cfb73125aa20f810bdabf7d7af568cec6c37;
      expv[48] = 148'hfea6343176a0539e4a0d8fea9f94e07d4647f;
      expv[49] = 148'h60e7a17d9ce70e51194f68711dc2e9798a27a;
      expv[50] = 148'hd9440b86ce5f4403c85ae587b1065330ca16d;
      expv[51] = 148'h993daf4e331e4822a4389e0ffa4cdabb890e7;
      expv[52] = 148'hdcf6c1334a7f3b5918dd0cac1208bcf88ad21;
      expv[53] = 148'h086dfe7ee5a49aff87ee055bd07c63ca07fee;
      expv[54] = 148'h5af9b321b2a6d3d9581df6974589c68f87127;
      expv[55] = 148'h59654c151202be110787f3e29dd9aba54347c;
      expv[56] = 148'h67fca664a10b80abb4736177056532a7e5505;
      expv[57] = 148'hb5c6bfdab5b0ab8c4af720749e6b74f59e95c;
      expv[58] = 148'h31735f66833fa262a101169c1cae578b76da1;
      expv[59] = 148'ha367ca1ddbedcb205204bf059b977c164be38;
      expv[60] = 148'h9fcbb2e5ca943cb045460f66d16721c44c8a3;
      expv[61] = 148'h018bc50d083ff4fa60f34ca2da57f78691f10;
      expv[62] = 148'hdfe7ce6cabdb0ddc6910a55e424a6495b278f;
      expv[63] = 148'hd23a72bf97e474955d192a465bc97c7c13265;
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
