// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 128;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_107873 dut (
    .A(in_vec[127:64]),
    .B(in_vec[63:0]),
    .mult_low(out_vec[63:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 128'hb0962110fe19a1ac1d2d8a5b1d7db47a;
    stim[1] = 128'h0e60a33d5833b57245ee3e3f9f1535b4;
    stim[2] = 128'ha189440667ea4f4c2a2f32a3c0a12fa7;
    stim[3] = 128'h687f67fedc03643d8cc844b7b8551822;
    stim[4] = 128'hb38b77f5438b44e1eec9e3543a3f2322;
    stim[5] = 128'h6e13fa730015ebc9fd358fac05c804bb;
    stim[6] = 128'hb1e0f6c4c7abf7c5e8e8d51e8e67bf20;
    stim[7] = 128'h7a85994e652524816761c4b378a6f01a;
    stim[8] = 128'hb4863139f0b260db49421c5fa7e1c930;
    stim[9] = 128'h22d07c2073014ae6886e413ac4c0d859;
    stim[10] = 128'h660112ce0b3ebea483d4cf4922bbb0af;
    stim[11] = 128'h34a41a4acc7ff3a16deaf19b83f665ed;
    stim[12] = 128'h1d89d268df743d5508087d649ea9567d;
    stim[13] = 128'he778092e31281fdb929d89819adf45a3;
    stim[14] = 128'he7215335de05200bc33739ad6d965e89;
    stim[15] = 128'h84c2a95f28008e0877a1dbb7cd26c16d;
    stim[16] = 128'h0f9980bbb24ca8d7ed1fde7e2d056ba6;
    stim[17] = 128'he16af64b0769d04cd0c8f093e3f57e7f;
    stim[18] = 128'hdcbe62290ebf43cb9fb1548eded3af78;
    stim[19] = 128'h4483204400769866acd11e061a568ebd;
    stim[20] = 128'hd50721d107ce0dbdf9e08f8a67b371b4;
    stim[21] = 128'hbea0b3c4dd7ff7b741a2ca52eaf6e4cf;
    stim[22] = 128'h32f95dbf2ddc41130ff946dbf7663fb5;
    stim[23] = 128'h613475163771d65d574f4d050e042273;
    stim[24] = 128'h234e00ff6e16c5d1b18d11df1f2fe192;
    stim[25] = 128'h6b41066319577510e8c51ac2071ca4aa;
    stim[26] = 128'he09502be73557c4c694481cf645ce30c;
    stim[27] = 128'h7a1f7b40b204b9afcab79b011e65f279;
    stim[28] = 128'h5811af989e3eaab3c673611553acaa6c;
    stim[29] = 128'h4da50fbc31da844f70d05c3b59336363;
    stim[30] = 128'hdc335c720d189625e6467fe8bcf866b6;
    stim[31] = 128'h06711b0a5f32f9a4e1149bbd7f8f3a00;
    stim[32] = 128'h00e965342776e0e1f839872602788c0c;
    stim[33] = 128'h77c9dbd4426c678cae8262dc9fae1c1d;
    stim[34] = 128'h1d92e1adf37b4b5e094f98e77ce1139f;
    stim[35] = 128'hb01b563bf81165fa0230431ea339e5b1;
    stim[36] = 128'h6450c5d2620b532560adbd552599a974;
    stim[37] = 128'h1c599e638502ce54de8e40ced3c768c8;
    stim[38] = 128'h77c9b2af492bbf9643e9f7202685fa4c;
    stim[39] = 128'hc2119c547496683bc32dce281097b494;
    stim[40] = 128'he09e5f785b88fb2c49bd49f7180513d5;
    stim[41] = 128'hf0232ed337058447c2bc55f9215092cf;
    stim[42] = 128'h3442c289b04e563695956c1d14a08650;
    stim[43] = 128'h40c7725fcc4de5368a01529915a0b0af;
    stim[44] = 128'h561ad81e8feb895df9c4db38a2722fe4;
    stim[45] = 128'h4fbbe714811b47ff465e7ac71f658e9f;
    stim[46] = 128'h2588cc69c98c7b7e5031f59c3f008d40;
    stim[47] = 128'h1196cd54084bdc2def7e8fe77ed16d8a;
    stim[48] = 128'hfd7e19f620631d3145bd8f97dcb2073e;
    stim[49] = 128'h0601394c454a44162430da6706ecca3b;
    stim[50] = 128'h7a27d9de235c0742bbf304d1f3df1516;
    stim[51] = 128'h9e2476c3d44f25a63e3935d5b807444b;
    stim[52] = 128'h129592a918050c8ddbcdc22d49148f8b;
    stim[53] = 128'hd1c6f3dc5be021289877ebe5777d1f21;
    stim[54] = 128'hd3e230dfb628544729838ef689a2e868;
    stim[55] = 128'h33a6743ce277b32437b5aea35ece9121;
    stim[56] = 128'h78e7bb27427531975a4466a546d4c0a9;
    stim[57] = 128'h7509293d6c3046914b4c307a4c879f87;
    stim[58] = 128'h849aa9998b7f0b900b4e66072c6410c8;
    stim[59] = 128'h0f7467aab55ecbf52767197d0f472484;
    stim[60] = 128'h3b9a2bf0bdb7c843a23d21900a6ebfab;
    stim[61] = 128'ha9a3dc22455ac1516bb1356c47e5f21f;
    stim[62] = 128'hcb18e66186858534529f975e9bf2c5fd;
    stim[63] = 128'h8ed43ad8a90183db8d8e56b8a944b8f7;
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
      expv[0] = 64'hd45fdebb8adffbf8;
      expv[1] = 64'h4036176269462e28;
      expv[2] = 64'h1ea0f87aad34ae94;
      expv[3] = 64'h61220d40aa1a081a;
      expv[4] = 64'heb04c083f048e8e2;
      expv[5] = 64'h6466eec889ba5fd3;
      expv[6] = 64'h11ff5548399df3a0;
      expv[7] = 64'hbe565a2e3ba4a51a;
      expv[8] = 64'h860088142cf91c10;
      expv[9] = 64'hb4bd24bd572519f6;
      expv[10] = 64'h4e85077fdcc1121c;
      expv[11] = 64'h88ceea084d49110d;
      expv[12] = 64'hf822b0111b798081;
      expv[13] = 64'h324981219ae74f71;
      expv[14] = 64'h0f71af6e27f42fe3;
      expv[15] = 64'hbca99c35f0808168;
      expv[16] = 64'h81886e3abf7a586a;
      expv[17] = 64'ha713e47a7ebfbdb4;
      expv[18] = 64'h05aa4f5c93508c28;
      expv[19] = 64'heb82442bae5b174e;
      expv[20] = 64'hd75d62e8171915e4;
      expv[21] = 64'h1af2417862f248f9;
      expv[22] = 64'h157efa40e34faf6f;
      expv[23] = 64'hc1e4cca9760fa5c7;
      expv[24] = 64'hacad3ba06d388232;
      expv[25] = 64'hf54839ef18d1fca0;
      expv[26] = 64'h8fdba5ec90893790;
      expv[27] = 64'h1151e22b5fce31b7;
      expv[28] = 64'h3624e49a190ee184;
      expv[29] = 64'h80d6a5cb9b68b78d;
      expv[30] = 64'hb05654e9bb257c4e;
      expv[31] = 64'haabe6af75b2b2800;
      expv[32] = 64'h1d5fb9e80805968c;
      expv[33] = 64'h37542c9db6c30adc;
      expv[34] = 64'h59cf9dcd25c9c962;
      expv[35] = 64'h4bf1f577f6ea23da;
      expv[36] = 64'h643fae1ff12219c4;
      expv[37] = 64'hbac8e89ead4f51a0;
      expv[38] = 64'h5f2568693f035c88;
      expv[39] = 64'h93f2b140530abe1c;
      expv[40] = 64'h270fe29c5b793f9c;
      expv[41] = 64'h64ad760020167369;
      expv[42] = 64'h3f31b920335b34e0;
      expv[43] = 64'hcdca69b4e694cfea;
      expv[44] = 64'hcc81d6cc716869d4;
      expv[45] = 64'hecc1a00d9a7c2961;
      expv[46] = 64'h0a4bc7a0c5234580;
      expv[47] = 64'hebfe62bcac60d942;
      expv[48] = 64'ha2294d65f5df68de;
      expv[49] = 64'hf06a2229da1f0d12;
      expv[50] = 64'hd0420eed8eff09ac;
      expv[51] = 64'ha2ca321b90ba1fa2;
      expv[52] = 64'h098175fd0cc4938f;
      expv[53] = 64'hbb008b29c4701e28;
      expv[54] = 64'h9f10d0cfe0b094d8;
      expv[55] = 64'hc6df30245cdd7ba4;
      expv[56] = 64'h1f6e33b21f9afcaf;
      expv[57] = 64'h6e3d19184bc04577;
      expv[58] = 64'h0c571d3a303a0880;
      expv[59] = 64'h4b59d465c5829e54;
      expv[60] = 64'ha5c6f2d582f6c1c1;
      expv[61] = 64'h6d2496ae9530facf;
      expv[62] = 64'h3f6d51dd189da864;
      expv[63] = 64'hc00bbc5ec067a04d;
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
