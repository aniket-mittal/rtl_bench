// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 112;
  localparam OW = 111;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_04067 dut (
    .clk(clk),
    .rst(in_vec[111:111]),
    .icbiu_dat_i(in_vec[110:79]),
    .icbiu_ack_i(in_vec[78:78]),
    .icbiu_err_i(in_vec[77:77]),
    .ic_en(in_vec[76:76]),
    .icqmem_adr_i(in_vec[75:44]),
    .icqmem_cycstb_i(in_vec[43:43]),
    .icqmem_ci_i(in_vec[42:42]),
    .icqmem_sel_i(in_vec[41:38]),
    .icqmem_tag_i(in_vec[37:34]),
    .spr_cs(in_vec[33:33]),
    .spr_write(in_vec[32:32]),
    .spr_dat_i(in_vec[31:0]),
    .icbiu_dat_o(out_vec[110:79]),
    .icbiu_adr_o(out_vec[78:47]),
    .icbiu_cyc_o(out_vec[46:46]),
    .icbiu_stb_o(out_vec[45:45]),
    .icbiu_we_o(out_vec[44:44]),
    .icbiu_sel_o(out_vec[43:40]),
    .icbiu_cab_o(out_vec[39:39]),
    .icqmem_dat_o(out_vec[38:7]),
    .icqmem_ack_o(out_vec[6:6]),
    .icqmem_rty_o(out_vec[5:5]),
    .icqmem_err_o(out_vec[4:4]),
    .icqmem_tag_o(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 112'h80309dbf12fa2d017d140b49dcb9;
    stim[1] = 112'h9f7ce66256a79bd298093ab10985;
    stim[2] = 112'h294d8a17573048d55de1435623cb;
    stim[3] = 112'h1095f3eb5d267f721d689d82c83d;
    stim[4] = 112'h635c53ac4bfb59cbe0e01642f005;
    stim[5] = 112'h02c6f95c66dee36d4bf89a395832;
    stim[6] = 112'h6e5cd90c28389be46280f834272c;
    stim[7] = 112'h4321bcc10ef688de3a34fa5a8205;
    stim[8] = 112'h0d25e8367c7e36dbc91241d13082;
    stim[9] = 112'h26473d8c86bf6c727a7bd2dba498;
    stim[10] = 112'h642c00ce44c40b418f927f5c6d08;
    stim[11] = 112'h6a1d8795be6cdeeb57f6e25dfe38;
    stim[12] = 112'h4b266c1561cf0651be7caf103c79;
    stim[13] = 112'h0517b72064fd0008da7a94e8c978;
    stim[14] = 112'h4152e0fcb9837bf8308eba528d88;
    stim[15] = 112'h1716e8d73dccd68c75a3903c3c24;
    stim[16] = 112'h2a3dc205e295a8d05eddea3ac4a2;
    stim[17] = 112'h6ee0a4b09f052bda370e2da0694a;
    stim[18] = 112'h68d010266c28649ecb6dd20ddc8e;
    stim[19] = 112'h7cc9f21a30e731abb15287b0d2d4;
    stim[20] = 112'hea28ef93b9ffc8f829af45c2058d;
    stim[21] = 112'h385d4041a255a874a36c9279922a;
    stim[22] = 112'h0eca499a91dc615cae9234736e98;
    stim[23] = 112'h759f7bffefcc2f8c0e5fe995469e;
    stim[24] = 112'h0b9a79e7b5a094e3f57dc0e4d449;
    stim[25] = 112'h6589bd6747004cf53b562c27ebf9;
    stim[26] = 112'h7c6ce5a3f12d6f1c27de7a2096df;
    stim[27] = 112'h1b6224032423b26936798ef4cf14;
    stim[28] = 112'h3028459ed1b375512da6f10653fd;
    stim[29] = 112'h2a901b29b3ed3986e087fb0cca4e;
    stim[30] = 112'h4173fdd72651d3e98a0da8999d6d;
    stim[31] = 112'h56b0b4223c8d7db56f1c3f5ceb3a;
    stim[32] = 112'h531c3a2f2585bedd4f268c9268b7;
    stim[33] = 112'h76f11768f077f1b1ff38678b28f1;
    stim[34] = 112'h09749dcc275cf37c03de6bbd0ede;
    stim[35] = 112'h1a8f16790abf221ed79d87450678;
    stim[36] = 112'h3af88576ac32136e40623d405239;
    stim[37] = 112'h49162d6b24fd81b9480530e33b75;
    stim[38] = 112'h14a2e8935813d130b0da56c401cb;
    stim[39] = 112'h5ae30ad8933f3bd27015a3f9d30f;
    stim[40] = 112'h1f8e3c636af2c2012384a35cf29e;
    stim[41] = 112'h1177b7bdf05ce283cdf824ee3858;
    stim[42] = 112'h620f437ba10456204f49de84511a;
    stim[43] = 112'h67bfe9be529da1f7458eae241aeb;
    stim[44] = 112'h03424f1cceb41da3a1c9b9d36a10;
    stim[45] = 112'h18ff61fca89eee2501cf7db8658c;
    stim[46] = 112'h012d8659b93829fb42aecb4aeff7;
    stim[47] = 112'h07673034f7648e1129fb6eda0b94;
    stim[48] = 112'h4ffdad389a0873d6ec789622cc35;
    stim[49] = 112'h3ebfa3ba464555553ca57c84b5d8;
    stim[50] = 112'h0a77b4d0ac7125a140eda7b84e32;
    stim[51] = 112'h4445df6cf08a595cd6b418446be1;
    stim[52] = 112'h0a09f659bfb71b6bde5ce778192e;
    stim[53] = 112'h2a150d2fed1004b4952d21c3a7cc;
    stim[54] = 112'h56c9c84f0df206e1e21b4f591a1c;
    stim[55] = 112'h7c4d1a931a4744153c4474996ced;
    stim[56] = 112'h7303fae07e6971df76609ef74998;
    stim[57] = 112'h6c17d7aa922cfcffa9eb7d38a038;
    stim[58] = 112'h1951c0f0c84674c987975de12f62;
    stim[59] = 112'h179875aa2e5e4116c1bb91e02fb9;
    stim[60] = 112'h505177229a8022bbd3f70367969c;
    stim[61] = 112'h5ab5643d4d517866df77d423ef82;
    stim[62] = 112'h41ed822616c47ef693f82bc25fdd;
    stim[63] = 112'h24948b156ef4c073edb0a2e5fad8;
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
      expv[0] = 111'h0000000017d1680b840000000025;
      expv[1] = 111'h00000000353cde94800000000022;
      expv[2] = 111'h00000000398246aa870000000028;
      expv[3] = 111'h00000000xxxxxxxxxfxxxxxxxxxa;
      expv[4] = 111'h000000005fdace5f03635c53ac48;
      expv[5] = 111'h0000000036f71b6a6f02c6f95c51;
      expv[6] = 111'h0000000041c4df230a6e5cd90c11;
      expv[7] = 111'h0000000077b446f1e84321bcc12d;
      expv[8] = 111'h0000000063f1b6de04xxxxxxxxx4;
      expv[9] = 111'h00000000xxxxxxxxx926473d8cae;
      expv[10] = 111'h0000000026205a0c6e642c00ce44;
      expv[11] = 111'h000000007366f75a8fxxxxxxxxxd;
      expv[12] = 111'h000000000e78328de94b266c1551;
      expv[13] = 111'h0000000027e80046e90517b72051;
      expv[14] = 111'h000000004c1bdfc182xxxxxxxxx3;
      expv[15] = 111'h000000006e66b46386xxxxxxxxx8;
      expv[16] = 111'h0000000014ad4682eb2a3dc205d1;
      expv[17] = 111'h0000000078295ed18cxxxxxxxxx3;
      expv[18] = 111'h00000000614324f66d68d0102651;
      expv[19] = 111'h0000000007398d5d85xxxxxxxxx4;
      expv[20] = 111'h000000004ffe47c106000000002b;
      expv[21] = 111'h0000000012ad43a50d385d404191;
      expv[22] = 111'h000000000ee30ae50axxxxxxxxx4;
      expv[23] = 111'h00000000xxxxxxxxx9759f7bffd1;
      expv[24] = 111'h000000002d04a71f85xxxxxxxxxf;
      expv[25] = 111'h00000000380267a9ed6589bd6745;
      expv[26] = 111'h00000000096b78e10fxxxxxxxxx7;
      expv[27] = 111'h00000000211d9349891b62240311;
      expv[28] = 111'h000000000d9baa8906xxxxxxxxx9;
      expv[29] = 111'h00000000xxxxxxxxxfxxxxxxxxx1;
      expv[30] = 111'h00000000328e9f4c684173fdd711;
      expv[31] = 111'h00000000646bedab0cxxxxxxxxx7;
      expv[32] = 111'h000000002c2df6ea6c531c3a2f11;
      expv[33] = 111'h0000000003bf8d8f8cxxxxxxxxxe;
      expv[34] = 111'h000000003ae79be00f09749dcc11;
      expv[35] = 111'h0000000055f910f68e1a8f167927;
      expv[36] = 111'h0000000061909b72013af8857691;
      expv[37] = 111'h0000000027ec0dca6049162d6b11;
      expv[38] = 111'h00000000409e898583xxxxxxxxx6;
      expv[39] = 111'h0000000019f9de9380xxxxxxxxx5;
      expv[40] = 111'h00000000579610090e1f8e3c6351;
      expv[41] = 111'h0000000002e7141e07xxxxxxxxxe;
      expv[42] = 111'h00000000xxxxxxxxxd620f437b91;
      expv[43] = 111'h0000000014ed0fba06xxxxxxxxx3;
      expv[44] = 111'h0000000075a0ed1d0703424f1cc2;
      expv[45] = 111'h0000000044f771280718ff61fc91;
      expv[46] = 111'h0000000049c14fda0axxxxxxxxxb;
      expv[47] = 111'h000000003b24708907xxxxxxxxxe;
      expv[48] = 111'h00000000xxxxxxxxxfxxxxxxxxxe;
      expv[49] = 111'h00000000322aaaa9e23ebfa3ba49;
      expv[50] = 111'h0000000063892d0a030a77b4d091;
      expv[51] = 111'h000000000452cae68axxxxxxxxxd;
      expv[52] = 111'h000000007db8db5e89xxxxxxxxx7;
      expv[53] = 111'h00000000xxxxxxxxx42a150d2fd1;
      expv[54] = 111'h000000006f90370f0856c9c84f26;
      expv[55] = 111'h00000000523a20a981xxxxxxxxx1;
      expv[56] = 111'h00000000734b8efb89xxxxxxxxx8;
      expv[57] = 111'h000000001167e7fd07xxxxxxxxxa;
      expv[58] = 111'h000000004233a64c0e1951c0f0c5;
      expv[59] = 111'h0000000072f208b606179875aa11;
      expv[60] = 111'h00000000540115de8fxxxxxxxxxd;
      expv[61] = 111'h000000006a8bc336ed5ab5643d4d;
      expv[62] = 111'h000000003623f7b48fxxxxxxxxxe;
      expv[63] = 111'h0000000077a6039f6624948b1551;
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
