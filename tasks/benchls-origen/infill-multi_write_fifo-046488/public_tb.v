// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 197;
  localparam OW = 66;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_046488 dut (
    .clk(clk),
    .data_in1(in_vec[196:133]),
    .data_in2(in_vec[132:69]),
    .data_in3(in_vec[68:5]),
    .rst(in_vec[4:4]),
    .write1(in_vec[3:3]),
    .write2(in_vec[2:2]),
    .write3(in_vec[1:1]),
    .read(in_vec[0:0]),
    .data_out(out_vec[65:2]),
    .fifo_full(out_vec[1:1]),
    .fifo_empty(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 197'h014e1c4403a259ca95d22afaafa49d5c0d19d1b9e76108f53c;
    stim[1] = 197'h01542a99b6d3aede99711ec6717c2ab74e7d1c6fe4866c23f7;
    stim[2] = 197'h09aa42ab4189cf913bd3e7afc19f1a0ea74abfcfacff50234e;
    stim[3] = 197'h165c4cdd195ffb3d89651b0b3c222d501e9003e8322c779189;
    stim[4] = 197'h145500f3dacdab02592363b7a45e7a8f68359d3bce1a93a2a7;
    stim[5] = 197'h0cd465d03b95f23cbb9473ea769a2172a62971e7e676676e4c;
    stim[6] = 197'h0bd8325a9598cb9d2822d94cfd48976f8f53fd3dcaf11c7484;
    stim[7] = 197'h06f1f7e57145db048b206045be8ccbeaf246691673fdbe5441;
    stim[8] = 197'h097cbdb1f6d6152a8b57b9e30c66436496b9f47776e09750ee;
    stim[9] = 197'h1936433035c081a689611052ef7aebbfaf55fea529ab7ba064;
    stim[10] = 197'h0f0a6a7509881c798e800df2b7835ba0c9772deed2d94a58a1;
    stim[11] = 197'h0ced3860580ba930ab73c709ae7e9ada8130475f2fa17b0e2d;
    stim[12] = 197'h019cca398dbd9d9350be61c8ca374c90bb64a0b33ec09da129;
    stim[13] = 197'h05ab72fb4b733c02106923ff6e3e7958b060924862d0e87446;
    stim[14] = 197'h06e481c5fb12ede37b833d38fa576de25e23d287ee9ee72886;
    stim[15] = 197'h176fbd174b1409eef8f1ae6ec8ab58ad130e785f1c8dbed5c5;
    stim[16] = 197'h1fc659d77e9f40f326d3bcad1e9bb5312ce12938f2e72887e2;
    stim[17] = 197'h037dbce80a2225f7e1bd5e66527f5acb7cf6c7fb433ee86fe2;
    stim[18] = 197'h07a585b3c42ec4631a0ee90c94bd4de0cc4c53a786b90d2c01;
    stim[19] = 197'h1b20b478ee6d0653096c6d81b0e7c601c5b7790d29ec53ee88;
    stim[20] = 197'h005da1cb59f0a8173987ed1f9e7dd53303ee757f2dda4ac90a;
    stim[21] = 197'h193ec465f96e7125ee4ecbf3645298fee3c94a7ccf10418ba6;
    stim[22] = 197'h096a63b36064338d11cab898289682b0696d99a3ecfc81b482;
    stim[23] = 197'h1fb7b997f02ac91dff6e7598e1c0abaa2e5314cb9d34d586c5;
    stim[24] = 197'h0b450156f3722ae67e12a8060f9c35bd6c9d2a9b9c93991209;
    stim[25] = 197'h070aaf0849f60e43ee6bcdb26ecf08ac68d06bd889cf740c87;
    stim[26] = 197'h1dacb87350d0b39c48aa5eb34b9c8ab472e9e7613d40800ce2;
    stim[27] = 197'h01e6218dc109a1a8ed739b4ef22d909a2b47403b7b6e0bdda3;
    stim[28] = 197'h1537c3c8e46fc2e6d73100ff77705c8a3ab5bd630451859605;
    stim[29] = 197'h091964c4a278e04829b18d8920cce0b7d39f5c0f5b206e1b48;
    stim[30] = 197'h088e000ea6a63162d0e325f10c471eb1af2c5ed501dfceb62f;
    stim[31] = 197'h0162209c1fac90d93b0ef9eba79999a248bba1d3aab5037705;
    stim[32] = 197'h12bbca17f8f04104647120937ca3fb36e69982e680706f4fcd;
    stim[33] = 197'h1643d40274c8dd12f362fd2284c8777273d81fe88cce782e46;
    stim[34] = 197'h0b18c6fe09004512f7066256570cd8b6a0439f73184163a8e4;
    stim[35] = 197'h0628dfb88fb3cff4a64746addeafdeac40762f7dde1c13f087;
    stim[36] = 197'h1f6724dc10770aaba32268315da30f008f96d31e6304e5a768;
    stim[37] = 197'h172d2e1dc48196fe86093b8476ae93e8587b86305cb0849e83;
    stim[38] = 197'h00053bc51bc6f787d9fe387e39732a7549e08e8f14868ca5e0;
    stim[39] = 197'h0d36b07153345506d13ae5aa0379f66cb1fc75fa15927809c8;
    stim[40] = 197'h1096d9722182d10220367c6868bacbcc1d2cb6fb8ee6effd02;
    stim[41] = 197'h00d5e73ab482a6d0bf87eea28127d180fa25dfc50e9f24ff6c;
    stim[42] = 197'h0f2dd2cdf97f4beee95df779968dc3f10c3c5d8209f2746a2b;
    stim[43] = 197'h07e4bf53ee3b89b30a2b1f3fdfd6716ee7f9fd937cb6c1f144;
    stim[44] = 197'h0248349003cd5cca5a7bd26ebd0ba09bb879fac58eec95e96f;
    stim[45] = 197'h0a051c4df6dbf4d82ab97ebb73ab371a9a30add7e33a3dc002;
    stim[46] = 197'h0aec0a1d443c5b651892d2094b7bae9bee930d7f3d18322285;
    stim[47] = 197'h0ad5399ebb6d755f36f82563e24f7d4dce50e96f75747ed0af;
    stim[48] = 197'h0c6c9214a07c2057741296247598016b70c44a7d7af32b76e5;
    stim[49] = 197'h0f802f6bbfa679fcc8d36edb81d6a990fbab39216d24514b4a;
    stim[50] = 197'h03bdffb3c7076c2ab115b82778d3c90c0b4758aa71e287a945;
    stim[51] = 197'h126483c4f5529efdc98d85131b22db8907400e189b8892bfaf;
    stim[52] = 197'h043c69f74db0d2d2569f38e890e55668b733c2b39351cf85e2;
    stim[53] = 197'h0caa399207e00d27417b97ff72bc6dfdd6d913f9f0df7c8463;
    stim[54] = 197'h1bcd5cd84f17270eb6c225c07fc98842d3042c073152733a4e;
    stim[55] = 197'h1524c4841dbac24e7473c5fec0e9de5bb762416bbf4e28af6b;
    stim[56] = 197'h17fbcc497fb5bdc18a0a3a8b1b97bf2d4b4e565276305938c7;
    stim[57] = 197'h1429c0e8cc0efc144f50ef30acabc034f82528edad4218b964;
    stim[58] = 197'h1fcf68dee04d7af0cae5d28058e631c62af0cf95ff927db42e;
    stim[59] = 197'h10357352262fdb59c2ddbf2e43c69053b14fa63f3f17650e82;
    stim[60] = 197'h1fb103b2f0255741f883423c01f527b4696d8904af589edff3;
    stim[61] = 197'h0a7142579ab164952b40d422f37924f4c43ea7454ecfef96c7;
    stim[62] = 197'h0700d87b49279f31d943c84374edbf0f2ee107e4ce07a4b56d;
    stim[63] = 197'h1d8353ba202d958dd0b3593c8cfc7035e8f44ed75426e07aef;
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
      expv[0] = 66'hxxxxxxxxxxxxxxxxx;
      expv[1] = 66'hxxxxxxxxxxxxxxxxx;
      expv[2] = 66'hxxxxxxxxxxxxxxxxx;
      expv[3] = 66'hxxxxxxxxxxxxxxxxx;
      expv[4] = 66'h1354855683139f224;
      expv[5] = 66'h37a7cf5f833e341d4;
      expv[6] = 66'h37a7cf5f833e341d4;
      expv[7] = 66'h37a7cf5f833e341d4;
      expv[8] = 66'h0e957f9f59fea0468;
      expv[9] = 66'h0e957f9f59fea0468;
      expv[10] = 66'h0e957f9f59fea0468;
      expv[11] = 66'h2cb899ba32bff67b0;
      expv[12] = 66'h28aa01e7b59b56048;
      expv[13] = 66'h3246c76f48bcf51ec;
      expv[14] = 66'h3246c76f48bcf51ec;
      expv[15] = 66'h3246c76f48bcf51ec;
      expv[16] = 66'h106b3a779c3527454;
      expv[17] = 66'h106b3a779c3527454;
      expv[18] = 66'h106b3a779c3527454;
      expv[19] = 66'h037abccca4feb596c;
      expv[20] = 66'h037abccca4feb596c;
      expv[21] = 66'h037abccca4feb596c;
      expv[22] = 66'h037abccca4feb596c;
      expv[23] = 66'h037abccca4feb596c;
      expv[24] = 66'h39ed8ff6867dd0dfc;
      expv[25] = 66'h364168f1dcda0ca60;
      expv[26] = 66'h00bb4396b3e1502e4;
      expv[27] = 66'h00bb4396b3e1502e4;
      expv[28] = 66'h330fda3f3cfbaa660;
      expv[29] = 66'h07dceafe5bb495920;
      expv[30] = 66'h07dceafe5bb495920;
      expv[31] = 66'h327d88cbf2dce24bc;
      expv[32] = 66'h1c9d97e6c8a531fdd;
      expv[33] = 66'h1c9d97e6c8a531fdc;
      expv[34] = 66'h1c9d97e6c8a531fdc;
      expv[35] = 66'h1c9d97e6c8a531fdc;
      expv[36] = 66'h2577942ff1e08208c;
      expv[37] = 66'h2577942ff1e08208c;
      expv[38] = 66'h08e24126f947f66dc;
      expv[39] = 66'h08e24126f947f66dc;
      expv[40] = 66'h08e24126f947f66dc;
      expv[41] = 66'h08e24126f947f66dc;
      expv[42] = 66'h08e24126f947f66dc;
      expv[43] = 66'h2c87a804e991ba25c;
      expv[44] = 66'h2c87a804e991ba25c;
      expv[45] = 66'h26c5fa450990eee4d;
      expv[46] = 66'h26c5fa450990eee4c;
      expv[47] = 66'h140a389bedb7e9b04;
      expv[48] = 66'h1572fd76e7566e350;
      expv[49] = 66'h34615bafc6747b800;
      expv[50] = 66'h34615bafc6747b800;
      expv[51] = 66'h15d8143a8878b6ca0;
      expv[52] = 66'h3125a41296f75d37c;
      expv[53] = 66'h3125a41296f75d37c;
      expv[54] = 66'h15aa733d76daeabe4;
      expv[55] = 66'h15aa733d76daeabe4;
      expv[56] = 66'h2df04ac7c49efa9b8;
      expv[57] = 66'h1ca1d2deeae8fda14;
      expv[58] = 66'h1ca1d2deeae8fda14;
      expv[59] = 66'h1ca1d2deeae8fda14;
      expv[60] = 66'h1ca1d2deeae8fda15;
      expv[61] = 66'h1ca1d2deeae8fda15;
      expv[62] = 66'h1ca1d2deeae8fda14;
      expv[63] = 66'h14e284af3562c92a4;
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
