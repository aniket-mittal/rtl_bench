// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 130;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_088417 dut (
    .selCh(in_vec[129:128]),
    .inCh0(in_vec[127:96]),
    .inCh1(in_vec[95:64]),
    .inCh2(in_vec[63:32]),
    .inCh3(in_vec[31:0]),
    .selData(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 130'h296abd1f3f89cb4bbd705a779b886b196;
    stim[1] = 130'h12dbff94bb2efaddd7f56c76f03f3a338;
    stim[2] = 130'h34c48a61e056967bea4ebd07ab4f99f9b;
    stim[3] = 130'h3eac6c829c225332805a8835822fbe0e6;
    stim[4] = 130'h2273a379475899d65dad37cdffeaed358;
    stim[5] = 130'h35ece3f4c0b72d9ff7d3935cc43ce7bbb;
    stim[6] = 130'h3a5b7d5d664a1b5c3add9dff9b3a1787d;
    stim[7] = 130'h291a0f606d80250a337388a87af2079eb;
    stim[8] = 130'h21657821585e49bcae1cca7d9bb3310f4;
    stim[9] = 130'h177d4b5c1216a0a7ef758e1da540a6949;
    stim[10] = 130'h14111a351f43afbb1eb9b86854b22ae1e;
    stim[11] = 130'h108c5b03502376363c8f7b8b2068823b1;
    stim[12] = 130'h276995ec4656d689946e1d1803f356cb5;
    stim[13] = 130'h35643c683babebdda86a95b34c3baa5a2;
    stim[14] = 130'h051f6cd6a346a1e9e5388e997f602f563;
    stim[15] = 130'h3329faad3629b2ee4162dac32ba9653a7;
    stim[16] = 130'h3a6aa8cac78c8e29531eaf854eee036f3;
    stim[17] = 130'h0a8990e6d411f9a4b1f7d4712b84f276f;
    stim[18] = 130'h35798588dd5c1c806b46b272147f75427;
    stim[19] = 130'h3926196dc2b011d426cc6a38e38fd62bb;
    stim[20] = 130'h2fd3c2f541079ac7adcb78f24a1f6a721;
    stim[21] = 130'h3268801ec84971bdb02ff500875f5914a;
    stim[22] = 130'h051ac1de9a9a50eb93e4c6dde68f50de5;
    stim[23] = 130'h202f95dff72cf8b232fbf083ae614068d;
    stim[24] = 130'h19453ea5558eece3036fb8d98772c5738;
    stim[25] = 130'h08e4ebf988d631ef5cff182569c323f38;
    stim[26] = 130'h2080421b9e7c0a64f9ecd412df7d5a381;
    stim[27] = 130'h2df88eb9b593d506627d83bcfcb79c59d;
    stim[28] = 130'h00ce2b66f71d3bcbd0bb75eaebe1eac73;
    stim[29] = 130'h2c6e6cc9eb4357c4c531b78fe1d6bb454;
    stim[30] = 130'h31df8acb5f512e60d74a4c9d637408eb1;
    stim[31] = 130'h1f47e48c55695e8de516014f791a75c89;
    stim[32] = 130'h10042575353513798b8521a5a027403c0;
    stim[33] = 130'h2577b6cca75afe452d7d50d5e850009e8;
    stim[34] = 130'h03ff96e93e1deb498df7ffb50bea5de4a;
    stim[35] = 130'h377333688eb3ff4c1f0d0f6400bd907e6;
    stim[36] = 130'h2c5cedd9950f6459b4bff396c5c9a6fc6;
    stim[37] = 130'h1059c05726e98883d92201e1a2ee4524f;
    stim[38] = 130'h17ae22a7e6f0b747562a44232cc61efe7;
    stim[39] = 130'h3f9c7f2ecf0497e3e74073f26d31df6f4;
    stim[40] = 130'h355d2fc05f06f184d942e94749ea55dd1;
    stim[41] = 130'h2ff5b9f78f87d5599421843a1e22f49d5;
    stim[42] = 130'h146c5ea34c6ce83a922090f123d203f27;
    stim[43] = 130'h20a6aa20129c520b0695e464217313341;
    stim[44] = 130'h1e20fe5bf36f6486a21f0f28d71718bac;
    stim[45] = 130'h06f2e02a1146b2423fbc7568deadb9567;
    stim[46] = 130'h0db6423c9145624e26e2652b37cb78efa;
    stim[47] = 130'h24614180fce2b83583f6238b0c28f19f6;
    stim[48] = 130'h3bc472a8cf2d258bd2b05b75e967eec3f;
    stim[49] = 130'h039242f650008f17745dffeb8c9b265ce;
    stim[50] = 130'h0b1855dc683215784a2d5b8ef902ccd0f;
    stim[51] = 130'h1dcdaf33a4e112a435d91cad9db4a3e8d;
    stim[52] = 130'h13dc53bf348d77022bcecce145fa4a87d;
    stim[53] = 130'h14daf726ab437d5533625334c645fb0a2;
    stim[54] = 130'h12e49c73826a445b84f6d43c4599b45c2;
    stim[55] = 130'h008d2e252eb6b39cd04507833843e83d9;
    stim[56] = 130'h153d3eff9800f77feeb7e65a78b3bb252;
    stim[57] = 130'h1acee721d98bbbdcba808fdabc25db662;
    stim[58] = 130'h03dbbce95f00f667f2e1d2b0f1f3d3dd0;
    stim[59] = 130'h1041c7073d874d911a7fc139e12a7d6de;
    stim[60] = 130'h36c95490fe40ac8093944636e217dd7aa;
    stim[61] = 130'h0d5ea370e30c1626589b44bc752710e72;
    stim[62] = 130'h105e0003f2849a5782ae0f8d84532f03a;
    stim[63] = 130'h234bbc816adbc440a4e517e0fc1b2ec06;
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
      expv[0] = 32'hd705a779;
      expv[1] = 32'hb2efaddd;
      expv[2] = 32'hb4f99f9b;
      expv[3] = 32'h22fbe0e6;
      expv[4] = 32'hdad37cdf;
      expv[5] = 32'h43ce7bbb;
      expv[6] = 32'hb3a1787d;
      expv[7] = 32'h37388a87;
      expv[8] = 32'he1cca7d9;
      expv[9] = 32'h216a0a7e;
      expv[10] = 32'hf43afbb1;
      expv[11] = 32'h02376363;
      expv[12] = 32'h46e1d180;
      expv[13] = 32'hc3baa5a2;
      expv[14] = 32'h51f6cd6a;
      expv[15] = 32'hba9653a7;
      expv[16] = 32'heee036f3;
      expv[17] = 32'ha8990e6d;
      expv[18] = 32'h47f75427;
      expv[19] = 32'h38fd62bb;
      expv[20] = 32'hdcb78f24;
      expv[21] = 32'h75f5914a;
      expv[22] = 32'h51ac1de9;
      expv[23] = 32'h2fbf083a;
      expv[24] = 32'h58eece30;
      expv[25] = 32'h8e4ebf98;
      expv[26] = 32'h9ecd412d;
      expv[27] = 32'h27d83bcf;
      expv[28] = 32'h0ce2b66f;
      expv[29] = 32'h531b78fe;
      expv[30] = 32'h37408eb1;
      expv[31] = 32'h5695e8de;
      expv[32] = 32'h53513798;
      expv[33] = 32'hd7d50d5e;
      expv[34] = 32'h3ff96e93;
      expv[35] = 32'h0bd907e6;
      expv[36] = 32'h4bff396c;
      expv[37] = 32'h6e98883d;
      expv[38] = 32'h6f0b7475;
      expv[39] = 32'hd31df6f4;
      expv[40] = 32'h9ea55dd1;
      expv[41] = 32'h421843a1;
      expv[42] = 32'hc6ce83a9;
      expv[43] = 32'h695e4642;
      expv[44] = 32'h36f6486a;
      expv[45] = 32'h6f2e02a1;
      expv[46] = 32'hdb6423c9;
      expv[47] = 32'h3f6238b0;
      expv[48] = 32'h967eec3f;
      expv[49] = 32'h39242f65;
      expv[50] = 32'hb1855dc6;
      expv[51] = 32'h4e112a43;
      expv[52] = 32'h48d77022;
      expv[53] = 32'hb437d553;
      expv[54] = 32'h26a445b8;
      expv[55] = 32'h08d2e252;
      expv[56] = 32'h800f77fe;
      expv[57] = 32'h98bbbdcb;
      expv[58] = 32'h3dbbce95;
      expv[59] = 32'hd874d911;
      expv[60] = 32'h217dd7aa;
      expv[61] = 32'hd5ea370e;
      expv[62] = 32'h2849a578;
      expv[63] = 32'h4e517e0f;
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
