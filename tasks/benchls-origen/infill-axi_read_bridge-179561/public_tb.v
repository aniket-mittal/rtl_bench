// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 111;
  localparam OW = 175;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_179561 dut (
    .clk(clk),
    .rst(in_vec[110:110]),
    .s_arvalid(in_vec[109:109]),
    .s_araddr(in_vec[108:77]),
    .s_arlen(in_vec[76:69]),
    .s_rready(in_vec[68:68]),
    .ddrRdAddrDone(in_vec[67:67]),
    .ddrRdData(in_vec[66:35]),
    .ddrRdDataValid(in_vec[34:34]),
    .m_arready(in_vec[33:33]),
    .m_rvalid(in_vec[32:32]),
    .m_rdata(in_vec[31:0]),
    .s_arready(out_vec[174:174]),
    .s_rvalid(out_vec[173:173]),
    .s_rdata(out_vec[172:141]),
    .ddrWr(out_vec[140:140]),
    .ddrWrAddress(out_vec[139:108]),
    .ddrWrEn(out_vec[107:107]),
    .ddrWrData(out_vec[106:75]),
    .ddrWrDataValid(out_vec[74:74]),
    .ddrRdAddr(out_vec[73:42]),
    .ddrRd(out_vec[41:41]),
    .m_arvalid(out_vec[40:40]),
    .m_araddr(out_vec[39:8]),
    .m_arlen(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 111'h53defc33b3030cd6718cf40e4679;
    stim[1] = 111'h50ce90cc05ba717715ceed0d1b69;
    stim[2] = 111'h340bf8706d5c478074cfb06061d6;
    stim[3] = 111'h0ff505029c0146dbe4fdbd89dc2f;
    stim[4] = 111'h12efe1a7082d84a83f6225184785;
    stim[5] = 111'h16cb1c87344e09407e8713ef22d0;
    stim[6] = 111'h076a859d1c18167195c3277ee270;
    stim[7] = 111'h3aa68757a00bbdb12a8da27fae59;
    stim[8] = 111'h09d4ce6cb847c1d75addb6e0067e;
    stim[9] = 111'h30ce8970c43fd2e78d03cae0b6d8;
    stim[10] = 111'h0f6f7f77ac98c941467d32888321;
    stim[11] = 111'h0efecc7f928f22a72741ed7dd98e;
    stim[12] = 111'h3935ecd8d1cdd1c43f320f202b73;
    stim[13] = 111'h34ae28d5d5bf6ee9442840a68092;
    stim[14] = 111'h0ccb5415026dec8d37a2e16cd744;
    stim[15] = 111'h2c0fb9f03caf9b945022949482dc;
    stim[16] = 111'h2ce27c5895878c86dd69ea0cb85e;
    stim[17] = 111'h23cea9d0f23b28e12c5cbc8e8406;
    stim[18] = 111'h1b2869136ceecbc81a628c95f868;
    stim[19] = 111'h0149f4a04242ff6b2f0c799f0ff3;
    stim[20] = 111'h0604241b354a7ba3227455eaea98;
    stim[21] = 111'h33856880dbb2d2568f8876205d11;
    stim[22] = 111'h11539e77db2819828f7af1d4e9c1;
    stim[23] = 111'h15756578b25ed63825848135394e;
    stim[24] = 111'h21428800f00d99d0413c49ab2499;
    stim[25] = 111'h01685805d29a0a4fea07ceee4835;
    stim[26] = 111'h34c3bcf308de65ff6657ebf45af1;
    stim[27] = 111'h3a06687fee708d38d66edf5d57bc;
    stim[28] = 111'h0d6a35b701dc4828d62617b4169d;
    stim[29] = 111'h3102cb864b43828a20498b6569e6;
    stim[30] = 111'h07d3bed8c8fff004d69562a8413c;
    stim[31] = 111'h3f4b80dbdcb1856346db76315d99;
    stim[32] = 111'h20f24440342913deb098d2f50b4b;
    stim[33] = 111'h098f18b15424ec93460cf64c9a95;
    stim[34] = 111'h04c5d2830f114c2644acfc01ad32;
    stim[35] = 111'h2d738714ed3c49918bf9b87cfad7;
    stim[36] = 111'h18f9d7dc06e81cbd932a34f80805;
    stim[37] = 111'h07d11d4cd54b4db0d81d16276c99;
    stim[38] = 111'h3882be087ec9c0c2ceaf808c7469;
    stim[39] = 111'h10b99e502d6daf1e2508a39eebe3;
    stim[40] = 111'h25d797f283a585ca7a2a87f43565;
    stim[41] = 111'h187c8ad65a42cf02bc61717fb5b2;
    stim[42] = 111'h251310c1eddbff9bf4edadeb15ec;
    stim[43] = 111'h1f9803aa605cf50e927454ca002f;
    stim[44] = 111'h24a5660122681f3c2c8eecb4592d;
    stim[45] = 111'h0bcba35e7c6d41f80bf77c313e3c;
    stim[46] = 111'h19bd8a179bc6d01852b248af03b3;
    stim[47] = 111'h1398c522334d56f2ea3a9c9abf88;
    stim[48] = 111'h1cbc372c2a216e78c30e0a816abd;
    stim[49] = 111'h145816cc0e1cc860b12e275d5f6b;
    stim[50] = 111'h2eed257934e8a0667989af9573a0;
    stim[51] = 111'h34929a9947602455668ee17475d0;
    stim[52] = 111'h2e7405eb429d87f70c8af7356fa1;
    stim[53] = 111'h1ed3997213d3ef8d25134f02f2bd;
    stim[54] = 111'h20dd0536328c6ef37c0eeca412a9;
    stim[55] = 111'h3e560f531d9d4b0fb5a6d26104c1;
    stim[56] = 111'h28c0e2bbf37c5d8907226b88ce0e;
    stim[57] = 111'h2deadc9590af7049a36091247f64;
    stim[58] = 111'h3c1f6903d8a84214cf063f1fc8e2;
    stim[59] = 111'h31121776d3c5e90856515cfa7141;
    stim[60] = 111'h34b716251103d8966e47dcecf08a;
    stim[61] = 111'h1bee099bcf9400d74d7e08bee840;
    stim[62] = 111'h055d6f2dc6d054aa475941ca9baf;
    stim[63] = 111'h161e8fadc6b47d00fa0a1af4ea68;
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
      expv[0] = 175'hxxxxxxxxx0000000000000000000000000xxxxxxxxxx;
      expv[1] = 175'hxxxxxxxxx0000000000000000000000000xxxxxxxxxx;
      expv[2] = 175'hxxxxxxxxx0000000000000000000000000xxxxxxxxxx;
      expv[3] = 175'hxxxxxxxxx00000000000000002817f0e0da05fc3836a;
      expv[4] = 175'h37b13b85e00000000000000002817f0e0da05fc3836a;
      expv[5] = 175'h57b13b85e00000000000000002817f0e0ca05fc3836a;
      expv[6] = 175'h57b13b85e00000000000000002817f0e0ca05fc3836a;
      expv[7] = 175'h57b13b85e00000000000000002817f0e0ca05fc3836a;
      expv[8] = 175'h57b13b85e0000000000000000354d0eaf5d5343abd00;
      expv[9] = 175'h36dc00cfc0000000000000000354d0eaf5d5343abd00;
      expv[10] = 175'h56dc00cfc0000000000000000219d12e1986744b8621;
      expv[11] = 175'h2651106420000000000000000219d12e1986744b8621;
      expv[12] = 175'h4651106420000000000000000219d12e1886744b8621;
      expv[13] = 175'h4651106420000000000000000326bd9b19c9af66c68e;
      expv[14] = 175'h0651106420000000000000000326bd9b19c9af66c68e;
      expv[15] = 175'h0651106420000000000000000326bd9b18c9af66c68e;
      expv[16] = 175'h0651106420000000000000000326bd9b18c9af66c68e;
      expv[17] = 175'h3d41970bc0000000000000000326bd9b18c9af66c68e;
      expv[18] = 175'h5d41970bc0000000000000000079d53a1d1e754e8791;
      expv[19] = 175'h1d41970bc0000000000000000079d53a1c1e754e8791;
      expv[20] = 175'h1d41970bc0000000000000000079d53a1c1e754e8791;
      expv[21] = 175'h1d41970bc0000000000000000079d53a1c1e754e8791;
      expv[22] = 175'h1d41970bc0000000000000000079d53a1c1e754e8791;
      expv[23] = 175'h1d41970bc0000000000000000079d53a1c1e754e8791;
      expv[24] = 175'h1d41970bc0000000000000000079d53a1c1e754e8791;
      expv[25] = 175'h1d41970bc0000000000000000079d53a1c1e754e8791;
      expv[26] = 175'h39ddc906a0000000000000000079d53a1c1e754e8791;
      expv[27] = 175'h59ddc906a0000000000000000298779e61a61de79846;
      expv[28] = 175'h19ddc906a0000000000000000298779e60a61de79846;
      expv[29] = 175'h19ddc906a0000000000000000298779e60a61de79846;
      expv[30] = 175'h316cad3cc0000000000000000298779e60a61de79846;
      expv[31] = 175'h516cad3cc0000000000000000298779e60a61de79846;
      expv[32] = 175'h516cad3cc00000000000000003e9701b79fa5c06dee5;
      expv[33] = 175'h116cad3cc00000000000000003e9701b79fa5c06dee5;
      expv[34] = 175'h116cad3cc00000000000000003e9701b79fa5c06dee5;
      expv[35] = 175'h116cad3cc00000000000000003e9701b79fa5c06dee5;
      expv[36] = 175'h370f9f5ae00000000000000003e9701b79fa5c06dee5;
      expv[37] = 175'h570f9f5ae00000000000000003e9701b78fa5c06dee5;
      expv[38] = 175'h570f9f5ae00000000000000003e9701b78fa5c06dee5;
      expv[39] = 175'h570f9f5ae000000000000000031057c10dc415f043f6;
      expv[40] = 175'h170f9f5ae000000000000000031057c10dc415f043f6;
      expv[41] = 175'h170f9f5ae000000000000000031057c10cc415f043f6;
      expv[42] = 175'h2e2ff6b64000000000000000031057c10cc415f043f6;
      expv[43] = 175'h4e2ff6b6400000000000000000a262183d2898860f6e;
      expv[44] = 175'h0e2ff6b6400000000000000000a262183d2898860f6e;
      expv[45] = 175'h0e2ff6b6400000000000000000a262183c2898860f6e;
      expv[46] = 175'h2f8627c7800000000000000000a262183c2898860f6e;
      expv[47] = 175'h4f8627c7800000000000000000a262183c2898860f6e;
      expv[48] = 175'h4f8627c7800000000000000000a262183c2898860f6e;
      expv[49] = 175'h4f8627c7800000000000000000a262183c2898860f6e;
      expv[50] = 175'h4f8627c7800000000000000000a262183c2898860f6e;
      expv[51] = 175'h4f8627c7800000000000000001dda4af2577692bc9a7;
      expv[52] = 175'h0f8627c7800000000000000001dda4af2477692bc9a7;
      expv[53] = 175'h0f8627c7800000000000000001dda4af2477692bc9a7;
      expv[54] = 175'h29e05e57a00000000000000001dda4af2477692bc9a7;
      expv[55] = 175'h49e05e57a000000000000000001ba0a6c506e829b194;
      expv[56] = 175'h09e05e57a000000000000000001ba0a6c406e829b194;
      expv[57] = 175'h09e05e57a000000000000000001ba0a6c406e829b194;
      expv[58] = 175'h09e05e57a000000000000000001ba0a6c406e829b194;
      expv[59] = 175'h09e05e57a000000000000000001ba0a6c406e829b194;
      expv[60] = 175'h2b9f4e282000000000000000001ba0a6c406e829b194;
      expv[61] = 175'h4b9f4e2820000000000000000296e2c4a1a5b8b12888;
      expv[62] = 175'h0b9f4e2820000000000000000296e2c4a0a5b8b12888;
      expv[63] = 175'h28395375e0000000000000000296e2c4a0a5b8b12888;
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
