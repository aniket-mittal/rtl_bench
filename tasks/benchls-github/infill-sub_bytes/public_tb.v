// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 128;
  localparam OW = 128;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  sub_bytes dut (
    .in(in_vec[127:0]),
    .out(out_vec[127:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 128'h909b7d7c0346bd5c3a74d9a14c794f22;
    stim[1] = 128'hbde8ded485d382c54faf94a028a86919;
    stim[2] = 128'h4a2a0efd8642ded0e2a33cf6d9df6410;
    stim[3] = 128'hf3230c8901ec0f5fa3b75a6aecaf6d60;
    stim[4] = 128'h697b14a38a97d31fdf2a46a82b7d6d58;
    stim[5] = 128'h8e14ccffd481234e4b275591526f1393;
    stim[6] = 128'ha87ab0fc8fd3b79a6013b4af68769229;
    stim[7] = 128'hbcdccc7275626416a82079ae58372a8a;
    stim[8] = 128'h466eeb5ecfa47825d0d4cf6ed7a68707;
    stim[9] = 128'hcf24509f0b5e6a9c3ad68794ec82d36b;
    stim[10] = 128'hefaf52250d3e1da29cd35b7fe7b44f07;
    stim[11] = 128'hed79433ac768781864b553f93e04dc97;
    stim[12] = 128'h05fb21cffc3cbe099dc8649cb444473b;
    stim[13] = 128'h53137bb5c1c5fa03101b6a134eb98bbc;
    stim[14] = 128'hb95a1e6324804b829c8913bd7a5052cd;
    stim[15] = 128'h5801c7a965ebbb0e2b6ed2c80a0fda59;
    stim[16] = 128'hc1067f26304580debc61cc5c1d3ecfbd;
    stim[17] = 128'haa54553589f3f456fc47bcb113423cf1;
    stim[18] = 128'h2c8581b34a852705a28409a6b97429b0;
    stim[19] = 128'he3bb615681b83b43285498ae557c28f4;
    stim[20] = 128'h9510d8cdd7c82fc97f6578f68fe4304b;
    stim[21] = 128'h192bfba134d118857014437afa14cf85;
    stim[22] = 128'hf749718f256889129eea167a662300a6;
    stim[23] = 128'h2a10d910b6d71ea0a5ee2ed078f677ac;
    stim[24] = 128'h0f1344dfd22b449576b32460e49d1161;
    stim[25] = 128'h17187559c8b61e23828e89fff2ddd6e3;
    stim[26] = 128'hae1f7f8d97695d9875bae620a4d270cc;
    stim[27] = 128'h0f7106077b0112899acc361120e6e4a0;
    stim[28] = 128'hedab71eb5eb8022a3534e48c3154da77;
    stim[29] = 128'h1f4a777fd74258057c65c75f258089e5;
    stim[30] = 128'he6143b26b1e9fc2c1869e3c6b7ce390c;
    stim[31] = 128'h233d669dd62969b1527bab826f81d72c;
    stim[32] = 128'h9ac5e08f5d823e1c83a5144d785fba0b;
    stim[33] = 128'hf9044b9a817ab0ee0081301c6319cd83;
    stim[34] = 128'h6ae76d8fcfb986d0fc99c2340e6f3b51;
    stim[35] = 128'h58467f7f2bc5bb1c4da7d48672dd0b62;
    stim[36] = 128'he19e96c00dc80dced1f8749dde583517;
    stim[37] = 128'h3a4c44777d0138bb12ab945a5a4ec1e7;
    stim[38] = 128'h893bdc4d9a6d03d65fc139b0a468c7b3;
    stim[39] = 128'h97c665018035371b4e5799c7ed7e5c98;
    stim[40] = 128'hd4a2463ae3e452c0c772e2ca155dc1fa;
    stim[41] = 128'h9ca9994a5b13c3159639f31e314247b2;
    stim[42] = 128'hfdd52d0cb1b1575de02561169274280b;
    stim[43] = 128'h9edf77d7f615337dddfb3d9088a6bf5a;
    stim[44] = 128'hed13504387a24c97cf41b32c2162e4e7;
    stim[45] = 128'h099123242f7511b6931016a01910a708;
    stim[46] = 128'h0525117589a2fbc9a95728be0c8b9df8;
    stim[47] = 128'h3f82953e3e38368502558557527f4887;
    stim[48] = 128'h48d1bcd271316e2c4beff5d47bd3b6cd;
    stim[49] = 128'h0d9ede2df47c9f5c19e298326c4d0c88;
    stim[50] = 128'hd35692558301f9a4016c4a23f5d745a3;
    stim[51] = 128'h758cfda45b049d13960f061764930bd7;
    stim[52] = 128'h2ddebbce588f7daa0c60a93ae3ec1fb1;
    stim[53] = 128'h80bade5214292b31c6638eab05ca570f;
    stim[54] = 128'h2f0e75ae013457f3a4c378d725ec73d3;
    stim[55] = 128'h02983ebcc14861aac360e84e8cc7519f;
    stim[56] = 128'h4f8738f4433ec440261279dbc87fe626;
    stim[57] = 128'hfc63d18ddcbcf6ab72883f8922c5175f;
    stim[58] = 128'h126a4f2dbb43d7c7a5e79f5884c8f927;
    stim[59] = 128'h7454cae6971c330192b293a4a810b919;
    stim[60] = 128'he09095cdc9744b07758b79b58a6c6cc2;
    stim[61] = 128'hbf34e8e645bcba92317ec8507cea989e;
    stim[62] = 128'h72f66000e4c7a997dcda396f7f792700;
    stim[63] = 128'hd191aa1fc84a6dd84edc0d7f76d6eb12;
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
      expv[0] = 128'h6014ff107b5a7a4a8092353229b68493;
      expv[1] = 128'h7a9b1d48976613a6847922e034c2f9d4;
      expv[2] = 128'hd6e5ab54442c1d70980aeb42359e43ca;
      expv[3] = 128'h0d26fea77cce76cf0aa9be02ce793cd0;
      expv[4] = 128'hf921fa0a7e8866c09ee55ac2f1ff3c6a;
      expv[5] = 128'h19fa4b16480c262fb3ccfc8100a87ddc;
      expv[6] = 128'hc2dae7b07366a9b8d07d8d7945384fa5;
      expv[7] = 128'h65864b409daa4347c2b7b6e46a9ae57e;
      expv[8] = 128'h5a9fe9588a49bc3f70488a9f0e2417c5;
      expv[9] = 128'h8a3653db2b5802de80f61722ce13667f;
      expv[10] = 128'hdf79003fd7b2a43ade6639d2948d84c5;
      expv[11] = 128'h55b61a80c645bcad43d5ed99b2f28688;
      expv[12] = 128'h6b0ffd8ab0ebae015ee843de8d1ba0e2;
      expv[13] = 128'hed7d21d578a62d7bcaaf027d2f563d65;
      expv[14] = 128'h56be72fb36cdb313dea77d7ada5300bd;
      expv[15] = 128'h6a7cc6d34de9eaabf19fb5e8677657cb;
      expv[16] = 128'h786fd2f7046ecd1d65ef4b4aa4b28a7a;
      expv[17] = 128'hac20fc96a70dbfb1b0a065c87d2ceba1;
      expv[18] = 128'h71970c6dd697cc6b3a5f01245692a5e7;
      expv[19] = 128'h11eaefb10c6ce21a342046e4fc1034bf;
      expv[20] = 128'h2aca61bd0ee815ddd24dbc42736904b3;
      expv[21] = 128'hd4f10f32183ead9751fa1ada2dfa8a97;
      expv[22] = 128'h683ba3733f45a7c90b8747da33266324;
      expv[23] = 128'he5ca35ca4e0e72e006283170bc42f591;
      expv[24] = 128'h767d1b9eb5f11b2a386d36d0695e82ef;
      expv[25] = 128'hf0ad9dcbe84e72261319a71689c1f611;
      expv[26] = 128'he4c0d25d88f94c469df48eb749b5514b;
      expv[27] = 128'h76a36fc5217cc9a7b84b0582b78e69e0;
      expv[28] = 128'h5562a3e9586c77e596186964c72057f5;
      expv[29] = 128'hc0d6f5d20e2c6a6b104dc6cf3fcda7d9;
      expv[30] = 128'h8efae2f7c81eb071adf911b4a98b12fe;
      expv[31] = 128'h2627335ef6a5f9c800216213a80c0e71;
      expv[32] = 128'hb8a6e1734c13b29cec06fae3bccff42b;
      expv[33] = 128'h99f2b3b80cdae728630c049cfbd4bdec;
      expv[34] = 128'h02943c738a564470b0ee2518aba8e2d1;
      expv[35] = 128'h6a5ad2d2f1a6ea9ce35c484440c12baa;
      expv[36] = 128'hf80b90bad7e8d78b3e41925e1d6a96f0;
      expv[37] = 128'h80291bf5ff7c07eac96222bebe2f7894;
      expv[38] = 128'ha7e286e3b83c7bf6cf7812e74945c66d;
      expv[39] = 128'h88b44d7ccd969aaf2f5beec655f34a46;
      expv[40] = 128'h483a5a80116900bac6409874594c782d;
      expv[41] = 128'hded3eed6397d2e5990120d72c72ca037;
      expv[42] = 128'h5403d8fec8c85b4ce13fef474f92342b;
      expv[43] = 128'h0b9ef50e4259c3ffc10f2760c42408be;
      expv[44] = 128'h557d531a173a29888a836d71fdaa6994;
      expv[45] = 128'h01812636159d824edcca47e0d4ca5c30;
      expv[46] = 128'h6b3f829da73a0fddd35b34aefe3d5e41;
      expv[47] = 128'h75132ab2b207059777fc975b00d25217;
      expv[48] = 128'h523e65b5a3c79f71b3dfe64821664ebd;
      expv[49] = 128'hd70b1dd8bf10db4ad498462350e3fec4;
      expv[50] = 128'h66b14ffcec7c99497c50d626e60e6e0a;
      expv[51] = 128'h9d64544939f25e7d90766ff043dc2b0e;
      expv[52] = 128'hd81dea8b6a73ffacfed0d38011cec0c8;
      expv[53] = 128'hcdf41d00faa5f1c7b4fb19626b745b76;
      expv[54] = 128'h15ab9de47c185b0d492ebc0e3fce8f66;
      expv[55] = 128'h7746b2657852efac2ed09b2f64c6d1db;
      expv[56] = 128'h841707bf1ab21c09f7c9b6b9e8d28ef7;
      expv[57] = 128'hb0fb3e5d8665426240c475a793a6f0cf;
      expv[58] = 128'hc90284d8ea1a0ec60694db6a5fe899cc;
      expv[59] = 128'h9220748e889cc37c4f37dc49c2ca56d4;
      expv[60] = 128'he1602abddd92b3c59d3db6d57e505025;
      expv[61] = 128'h08189b8e6e65f44fc7f3e8531087460b;
      expv[62] = 128'h4042d06369c6d388865712a8d2b6cc63;
      expv[63] = 128'h3e81acc0e8d63c612f86d7d238f6e9c9;
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
