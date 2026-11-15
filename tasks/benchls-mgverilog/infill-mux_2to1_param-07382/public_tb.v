// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 129;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_07382 dut (
    .mux_in0(in_vec[128:65]),
    .mux_in1(in_vec[64:1]),
    .mux_sel(in_vec[0:0]),
    .mux_out(out_vec[63:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 129'h1f765788f3afb46fbd981512e74820d9b;
    stim[1] = 129'h0a2ee4400ca247fa80d73c0dce504949e;
    stim[2] = 129'h037319692d40202130bcad4cfa68c1462;
    stim[3] = 129'h0f56deb94c2b8dc0565ba2a9f674f00b5;
    stim[4] = 129'h1401604862c2076367fa2fa65837a825c;
    stim[5] = 129'h110e9de99364dce15802b329f12761ff8;
    stim[6] = 129'h0d5aa4f45a47fbde06594a3c25d535948;
    stim[7] = 129'h07748ac97f98017ab6008f9d97831ed07;
    stim[8] = 129'h085f48ad402c971e9e8ec2595d4c48506;
    stim[9] = 129'h186fcf174a3cd2ddcebd11168062678ab;
    stim[10] = 129'h04995cdb01bd8a5023a2fe45243cc61fe;
    stim[11] = 129'h096525142155671bf17eb603f1848d346;
    stim[12] = 129'h129d3e00023d11bf0d50f2ed98ade50e7;
    stim[13] = 129'h0b8e9f9df697824e460e7e5356f28a623;
    stim[14] = 129'h04681acacf2f9903222b242f58c9334ae;
    stim[15] = 129'h1dbe54bf1f6145f570487ba9de5906444;
    stim[16] = 129'h0b76f497d4b56d3dd240ef10ea3f97ae7;
    stim[17] = 129'h029e296a76038126a5833ffba600385ab;
    stim[18] = 129'h0eb7828772218f3bab90d50e48c8fa6e3;
    stim[19] = 129'h1782c69ce8440715bebf08aab65f243ba;
    stim[20] = 129'h0b1610e8120516677555bd364a5928069;
    stim[21] = 129'h14ad5b5aa5fbaeb7eb7a1ffac2790c1f4;
    stim[22] = 129'h0cfa606ecbb11f713d90e94f56e925439;
    stim[23] = 129'h1b344c0049b4fc4804d58a2ba34fc6961;
    stim[24] = 129'h005931af798e2acec061b8b5b6984b392;
    stim[25] = 129'h1782093082fbc01dfb3585c13340b8e67;
    stim[26] = 129'h192c8c3bd853c3a49d75505bc6a03bd48;
    stim[27] = 129'h0f4e3168d1eda07d8a668756239de9431;
    stim[28] = 129'h0b5dadb2bc9a8ad2af1b4818a1c962a42;
    stim[29] = 129'h1da86821c1a09e52dcad8531639d78460;
    stim[30] = 129'h012a4d7d671dd73cbff3f420e243c8a6d;
    stim[31] = 129'h1bd9218b1ee39bb3c540d49cf83dec674;
    stim[32] = 129'h0d34110bc1b936ea014b377ece45fc485;
    stim[33] = 129'h17a2422ab35e6833c2776ac74adf38bdc;
    stim[34] = 129'h1ec3736158317a1ed7971638a71c6bb89;
    stim[35] = 129'h00de5c7a2f88e492b3c799da973eb4e3f;
    stim[36] = 129'h15079cd4b20ef646fedb48da25fa499b9;
    stim[37] = 129'h04f7adca951ef6a01a23447a8daabce45;
    stim[38] = 129'h181ac3b4b7bf497e3c4787377011ac318;
    stim[39] = 129'h0be5759d10a55c265a8b44a49adfcb2b7;
    stim[40] = 129'h0c745f976a08afe79bd839f84757651ec;
    stim[41] = 129'h10ef1f08df68d99d32effb5f9d6a4d363;
    stim[42] = 129'h08019ece1b97e62b0c24cb140c97f0479;
    stim[43] = 129'h1e6346ba2986c5edd10cfc3a53394c7ed;
    stim[44] = 129'h0ab41210d461fb97cd04880b1d1351798;
    stim[45] = 129'h108bfa3af6ec3214fa0287f22985ed51a;
    stim[46] = 129'h1bbf60b7b3a044d6b87facaa53952be8e;
    stim[47] = 129'h0ce3af2e93e8149e28956578c8b743fb4;
    stim[48] = 129'h0e231c857a608049e29be82a82a6a16d5;
    stim[49] = 129'h07e4ae691864a065cfe89dcde6c31744f;
    stim[50] = 129'h13e6e5776bdeb0eb8b4442479817cec6f;
    stim[51] = 129'h0a058cc0060cbc8f0d41599f286af091e;
    stim[52] = 129'h1d9b1c707735c0e07e59fcf5f0e199fa5;
    stim[53] = 129'h0e3d2c44829edbeddd288e790afd0adda;
    stim[54] = 129'h029c2e0b5689c841d079e6d6e4b0c0ba4;
    stim[55] = 129'h1be0fb98883aff10faecb4506a0bd5dff;
    stim[56] = 129'h1ffc5aae57b540fdb474158089942fd81;
    stim[57] = 129'h01ad85edb986e41a08998bd85ccb7206d;
    stim[58] = 129'h0097da819ff60057b0a164fa7f997045e;
    stim[59] = 129'h0620f1df7a6af620f93796476bb8ad2ec;
    stim[60] = 129'h007a0352e25789cac75858f3e12d318e8;
    stim[61] = 129'h1e2a61a5583268f27c48f615e0945626a;
    stim[62] = 129'h0b95f49302f185586e92f6aa8e31e5503;
    stim[63] = 129'h1f6a1e091371fb07ddc01cfd449b577cc;
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
      expv[0] = 64'hecc0a8973a4106cd;
      expv[1] = 64'h5177220065123fd4;
      expv[2] = 64'h1b98cb496a010109;
      expv[3] = 64'hb2dd154fb3a7805a;
      expv[4] = 64'ha00b024316103b1b;
      expv[5] = 64'h8874ef4c9b26e70a;
      expv[6] = 64'h6ad527a2d23fdef0;
      expv[7] = 64'hb0047cecbc18f683;
      expv[8] = 64'h42fa456a0164b8f4;
      expv[9] = 64'h75e888b403133c55;
      expv[10] = 64'h24cae6d80dec5281;
      expv[11] = 64'h4b2928a10aab38df;
      expv[12] = 64'h6a87976cc56f2873;
      expv[13] = 64'h3073f29ab7945311;
      expv[14] = 64'h2340d656797cc819;
      expv[15] = 64'hedf2a5f8fb0a2fab;
      expv[16] = 64'h9207788751fcbd73;
      expv[17] = 64'h2c19ffdd3001c2d5;
      expv[18] = 64'h5c86a8724647d371;
      expv[19] = 64'hbc1634e7422038ad;
      expv[20] = 64'haaade9b252c94034;
      expv[21] = 64'ha56adad52fdd75bf;
      expv[22] = 64'hec874a7ab7492a1c;
      expv[23] = 64'h26ac515d1a7e34b0;
      expv[24] = 64'h02c98d7bcc715676;
      expv[25] = 64'hd9ac2e099a05c733;
      expv[26] = 64'hc96461dec29e1d24;
      expv[27] = 64'h53343ab11cef4a18;
      expv[28] = 64'h5aed6d95e4d45695;
      expv[29] = 64'hed43410e0d04f296;
      expv[30] = 64'hff9fa107121e4536;
      expv[31] = 64'hdec90c58f71cdd9e;
      expv[32] = 64'h0a59bbf6722fe242;
      expv[33] = 64'hbd1211559af3419e;
      expv[34] = 64'hbcb8b1c538e35dc4;
      expv[35] = 64'h9e3cced4b9f5a71f;
      expv[36] = 64'hf6da46d12fd24cdc;
      expv[37] = 64'hd11a23d46d55e722;
      expv[38] = 64'hc0d61da5bdfa4bf1;
      expv[39] = 64'hd45a2524d6fe595b;
      expv[40] = 64'h63a2fcbb50457f3c;
      expv[41] = 64'h977fdafceb5269b1;
      expv[42] = 64'h612658a064bf823c;
      expv[43] = 64'h8867e1d299ca63f6;
      expv[44] = 64'h55a09086a30fdcbe;
      expv[45] = 64'h845fd1d7b76190a7;
      expv[46] = 64'hddfb05bd9d0226b5;
      expv[47] = 64'h671d79749f40a4f1;
      expv[48] = 64'h14df415415350b6a;
      expv[49] = 64'h7f44ee6f3618ba27;
      expv[50] = 64'h5a22123cc0be7637;
      expv[51] = 64'h502c66003065e478;
      expv[52] = 64'hf2cfe7af870ccfd2;
      expv[53] = 64'h71e9622414f6df6e;
      expv[54] = 64'h14e1705ab44e420e;
      expv[55] = 64'hd765a283505eaeff;
      expv[56] = 64'ha3a0ac044ca17ec0;
      expv[57] = 64'h44cc5ec2e65b9036;
      expv[58] = 64'h04bed40cffb002bd;
      expv[59] = 64'h31078efbd357b107;
      expv[60] = 64'h03d01a9712bc4e56;
      expv[61] = 64'hf1530d2ac1934793;
      expv[62] = 64'h7497b554718f2a81;
      expv[63] = 64'hfb50f0489b8fd83e;
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
