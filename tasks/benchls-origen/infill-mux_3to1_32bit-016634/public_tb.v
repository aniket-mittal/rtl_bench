// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 98;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_016634 dut (
    .A(in_vec[97:66]),
    .B(in_vec[65:34]),
    .C(in_vec[33:2]),
    .sel(in_vec[1:0]),
    .out(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 98'h0f38b9c44261f298c3a89a891;
    stim[1] = 98'h0dc7de7a29b3f7c730f636bbd;
    stim[2] = 98'h1d21b1173d0415fdb86080b75;
    stim[3] = 98'h3586049b769ec3c9a610f7f49;
    stim[4] = 98'h351edd1eb4bfe405509f9e31a;
    stim[5] = 98'h00005f15a47c2d636ea27ad9f;
    stim[6] = 98'h2b06f46d566c7b74567d3f420;
    stim[7] = 98'h2b709f39f02fffb7b41846f45;
    stim[8] = 98'h023bf6754c66ea530944eb342;
    stim[9] = 98'h2aac977f4bf9db59c7628864e;
    stim[10] = 98'h134ca299527f998c3dedbfa80;
    stim[11] = 98'h31a1c7241cda0613a8aa4e042;
    stim[12] = 98'h2c4435651226cfb3252fa6eab;
    stim[13] = 98'h1d4ca35681c827b341d9a1298;
    stim[14] = 98'h3899e41ade97d8cfdd5ba8ccc;
    stim[15] = 98'h2fa44def3b384973182f0ef37;
    stim[16] = 98'h35a334880233ef8e20f5031b4;
    stim[17] = 98'h0a7a3976eb9135a7be267e0f8;
    stim[18] = 98'h1b73ab41401d1a8148137e652;
    stim[19] = 98'h35d89064419bcaffd15fe0df4;
    stim[20] = 98'h29143ec5d3d474a67240ef33e;
    stim[21] = 98'h30cd1c9612cb61dd0db725e37;
    stim[22] = 98'h3dfd54a29e2f4ada278f0367a;
    stim[23] = 98'h12953036bb9a41fc7feffe1e1;
    stim[24] = 98'h35c58544fad5c8b3c78c1c996;
    stim[25] = 98'h001d83c27473e9a31089c0eb1;
    stim[26] = 98'h3540766358c9a7112dbe72332;
    stim[27] = 98'h2beb05960746b560ed24d398f;
    stim[28] = 98'h21a8329f3dd69a7eb7717490f;
    stim[29] = 98'h1c0487372139e1d9d014097b8;
    stim[30] = 98'h26d35fc041c4f07fdfae8149c;
    stim[31] = 98'h307af4a74a9b65ae7ca6594c1;
    stim[32] = 98'h2ad4b21f782620131795af5f5;
    stim[33] = 98'h2447bcda9e2fbf6be30946a97;
    stim[34] = 98'h2986ea26ae415be7269e56d02;
    stim[35] = 98'h0f6ab01ef3ac4c7bf1a2b454e;
    stim[36] = 98'h0a6e72ea430b5c633509a7905;
    stim[37] = 98'h3f9ba968f266ba2e055104df8;
    stim[38] = 98'h33341cf6e9b0c1e7440a1aadb;
    stim[39] = 98'h2f79264fc290cefa509566d87;
    stim[40] = 98'h02acd19c7487b524ad3d67cb4;
    stim[41] = 98'h0cc596f83a4bef01111d2b0ee;
    stim[42] = 98'h101d6f84176549db7f25c7cf3;
    stim[43] = 98'h2519bc5e6b8ac28762c5cca93;
    stim[44] = 98'h0388652f0e7cc5e4cb04c5aa7;
    stim[45] = 98'h15d8a4a61855403cc07ab68fc;
    stim[46] = 98'h1559b248e49ca823709c10d32;
    stim[47] = 98'h3d9ef906b12a0896eea8a1f6b;
    stim[48] = 98'h0e062feaceac4c0be6d001207;
    stim[49] = 98'h08868d9f80760b0386688f9b4;
    stim[50] = 98'h149baa575d9dd0ba58e65a3d1;
    stim[51] = 98'h3e3f120340a1881ae46dbafec;
    stim[52] = 98'h03783d9ed6910224129da1929;
    stim[53] = 98'h3d3bdbe5a3169842ac66f31f8;
    stim[54] = 98'h3ddb69d6a78df49d811fdad71;
    stim[55] = 98'h2fc651c9e49ee78b2bf4615a2;
    stim[56] = 98'h2babb76ef55a567b01e6d2228;
    stim[57] = 98'h28ab70b73f00f2e794edab253;
    stim[58] = 98'h14e2570eff53b27bc8877cd6f;
    stim[59] = 98'h11ee69dd7011f8566d527df85;
    stim[60] = 98'h3001d05961023a252669a79c2;
    stim[61] = 98'h2eac1e3b9b839109a48d3a60d;
    stim[62] = 98'h31b0a3708711fe3edf2bc3aec;
    stim[63] = 98'h3042f7a605303f1d78e2944fd;
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
      expv[0] = 32'h0987ca63;
      expv[1] = 32'ha6cfdf1c;
      expv[2] = 32'hf41057f6;
      expv[3] = 32'hda7b0f26;
      expv[4] = 32'h427e78c6;
      expv[5] = 32'hba89eb67;
      expv[6] = 32'hac1bd1b5;
      expv[7] = 32'hc0bffede;
      expv[8] = 32'h2513acd0;
      expv[9] = 32'h1d8a2193;
      expv[10] = 32'h4d328a65;
      expv[11] = 32'ha2a93810;
      expv[12] = 32'h94be9baa;
      expv[13] = 32'h75328d5a;
      expv[14] = 32'he267906b;
      expv[15] = 32'h60bc3bcd;
      expv[16] = 32'hd68cd220;
      expv[17] = 32'h29e8e5db;
      expv[18] = 32'h204df994;
      expv[19] = 32'hd7624191;
      expv[20] = 32'hc903bccf;
      expv[21] = 32'h36dc978d;
      expv[22] = 32'h9e3c0d9e;
      expv[23] = 32'hee6907f1;
      expv[24] = 32'h1e307265;
      expv[25] = 32'hd1cfa68c;
      expv[26] = 32'hb6f9c8cc;
      expv[27] = 32'hb4934e63;
      expv[28] = 32'hddc5d243;
      expv[29] = 32'h70121cdc;
      expv[30] = 32'h9b4d7f01;
      expv[31] = 32'h2a6d96b9;
      expv[32] = 32'he098804c;
      expv[33] = 32'h8c251aa5;
      expv[34] = 32'h9a795b40;
      expv[35] = 32'hc68ad153;
      expv[36] = 32'h0c2d718c;
      expv[37] = 32'hfe6ea5a3;
      expv[38] = 32'h10286ab6;
      expv[39] = 32'h42559b61;
      expv[40] = 32'h0ab34671;
      expv[41] = 32'h4474ac3b;
      expv[42] = 32'hfc971f3c;
      expv[43] = 32'h8b1732a4;
      expv[44] = 32'h2c1316a9;
      expv[45] = 32'h57629298;
      expv[46] = 32'hc270434c;
      expv[47] = 32'hbaa287da;
      expv[48] = 32'h9b400481;
      expv[49] = 32'h221a367e;
      expv[50] = 32'h767742e9;
      expv[51] = 32'hf8fc480d;
      expv[52] = 32'h5a440890;
      expv[53] = 32'hf4ef6f96;
      expv[54] = 32'h9e37d276;
      expv[55] = 32'hafd18568;
      expv[56] = 32'haeaeddbb;
      expv[57] = 32'h53b6ac94;
      expv[58] = 32'h221df35b;
      expv[59] = 32'hc047e159;
      expv[60] = 32'h99a69e70;
      expv[61] = 32'h6e0e4426;
      expv[62] = 32'hc6c28dc2;
      expv[63] = 32'h14c0fc75;
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
