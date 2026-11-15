// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 101;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_008885 dut (
    .m_addr(in_vec[100:69]),
    .d_f_mem(in_vec[68:37]),
    .inst_decode(in_vec[36:0]),
    .mem_out(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 101'h18bf4b191cdc8e49e9891070d5;
    stim[1] = 101'h130bbe24d5940659cb0128189c;
    stim[2] = 101'h1a7b4a489aaeb7a8f30f2c8be4;
    stim[3] = 101'h0bc1d6de5478a59748d9e70810;
    stim[4] = 101'h1a531eea232788475aa0d53faa;
    stim[5] = 101'h0684163d84e6e19e541b42cd58;
    stim[6] = 101'h19c7d94d5ca079c822b87cbe56;
    stim[7] = 101'h0636f343ab8d77004b8e955a27;
    stim[8] = 101'h1c08102b41d6a357af70c7e7a9;
    stim[9] = 101'h1b3cf57169716ef1e33db1fd11;
    stim[10] = 101'h1ac282194173fd11b6ea16e3e4;
    stim[11] = 101'h05a6f23e218f39cf7c568ca372;
    stim[12] = 101'h000d9ce3167b6960986d82bb34;
    stim[13] = 101'h11f0960cb1aef5811807b0ab03;
    stim[14] = 101'h125024e0f96c5d525e35559966;
    stim[15] = 101'h02232bc6ad35429619245ef89e;
    stim[16] = 101'h1811a54b4e07db2267adbc7b1a;
    stim[17] = 101'h177ab2e4f6195aa7e5598ec98f;
    stim[18] = 101'h14dec40fbfa59d7ea9f1c3efbe;
    stim[19] = 101'h134e1cd3f810e2946ee624a385;
    stim[20] = 101'h1d4cc149d74644781035cfd098;
    stim[21] = 101'h0e5a357fe0deb7d834acd5b823;
    stim[22] = 101'h1624aa3fc289dd5607fb2839ff;
    stim[23] = 101'h16ec1c5f0e0d2d8917bdae548d;
    stim[24] = 101'h1d35e2d7e452cf379fbd5bb21f;
    stim[25] = 101'h04c95cb4bf6328f16a1ad02927;
    stim[26] = 101'h115dc1c64d25bd7989fe0633b6;
    stim[27] = 101'h12f43debcc7133dcbb66f43b36;
    stim[28] = 101'h1bccbb5525abad8895382b1cca;
    stim[29] = 101'h0dd05787ab0e2c6fa6d11a1d8d;
    stim[30] = 101'h1ea319da34e37796a2462a4c9f;
    stim[31] = 101'h1c73d7483ee7ac256caadf4487;
    stim[32] = 101'h064a4881204096f69f66a0e91a;
    stim[33] = 101'h16503a50d1ab95bfce8e8d8f4d;
    stim[34] = 101'h15d1364bd15a091d8f0b3c029f;
    stim[35] = 101'h0ac421467fd272de19aece8469;
    stim[36] = 101'h0f9f2f7a1e2e7ab42767003562;
    stim[37] = 101'h010b01d44cb7cf4dfb1633a8a2;
    stim[38] = 101'h11d8417347d4959ef1ce804c57;
    stim[39] = 101'h046f9d227432424f922ab3ca40;
    stim[40] = 101'h1618e2ec5c5ee20738d547b4bf;
    stim[41] = 101'h0c3f64829976d1e33bf91a37df;
    stim[42] = 101'h192eb0feee3558096324cf2d1b;
    stim[43] = 101'h0cadd4191cd757dd201d2f92d3;
    stim[44] = 101'h04a8c08b5cb97bf3b4cf2ca9c5;
    stim[45] = 101'h10cf0adbbdba20d9d13d6b5c7f;
    stim[46] = 101'h0a6285d5ef72a7d2c9cbed3595;
    stim[47] = 101'h0e8b0cd7b5846580133c69c205;
    stim[48] = 101'h1d7f307010476a5267f1de203c;
    stim[49] = 101'h166b1de5f1cb5ad125943877ad;
    stim[50] = 101'h11ddd30c35ec831d188901b4bf;
    stim[51] = 101'h1cf87e7bc8ced169d0e3d2c25f;
    stim[52] = 101'h056aa46c6a844554b1796fa8e8;
    stim[53] = 101'h0bd1837c4550f443ec45761c04;
    stim[54] = 101'h050e18b1b717d738420ede89a8;
    stim[55] = 101'h1a56805ff893f5a652b035a97f;
    stim[56] = 101'h1c17de4ca7294969408566d589;
    stim[57] = 101'h040143418886e9a7b9d161601f;
    stim[58] = 101'h0411c704282b9303ad57cbf7ac;
    stim[59] = 101'h10ace4a57552b78534e18461c3;
    stim[60] = 101'h0dcc473e18f0d150139d48ed0b;
    stim[61] = 101'h1f3c6b2a770df3212d7ebf985a;
    stim[62] = 101'h0d460c923590b9d3b831209d9e;
    stim[63] = 101'h1033546745ce523b05d6799e5d;
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
      expv[0] = 32'he6e4724f;
      expv[1] = 32'haca032ce;
      expv[2] = 32'hd575bd47;
      expv[3] = 32'h0000a3c5;
      expv[4] = 32'h00000042;
      expv[5] = 32'h000000f2;
      expv[6] = 32'he503ce41;
      expv[7] = 32'h5c6bb802;
      expv[8] = 32'h000000b5;
      expv[9] = 32'h0000004b;
      expv[10] = 32'h0b9fe88d;
      expv[11] = 32'h0000ce7b;
      expv[12] = 32'hb3db4b04;
      expv[13] = 32'hffffffac;
      expv[14] = 32'hcb62ea92;
      expv[15] = 32'h69aa14b0;
      expv[16] = 32'h0000003e;
      expv[17] = 32'hb0cad53f;
      expv[18] = 32'hfd2cebf5;
      expv[19] = 32'hc08714a3;
      expv[20] = 32'h00000032;
      expv[21] = 32'h00000006;
      expv[22] = 32'h144eeab0;
      expv[23] = 32'h70696c48;
      expv[24] = 32'h229679bc;
      expv[25] = 32'hfb19478b;
      expv[26] = 32'h692debcc;
      expv[27] = 32'h63899ee5;
      expv[28] = 32'h0000006c;
      expv[29] = 32'h5871637d;
      expv[30] = 32'ha71bbcb5;
      expv[31] = 32'hf73d612b;
      expv[32] = 32'h000000b7;
      expv[33] = 32'h8d5cadfe;
      expv[34] = 32'h8ad048ec;
      expv[35] = 32'h000000fe;
      expv[36] = 32'hffffd5a1;
      expv[37] = 32'h000065be;
      expv[38] = 32'h3ea4acf7;
      expv[39] = 32'h00000000;
      expv[40] = 32'he2f71039;
      expv[41] = 32'hcbb68f19;
      expv[42] = 32'h00000071;
      expv[43] = 32'hffffffe9;
      expv[44] = 32'he5cbdf9d;
      expv[45] = 32'hedd106ce;
      expv[46] = 32'h7b953e96;
      expv[47] = 32'hac232c00;
      expv[48] = 32'h823b5293;
      expv[49] = 32'h8e5ad689;
      expv[50] = 32'haf6418e8;
      expv[51] = 32'h46768b4e;
      expv[52] = 32'h00000054;
      expv[53] = 32'h2a87a21f;
      expv[54] = 32'h000000b9;
      expv[55] = 32'hc49fad32;
      expv[56] = 32'h0000004b;
      expv[57] = 32'h44374d3d;
      expv[58] = 32'h415c981d;
      expv[59] = 32'hffffffaa;
      expv[60] = 32'h00000080;
      expv[61] = 32'h000000b8;
      expv[62] = 32'hac85ce9d;
      expv[63] = 32'h2e7291d8;
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
