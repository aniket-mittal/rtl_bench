// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 177;
  localparam OW = 139;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_03715 dut (
    .clk(clk),
    .rst(in_vec[176:176]),
    .i_m0_we(in_vec[175:175]),
    .i_m0_cyc(in_vec[174:174]),
    .i_m0_stb(in_vec[173:173]),
    .i_m0_sel(in_vec[172:169]),
    .i_m0_dat(in_vec[168:137]),
    .i_m0_adr(in_vec[136:105]),
    .i_m1_we(in_vec[104:104]),
    .i_m1_cyc(in_vec[103:103]),
    .i_m1_stb(in_vec[102:102]),
    .i_m1_sel(in_vec[101:98]),
    .i_m1_dat(in_vec[97:66]),
    .i_m1_adr(in_vec[65:34]),
    .i_s_dat(in_vec[33:2]),
    .i_s_ack(in_vec[1:1]),
    .i_s_int(in_vec[0:0]),
    .o_m0_ack(out_vec[138:138]),
    .o_m0_dat(out_vec[137:106]),
    .o_m0_int(out_vec[105:105]),
    .o_m1_ack(out_vec[104:104]),
    .o_m1_dat(out_vec[103:72]),
    .o_m1_int(out_vec[71:71]),
    .o_s_we(out_vec[70:70]),
    .o_s_stb(out_vec[69:69]),
    .o_s_cyc(out_vec[68:68]),
    .o_s_sel(out_vec[67:64]),
    .o_s_adr(out_vec[63:32]),
    .o_s_dat(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 177'h1aa04099c28b66d732916dd8d168bb279991cced3266a;
    stim[1] = 177'h12ee472a824863dce6ea7acba72d0e2fe0903c2991d3e;
    stim[2] = 177'h0a62b18ccdd5a21bb0078ed1301b8aecbc3a5425de672;
    stim[3] = 177'h0fbe413485aef523874004d3515913508a35dbd75f7a5;
    stim[4] = 177'h05cc2452c84ac3273c9310f832a3602f09b464a2af95b;
    stim[5] = 177'h0595c9134b7d73c400cb54a12474da3154f240d0eb0b2;
    stim[6] = 177'h01f13c5e37307ea971dd0fd4c7125ac80d0d7e95a63f0;
    stim[7] = 177'h0a8f4ed02d74363dda4d1952aa4c620e2bf9bb459deee;
    stim[8] = 177'h0329d4a6c58c0ab2c7ff28c6456a5b48bb712d67d44a4;
    stim[9] = 177'h044bc542021ac3f6e3727dbf2f5b60672bd7b55437f95;
    stim[10] = 177'h0c6ad967212baab149434fd978503365aeed355ffd571;
    stim[11] = 177'h102520656365d49fcdd6a2f1a86b2af30b30dd3572acf;
    stim[12] = 177'h06307e9163a7be262d9ba38463cc6eeaf2993e8bcb540;
    stim[13] = 177'h018a6b83ca7950dd53514571bf89860b3e9a263fa52d2;
    stim[14] = 177'h0e8a44cffbb707e982ef273391669fd6a5c621a0fd8a8;
    stim[15] = 177'h0973851b1f6845b70edfa41b5913d023871566965c1cf;
    stim[16] = 177'h000a388fb65887295d22ee52c476345b599d98d0ada6d;
    stim[17] = 177'h05343cc94f58f842d202d456f19542a490cba67fed1c1;
    stim[18] = 177'h0417510b54d30dc0f3e948acc66cb6664e0ec02316876;
    stim[19] = 177'h05a0911cef7e5a44554fdd36ca122ce72edf64c250114;
    stim[20] = 177'h0df06a0443a1396338cfbf989c97120b7be143755af21;
    stim[21] = 177'h0907cb2371269e04ebaec23a5f467fd6418fce94be049;
    stim[22] = 177'h08f1de43ab0de5f023ffb21ec97732f101960bc736f59;
    stim[23] = 177'h0b1f0af2dd1ab8c59f99d9b2b3d215d955afb4fb107e4;
    stim[24] = 177'h01459264c9456a45ce69a0967df9d6e0a5b2d09b9840f;
    stim[25] = 177'h0d970fa96fad7144fcee45d850e42e88d4d6d4bf0ba85;
    stim[26] = 177'h09aa710d5c6ef7db78c465df28934c48a9c4fb762ddda;
    stim[27] = 177'h0f4ad0ddca111bba19267b46d1e9b8a1a526fb518e723;
    stim[28] = 177'h098345ebed96f1dc30db67dbc5da1657a1ca2279516e2;
    stim[29] = 177'h07da35eb6236d6a9665b50a3cee82bd45cfdeb1f5027d;
    stim[30] = 177'h063e194e31f8f0011178f96e5eeaab6d01a4ada2088e7;
    stim[31] = 177'h06555e389bc4d23f1354a1382129d7e1c178d979ba2c8;
    stim[32] = 177'h0aa80904957706585a3622229f9ebb975c3791b4e5f1a;
    stim[33] = 177'h01ca95853ba4b046c21e9196eaa0c40e27e3578ed8023;
    stim[34] = 177'h0ca941ff9d74ff3fdc1c16c1c478857d48ac36a1f2855;
    stim[35] = 177'h00c4a1c76500a1200b402f9abae1618187ac9efd7d7ec;
    stim[36] = 177'h044e692a0362a8a743fcb214d490993fcffe81471a71f;
    stim[37] = 177'h02082902cffe35e2e98b61538b788dea964856c71e979;
    stim[38] = 177'h0439e9d8bb7d09cb740843558c7e992aba62dfe95e135;
    stim[39] = 177'h00d44cbf8f80447574c9acd2fabcfecae81ad0fda4e20;
    stim[40] = 177'h049e7c633eaf332e541c95b8bd795145f5ab9ccb0db06;
    stim[41] = 177'h066382e5b906ea46b86690a7585b9407fcd91081ab651;
    stim[42] = 177'h062182659339ef506e15419293de25c76fcc122148416;
    stim[43] = 177'h058e8a21977664b5f0d3143f98381a34617af2585b4bb;
    stim[44] = 177'h0175a4f57c513639d7755ed1f7fa91bd749bf785f2c50;
    stim[45] = 177'h0214234023ccb48238508505eb9443361ae454ab9e324;
    stim[46] = 177'h09c1d29fec37f05492866044f8de029736cb6a7c9fa0d;
    stim[47] = 177'h08fc516d7941d8fca5825a309dcf9999cb67bf7cf3073;
    stim[48] = 177'h0690b77f7c8454c9144c0c85b080639c24edf77b40af1;
    stim[49] = 177'h0400c4288e1b468eed668cec754335ae4a5d264f6a08f;
    stim[50] = 177'h06ab1363958ad9a19ecbad49a02f27e29a3086c7aba57;
    stim[51] = 177'h0ac7362c3ddee59314a8e1b5c1cfe54f614bc8f6f3d5e;
    stim[52] = 177'h09f41e18ca35ac07992eb38ec20d6366425fc10685c14;
    stim[53] = 177'h01e014794c881686c90c2474be199b84e33f03bf2b48e;
    stim[54] = 177'h005f86b7f71c7f915d6f21c2b475f40a7276772cc19e5;
    stim[55] = 177'h08c52941a90548c906aca74d08a55924a4deffdf12541;
    stim[56] = 177'h0935fa972d19943fc3f9426a747f209fe05e29ddce17f;
    stim[57] = 177'h05c585c3b740fcd8fd9b5a4b415681514ec2d11a67a06;
    stim[58] = 177'h0f9c8798afb7c4d026ef28c458ecbb697a6a07521d0e9;
    stim[59] = 177'h0dbdfd4523cbda57b6dbc82fc7628bca07a374428529d;
    stim[60] = 177'h01ddd0b06dd4fd46934aceb7dc467a3367892960214cb;
    stim[61] = 177'h036527260287f453ce8d19b8674412dc25829114a563a;
    stim[62] = 177'h0cdcd5c0c60f7c8fd1c7bfeac37b5b831ea986f1d7782;
    stim[63] = 177'h077be46fc2a892221859beb01a14490d96d72e4b4aca7;
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
      expv[0] = 139'hxced3266x33b4c99axxxxxxxxxxxxxxxxxx;
      expv[1] = 139'h3c2991d3cf0a6474f000000000000000000;
      expv[2] = 139'h1425de6705097799c000000000000000000;
      expv[3] = 139'h1bd75f7a46f5d7de9000000000000000000;
      expv[4] = 139'h64a2af95a928abe561e561939e461229642;
      expv[5] = 139'h40d0eb0b00343ac2c1ceb9e2006ae489a5b;
      expv[6] = 139'h3e95a63f0fa5698fc0f83f54b8e89e2f1b9;
      expv[7] = 139'h3b459deeced1677bb000000000000000000;
      expv[8] = 139'h2d67d44a4b59f51297c6d22edc4a31915a9;
      expv[9] = 139'h355437f94d550dfe5c9819caf5ef6fcbd6d;
      expv[10] = 139'h355ffd570d57ff55c000000000000000000;
      expv[11] = 139'h5d3572ace74d5cab3012ea4fe6e29032b1b;
      expv[12] = 139'h3e8bcb540fa2f2d50000000000000000000;
      expv[13] = 139'h663fa52d098fe94b40cca86ea9a535c1e53;
      expv[14] = 139'h21a0fd8a88683f62a74b83f4c1752267fdd;
      expv[15] = 139'h66965c1ce9a5970734b422db8769c28d8fb;
      expv[16] = 139'h18d0ada6e6342b69b00c4394ae951c47db2;
      expv[17] = 139'h267fed1c099ffb470000000000000000000;
      expv[18] = 139'h402316874008c5a1d10986e079fba885aa6;
      expv[19] = 139'h24c250114930940451df2d222aa0488e77b;
      expv[20] = 139'h03755af220dd56bc85f09cb19c68350221d;
      expv[21] = 139'h0e94be04a3a52f8124834f0275d3e591b89;
      expv[22] = 139'h0bc736f582f1cdbd6000000000000000000;
      expv[23] = 139'h34fb107e4d3ec41f957576556be66cacf48;
      expv[24] = 139'h109b9840d426e6103965b8296cb8259f7e7;
      expv[25] = 139'h14bf0ba8452fc2ea1b9ba23535b17614390;
      expv[26] = 139'h3b762ddd9edd8b776213122a713977ca24d;
      expv[27] = 139'h3b518e721ed4639c8a9e286949bed1b47a6;
      expv[28] = 139'h2279516e189e545b85d595e87289f6f1768;
      expv[29] = 139'h2b1f5027cac7d409fddaf5173f7428f3ba0;
      expv[30] = 139'h2da2088e5b6882239d3adb40692e5b97baa;
      expv[31] = 139'h1979ba2c865e6e8b2625f8705e384e084a7;
      expv[32] = 139'h11b4e5f1846d397c6000000000000000000;
      expv[33] = 139'h178ed80205e3b6008000000000000000000;
      expv[34] = 139'h36a1f2854da87ca15f015f522b05b0711e2;
      expv[35] = 139'h1efd7d7ec7bf5f5fb0086061eb2be6aeb85;
      expv[36] = 139'h01471a71c051c69c7000000000000000000;
      expv[37] = 139'h16c71e97a5b1c7a5e20f1af174c4148167f;
      expv[38] = 139'h1fe95e1347fa5784d000000000000000000;
      expv[39] = 139'h10fda4e2043f69388060223aba6a265fc7c;
      expv[40] = 139'h1ccb0db04732c36c1000000000000000000;
      expv[41] = 139'h1081ab6524206ad9433375235c31c172dc8;
      expv[42] = 139'h5221484144885210531cf7a83700c132c99;
      expv[43] = 139'h72585b4bac9616d2e1cb325af8674510cbb;
      expv[44] = 139'h3785f2c50de17cb140b89b1cebbad27abe2;
      expv[45] = 139'h14ab9e32452ae78c9000000000000000000;
      expv[46] = 139'h2a7c9fa0ca9f27e83000000000000000000;
      expv[47] = 139'h3f7cf3070fdf3cc1c000000000000000000;
      expv[48] = 139'h377b40af0dded02bc000000000000000000;
      expv[49] = 139'h664f6a08e993da82310da34776b06214470;
      expv[50] = 139'h46c7aba561b1eae953556cd0cf6589b1cac;
      expv[51] = 139'h48f6f3d5c23dbcf5766f72c98a539b161ee;
      expv[52] = 139'h010685c14041a17054fad603cc9a0f0c651;
      expv[53] = 139'h03bf2b48c0efcad23000000000000000000;
      expv[54] = 139'h372cc19e4dcb30679bcd029c9d9870ad1d7;
      expv[55] = 139'h3fdf12540ff7c4950b26492937b9d342295;
      expv[56] = 139'h29ddce17da777385fd5827f817809a9d1fc;
      expv[57] = 139'h111a67a0544699e815d05453b0b692d055a;
      expv[58] = 139'h07521d0e81d48743abceda5e9a8a31163b2;
      expv[59] = 139'h34428529cd10a14a7df2f281e8d20bf1d8a;
      expv[60] = 139'h2960214c8a5808532000000000000000000;
      expv[61] = 139'h1114a56394452958e344b70960a66e19d10;
      expv[62] = 139'h06f1d77811bc75de02e6e0c7aa6ffab0ded;
      expv[63] = 139'h2e4b4aca5b92d2b29d624365b5cfac06851;
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
