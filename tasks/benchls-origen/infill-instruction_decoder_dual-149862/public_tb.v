// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 264;
  localparam OW = 70;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_149862 dut (
    .clock_i(clk),
    .reset_i(in_vec[263:263]),
    .enable_i(in_vec[262:262]),
    .shouldStalled_i(in_vec[261:261]),
    .byteAddr_i(in_vec[260:256]),
    .block_i(in_vec[255:0]),
    .shouldStalled_o(out_vec[69:69]),
    .backDisable_o(out_vec[68:68]),
    .nextByteOffset_o(out_vec[67:64]),
    .InstructionA_o(out_vec[63:34]),
    .InstructionB_o(out_vec[33:4]),
    .InstructionAFormat_o(out_vec[3:3]),
    .InstructionBFormat_o(out_vec[2:2]),
    .enableA_o(out_vec[1:1]),
    .enableB_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 264'hbfbbc7de18af929000cfebfa4cacdfc45e75bb6164dec71e7eb94b9fdd0257063e;
    stim[1] = 264'hd3b5d5928f212bf9314f47214e642d4aa9364db5a29cd96f68605683270ed409e0;
    stim[2] = 264'h568875d6aeb6ed67000a4f43ca662db91b405e8759dc985a535ddcf09cf4e061dc;
    stim[3] = 264'h55e146d13fa9bf41e9e5a27c6d927b750a7d1e7f3929c2dfc23ffdbf4a0af4f473;
    stim[4] = 264'h648812e2cb573f03e605a879b8e0e9df10405e016ad8f0617ece889d60407994cb;
    stim[5] = 264'h23511a8b5d2c591f7826efe5177d6fa3c46ebf07d593729c9363e23771c7149c98;
    stim[6] = 264'h1b509e7d73624cfb10bd8067a28d4df30cf468480d9c5b381d0fde5ff94c3e8dcc;
    stim[7] = 264'h3ac230b02bca064bc5a37a6b22c9e09cd68fa88ad4ee54c41772b8d46b295d1942;
    stim[8] = 264'h670bf9e60aafeab0242d22c496e102cbbdef2bc97ddf8900c3640e809a3f745ddf;
    stim[9] = 264'h15a4968ef675e5fcac1b183dc294ca1f4f491e54c79e41a0b63d732cc88b5901b4;
    stim[10] = 264'h280c652863eb1a533c776643c2688bf50e525cdca5f9a48de8f5b1d6ee879b7675;
    stim[11] = 264'h42dd2b529adca767ba6f210763e3d26eb69997d7b9f029965bc41cd2caac1cd1d9;
    stim[12] = 264'h32d9b4b3ad2648570a932e234488b0416fc7ab4af9823109782d5f38f3af854ed2;
    stim[13] = 264'h3719b27858a65b48586c956495600c4eed9f8fc0acc05568773629b77ba1045311;
    stim[14] = 264'h075d36a72b6f79e20cc73d9bdb17f4ad63a2aeeecc82c2d4be159f11aa2988236f;
    stim[15] = 264'h63436437b28f1d147942eb42d4e8f74052aa7afce97fcdf3143e06b6e685eed855;
    stim[16] = 264'h1523a12252553bb2d523c9b2c2de8a4a0359d59ec1b39cc57aa2d86e33cb129cbc;
    stim[17] = 264'h22c6e6334cee775517ebd9196f2cb83717f605503ccc492fb46508ccc44e834bee;
    stim[18] = 264'h7efdde2c368bff63adb4bb691b11579a83024606c2577f5d755d635869dc33e6ee;
    stim[19] = 264'h0a6ecacbf8745cffb568752b8d747c8ea1325d964d448728792daa5f3b942c1a9d;
    stim[20] = 264'h38bba7638fe3fb5f3e025a9a9591deeacf20f23ee2bcf15c80199a10d3ebbcbfc0;
    stim[21] = 264'h0b6ff91546ce91805a8947834c6cd4862259f18db300d98e42fe6601f36cebb830;
    stim[22] = 264'h16da4d9c38f7795743ee22666afef8fbec9a90ed255f31b3e92bf0aabba8deb5fa;
    stim[23] = 264'h108ce2c5bf7e6c8a28615f22e8eed0410eb435243f3eb83d47ab57e790e1a87e27;
    stim[24] = 264'h535a648ccbf79e3d51fad9745e7c457e31d27173ceaf7a2745cec885dbccb50d8c;
    stim[25] = 264'h3c7226a5e6f7146df3f3a6ed471f62e8d8aa7f4be2aa0f890006ac1c0316a1557d;
    stim[26] = 264'h380aff03afd205972e084973bd17c275ee7fa4bf13558be4768a6e9ca44a3c6d24;
    stim[27] = 264'h16c1dca3a1491fd8879fd55ab1ba79f7b1ec938e7ecf427619e6e4dfe8ae7f374f;
    stim[28] = 264'h6ecb8958c55249121c97a76ef8e299871326a2a2227261d92d4e381f2caa2d24f9;
    stim[29] = 264'h6807938170cb6a81d27830dca0669c13e4ccea23d06511522ee3249b195a7c3c3b;
    stim[30] = 264'h25ec54ab176a67e4445302096578ef328d5ec96138de5bb582b809d5da3ba2268a;
    stim[31] = 264'h38222027eedd4e042199183eeaee297e1752e23a4668d78afbe4daad9bd0c754e9;
    stim[32] = 264'h68ebdb595a04809ea67b3adaaccf164908f2c8aa95117351c1d13e75fd174123ec;
    stim[33] = 264'hac9a360fa5cd3133f80e97a49cac267bb6654bd15c4f59b88d93748699a1030e43;
    stim[34] = 264'h38faa5b7ca9315204a9cbe38822cfe904e3a8edf23ed33bca457bc95d5cb67f1c4;
    stim[35] = 264'h3b6f48472562896cfd84ec3578b9eb69c39503e2e8031d5d537840abac702e3747;
    stim[36] = 264'h1a4c0da39073173533ecba0ebef280158ea8557f36d84ac5dc3fda6eb4f81b49af;
    stim[37] = 264'h647adef754ca4eece0ca817c6876cad8e59b8ecf632be4bc33bb13b49c4d22cb8b;
    stim[38] = 264'h7773e21b80199319e2bbfab8cea3a54675842f5dba24753f2aef011c4a03851be7;
    stim[39] = 264'h1defa3d7cf3a6f212e2f35a87ed48e8998860a7aa1c53e6796a025f3598ae5dc0b;
    stim[40] = 264'h14ed703f9072e9bc1034fbe288b74e37b8a70c038a614920554c8727a79095a1d8;
    stim[41] = 264'h6031e0a559c8db31b5392e8585089441967e8c657c5c8311889f22480aafffabc6;
    stim[42] = 264'h3f083b635ece7f1508709588be4424608df00ee1580a52fce551dc048cf3ec407c;
    stim[43] = 264'h0463bb5adc194ea990a52b43f297b3d340a17c8396315ded8007f0060308a57eb4;
    stim[44] = 264'h5de6537bef6d0887e1dfa6e306ba17b4d93aedd56d48ef257eebfdda07481da1db;
    stim[45] = 264'h62ab069443d7bcac8873975442e513c7d2392402605354502191aa606eed04ba0f;
    stim[46] = 264'h6d9d4581bfc89ea3277a0c581d9e847587b01047b397379872532a66a17cbcb5e4;
    stim[47] = 264'h70b06084cfe569a781e5263f96c483d1e99052d251d8a2704a7161b52e0c610049;
    stim[48] = 264'h430688b1fdfa6a02500d433c5b77aa90f2a055dae25b559a03d39d2f1c028fb38f;
    stim[49] = 264'h07f01e6957506a44121a8b134c80af2b4427963cf1b423b4750f905eb8a4ed0744;
    stim[50] = 264'h73df374c03c0fa35eda9bbfa12eac0ea5f4e00cf9aba486d8e1d0622f48ffabe2e;
    stim[51] = 264'h6bafdb3abfdc3fd925b8acd4b7fb3d399fc665882c3e83e0d23e37aaab325a25ed;
    stim[52] = 264'h081f09864a79fe4494884316b5ad3a6f12072ffb9359ddec79e186c4fbcebbdd2c;
    stim[53] = 264'h54f8a1577af668617e2763a4f18808ff7397370b5e31955459b3fb826fb61326f7;
    stim[54] = 264'h1e06e2edd7ef6d57fb539d0b10850755ff124c7967a72fb783d5de336c4e398c9a;
    stim[55] = 264'h25eb7d67ed70d44ea0933890c56519d50e722fe5cc91484b65bb5fb1c4b20e650b;
    stim[56] = 264'h6f7a55e4191914378dacf3474bbe23b3a04b9f68096cfd70260f81bf1c08fcd882;
    stim[57] = 264'h0e0deb3acdf112be90d797587ca78a7ec2c96acc1d06c440aa98828c1d9faf3f06;
    stim[58] = 264'h726fb386b5988b6f2650537af0e435b8bbdde7cb30fa513d76719c566bfaeaaf37;
    stim[59] = 264'h0b2468ae61074a6ef4114a521e62d298774a780174f22481242b560a97f1f7b5fa;
    stim[60] = 264'h2bf80488e127f092c89f813403518c6ad6ca4d6e3b4fe486abfc33bd68312d9dc9;
    stim[61] = 264'h581af7692d25cc5dfc09cfdd52b9ec57de424a6d40c033f9ba4fa71fff173e538c;
    stim[62] = 264'h726e4f503ec27ef0626bf2569320eeecbc2d37e5c273fefe1e0e3dda0b343dd452;
    stim[63] = 264'h7711c5e69b2f5eca696d192927f643c55872b4e10335e8ec1f7c9c18ec10fe9fce;
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
      expv[0] = 70'hxxxxxxxxxxxxxxxxxx;
      expv[1] = 70'h00xxxxxxxxxxxxxxxx;
      expv[2] = 70'h00xxxxxxxxxxxxxxxx;
      expv[3] = 70'h020009cf4c006ee78b;
      expv[4] = 70'h04b7e9415dbf847ffb;
      expv[5] = 70'h04b7e9415dbf847ff8;
      expv[6] = 70'h04b7e9415dbf847ff8;
      expv[7] = 70'h04b7e9415dbf847ff8;
      expv[8] = 70'h04b7e9415dbf847ff8;
      expv[9] = 70'h04b7e9415dbf847ff8;
      expv[10] = 70'h04b7e9415dbf847ff8;
      expv[11] = 70'h04b7e9415dbf847ff8;
      expv[12] = 70'h04ac1cd1d841cd2caf;
      expv[13] = 70'h04ac1cd1d841cd2cac;
      expv[14] = 70'h04ac1cd1d841cd2cac;
      expv[15] = 70'h04ac1cd1d841cd2cac;
      expv[16] = 70'h04ac1cd1d841cd2cac;
      expv[17] = 70'h04ac1cd1d841cd2cac;
      expv[18] = 70'h04ac1cd1d841cd2cac;
      expv[19] = 70'h04ac1cd1d841cd2cac;
      expv[20] = 70'h04ac1cd1d841cd2cac;
      expv[21] = 70'h04ac1cd1d841cd2cac;
      expv[22] = 70'h04ac1cd1d841cd2cac;
      expv[23] = 70'h04ac1cd1d841cd2cac;
      expv[24] = 70'h04ac1cd1d841cd2cac;
      expv[25] = 70'h02000de6580032217f;
      expv[26] = 70'h02000de6580032217c;
      expv[27] = 70'h02000de6580032217c;
      expv[28] = 70'h02000de6580032217c;
      expv[29] = 70'h02000de6580032217c;
      expv[30] = 70'h02000de6580032217c;
      expv[31] = 70'h02000de6580032217c;
      expv[32] = 70'h02000de6580032217c;
      expv[33] = 70'h02000de6580032217c;
      expv[34] = 70'h00000de6580032217c;
      expv[35] = 70'h00000de6580032217c;
      expv[36] = 70'h00000de6580032217c;
      expv[37] = 70'h00000de6580032217c;
      expv[38] = 70'h00000de6580032217c;
      expv[39] = 70'h00000de6580032217c;
      expv[40] = 70'h00000de6580032217c;
      expv[41] = 70'h00000de6580032217c;
      expv[42] = 70'h00000de6580032217c;
      expv[43] = 70'h00000de6580032217c;
      expv[44] = 70'h00000de6580032217c;
      expv[45] = 70'h02001b40e8006ebfdf;
      expv[46] = 70'h02001b40e8006ebfdc;
      expv[47] = 70'h02001b40e8006ebfdc;
      expv[48] = 70'h02001b40e8006ebfdc;
      expv[49] = 70'h040147d9c69ce978ef;
      expv[50] = 70'h040147d9c69ce978ec;
      expv[51] = 70'h040147d9c69ce978ec;
      expv[52] = 70'h040147d9c69ce978ec;
      expv[53] = 70'h040147d9c69ce978ec;
      expv[54] = 70'h04e09bed855166cfeb;
      expv[55] = 70'h04e09bed855166cfe8;
      expv[56] = 70'h04e09bed855166cfe8;
      expv[57] = 70'h04e09bed855166cfe8;
      expv[58] = 70'h04e09bed855166cfe8;
      expv[59] = 70'h04e09bed855166cfe8;
      expv[60] = 70'h04e09bed855166cfe8;
      expv[61] = 70'h04e09bed855166cfe8;
      expv[62] = 70'h049c7ffc5cfe6e93ef;
      expv[63] = 70'h049c7ffc5cfe6e93ec;
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
