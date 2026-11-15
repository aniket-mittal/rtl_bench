// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 199;
  localparam OW = 90;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_02735 dut (
    .clk(clk),
    .rst(in_vec[198:198]),
    .enable_CPU(in_vec[197:197]),
    .flush(in_vec[196:196]),
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
    .memory_write(out_vec[2:2]),
    .memory_to_reg(out_vec[1:1]),
    .reg_write(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 199'h6fa371f1508973ffa14ab5f8e8779cfc99a0b23d7bbdebb996;
    stim[1] = 199'h5545dcab0d184f92bdeef37cd9c9a6e1d4a2947656e83d2fae;
    stim[2] = 199'h3989b2e9741616b953bcf8fac0ad9a335aa0c5afc5efda24fb;
    stim[3] = 199'h140cbc19d44d5dfb359da420bfff03c91c38242e8bb00542a9;
    stim[4] = 199'h15ed9d69b232c5138a81ab8ab5b7f5e9ff4cf2704edc1b0eb4;
    stim[5] = 199'h1af9ee7aa28ff826071ac34b15c831d1cc696b077dc77a6b43;
    stim[6] = 199'h206de9276f8b3ec333e97348668474d454bc349187474090b8;
    stim[7] = 199'h147bee09e2943849d922582bc903e703f2e3a8ab7d046d03d9;
    stim[8] = 199'h3a73184d50724edaef5a5c4c34174377067a2129c3e32c1640;
    stim[9] = 199'h27266a76ca26112a37577c043075f3305cc767b2574ac9fc56;
    stim[10] = 199'h186353c8b48271c99a55be092c77d12641bae1d3da39a8fcce;
    stim[11] = 199'h09e06a4c88878a7880a7aeea9dbc816fdfd7f609fb898e55ee;
    stim[12] = 199'h1a907849089bd524550564f64a84a154513d89fd54f1e501d2;
    stim[13] = 199'h0d37cc893b65828ed630a7f88a801562db5232d7db204781dd;
    stim[14] = 199'h0508552e2f86d4f78d31d5f1460c8c63d88cc9cd3f8eaa3fdd;
    stim[15] = 199'h3a6871bbe7b01e01a316bbfd7dda51ac28d59ebad57f000afd;
    stim[16] = 199'h02ffbb581d4cf97f1682983830811504350670ee86d877c710;
    stim[17] = 199'h1bcf088704fecdde1d7cdc35116ca0c6e44387fa61e5230323;
    stim[18] = 199'h1b3f04cc5857ded995cff89c48052f86afcdaf08545e6de382;
    stim[19] = 199'h1688cf7f1b8c7df87d4795f86e9b05a34d875a14faadbeaea5;
    stim[20] = 199'h2f7b3972bef618615a9fa868c44b635f7301f79fba66ffb98d;
    stim[21] = 199'h2892ecee3c7e203ddb5226e70c2885c433dd908812586d2b41;
    stim[22] = 199'h3558940a1b61dc8d921589c3b0c772b1a29bd33b837c11b2e8;
    stim[23] = 199'h0ea67b8722647ffcc122bfa67445d2dd37fdf80e5b392a33ce;
    stim[24] = 199'h28637e4e3c8be0febfa3378a720a3e7c6188b754a73b83200a;
    stim[25] = 199'h39d7dbafd2fc3dfe0e04b27732fb5e638f2640c0c64cd6ed8e;
    stim[26] = 199'h2420b8d7174f7f59e3b65b52f87d0630e7a101e29cf20c6a2d;
    stim[27] = 199'h1798983f3272fb42b555c276ed86c312480d9773693705c843;
    stim[28] = 199'h0b054f253d98b60223bc206e12d32e4b16d3ecb218577d011c;
    stim[29] = 199'h30fa1b72b8428fdce468f967bbc3aa9daa92b1c489ca903f02;
    stim[30] = 199'h2c9443b8479e0a9d72f0e5b2beb1795aef48a9837565fa3727;
    stim[31] = 199'h0898c5fb76947c8f60273bdd8829ab2d8ccde369a03addf371;
    stim[32] = 199'h15ef1ec7f7700e2ace52c1c6fd230098d908f66cb5a86bafda;
    stim[33] = 199'h3ce1c85f0856e65e11d874923a83a1d56a9eb9b5213c68e569;
    stim[34] = 199'h37c780977934cd91d7bead1f8cd63e0c6a4317b91fc2fc6360;
    stim[35] = 199'h39d93018f93a9e60ab4ce300730575620f3ed9fca2e973558c;
    stim[36] = 199'h3f2e738791597e57383837430f4812a7944b121a7d0558a1b9;
    stim[37] = 199'h3ffe49e7bdef39af31528234e721ac4af0ebc1a9636822d6b4;
    stim[38] = 199'h192ff2d3c3120dff158122faa4d6fc8d0cccd0689a29079a48;
    stim[39] = 199'h280fb9d63bb7e9cc059da573b0648a370f8c5c9756afead5a8;
    stim[40] = 199'h113bdab3ac6be570323ff7bed502acb5e4641a3d63163c38dd;
    stim[41] = 199'h2a0e1790f05db5b9cef97d08cef74edcfc34d245415adf1fb7;
    stim[42] = 199'h3da4da920cdd29b797d2dfa508599cf00d488a5435516412e5;
    stim[43] = 199'h3de679d55f6446bd2ac17c386f978e6f6f0c1092cdf92f1971;
    stim[44] = 199'h08f8ad6279bda0672ca79747a08367b850f2ffe64e53c9f319;
    stim[45] = 199'h3c56785fb820f1bc45a8616e53822a1587a9baccff98d2d6bf;
    stim[46] = 199'h073df992a40da15cc06a567fa6c4ddfa4eb71bd2831477844d;
    stim[47] = 199'h2ef424b0979688d19aa9f1d8c2712437934ab7ee8ad591debf;
    stim[48] = 199'h10d6d1bf0919ccf4fea49ce4584b59bdbd37acd1d6fedd4c70;
    stim[49] = 199'h17866226e8fe9f538ba36c8463f7d4ac1085d3f5003b837928;
    stim[50] = 199'h39b1eea2a47e8e80413d7188dad0b4b8a242acc5891ffdf698;
    stim[51] = 199'h1f2c5a5b787d811011c7266eb62b80bcda074519d9b8752690;
    stim[52] = 199'h0e97f169328cda7e22f2bae66d881d3deb242ae283cf0aa2e4;
    stim[53] = 199'h247ee59a69b6bafb6352756ba3725909d2e93c88f0aad25bae;
    stim[54] = 199'h007c4a28e2d464346382f737325567eb83af5248822259620a;
    stim[55] = 199'h2ae6261b9fba4e4d7084c07ddeb96594104c797f7e7527ddb0;
    stim[56] = 199'h256d3be39b213aa2349ca58c19830766a5977dcaed54aa2293;
    stim[57] = 199'h27ddac58551a2d5b28199c7bd0dd22a7e63f8c60ad02c76f15;
    stim[58] = 199'h2ca5aff2f7c7decd780f89ab228e31f0e03d3500c4f297a795;
    stim[59] = 199'h213419e858d2ff422ee078c4924a2d469ee4e720bd7c41ab04;
    stim[60] = 199'h2cf77e63c93f6fcb4199dc9ae1e57887736a1f63a4b1aba230;
    stim[61] = 199'h0a38f8f964012cfdc1dfb971e00e9dd7c4e5d091c5d6eb6259;
    stim[62] = 199'h31fbd659051f9329736b4955f0d079fbdde68eba5e2e8cea1a;
    stim[63] = 199'h0abb7f8999ce9fa778d997397d1828f8ee69ea0f1ca1ca6e11;
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
      expv[7] = 90'h000000000fa5cd2180000c5;
      expv[8] = 90'h000000000fa5cd2180000c5;
      expv[9] = 90'h000000000fa5cd2180000c5;
      expv[10] = 90'h000000001d5df010c0000b3;
      expv[11] = 90'h000000001d5df010c0000b3;
      expv[12] = 90'h000000001d5df010c0000b3;
      expv[13] = 90'h000000001d5df010c0000b3;
      expv[14] = 90'h000000001d5df010c0000b3;
      expv[15] = 90'h000000001d5df010c0000b3;
      expv[16] = 90'h000000001d5df010c0000b3;
      expv[17] = 90'h000000001d5df010c0000b3;
      expv[18] = 90'h000000001d5df010c0000b3;
      expv[19] = 90'h000000001d5df010c0000b3;
      expv[20] = 90'h000000001d5df010c0000b3;
      expv[21] = 90'h000000002a7ea1a33fdcc6b;
      expv[22] = 90'h0000000031f880f77695a09;
      expv[23] = 90'h0000000031f880f77695a09;
      expv[24] = 90'h0000000031f880f77695a09;
      expv[25] = 90'h000000003e8cde29c695a56;
      expv[26] = 90'h000000003e8cde29c695a56;
      expv[27] = 90'h000000000ed96d4bc695a68;
      expv[28] = 90'h000000000ed96d4bc695a68;
      expv[29] = 90'h000000000ed96d4bc695a68;
      expv[30] = 90'h000000000ed96d4bc695a68;
      expv[31] = 90'h000000001e782a75fd1b93f;
      expv[32] = 90'h000000001e782a75fd1b93f;
      expv[33] = 90'h000000001e782a75fd1b93f;
      expv[34] = 90'h000000001e782a75fd1b93f;
      expv[35] = 90'h000000001e782a75fd1b93f;
      expv[36] = 90'h000000001e782a75fd1b93f;
      expv[37] = 90'h000000001e782a75fd1b93f;
      expv[38] = 90'h000000001e782a75fd1b93f;
      expv[39] = 90'h000000001e782a75fd1b93f;
      expv[40] = 90'h00000000167695cef56ad47;
      expv[41] = 90'h00000000167695cef56ad47;
      expv[42] = 90'h000000003be5f423056adbb;
      expv[43] = 90'h000000003be5f423056adbb;
      expv[44] = 90'h000000003be5f423056adbb;
      expv[45] = 90'h000000003be5f423056adbb;
      expv[46] = 90'h000000003be5f423056adbb;
      expv[47] = 90'h000000003be5f423056adbb;
      expv[48] = 90'h000000001e5a2346456adfe;
      expv[49] = 90'h000000001e5a2346456adfe;
      expv[50] = 90'h000000001e5a2346456adfe;
      expv[51] = 90'h000000001e5a2346456adfe;
      expv[52] = 90'h000000001e5a2346456adfe;
      expv[53] = 90'h000000001e5a2346456adfe;
      expv[54] = 90'h00da82698d49d5ae856ad73;
      expv[55] = 90'h00da82698d49d5ae856ad73;
      expv[56] = 90'h000000003ee93935c56ad84;
      expv[57] = 90'h000000002c84ea88f51149a;
      expv[58] = 90'h00000000206671ef45114ab;
      expv[59] = 90'h00000000203e26ac85114aa;
      expv[60] = 90'h00000000234bfd088511421;
      expv[61] = 90'h0000000024fdbf2d35d1186;
      expv[62] = 90'h0000000024fdbf2d35d1186;
      expv[63] = 90'h0000000024fdbf2d35d1186;
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
