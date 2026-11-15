// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 145;
  localparam OW = 72;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_06667 dut (
    .sel(in_vec[144:144]),
    .x0(in_vec[143:72]),
    .x1(in_vec[71:0]),
    .y(out_vec[71:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 145'h1aa60110fa09d45d3561e48b39a05a319215d;
    stim[1] = 145'h04e855ae814d45e42d92898a31be3b7beda31;
    stim[2] = 145'h152773101646c4a34cfe5b779ba1a18577d4d;
    stim[3] = 145'h0db905ff3dcda81c0dfdb38a27f73d1967e55;
    stim[4] = 145'h0bb4666ee7168a4ffe333f5cf1fedb52c6fea;
    stim[5] = 145'h062d2a76c043c1e10c370bf8d728c417208c7;
    stim[6] = 145'h03543e4b701bc0a25fd13aee6042ff3e3e8a1;
    stim[7] = 145'h1db6f51e41ce91aeb8e733bc265f1ab48f759;
    stim[8] = 145'h17018768f44af3e7319f58c98ad64ceec67dd;
    stim[9] = 145'h07e8e14cf6b94a02de03667b7fe04767aeb7b;
    stim[10] = 145'h0018af1f7ee544ce07f861598cc3e66548d3e;
    stim[11] = 145'h07c4a8b19efebb604c4be46e83a47f63c3a5b;
    stim[12] = 145'h19b581c578080ab92f68a9167c97bdecef94e;
    stim[13] = 145'h1f8f27aceb6fd7a8df30ce1bba610d2533caf;
    stim[14] = 145'h10534700cdd7e7b78d10fc16b2015f7a697dc;
    stim[15] = 145'h0aa0025105355f8a94ade731b2809ad3f9ef6;
    stim[16] = 145'h00ec8774a5c036ea8c6b8640c30a83565fcdf;
    stim[17] = 145'h081b31f726888fe142c1640ce6fc726814e90;
    stim[18] = 145'h1dfb96121cec923650bc72df94c68e6904e3d;
    stim[19] = 145'h049e80b6c6fa5dadf38453db093a9cc434bd7;
    stim[20] = 145'h007c4a7d46031094172a5a698f972fc305641;
    stim[21] = 145'h1d9dc5cf54f25b0560789d316545ed416c9bc;
    stim[22] = 145'h1907deea0b4ad58060e56add80203b166b57f;
    stim[23] = 145'h1774d4329434b8b76be93e4edd28e039117ff;
    stim[24] = 145'h196c0537b613b583308562b1f022cacce52bf;
    stim[25] = 145'h1b9c703180b33f47e86681a5d3858facd27f3;
    stim[26] = 145'h109c900daf2c43d643bcac086200a9ae8c1b8;
    stim[27] = 145'h1b70d591ccbb3e56018c439256400b754b8c0;
    stim[28] = 145'h0cff2369189ab30d9a5ae91767acb4ee73b39;
    stim[29] = 145'h1f028634512e375acb6ba236849ab45027dd6;
    stim[30] = 145'h03fdf836e600f7c5afa4423c7f7525976665f;
    stim[31] = 145'h061f52e7e2b0b58af6286b5563fcc35c1b056;
    stim[32] = 145'h0839cdc4189b61b21235b9e978c1dc590ed68;
    stim[33] = 145'h0810b19fe8fde715a890c9438c071455fdc13;
    stim[34] = 145'h0c38a9f60e4984bc46a8479e5a08c6f212e3e;
    stim[35] = 145'h0388aeac8270afd93b18cd3937e8b4f625c46;
    stim[36] = 145'h0c5b77e605fc4dc642d2d1d60c0afbd8c3f40;
    stim[37] = 145'h151284fd8ea980d679de273294879ce8aeeea;
    stim[38] = 145'h0e72e19f851d1e328b4cb4d4cf2376461fb6b;
    stim[39] = 145'h157a76d5a6890c54e60b5d0e7bfc3748d79dc;
    stim[40] = 145'h18792fa7f423b8449269d2af5b6a8eedf9178;
    stim[41] = 145'h099e44ad107e4f3dea0b9d3f8296fd0e4b658;
    stim[42] = 145'h1b87c2a21ad6c0ce89e6750dde21c87603665;
    stim[43] = 145'h1941a53221a35a75b3e304d97fd6224af78a4;
    stim[44] = 145'h09fe5f681595ced2f1baa30f289431b8b40e8;
    stim[45] = 145'h15801ceb5cb5fa53d32ed25ad619f467d47b3;
    stim[46] = 145'h130b5c4b361551e31c0968e5fe31bfcf5bc27;
    stim[47] = 145'h13c60fe85b91ca70a1b41cd5acd5622a233a3;
    stim[48] = 145'h1bdf6b68675dd01186b0e871c56f15a055c3a;
    stim[49] = 145'h08d85bf7fe6b6cc567ca870af58cb0613321a;
    stim[50] = 145'h092e32b0b1ecd5539ac72457524165625c34c;
    stim[51] = 145'h0f999ee81054194e49c6338b351e7b847e9ee;
    stim[52] = 145'h08d57251f57f883e6dcb00402c253d7dd3647;
    stim[53] = 145'h13982ef3ad065a85396f7217e983194a1fc5e;
    stim[54] = 145'h131f70e3178e29e67dbf56c9bef3ed207ca42;
    stim[55] = 145'h1f4f2a9e2eeafe4ef5d7741b49b4ad87b9407;
    stim[56] = 145'h13ef6625d9469ce135c812b702421c542fbd6;
    stim[57] = 145'h0301f43c4d7f9cc0f4604ed9afb8bd825886b;
    stim[58] = 145'h1eef288ba7e1a97db72bb609c93f02ea1c936;
    stim[59] = 145'h1c2ad998cd409577a056efc84186ec75057b1;
    stim[60] = 145'h0608952f11f206ba8033fbdc8414ccfcf2274;
    stim[61] = 145'h02dee67daa073468625b1e7f82467be71e141;
    stim[62] = 145'h0e5145ae054035429d79f90763dcd556bca9d;
    stim[63] = 145'h1c76904cf40818edf9ed162b49960003424ba;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 72'h1e48b39a05a319215d;
      expv[1] = 72'h4e855ae814d45e42d9;
      expv[2] = 72'he5b779ba1a18577d4d;
      expv[3] = 72'hdb905ff3dcda81c0df;
      expv[4] = 72'hbb4666ee7168a4ffe3;
      expv[5] = 72'h62d2a76c043c1e10c3;
      expv[6] = 72'h3543e4b701bc0a25fd;
      expv[7] = 72'h733bc265f1ab48f759;
      expv[8] = 72'hf58c98ad64ceec67dd;
      expv[9] = 72'h7e8e14cf6b94a02de0;
      expv[10] = 72'h018af1f7ee544ce07f;
      expv[11] = 72'h7c4a8b19efebb604c4;
      expv[12] = 72'h8a9167c97bdecef94e;
      expv[13] = 72'h0ce1bba610d2533caf;
      expv[14] = 72'h0fc16b2015f7a697dc;
      expv[15] = 72'haa0025105355f8a94a;
      expv[16] = 72'h0ec8774a5c036ea8c6;
      expv[17] = 72'h81b31f726888fe142c;
      expv[18] = 72'hc72df94c68e6904e3d;
      expv[19] = 72'h49e80b6c6fa5dadf38;
      expv[20] = 72'h07c4a7d46031094172;
      expv[21] = 72'h89d316545ed416c9bc;
      expv[22] = 72'h56add80203b166b57f;
      expv[23] = 72'h93e4edd28e039117ff;
      expv[24] = 72'h562b1f022cacce52bf;
      expv[25] = 72'h681a5d3858facd27f3;
      expv[26] = 72'hcac086200a9ae8c1b8;
      expv[27] = 72'hc439256400b754b8c0;
      expv[28] = 72'hcff2369189ab30d9a5;
      expv[29] = 72'hba236849ab45027dd6;
      expv[30] = 72'h3fdf836e600f7c5afa;
      expv[31] = 72'h61f52e7e2b0b58af62;
      expv[32] = 72'h839cdc4189b61b2123;
      expv[33] = 72'h810b19fe8fde715a89;
      expv[34] = 72'hc38a9f60e4984bc46a;
      expv[35] = 72'h388aeac8270afd93b1;
      expv[36] = 72'hc5b77e605fc4dc642d;
      expv[37] = 72'he273294879ce8aeeea;
      expv[38] = 72'he72e19f851d1e328b4;
      expv[39] = 72'hb5d0e7bfc3748d79dc;
      expv[40] = 72'h9d2af5b6a8eedf9178;
      expv[41] = 72'h99e44ad107e4f3dea0;
      expv[42] = 72'h6750dde21c87603665;
      expv[43] = 72'h304d97fd6224af78a4;
      expv[44] = 72'h9fe5f681595ced2f1b;
      expv[45] = 72'hed25ad619f467d47b3;
      expv[46] = 72'h968e5fe31bfcf5bc27;
      expv[47] = 72'h41cd5acd5622a233a3;
      expv[48] = 72'h0e871c56f15a055c3a;
      expv[49] = 72'h8d85bf7fe6b6cc567c;
      expv[50] = 72'h92e32b0b1ecd5539ac;
      expv[51] = 72'hf999ee81054194e49c;
      expv[52] = 72'h8d57251f57f883e6dc;
      expv[53] = 72'hf7217e983194a1fc5e;
      expv[54] = 72'hf56c9bef3ed207ca42;
      expv[55] = 72'h7741b49b4ad87b9407;
      expv[56] = 72'h812b702421c542fbd6;
      expv[57] = 72'h301f43c4d7f9cc0f46;
      expv[58] = 72'hbb609c93f02ea1c936;
      expv[59] = 72'h6efc84186ec75057b1;
      expv[60] = 72'h608952f11f206ba803;
      expv[61] = 72'h2dee67daa073468625;
      expv[62] = 72'he5145ae054035429d7;
      expv[63] = 72'hd162b49960003424ba;
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
