// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 200;
  localparam OW = 90;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_02738 dut (
    .clk(clk),
    .rst(in_vec[199:199]),
    .enable_CPU(in_vec[198:198]),
    .flush(in_vec[197:197]),
    .stall(in_vec[196:196]),
    .rs_inw(in_vec[195:164]),
    .rt_inw(in_vec[163:132]),
    .imm_inw(in_vec[131:100]),
    .write_back_data(in_vec[99:68]),
    .alu_result_back(in_vec[67:36]),
    .alu_op_inw(in_vec[35:30]),
    .rs_forward_inw(in_vec[29:28]),
    .rt_forward_inw(in_vec[27:26]),
    .alu_src_inw(in_vec[25:25]),
    .memory_write_inw(in_vec[24:24]),
    .memory_to_reg_inw(in_vec[23:23]),
    .reg_write_inw(in_vec[22:22]),
    .branch_isc_flag_inw(in_vec[21:21]),
    .pc_next_inw(in_vec[20:5]),
    .write_reg_addr_in_inw(in_vec[4:0]),
    .rd_value(out_vec[89:58]),
    .write_data(out_vec[57:26]),
    .branch_jump_flag(out_vec[25:25]),
    .branch_PC(out_vec[24:24]),
    .branch_addr(out_vec[23:8]),
    .write_reg_addr_out(out_vec[7:3]),
    .memory_write_out(out_vec[2:2]),
    .memory_to_reg_out(out_vec[1:1]),
    .reg_write_out(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 200'hd05df1ef86a64ab7768aa2a72b75e69c1e08953fc849bcfa8f;
    stim[1] = 200'hbdcb9ef73dbc7f3b4c2aa56fbf848585a91e569f841a5feaf2;
    stim[2] = 200'h1183ad4368bd2424ef325882d34b4c6b08bd6ba52b46389c2b;
    stim[3] = 200'h0090b6d4f48821467b122071c2c7937763823377290953108a;
    stim[4] = 200'h28e5f6756c4956aa06da584e4ab91340941c84ca399143c1e7;
    stim[5] = 200'h286c085f7039ff0af9eba8eb3e16929c7a20fa96e9e1e26501;
    stim[6] = 200'h41fb58741374b6152ddf7f337291e096807f43f09febfaca9d;
    stim[7] = 200'h3e127294de9932dae1ceaae8e09abfece45770eccd05650921;
    stim[8] = 200'h409eb87078b781698f1990333fa7fe452f598067c966002e91;
    stim[9] = 200'h5496bb34e3712a351468fdaea8a4cf6a2f868752ef92729d7b;
    stim[10] = 200'h34a8afe29c5923f85ac90287fa644bbdb2cd06594ccfa2675e;
    stim[11] = 200'h62ab87880e97afa7466334e83377e90286b4b30da5bbec8e3d;
    stim[12] = 200'h72f48f3974d3b60b49c1b0a7801ea787a769fdd590af036d51;
    stim[13] = 200'h4bd4e927d02e536c6704c0854fdaefc206bc5ea672ca5ebabe;
    stim[14] = 200'h3ee0b04d8a0ce8d303f25ec8771a63ea558871ec750cc78114;
    stim[15] = 200'h623ebe0a6d36134715daf4dfef615d56aefc7d398551fdb3b2;
    stim[16] = 200'h0768d9e4bb0330a4e659303fe1cc514222e93143ae78fa2f90;
    stim[17] = 200'h1c47144100ba3f93535f94ffa86a7ca94a07f25e12e48b2a9d;
    stim[18] = 200'h7e9381487c8f46bdc4f1602480fbedcd512cbb35c71f9484f1;
    stim[19] = 200'h1130d611f67de29c868940b8fe9aec4fcdc5755c6bbc0f30dc;
    stim[20] = 200'h9822d7e4d7c978a9d8459e57adcd499d01849c8522434fbe2b;
    stim[21] = 200'h5b068d27caeae32e33632a2157340c2ae7a85da01bd0ec4678;
    stim[22] = 200'h0a0d8e5b18e5a758835bb0db49445fe4818a758db89906af39;
    stim[23] = 200'h3fff776e1403aab28011af8c1b792399f36730cfdcf711c96c;
    stim[24] = 200'h1853244cb1fd64dae8aa2d83829e473d8901483f3a0e58561e;
    stim[25] = 200'h4542ec99821c9de22f861fcc4d4c83107438c6fd42f9042dbf;
    stim[26] = 200'h0b05d4f8fb926ddcb734456ec913c59b626dc53d0db65ededf;
    stim[27] = 200'h3decf98af277fb8f6d328f0ce8072a61b694000424e3c42393;
    stim[28] = 200'h3759ff407ff0de8d4376877db3bcd358d3638fa71897583a23;
    stim[29] = 200'h7b6d90447328e9fe8a07f225054b1475ed757b4cbf8287e46f;
    stim[30] = 200'h0277cda8910f7b6bad58654caaf9a742a4a084531277a48edd;
    stim[31] = 200'h59e0290a2afe85bf501f69a1cc24c109c9c2c8dd98b61d952c;
    stim[32] = 200'h37e995721a50e7ce29e32950abf71badf99c901342e53e7deb;
    stim[33] = 200'h029f64edf2c14c701a71fba0e058879bf76ce51451d3ae9bed;
    stim[34] = 200'h44e8db1e27d2550bd880726280d6a1ec571eeca0951b7b40fa;
    stim[35] = 200'h20133aa994d9b4105dc459c5d2d9ded8559061ad99e40dd106;
    stim[36] = 200'h4569c1bb6fb59547ef2134218c1268c8c8de34438edb0f81cb;
    stim[37] = 200'h51b1191207b619a123d0d134389750c553be1f73bdfc17f9c3;
    stim[38] = 200'h34ba00a2868465d00cad2b126ea8e8647de636b2f35bb5070d;
    stim[39] = 200'h7ee60c1af9348c96b6a3853e1bdf413db6b8c3ba5b0cfca47f;
    stim[40] = 200'h7b38e2379579a80468a8c1f4338f3a2c452922809ba5c0e879;
    stim[41] = 200'h74c299aea56b1932180d89e4d58d38ba0901a9cb6c95ecfcf9;
    stim[42] = 200'h5c5d841d917247285182a5665dd4efc3ae059fbedefa5665ca;
    stim[43] = 200'h2715d99288840ddd5b09b5330ebf958ea544c25c1d57c469af;
    stim[44] = 200'h47a6d2101eb329cb1b9f3f3878d88958995643bd9417efd6f4;
    stim[45] = 200'h4d136a0a59d15869450862da268c15b278df38c245b05f11e3;
    stim[46] = 200'h2cd4b28e9b35f595e5641a05b63891328140e267026dccee97;
    stim[47] = 200'h359cf5ff2fd3bd2bda77e4809fc21dcc18c71fee984282afb7;
    stim[48] = 200'h2ff9aa658df98ffd2c641f96c6d9d68e1c5fa507fbc7d51d94;
    stim[49] = 200'h7ace40f967d4b5e180515782905ea77d000edda8f2f706d381;
    stim[50] = 200'h5770f553a672067651a0f80a33530137d0acd666a5eae75285;
    stim[51] = 200'h27a6cb3379a5f627fbd2d687d204f42cb1675b4b3370a25647;
    stim[52] = 200'h06988f1ae6097086d3557a8365304fa273b99b181f181fd8db;
    stim[53] = 200'h71746b467ac53a183677e37ab697f772d7b2c62f229e73f277;
    stim[54] = 200'h625ee5ebb2e56b01ef350ba08cceaf639cfaa7cea4051211ce;
    stim[55] = 200'h306e9af4cafe5c4b6d735471c7b5eb7d22a35637819fe1ba67;
    stim[56] = 200'h08445e61fce889e703530fd77ee7f4269bc69f5ed80788d4b1;
    stim[57] = 200'h724fe3108be10a6d06b50d6724d5897914269b88c2d0ba2c2e;
    stim[58] = 200'h21479b5afa94ebb08e3fe90b879dfb92e22cc2beb114ecfe06;
    stim[59] = 200'h71412da3d7983a8200f204d378739af092b790db5fd69f9f8e;
    stim[60] = 200'h18a365cb3cb592f34394236ae6fffdb91509d37302a910e577;
    stim[61] = 200'h2d74c3c373faaf3f63aa779ea335f93a849276e21d62b03161;
    stim[62] = 200'h1709abe5c8945fe6d63ffdb820a1ce02d2b3875e8895439542;
    stim[63] = 200'h2c80131b4a31645b9ab6181d088afce6e14c6389f61aead2c9;
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
      expv[0] = 90'h00000000000000000000000;
      expv[1] = 90'h00000000000000000000000;
      expv[2] = 90'h00000000000000000000000;
      expv[3] = 90'h00000000000000000000000;
      expv[4] = 90'h00000000000000000000000;
      expv[5] = 90'h00000000000000000000000;
      expv[6] = 90'h00000000000000000000000;
      expv[7] = 90'h0000000001fd0fc27d654ef;
      expv[8] = 90'h0000000001fd0fc27d654ef;
      expv[9] = 90'h000000003e9ff9148017488;
      expv[10] = 90'h000000003e9ff9148017488;
      expv[11] = 90'h000000003e9ff9148017488;
      expv[12] = 90'h00000000000000000000000;
      expv[13] = 90'h00000000000000000000000;
      expv[14] = 90'h000000001af17a99cf5d5f1;
      expv[15] = 90'h000000001af17a99cf5d5f1;
      expv[16] = 90'h00000000000000000000000;
      expv[17] = 90'h00000000000000000000000;
      expv[18] = 90'h00000000000000000000000;
      expv[19] = 90'h00000000000000000000000;
      expv[20] = 90'h00000000000000000000000;
      expv[21] = 90'h00000000000000000000000;
      expv[22] = 90'h00000000000000000000000;
      expv[23] = 90'h00000000000000000000000;
      expv[24] = 90'h00000000000000000000000;
      expv[25] = 90'h00000000000000000000000;
      expv[26] = 90'h0000000010e31bf50216dfc;
      expv[27] = 90'h0000000010e31bf50216dfc;
      expv[28] = 90'h0000000010e31bf50216dfc;
      expv[29] = 90'h0000000010e31bf50216dfc;
      expv[30] = 90'h0000000010e31bf50216dfc;
      expv[31] = 90'h0000000010e31bf50216dfc;
      expv[32] = 90'h0000000010e31bf50216dfc;
      expv[33] = 90'h0000000010e31bf50216dfc;
      expv[34] = 90'h0000000010e31bf50216dfc;
      expv[35] = 90'h000000001c7bb2827da07d5;
      expv[36] = 90'h000000001c7bb2827da07d5;
      expv[37] = 90'h000000002378d10e07c0e5c;
      expv[38] = 90'h000000002378d10e07c0e5c;
      expv[39] = 90'h000000002378d10e07c0e5c;
      expv[40] = 90'h000000002378d10e07c0e5c;
      expv[41] = 90'h000000002378d10e07c0e5c;
      expv[42] = 90'h000000002378d10e07c0e5c;
      expv[43] = 90'h000000002378d10e07c0e5c;
      expv[44] = 90'h000000002378d10e07c0e5c;
      expv[45] = 90'h000000002362256277eb7a7;
      expv[46] = 90'h00000000274561a50f88f19;
      expv[47] = 90'h00000000274561a50f88f19;
      expv[48] = 90'h00000000274561a50f88f19;
      expv[49] = 90'h00000000274561a50f88f19;
      expv[50] = 90'h00000000274561a50f88f19;
      expv[51] = 90'h00000000274561a50f88f19;
      expv[52] = 90'h00000000274561a50f88f19;
      expv[53] = 90'h00000000274561a50f88f19;
      expv[54] = 90'h00000000274561a50f88f19;
      expv[55] = 90'h00000000000000000000000;
      expv[56] = 90'h00000000000000000000000;
      expv[57] = 90'h00000000000000000000000;
      expv[58] = 90'h00000000000000000000000;
      expv[59] = 90'h00000000000000000000000;
      expv[60] = 90'h00000000000000000000000;
      expv[61] = 90'h00000000000000000000000;
      expv[62] = 90'h00000000000000000000000;
      expv[63] = 90'h00000000000000000000000;
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
