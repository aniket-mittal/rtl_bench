// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 179;
  localparam OW = 13;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_027563 dut (
    .clk(clk),
    .rst_n(in_vec[178:178]),
    .axi_ip_ready(in_vec[177:177]),
    .axi_ip_mac(in_vec[176:129]),
    .axi_ip_data(in_vec[128:97]),
    .axi_ip_length(in_vec[96:81]),
    .axi_arp_ready(in_vec[80:80]),
    .axi_arp_mac(in_vec[79:32]),
    .axi_arp_data(in_vec[31:0]),
    .axi_ip_done(out_vec[12:12]),
    .axi_ip_index(out_vec[11:4]),
    .axi_arp_done(out_vec[3:3]),
    .axi_arp_index(out_vec[2:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 179'h0396f96e3b7fe58728ce640f1872ef189e31726a4e000;
    stim[1] = 179'h10c515eb826fb243b3cecd6d7ca84a23f10234b2b3a46;
    stim[2] = 179'h6c830ca8987901533767b02d95d421fc14aaccd324d56;
    stim[3] = 179'h36f5f9bfaf0b2dee8dc6279000690244807c4b2afcac2;
    stim[4] = 179'h75f2f9bbc33e891cf2b750405570bc2b82dd1e3360dd9;
    stim[5] = 179'h6ffdf2911487ec36d0e21dd089ff69abeba857b76a63f;
    stim[6] = 179'h5744b197f7e587a73546e16a1826cc72f10a078b8784c;
    stim[7] = 179'h5c07975ec74e37d1169c28640776695c14337d7cd32a9;
    stim[8] = 179'h509d1ba0a15068c0eaef2923df236ea5de144f4d2fa3c;
    stim[9] = 179'h7eb5704a3195a0e03c9e88826a8baf93a5eb653f6acd2;
    stim[10] = 179'h48cbf9aa5a8f88f5057a80f19f7ba565bf524d7e7de9c;
    stim[11] = 179'h41665a30cc1fb77ccc26fde0b8949faca4de731149f63;
    stim[12] = 179'h302d0eed42ec90c23036c9664ef0c6c9197d120e2d1e1;
    stim[13] = 179'h656555b5992653705cec28da3cf76cb0886635441ab1d;
    stim[14] = 179'h7cbf1788f16df1b1cc5259af64801c1f940cdb25f8b6a;
    stim[15] = 179'h57b6596d3e6807b2843526779461e586a5c4ae5cfa876;
    stim[16] = 179'h62e40fa4cf3a21c3f018fcfb7be2086afbf027c158e6e;
    stim[17] = 179'h5134a8b933285125bba3dbbbe4385a5fc235a950ec6f7;
    stim[18] = 179'h47440821590a8322f17fcc05368fa6455a50cfd34dacc;
    stim[19] = 179'h4af16bfb35f835ed68949fe683a14262461cf53f9dcea;
    stim[20] = 179'h43784d723b782b13f90ae81f3c9cab832a7a256d6704a;
    stim[21] = 179'h6db4fe42cf8852c0e1f99b16215e64b5931f61851f887;
    stim[22] = 179'h67dab69b92ed7840d6f9054e63f3bce0d0f7b95451dc4;
    stim[23] = 179'h5683fa730109d66add389d3b91ab9fd992b54250f93b4;
    stim[24] = 179'h49713808f78df9fb52072c866b32331b74ed42dff8c83;
    stim[25] = 179'h6bc939d33202670b1e927298de67d8b95a3564bdd3c8d;
    stim[26] = 179'h479b78ddea099ad8a5d59d0f369c218b39ff8a3e388ea;
    stim[27] = 179'h76d01bd498254b730f1893b147c5d2b6078024753a55b;
    stim[28] = 179'h5809694856aafbbaeda41a68698a9e0c9fbc62e631558;
    stim[29] = 179'h7f5035e435d4ff5f57df53b7aa80658bf892b53d5588b;
    stim[30] = 179'h6c19a98569e9d6fd9a74d8248d057fcadfb121c4c7e50;
    stim[31] = 179'h522d745df07da05afaef36f107a500395ccf31394ea7c;
    stim[32] = 179'h57e5517e28dd109957be65e491588755c2be47a938d90;
    stim[33] = 179'h4533918b3c38b5930f85554db863cc1a2cfbe281154ce;
    stim[34] = 179'h7dc89cb886b33beec308f25ee6266b2247a140c66492f;
    stim[35] = 179'h2ec2dbe13862e1237fbcc02ae5ea23af690bbad669f32;
    stim[36] = 179'h4630c051c4ed6ba1c25c680abd63afdcbb9923f1cc622;
    stim[37] = 179'h083596dc66556d4f541204a2fe3f33feef4ae49f2a684;
    stim[38] = 179'h5fb9180ee0d298dac05d94707b48259f674c5f2545919;
    stim[39] = 179'h5c4ee0b3bf055ae96c61ba2873ccdea6327467215a33e;
    stim[40] = 179'h430734f6973f0f791a0204b776328a3602d3e6ffe0170;
    stim[41] = 179'h49f3ff74a042d5afbc1d385cac29bc2f4a2076195a978;
    stim[42] = 179'h741f6f783aac470e1f0320218ff13aef190a1f226f28b;
    stim[43] = 179'h74e0a3cb3f0fc2ed753d1e65e6d9da477f36079f8367d;
    stim[44] = 179'h76ddfe6483472554e0a99c3da303d78da2e5ccf6b7e40;
    stim[45] = 179'h5af94f6aafd131d40b6b9edf372236bb7549ac8afff1f;
    stim[46] = 179'h4f095416ddc10d6c14b9b0606e5a4e09f5d5c174ee646;
    stim[47] = 179'h6c4f51ab2fe8bf98e42299c649aa8ecbb5d87d5efd0de;
    stim[48] = 179'h74ca71c0ceb3159569ce8cf5c473fca347bf0f63350b3;
    stim[49] = 179'h437f54195fc1a9cd73e10edc0b80f9e21d897382515d5;
    stim[50] = 179'h66e60cf0a734bc9d3be1886be69ad98ea409f8cd202f8;
    stim[51] = 179'h45c11e201a23935dc1f44daba67e101e3080c2c026940;
    stim[52] = 179'h46f01ca2daf4145ab6b4acb06d7f31c7ab45b4ad6f886;
    stim[53] = 179'h7893ce864bb6d3c941bb3ce80c6a745a9dadda7a58975;
    stim[54] = 179'h57997a889f201f3ea23b18e09643f6d55de217bf678b4;
    stim[55] = 179'h6c0b1a09ad8bdec1e2a815dd37b41f29e2cf76359cfa3;
    stim[56] = 179'h52cd6b04af4e50df8b580e6cbae3c8c5c44c599bd7ff4;
    stim[57] = 179'h6a149b3930f9336718f6a75feb7e94da0ec5ed0a0caa7;
    stim[58] = 179'h5e295b2feda62af3312b7e5a9c00399e4fa5ce3c36775;
    stim[59] = 179'h57012cb0637c4325e7928ed19603139b164fac3382590;
    stim[60] = 179'h6975e1ecfc316495d055e0aead5ce6ae36bf70bb18778;
    stim[61] = 179'h6d4c67e2951609d4364ee67c1d46de326ba8fea4bf6ea;
    stim[62] = 179'h5e5ad4da6ab54dfbf9dadc4d6f250b07d66dc39642b0a;
    stim[63] = 179'h4a64219c1aaea5f645d2ebc54958776a2aa444993d6ea;
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
      expv[0] = 13'h0000;
      expv[1] = 13'h0000;
      expv[2] = 13'h0000;
      expv[3] = 13'h0000;
      expv[4] = 13'h0000;
      expv[5] = 13'h0000;
      expv[6] = 13'h0011;
      expv[7] = 13'h0022;
      expv[8] = 13'h0033;
      expv[9] = 13'h0044;
      expv[10] = 13'h0055;
      expv[11] = 13'h0066;
      expv[12] = 13'h0000;
      expv[13] = 13'h0000;
      expv[14] = 13'h0000;
      expv[15] = 13'h0011;
      expv[16] = 13'h0022;
      expv[17] = 13'h0033;
      expv[18] = 13'h0044;
      expv[19] = 13'h0055;
      expv[20] = 13'h0066;
      expv[21] = 13'h0077;
      expv[22] = 13'h0087;
      expv[23] = 13'h0097;
      expv[24] = 13'h00af;
      expv[25] = 13'h00bf;
      expv[26] = 13'h00c8;
      expv[27] = 13'h00d9;
      expv[28] = 13'h00ea;
      expv[29] = 13'h00fb;
      expv[30] = 13'h010c;
      expv[31] = 13'h011d;
      expv[32] = 13'h012e;
      expv[33] = 13'h013f;
      expv[34] = 13'h014f;
      expv[35] = 13'h0000;
      expv[36] = 13'h0000;
      expv[37] = 13'h0000;
      expv[38] = 13'h0000;
      expv[39] = 13'h0000;
      expv[40] = 13'h0001;
      expv[41] = 13'h0002;
      expv[42] = 13'h0003;
      expv[43] = 13'h0004;
      expv[44] = 13'h0015;
      expv[45] = 13'h0026;
      expv[46] = 13'h0037;
      expv[47] = 13'h0047;
      expv[48] = 13'h0057;
      expv[49] = 13'h006f;
      expv[50] = 13'h007f;
      expv[51] = 13'h008f;
      expv[52] = 13'h009f;
      expv[53] = 13'h00af;
      expv[54] = 13'h00bf;
      expv[55] = 13'h00c8;
      expv[56] = 13'h00d9;
      expv[57] = 13'h00ea;
      expv[58] = 13'h00fb;
      expv[59] = 13'h010c;
      expv[60] = 13'h011d;
      expv[61] = 13'h012e;
      expv[62] = 13'h013f;
      expv[63] = 13'h014f;
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
