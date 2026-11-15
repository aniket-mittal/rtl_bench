// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 231;
  localparam OW = 96;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_067830 dut (
    .i_Data_From_MEM(in_vec[230:199]),
    .i_Data_From_WB(in_vec[198:167]),
    .i_Data_From_vWB(in_vec[166:135]),
    .i_Rs1(in_vec[134:103]),
    .i_Rs2(in_vec[102:71]),
    .i_Immediate(in_vec[70:39]),
    .i_PC(in_vec[38:7]),
    .i_Fwrd_Ctrl1(in_vec[6:5]),
    .i_Fwrd_Ctrl2(in_vec[4:3]),
    .i_ALU_src1_Ctrl(in_vec[2:1]),
    .i_ALU_src2_Ctrl(in_vec[0:0]),
    .o_Op1(out_vec[95:64]),
    .o_Op2(out_vec[63:32]),
    .o_Store_Data(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 231'h57eb409822704f019b6faa9432fd152725b3c4df20e6a4eb9318429b23;
    stim[1] = 231'h0a2484f94548250830912e359774ebaaf29c6b26037f6e174d07a0b6f6;
    stim[2] = 231'h524f1f7befec9cc6925f7d40b126903f4572553e6a138aae7ab5399e59;
    stim[3] = 231'h1fa41beb5faa9bf9b914a26f9b2a5750fb7cb12c7c12997689be26c001;
    stim[4] = 231'h6b6b0a241b744057bcd6195f732e9ea8635f1ff5d784abce4b3c5e4f92;
    stim[5] = 231'h2a11b13aaa1e3b35833c2c523ce052eafe33c006757b112955f14622d0;
    stim[6] = 231'h57ddcf9f3165693a40f862aeeb3a51395e8ce8831583c73bf6d05a466d;
    stim[7] = 231'h7005d633c6acda6fd0d7d0b5727802ff409b6dd460bad135b81716c613;
    stim[8] = 231'h5fb1e5be735a0c36e2af1ce3e6574c12d119b384b6a322d73b1663c967;
    stim[9] = 231'h67cda96486c7e8762a42c4d1947bf54418fd8fad0f5521a7eea7a6c648;
    stim[10] = 231'h408740413efe7378b00d06c88bb047f1ed2ce3cc0fa01d3986e7045089;
    stim[11] = 231'h06b9a65f9f873d6038d41c7cb1b11c0187a206da804c6160f63d2997cf;
    stim[12] = 231'h52038e816cd1580902a49c9b61e6bbf1773194562cf10b103e206a5387;
    stim[13] = 231'h2ca75e59f5f1365c0f067720b124e14a346028afd0eb7fec25e7382e2e;
    stim[14] = 231'h442c508b102244b5a8a23e54de3191c37267318b61e7b7a98f46e041f2;
    stim[15] = 231'h6a4171208354c9cf50921ffdce1b2d9507975ff08ff2fd59e79cbf6543;
    stim[16] = 231'h5829aad119c05e5515132a0e0840183a9d251ef5e381541db2091ef704;
    stim[17] = 231'h0efc36270e258bb007606f96d27de0bdd050fb56871234b517a0f9fb7f;
    stim[18] = 231'h108f9d9b28e7c25d2863624dc01cd740b7803f808bdc9bb5111ad0b1d1;
    stim[19] = 231'h2d5cec8418d7257ba61896e79af96b951ab5922233aab00a412ec28afd;
    stim[20] = 231'h7ddc32523ec13bf90997b2ea5ff80db5be3087d5cbf3355162dc1a33f4;
    stim[21] = 231'h1a4c6f503cee9fa8431dee132560a4880d25ede910e58ccdad084ce8d0;
    stim[22] = 231'h647e8be6bd6fe71d3933ffcf77bc89aea1af6f1f743871456efd2f25fd;
    stim[23] = 231'h7e75f8b794317212b69626c8e65c02a97bde00ee0b943403c75395e205;
    stim[24] = 231'h579a77649da9104fe937608bb9c5fb54401f64b007ff46d0526fcb9d1d;
    stim[25] = 231'h2383a7dfb86a9f10ee2f072e46d52aacf61a26c616b88ea6f62cd569e8;
    stim[26] = 231'h11a5e569e88789df94d07c037d870f590837053e1ab55aa8c5eb6e0b9f;
    stim[27] = 231'h6144056271bc76bc17b0907cf5b0997f506c6c2c3312e225e544c3812b;
    stim[28] = 231'h604776530e125427f1dc33bf9a53d1dc1ad5285de88f18f5ea5bc009c9;
    stim[29] = 231'h2983835abc71d497ad238865e87f29e48fb9ef10c4067b581948808521;
    stim[30] = 231'h77f354b75101df04f60fc81b1d44dfe7c45b8dd8634b9a17131a0e45ba;
    stim[31] = 231'h12636cb490767162ca828356fb95254da5832090403cc982a45215be3b;
    stim[32] = 231'h1ba45f155c64343a3f575856820ac367d22888d79c302abd780fc2a93f;
    stim[33] = 231'h66b783a311eb5caaf9b999992e5b1d4c5d0b5622794a921f6cf8677482;
    stim[34] = 231'h6e1da2d0ca1cfd441ed47a66bc48123eb10aacfce0e61c17ff706a7cdc;
    stim[35] = 231'h44232d74b22899541da1e94e2fda4e83b2238d82fab285bd8d117bfb0e;
    stim[36] = 231'h261d5f4aaacf4f051d32427b1eda2c8faed13113dab15be6c92b0ce4e6;
    stim[37] = 231'h0fe555f1870d4868897dd211a8aec2dd5245fa225fd03308683bc79495;
    stim[38] = 231'h377de5012e8795a955bd1600561d0cf302578e1da32dc0f7784318a8df;
    stim[39] = 231'h45bd733b6beaf6c211e3b1832d8da43860e8ac73fd032d8c3cff99e1d1;
    stim[40] = 231'h2f011e8dab58168edbc9e72347b5a932e6a8afe2fe05a6965e3920fcd0;
    stim[41] = 231'h1e3d6dbc28c68fc69c96a920c12c1c662e3a36be7410b093a9532259a1;
    stim[42] = 231'h0e54cf90ceac627a380c25b5558a78774a811e13c7dd4be759cf156c3d;
    stim[43] = 231'h6506a1276ad5007b323bab4a94374f19f57ff496cb3e9abe67cf1b85e3;
    stim[44] = 231'h65f55a1a3ab2cae6b567cf4007642efcaf90a94a4a4c12d044c442e090;
    stim[45] = 231'h09c91736c3641b6b2f02c51ed7756e4eaa9a5959806b0cf9259c3c00ec;
    stim[46] = 231'h6774d02c2791f17e22afd6259b9822bb36b318606a8bda204a67522602;
    stim[47] = 231'h4daa45f1c4f504872b29c7af878941ac3753e921ddf0db8d4ccb8cea5f;
    stim[48] = 231'h0e873503ef722838575f97a9d10fbe8097fa910c905940a22fb1e00192;
    stim[49] = 231'h7b76a1c4941abf2f7595e3bff605bf60bad9c582337bee58eec27876f2;
    stim[50] = 231'h681d9fade5959c0802bc0944431951effc5a4f4958b4a1f7adcc1859d0;
    stim[51] = 231'h527464369b2f3968bf8c46cdd31d934094b744fbc8aef886913103208c;
    stim[52] = 231'h57556d5268dca18c77d522ca695c66d9681661c199c29ccb1a1cb8700b;
    stim[53] = 231'h67eb80140f67327783e11fa59ca94d857323590255e9111301a3d52669;
    stim[54] = 231'h59438d29a774c3ddc94c5203379c169dc8c7a3b197538635e1204a0506;
    stim[55] = 231'h2b2c5075cd635a85147a0b464646737d0f5f03475ac39fa37207c5e800;
    stim[56] = 231'h677ba2f6cb7b556d2002b24382c9426c122ba003094fbfc359486e306c;
    stim[57] = 231'h1d3a8d746e985ea1688831e2913e0e217735dd3fffe756398f3365180f;
    stim[58] = 231'h6bf905692724b871038752e4b84abd7f6373422c5896a0828248415f53;
    stim[59] = 231'h04ef2522e8a16a05a1f4119cb69f61ff691460cf15ca205c1ee5959af3;
    stim[60] = 231'h7dacaabfce17fef071ccc8be6ceb3b7793c7d47d36fe5bfb9de5801889;
    stim[61] = 231'h2f095c3f63a39e8cfe71d42a2f93486f5867433fefc1ed9d46d0b8da1c;
    stim[62] = 231'h12378e7c885ca55b7a26f32f5aa0507ed3d0d282be8d8afc7c810602bd;
    stim[63] = 231'h70158d8218bdc1765d2e8b2d76433b9acf0dec9605d0987e283c4e3adc;
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
      expv[0] = 96'h2630853641cd49d74b6789be;
      expv[1] = 96'h61225c6b8a904a108a904a10;
      expv[2] = 96'hdfd9398dd427155c24befa81;
      expv[3] = 96'h3654aea1f82532edf6f96258;
      expv[4] = 96'h9678bc9f36e880af36e880af;
      expv[5] = 96'h543c766b543c766b543c766b;
      expv[6] = 96'h000000002b078e77afbb9f3e;
      expv[7] = 96'h702e2d8cc175a26b8d59b4df;
      expv[8] = 96'hc55e39c76d4645aea2336709;
      expv[9] = 96'h0d8fd0eccf9b52c9cf9b52c9;
      expv[10] = 96'h17608fe31f403a73810e8082;
      expv[11] = 96'h3f0e7ac00098c2c10d734cbf;
      expv[12] = 96'hc3cd77e259e21620ee6328ac;
      expv[13] = 96'h594ebcb3594ebcb3594ebcb3;
      expv[14] = 96'h1e8dc0832044896b2044896b;
      expv[15] = 96'hcf397eca1fe5fab30f2ebfe1;
      expv[16] = 96'h000000003a4a3deb3a4a3deb;
      expv[17] = 96'h0ec0df2d0e24696a0ec0df2d;
      expv[18] = 96'h51cf84ba17b9376a51cf84ba;
      expv[19] = 96'h00000000675560144c312dcf;
      expv[20] = 96'h000000007d8277f27d8277f2;
      expv[21] = 96'h79dd3f5079dd3f5079dd3f50;
      expv[22] = 96'h00000000e870e28a7267ff9e;
      expv[23] = 96'h0000000017286807f7bc01dc;
      expv[24] = 96'h000000000ffe8da0d26ec117;
      expv[25] = 96'hdc5e0e5c47074fbf47074fbf;
      expv[26] = 96'hfb0e1eb2356ab55129a0f806;
      expv[27] = 96'hca8987026625c44bc2880ac4;
      expv[28] = 96'h1c24a84fd11e31ebc08eeca6;
      expv[29] = 96'h530706b5880cf6b01f73de21;
      expv[30] = 96'h26341c8bec1f9036ec1f9036;
      expv[31] = 96'h48a42b7c80799305950506ad;
      expv[32] = 96'h3748be2a3860557a7eaeb0ad;
      expv[33] = 96'hd9f0cee9ba16ac44ba16ac44;
      expv[34] = 96'h000000003da8f4cd3da8f4cd;
      expv[35] = 96'h5fb49d0788465ae988465ae9;
      expv[36] = 96'h3a6484f65da262275da26227;
      expv[37] = 96'h00000000bfa066100e1a90d1;
      expv[38] = 96'h5d0f2b52465b81eeab7a2c00;
      expv[39] = 96'hd7d5ed84fa065b18d7d5ed84;
      expv[40] = 96'h56b02d1d56b02d1d56b02d1d;
      expv[41] = 96'h3c7adb78e82161275c746d7c;
      expv[42] = 96'h000000008fba97ce70184b6a;
      expv[43] = 96'hcf9e370b967d357ceaffe92d;
      expv[44] = 96'h0ec85df9756595cd756595cd;
      expv[45] = 96'h0000000013922e6d13922e6d;
      expv[46] = 96'h94cea44c6d6630c06d6630c0;
      expv[47] = 96'h89ea090ebbe1b71a56538f5f;
      expv[48] = 96'h5f63c003dee45070dee45070;
      expv[49] = 96'hdd84f0ed28357e5e28357e5e;
      expv[50] = 96'hcb2b3810cb2b3810cb2b3810;
      expv[51] = 96'h00000000a4e8c86da4e8c86d;
      expv[52] = 96'h343970e033853996aeaadaa4;
      expv[53] = 96'h07c23f4babd22226cfd70028;
      expv[54] = 96'h6f382d3b918f4763918f4763;
      expv[55] = 96'h8c8ce6fa1ebe068e1ebe068e;
      expv[56] = 96'h00000000cef745edcef745ed;
      expv[57] = 96'h227c1c42ffceac733a751ae8;
      expv[58] = 96'h049082beb12d41054e4970e2;
      expv[59] = 96'h3dcb2b352b9440b8d142d40b;
      expv[60] = 96'hd9d676ef6dfcb7f7fb59557f;
      expv[61] = 96'h00000000fce3a854fce3a854;
      expv[62] = 96'h000000007d1b15f8f44de65e;
      expv[63] = 96'h00000000ba5d165aba5d165a;
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
