// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 239;
  localparam OW = 2;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  ibex_pmp dut (
    .csr_pmp_cfg_i(in_vec[238:215]),
    .csr_pmp_addr_i(in_vec[214:79]),
    .csr_pmp_mseccfg_i(in_vec[78:76]),
    .priv_mode_i(in_vec[75:72]),
    .pmp_req_addr_i(in_vec[71:4]),
    .pmp_req_type_i(in_vec[3:0]),
    .pmp_req_err_o(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 239'h63bee84dc9003cf51c497eb1f1caca659daa01e1540f352dbfd1fb886423;
    stim[1] = 239'h2fb2a7ec85a2b58e4dc10d64884ff4344c07348ad75eeaa017d0ed84a708;
    stim[2] = 239'h6fa77e0eaa36749b5eee8e3baa9d3e77fc32e294876057656d9a97412ac0;
    stim[3] = 239'h63676d6b03b4248593209f019655a6915c8d31084cbb525dabb79da1e6c3;
    stim[4] = 239'h3967e997e15b3afbc542e8fbdc1a36054d550725e7efbd5a24e93c5dbbf5;
    stim[5] = 239'h606707fd49a0f9151fcd513fb1edd667265fedf58df9d4e120d2ab0c1af5;
    stim[6] = 239'h3294b223d91f4ab0144d85f842679449988b7099d71dc2feddb9e56a67e5;
    stim[7] = 239'h59a382c80af7a1e64de0bb8d5180fc018ab2795f186d96270026bda38a94;
    stim[8] = 239'h164bd39f7d688e6f3a23304c1407489f0b4684522e4eb941e10caaf1f241;
    stim[9] = 239'h6a542ccd4e12963a4f43104b26a0847e808d9e920187d929f4ef77f8ba39;
    stim[10] = 239'h2f56b0eeb530973dc370af57d42a8ec960515690fc0eeb90c18d4c9f4dda;
    stim[11] = 239'h2f15c75246fd1f54c5a81a4b07e6a1714c6623d866f8c94755525bda3857;
    stim[12] = 239'h142c888eae482c1ddef6cf81d93e7633625435c36f12448c05dc0c6df749;
    stim[13] = 239'h04041f1ac0493b5a40556074a87cea7a1a47a478f7ca5df5fbda14a46724;
    stim[14] = 239'h3934ead5923deed03cac8eef4e58011d87b1475e0c81014866401f4fac48;
    stim[15] = 239'h6e2f45c82f4f3759be2cd940bee0b1a65d0e74aa1c7db3904b0a84718fd3;
    stim[16] = 239'h03d8b904fc24fce8a119e0471d5a9f29663efd923b2289da69128d292472;
    stim[17] = 239'h1519a2894868370029879e2cfa7323b065cc4f67c9af57ec2ef470b9ed77;
    stim[18] = 239'h5cc743a02a9e5646d214fcee7cfe92d7dbc71d5951e7da75193a4f67c57f;
    stim[19] = 239'h1fc701c6f91d11420632d6a561517684ca267fb5ab61d034ab82cea16ade;
    stim[20] = 239'h0e7c3d3e7b8ee139e6c29dd7d131f5c1e7a972d29b1e876243891283bb13;
    stim[21] = 239'h3f6c3483c799532acc8fc03958a88fe2cc1126199a2c3feb9366ad17f96a;
    stim[22] = 239'h78f6cf0c42cd58af5948c0a0000af6781dd9d3f6ee77b08c84c554f4b93c;
    stim[23] = 239'h27a397f443bb2a69e0f8923e41258ea51dfd3b33aafa7318bc0915e9b461;
    stim[24] = 239'h46f232397a23e278b5fc6035af29351a610b17d671abe355796787c48a2e;
    stim[25] = 239'h2602fbdddf6b600ebcde337492e21f897323169da845ed73f466ec526a01;
    stim[26] = 239'h215d48f09fa108f4b8024ae3b597595c05ff6dd24f90045ef3c94dd58430;
    stim[27] = 239'h48d3cb7733fc0bbbf322e0932276a2a75ebf8fe6dfce457e22704d77833e;
    stim[28] = 239'h330585f52af75513a8d306451f1117ad8bc784e40af4eba7e9b9e4f6834f;
    stim[29] = 239'h6226a8c30388060a2e8b57994b77605c0e60e24abb7d8114719dae72493f;
    stim[30] = 239'h712a0111eeb62002d1053e8918152141f1515b8ab08f49243cd1d9b81c5a;
    stim[31] = 239'h47c866f7ba06f517a7d8bb844e0d50e2e49044b1fca55e08b880fce13c37;
    stim[32] = 239'h615f8c3dc0643630d5e45ecf36a410ea9fdb82071ee244bdd09468348cd9;
    stim[33] = 239'h4a47f65ba0088f561efb5e197816f652026edd18eb0ced3f2d0734cf08d9;
    stim[34] = 239'h2f38e08e73413154a5c739e0c48040c55ea345218e09d0aabe81cbf5cd17;
    stim[35] = 239'h7ef7e013deea24e925f10c4234002b4cd1d325c509786e40e7b16c3de6ed;
    stim[36] = 239'h4a819d61cda07f93adc9ec25e3b825f5ed0f44d9c55da9735933a3d97be0;
    stim[37] = 239'h698285f5dbb0195df4f05b93ace4da3ea72fddda35b76f9a70687e09180a;
    stim[38] = 239'h5a85bd3aefa5d564d4c04fdf1775ef2f7269c6717acb72dc3b7614b2c7c5;
    stim[39] = 239'h3b4838e20081b536a361bbc5d19e880923994fada532c4610f3aba7b5e12;
    stim[40] = 239'h102dbc4ea1986c3de1e2fa947ec50e475d5c835e68ea02510a3e4d74a5cc;
    stim[41] = 239'h6ad3209da502eabc095424763a28dc6ef342f675d38ebf34cf9a004d6ee1;
    stim[42] = 239'h4864146f933f7e4b1ea671ce5092512facc32571ecfe2b1dd14f5fa5bc4a;
    stim[43] = 239'h3bbad24923d14137c70250d9567b589fadc000d4f1c851ef372231ebb602;
    stim[44] = 239'h6908285593490e7c6020e663f9e7b786df9ce1d0d497e6bd9dc2d01454fc;
    stim[45] = 239'h0252ed3deb3c5a8a2d75b2449823871350b79b563cbac67307bc1a031760;
    stim[46] = 239'h1ea10ceb1cc41cfa45121f55277d17b734a56841dab4adf983cc4acbaf83;
    stim[47] = 239'h1f108ccf982f90cc3f0ff70819e87bf426679f60c68cb01b4020797174e6;
    stim[48] = 239'h3f32f269f0351b17c170c35c64136b29b67c282b7142320aac8d19ad5c65;
    stim[49] = 239'h66e60833ef4766a766f979b87948cc92ea9dde0cc471fae265242b097880;
    stim[50] = 239'h7a6e9f6385c9324d201e2c68f95557a8a1f4c90dd42870ac298b90452095;
    stim[51] = 239'h4e6bc3815d0604a60ada82b191de85850e5c505ad50d4b8b86d35d6dd04e;
    stim[52] = 239'h08df84e98ea3a14965ea4f90f4e4aa0bf80df33b9f4b9e0a58358d2cc84a;
    stim[53] = 239'h7f8096c36f8c4bdee90dc514c56abae1ab5638c3798211bec9f832f71838;
    stim[54] = 239'h58d57f2da3b1a38a312b7e16e9499908aadc78176435c33197b37fe68ffd;
    stim[55] = 239'h72edb03fcac1c19482e57456cd20713fc35efc4e02d5cb65379d9de67714;
    stim[56] = 239'h761fa57dd835064b1677b13aeceb8b809706be0342ebc9e7be14c556b30b;
    stim[57] = 239'h6407a94dc965925b44d7b446da2e2f863e1ee4df6cc9f9d30ccb1d8586c9;
    stim[58] = 239'h2ae8b298952dfa4108a05f01ca7631917dbf9fcde316e6e8ad5c8d7f0bfb;
    stim[59] = 239'h3fe6e01789c445821052dda639a284beb32d616d90a0c32190979d7c43b2;
    stim[60] = 239'h07c818f03d7ec4dc0f594e54a998930720f4cab6f424faaba214f1c6af85;
    stim[61] = 239'h622f3f12ffe4915762bd9e54f4a6b6c713d7a3b5a2a70918c335b98bbcb5;
    stim[62] = 239'h2cb197e20a238bd76632fbb34d5655cd16914f0010c11995e0cf4a0cc0ff;
    stim[63] = 239'h1b58220ab191a29267c03ecb929b1db92892c1bff27145a79cfa33dd9b10;
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
      expv[0] = 2'h3;
      expv[1] = 2'h3;
      expv[2] = 2'h2;
      expv[3] = 2'h1;
      expv[4] = 2'h3;
      expv[5] = 2'h1;
      expv[6] = 2'h2;
      expv[7] = 2'h3;
      expv[8] = 2'h0;
      expv[9] = 2'h2;
      expv[10] = 2'h3;
      expv[11] = 2'h3;
      expv[12] = 2'h1;
      expv[13] = 2'h3;
      expv[14] = 2'h1;
      expv[15] = 2'h3;
      expv[16] = 2'h3;
      expv[17] = 2'h3;
      expv[18] = 2'h3;
      expv[19] = 2'h2;
      expv[20] = 2'h2;
      expv[21] = 2'h3;
      expv[22] = 2'h3;
      expv[23] = 2'h3;
      expv[24] = 2'h3;
      expv[25] = 2'h3;
      expv[26] = 2'h0;
      expv[27] = 2'h0;
      expv[28] = 2'h3;
      expv[29] = 2'h3;
      expv[30] = 2'h3;
      expv[31] = 2'h3;
      expv[32] = 2'h1;
      expv[33] = 2'h3;
      expv[34] = 2'h1;
      expv[35] = 2'h3;
      expv[36] = 2'h3;
      expv[37] = 2'h3;
      expv[38] = 2'h3;
      expv[39] = 2'h3;
      expv[40] = 2'h3;
      expv[41] = 2'h2;
      expv[42] = 2'h3;
      expv[43] = 2'h3;
      expv[44] = 2'h3;
      expv[45] = 2'h3;
      expv[46] = 2'h1;
      expv[47] = 2'h0;
      expv[48] = 2'h3;
      expv[49] = 2'h3;
      expv[50] = 2'h3;
      expv[51] = 2'h3;
      expv[52] = 2'h3;
      expv[53] = 2'h3;
      expv[54] = 2'h2;
      expv[55] = 2'h3;
      expv[56] = 2'h3;
      expv[57] = 2'h3;
      expv[58] = 2'h3;
      expv[59] = 2'h3;
      expv[60] = 2'h3;
      expv[61] = 2'h3;
      expv[62] = 2'h3;
      expv[63] = 2'h3;
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
