// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 108;
  localparam OW = 145;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_039009 dut (
    .g_clk(clk),
    .g_resetn(in_vec[107:107]),
    .mem_axi_awready(in_vec[106:106]),
    .mem_axi_wready(in_vec[105:105]),
    .mem_axi_bvalid(in_vec[104:104]),
    .mem_axi_arready(in_vec[103:103]),
    .mem_axi_rvalid(in_vec[102:102]),
    .mem_axi_rdata(in_vec[101:70]),
    .mem_instr(in_vec[69:69]),
    .mem_cen(in_vec[68:68]),
    .mem_addr(in_vec[67:36]),
    .mem_wdata(in_vec[35:4]),
    .mem_wstrb(in_vec[3:0]),
    .mem_axi_awvalid(out_vec[144:144]),
    .mem_axi_awaddr(out_vec[143:112]),
    .mem_axi_awprot(out_vec[111:109]),
    .mem_axi_wvalid(out_vec[108:108]),
    .mem_axi_wdata(out_vec[107:76]),
    .mem_axi_wstrb(out_vec[75:72]),
    .mem_axi_bready(out_vec[71:71]),
    .mem_axi_arvalid(out_vec[70:70]),
    .mem_axi_araddr(out_vec[69:38]),
    .mem_axi_arprot(out_vec[37:35]),
    .mem_axi_rready(out_vec[34:34]),
    .mem_stall(out_vec[33:33]),
    .mem_error(out_vec[32:32]),
    .mem_rdata(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 108'h47142a43d15f987216e7f4e7bdd;
    stim[1] = 108'h7100102a46fcb3e32af363a7fee;
    stim[2] = 108'he0bcb32c8e6fac2b34539bf7435;
    stim[3] = 108'hce8605c24880eb13b34014b19d1;
    stim[4] = 108'hc9c90b75fc1b265e0b8fac6d9eb;
    stim[5] = 108'hb2658cb756e7752725de9e32121;
    stim[6] = 108'hfd8bb73e0666c16e1f86388d93a;
    stim[7] = 108'h927f9f3dbd12e79024358bb1fda;
    stim[8] = 108'hfaecaec7b635366db75ee7cba48;
    stim[9] = 108'hfb88427a0179a735654f69de3fb;
    stim[10] = 108'hff4e7b7c929c17408609b82706d;
    stim[11] = 108'haec0bbb51427d8d2ccf70e7b98c;
    stim[12] = 108'hacdfdba8f11117f865548ccfb8a;
    stim[13] = 108'hc6a5cc21afc0f313e5c40e10210;
    stim[14] = 108'hf94524f6f36b8fb488abaa68470;
    stim[15] = 108'h8a34b2ecdf6da078355c2c3f851;
    stim[16] = 108'hd7930bc560c60fad026a7fe44b7;
    stim[17] = 108'h8edcb302df4ce4cbffcbf9e44d9;
    stim[18] = 108'hcf76c1099e89d67fa47f36ef951;
    stim[19] = 108'hf6e9047293b5d2a4b698e948e08;
    stim[20] = 108'he41882e77251ce468f6a4fb23b8;
    stim[21] = 108'h94cfed72f7ac8ffa5bd99c4a2c1;
    stim[22] = 108'h9d12d71570bc98db3528cec3fe2;
    stim[23] = 108'h8b51558772268cdb1581d09f4c5;
    stim[24] = 108'hc43ad124b1564302b19cdcb0007;
    stim[25] = 108'hd38d930d733943afbf8ad93af8b;
    stim[26] = 108'hc5d90f40269139f1acb2a354fb4;
    stim[27] = 108'ha73aaeaaf8dc6434cbc643bd5bc;
    stim[28] = 108'hfd0b0790962569e1778391d7285;
    stim[29] = 108'h818d4c1684c1ec4f32718d342eb;
    stim[30] = 108'hf4fa16705b39fbee41bb3daa98d;
    stim[31] = 108'hfed36838d3e5f77a3db61d2fd20;
    stim[32] = 108'hab0221a0771d065f71dc5c878db;
    stim[33] = 108'hbd3448799601bbf926044cf3cae;
    stim[34] = 108'h9cfdf630ba7733f6209eb0fcce4;
    stim[35] = 108'h90118e6e02e2ef4296e1321a780;
    stim[36] = 108'hd1392550af0af9448c26a1ef7ed;
    stim[37] = 108'hbb214d4dcb6faa016002d406daf;
    stim[38] = 108'h80d2b0aa39190b4ef68562d4aa7;
    stim[39] = 108'h99b88cde9b9ad04f367bb26ca14;
    stim[40] = 108'hac67968c73f76c4038cc6a937b8;
    stim[41] = 108'hedcb798ec8c08c1683765ca364f;
    stim[42] = 108'h96b6293ad8b13b25ae040a65394;
    stim[43] = 108'hf3032db6651050c103e4e714376;
    stim[44] = 108'hcc4cc49ab8ce35293ee7b215f25;
    stim[45] = 108'hae3b308032e52d88899823bbe94;
    stim[46] = 108'h8a1ce8ead2d9abce3e7b029b4e5;
    stim[47] = 108'hc1b71f3e5f20c9add1d2df24d55;
    stim[48] = 108'had649496d57b7b324472d5b009d;
    stim[49] = 108'hc08f87dfa3d6ae833614c4fffff;
    stim[50] = 108'he7f50880bb3be22cf49dc603907;
    stim[51] = 108'h892ef5842a18f27405f572f745f;
    stim[52] = 108'hdf3cb1d3005bce444a3e3de7262;
    stim[53] = 108'h85b74acbebb6323c7669134868f;
    stim[54] = 108'hb6fe720be11b3ccf72a95ca094e;
    stim[55] = 108'hb7ae3761e97daac15a1b42e79d5;
    stim[56] = 108'hdd98108b8c5943e0ed2254592d3;
    stim[57] = 108'hc09beff0d8f0dcff647a8dd680b;
    stim[58] = 108'he3269af7eddfb58df8254b3058f;
    stim[59] = 108'hdfbeb1ea7fdabfe5ba06e64957b;
    stim[60] = 108'hb337eddf3a3c2be4d9f67005998;
    stim[61] = 108'hb1183b22bcbc3f4284b3098cbe7;
    stim[62] = 108'he2fe19d2d2dfa0749a5da38c320;
    stim[63] = 108'h910d61e1caaaff4e13c1cd7baa1;
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
      expv[0] = 145'h0xxxxxxxx0xxxxxxxxxxxxxxxxxxxc50a90f4;
      expv[1] = 145'h0xxxxxxxx0xxxxxxxxxxxxxxxxxxx40040a91;
      expv[2] = 145'h0xxxxxxxx0xxxxxxxxxxxxxxxxxxx2f2ccb23;
      expv[3] = 145'h0xxxxxxxx0xxxxxxxxxxxxxxxxxxxa1817092;
      expv[4] = 145'h0xxxxxxxx0xxxxxxxxxxxxxxxxxxx7242dd7f;
      expv[5] = 145'h0xxxxxxxx0xxxxxxxxxxxxxxxxxxx99632dd5;
      expv[6] = 145'h0xxxxxxxx0xxxxxxxxxxxxxxxxxxx62edcf81;
      expv[7] = 145'h0xxxxxxxx0xxxxxxxxxxxxxxxxxxx9fe7cf6f;
      expv[8] = 145'h112e790241358bb1fdaxxxxxxxxxxbb2bb1ed;
      expv[9] = 145'h012e790240358bb1fdaxxxxxxxxxxe2109e80;
      expv[10] = 145'h179a7356514f69de3fbxxxxxxxxxxd39edf24;
      expv[11] = 145'h079a7356504f69de3fbxxxxxxxxxxb02eed45;
      expv[12] = 145'h079a7356504f69de3fbxxxxxxxxxx37f6ea3c;
      expv[13] = 145'h11117f8651548ccfb8axxxxxxxxxxa973086b;
      expv[14] = 145'h01117f8650548ccfb8axxxxxxxxxx51493dbc;
      expv[15] = 145'h01117f8650548ccfb8axxxxxxxxxx8d2cbb37;
      expv[16] = 145'h01117f8650548ccfb8axxxxxxxxxxe4c2f158;
      expv[17] = 145'h01117f8650548ccfb8axxxxxxxxxxb72cc0b7;
      expv[18] = 145'h14ce4cbff1cbf9e44d9xxxxxxxxxxddb04267;
      expv[19] = 145'h04ce4cbff0cbf9e44d9xxxxxxxxxxba411ca4;
      expv[20] = 145'h1b5d2a4b6198e948e08xxxxxxxxxx0620b9dc;
      expv[21] = 145'h0b5d2a4b6098e948e08xxxxxxxxxx33fb5cbd;
      expv[22] = 145'h1ac8ffa5b1d99c4a2c1xxxxxxxxxx44b5c55c;
      expv[23] = 145'h0ac8ffa5b0d99c4a2c1xxxxxxxxxxd45561dc;
      expv[24] = 145'h0ac8ffa5b0d99c4a2c1xxxxxxxxxx0eb4492c;
      expv[25] = 145'h1564302b119cdcb0007xxxxxxxxxxe364c35c;
      expv[26] = 145'h0564302b109cdcb0007xxxxxxxxxx7643d009;
      expv[27] = 145'h0564302b109cdcb0007xxxxxxxxxxceabaabe;
      expv[28] = 145'h0564302b109cdcb0007xxxxxxxxxx42c1e425;
      expv[29] = 145'h0564302b109cdcb0007xxxxxxxxxx635305a1;
      expv[30] = 145'h0564302b109cdcb0007xxxxxxxxxx3e859c16;
      expv[31] = 145'h139fbee411bb3daa98dxxxxxxxxxxb4da0e34;
      expv[32] = 145'h039fbee410bb3daa98dxxxxxxxxxxc088681d;
      expv[33] = 145'h039fbee410bb3daa98dxxxxxxxxxx4d121e65;
      expv[34] = 145'h039fbee410bb3daa98dxxxxxxxxxx3f7d8c2e;
      expv[35] = 145'h039fbee410bb3daa98dxxxxxxxxxx04639b80;
      expv[36] = 145'h039fbee410bb3daa98dxxxxxxxxxx4e49542b;
      expv[37] = 145'h10af9448c126a1ef7edxxxxxxxxxxc8535372;
      expv[38] = 145'h00af9448c026a1ef7edxxxxxxxxxx34ac2a8e;
      expv[39] = 145'h00af9448c026a1ef7edxxxxxxxxxx6e2337a6;
      expv[40] = 145'h19ad04f3617bb26ca14xxxxxxxxxx19e5a31c;
      expv[41] = 145'h09ad04f3607bb26ca14xxxxxxxxxx72de63b2;
      expv[42] = 145'h09ad04f3607bb26ca14xxxxxxxxxxad8a4eb6;
      expv[43] = 145'h09ad04f3607bb26ca14xxxxxxxxxxc0cb6d99;
      expv[44] = 145'h11050c1031e4e714376xxxxxxxxxx133126ae;
      expv[45] = 145'h01050c1030e4e714376xxxxxxxxxx8ecc200c;
      expv[46] = 145'h01050c1030e4e714376xxxxxxxxxx873a3ab4;
      expv[47] = 145'h01050c1030e4e714376xxxxxxxxxx6dc7cf97;
      expv[48] = 145'h120c9add11d2df24d55xxxxxxxxxx592525b5;
      expv[49] = 145'h17b7b3244172d5b009dxxxxxxxxxx23e1f7e8;
      expv[50] = 145'h07b7b3244072d5b009dxxxxxxxxxxfd42202e;
      expv[51] = 145'h13be22cf419dc603907xxxxxxxxxx4bbd610a;
      expv[52] = 145'h03be22cf409dc603907xxxxxxxxxxcf2c74c0;
      expv[53] = 145'h03be22cf409dc603907xxxxxxxxxx6dd2b2fa;
      expv[54] = 145'h1b6323c76169134868fxxxxxxxxxxbf9c82f8;
      expv[55] = 145'h0b6323c76069134868fxxxxxxxxxxeb8dd87a;
      expv[56] = 145'h0b6323c76069134868fxxxxxxxxxx660422e3;
      expv[57] = 145'h0b6323c76069134868fxxxxxxxxxx26fbfc36;
      expv[58] = 145'h0b6323c76069134868fxxxxxxxxxxc9a6bdfb;
      expv[59] = 145'h1dfb58df81254b3058fxxxxxxxxxxefac7a9f;
      expv[60] = 145'h1dabfe5ba106e64957bxxxxxxxxxxcdfb77ce;
      expv[61] = 145'h0dabfe5ba006e64957bxxxxxxxxxx460ec8af;
      expv[62] = 145'h0dabfe5ba006e64957bxxxxxxxxxxbf8674b4;
      expv[63] = 145'h0dabfe5ba006e64957bxxxxxxxxxx43587872;
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
