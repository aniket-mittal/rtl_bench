// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 174;
  localparam OW = 41;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_08991 dut (
    .clk(clk),
    .resetn(in_vec[173:173]),
    .phase(in_vec[172:141]),
    .phase_valid(in_vec[140:140]),
    .data(in_vec[139:116]),
    .data_valid(in_vec[115:115]),
    .data_filtered(in_vec[114:83]),
    .data_filtered_valid(in_vec[82:82]),
    .i_q(in_vec[81:50]),
    .i_q_valid(in_vec[49:49]),
    .i_q_filtered(in_vec[48:17]),
    .i_q_filtered_valid(in_vec[16:16]),
    .dma_wr_overflow(in_vec[15:15]),
    .dma_wr_xfer_req(in_vec[14:14]),
    .channel_enable(in_vec[13:0]),
    .phase_ready(out_vec[40:40]),
    .data_ready(out_vec[39:39]),
    .data_filtered_ready(out_vec[38:38]),
    .i_q_ready(out_vec[37:37]),
    .i_q_filtered_ready(out_vec[36:36]),
    .overflow(out_vec[35:35]),
    .dma_wr_data(out_vec[34:3]),
    .dma_wr_en(out_vec[2:2]),
    .dma_wr_sync(out_vec[1:1]),
    .processing_resetn(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 174'h1d499b37ae4e4075b33356effa2cdb7db214d80f860f;
    stim[1] = 174'h1c08f36657087338eaa2a73117f75451a4921161f534;
    stim[2] = 174'h292891c8771dafaa0975558e7e9a1045beaa0a23779b;
    stim[3] = 174'h250c347ea0d4518028b6bbaa66e92ecb6336832a8c46;
    stim[4] = 174'h3add0e0ee2aff06d940682e3a41d6d34707b6dd7faf0;
    stim[5] = 174'h2f116fda79ecc9391bbff5e2ecc8a5c82927c191193b;
    stim[6] = 174'h2da156f8185a566915e7fbd52ccf3d2a1a0f1914abd2;
    stim[7] = 174'h3907ef5cd41814888100c58b5f03e0114c960b52f961;
    stim[8] = 174'h3dbd11a213636fe0f5bcd00d96bfa8e0345b9704cbdc;
    stim[9] = 174'h35d21efada55c0375727821da6ea8b07ac8d1ae6d85d;
    stim[10] = 174'h3dab4932561b7fe3d09f52260728726ab551e7d550a0;
    stim[11] = 174'h241856801f6316e7845454a7d954d94f5f82cf756873;
    stim[12] = 174'h22ee1cae2b931bc4f44c7a720a7da2a54a1a4308708b;
    stim[13] = 174'h3c74bf7d7b34c17d500fc58cb433159630a4b516ed87;
    stim[14] = 174'h25b0db8942d16127feedbec2662af1596ff143c56995;
    stim[15] = 174'h39bf9292fe82ba1e0a599921405e46a306cf998c8177;
    stim[16] = 174'h3b80e973834d81f20de04699af0d95002351059adb27;
    stim[17] = 174'h2d925d5e258db1c70ccdd182c0f0e5430fff786a6998;
    stim[18] = 174'h26bee91300d2e2d1f09ee8e72d9528b184978632502f;
    stim[19] = 174'h3dfb6c6d15e72ea0fe3883cf7ab3715fa28f2dfed350;
    stim[20] = 174'h27d291a9f29eeef8d1bf111a1c6c84ca500bca400797;
    stim[21] = 174'h253137e17ae3d6bf1e307a7681f338064b236ac73380;
    stim[22] = 174'h3b343c81fe3d29f2494a6bfbdb151ebcfcf04b20effd;
    stim[23] = 174'h2b800ae78e79518922b8db96f6442da4a3316191b014;
    stim[24] = 174'h35281c7293284ff0d42ff8fdb149f08561097e532901;
    stim[25] = 174'h207332459d8bcf434f4527f9a4ad3837379489782b32;
    stim[26] = 174'h2a5d79774f435675dba679deddc626eb86751c2d3695;
    stim[27] = 174'h21ae696db09d52a9216741c2c18a87c8ab5bcbcf462c;
    stim[28] = 174'h2c52e39f279623d4630c5ce89083f643e80167316d8d;
    stim[29] = 174'h2e26574c6e0ab051d056a8abce6aff7ce9255841fede;
    stim[30] = 174'h2fd3c2d7a7382cc158afa753aa59bcdabc65bd4b534d;
    stim[31] = 174'h2ce50cc2fc40c1e02e4d777be0cdeda4d29dec90b9ec;
    stim[32] = 174'h2314395e4f8216c70293b5597624c599cec7be1715cc;
    stim[33] = 174'h33eebfd70e71cf91d32d061eac42d12249708ffa2527;
    stim[34] = 174'h20ea83fccfa3e8b14441640b6105498f453272924639;
    stim[35] = 174'h3a9b55cfc16605d646e85571fc230cb0142f1c35034a;
    stim[36] = 174'h3ec18bf07725936742f95cb6d8f7db3f246eff9c6a55;
    stim[37] = 174'h230452b0e5cdeed4a0d0c586b6a7e3772c8a0b533575;
    stim[38] = 174'h340b6ea88cc7eb8597a552266b5fc8b8cec89695407f;
    stim[39] = 174'h3bf7a05af91eb5f6fa85300ed08e6c02640d3aa4e5fb;
    stim[40] = 174'h20be364432641f0671f7168f82dd8db78398a925e249;
    stim[41] = 174'h37286756ce8f66ce5fdbf8279a42f6799b442f2a6799;
    stim[42] = 174'h37a7527ff5330d2cb8ac1d95c18a7152ff7256aaaac8;
    stim[43] = 174'h35bea542ae6365425adf23a704bae291a1c91450bc67;
    stim[44] = 174'h3369e07f2e0676239d2330a31e3b841603421dcf3284;
    stim[45] = 174'h34951cd6d382b991febf2594e48ad8550889a4db6e96;
    stim[46] = 174'h2ba376a633e8087596aa4b1fce7f14768d85f1da9265;
    stim[47] = 174'h26dc1287d25ea69f45adc5b1739dd8dce1ac99e162c3;
    stim[48] = 174'h369a4fc185d170376546403bdbc686aff85591f68362;
    stim[49] = 174'h251dc5a182851ea34fdff05edd1ef7b30685a4bfdce9;
    stim[50] = 174'h2b53a38f7754a3c588359fdce82699f71b52b0e9840f;
    stim[51] = 174'h26e85a1ea10c6be01eee0e30be89eedda073ce590bf6;
    stim[52] = 174'h20cdfc1cf4e544eae927809adbb30c6f4cdd5069c093;
    stim[53] = 174'h3eb938213d34001feec862c538209c2469d2ebfd559c;
    stim[54] = 174'h287fce8695d48716fbe51c7774ff047ce9021453b1d5;
    stim[55] = 174'h2e78dfb8daf429a23f25e717b60abb5ef80724b8d1f7;
    stim[56] = 174'h37626e3d9aa59a64086fa0dd82242a7cc0fd6fa2b101;
    stim[57] = 174'h38311e421e37ce097fe07c71901c615c5a83cab69ca5;
    stim[58] = 174'h31018e2718649c65828f39e6b05915c727e50372dd29;
    stim[59] = 174'h3b4a8f1fa6573fd0f30a1d064c175611b8a79212a43b;
    stim[60] = 174'h2b59d0a89443276fb045921b9c0190ae4d6fdaed2abf;
    stim[61] = 174'h3d6b2283c20710ee792723451e1e60319824cc845eb7;
    stim[62] = 174'h296251bd9efb26e3dbb2ca3cd0bb23462b0827a4f635;
    stim[63] = 174'h397c9bb2c9791f3e463fd60c782b1a47f9bf4d3437b2;
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
      expv[0] = 41'hxxxxxxxxxxx;
      expv[1] = 41'h10xxxxxxxxx;
      expv[2] = 41'h087023cd993;
      expv[3] = 41'h048038ed7d6;
      expv[4] = 41'h10828b6bba9;
      expv[5] = 41'h106b74383ba;
      expv[6] = 41'h10bc45bf69a;
      expv[7] = 41'h10b6855be03;
      expv[8] = 41'h08e41fbd737;
      expv[9] = 41'h08801b1b7f1;
      expv[10] = 41'h080052ae019;
      expv[11] = 41'h080030dbff1;
      expv[12] = 41'h08007b18b71;
      expv[13] = 41'h08805c98de1;
      expv[14] = 41'h040059a60bd;
      expv[15] = 41'h04ffeedbec0;
      expv[16] = 41'h10e0a599921;
      expv[17] = 41'h106e03a5ce3;
      expv[18] = 41'h1036497578b;
      expv[19] = 41'h109afba44c3;
      expv[20] = 41'h0877edb1b42;
      expv[21] = 41'h100014f777a;
      expv[22] = 41'h1094c4df85b;
      expv[23] = 41'h08ecd0f207e;
      expv[24] = 41'h100073ca8c0;
      expv[25] = 41'h1054a071ca2;
      expv[26] = 41'h1001ccc9162;
      expv[27] = 41'h102975e5dd3;
      expv[28] = 41'h0806b9a5b6b;
      expv[29] = 41'h08803cb11eb;
      expv[30] = 41'h0800705582b;
      expv[31] = 41'h088039c1662;
      expv[32] = 41'h100062060f2;
      expv[33] = 41'h100c50e5792;
      expv[34] = 41'h104fbaff5c3;
      expv[35] = 41'h1003aa0ff32;
      expv[36] = 41'h106a6d573f3;
      expv[37] = 41'h087b062fc1e;
      expv[38] = 41'h10002e6f769;
      expv[39] = 41'h10d02dbaa23;
      expv[40] = 41'h08efde816bf;
      expv[41] = 41'h08001320f81;
      expv[42] = 41'h0480747b360;
      expv[43] = 41'h10cb8ac1d90;
      expv[44] = 41'h1056fa950aa;
      expv[45] = 41'h104da781fcb;
      expv[46] = 41'h08d254735b2;
      expv[47] = 41'h10001f4043b;
      expv[48] = 41'h089b704a1f6;
      expv[49] = 41'h10802e8b819;
      expv[50] = 41'h10947716862;
      expv[51] = 41'h102d4e8e3da;
      expv[52] = 41'h109ba1687ab;
      expv[53] = 41'h080337f073f;
      expv[54] = 41'h048069a0008;
      expv[55] = 41'h10efbe51c71;
      expv[56] = 41'h08b9e37ee36;
      expv[57] = 41'h1080552cd30;
      expv[58] = 41'h10e0c479083;
      expv[59] = 41'h08c406389c6;
      expv[60] = 41'h100032b9fe8;
      expv[61] = 41'h102d6742a23;
      expv[62] = 41'h10f5ac8a0f3;
      expv[63] = 41'h08258946f66;
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
