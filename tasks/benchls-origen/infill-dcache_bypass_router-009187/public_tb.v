// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 137;
  localparam OW = 170;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_009187 dut (
    .no_dcache(in_vec[136:136]),
    .cpu_req(in_vec[135:135]),
    .cpu_we(in_vec[134:134]),
    .cpu_size(in_vec[133:132]),
    .cpu_addr(in_vec[131:100]),
    .cpu_wdata(in_vec[99:68]),
    .ram_rdata(in_vec[67:36]),
    .ram_addr_ack(in_vec[35:35]),
    .ram_data_ack(in_vec[34:34]),
    .cfg_rdata(in_vec[33:2]),
    .cfg_addr_ack(in_vec[1:1]),
    .cfg_data_ack(in_vec[0:0]),
    .cpu_rdata(out_vec[169:138]),
    .cpu_addr_ack(out_vec[137:137]),
    .cpu_data_ack(out_vec[136:136]),
    .ram_req(out_vec[135:135]),
    .ram_we(out_vec[134:134]),
    .ram_size(out_vec[133:132]),
    .ram_addr(out_vec[131:100]),
    .ram_wdata(out_vec[99:68]),
    .cfg_req(out_vec[67:67]),
    .cfg_we(out_vec[66:66]),
    .cfg_size(out_vec[65:64]),
    .cfg_addr(out_vec[63:32]),
    .cfg_wdata(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 137'h148d7e327475a999404e300545fed154fc6;
    stim[1] = 137'h0f60c4fdb502ec3686619811babd9b86733;
    stim[2] = 137'h06156b4f74610c3aa712116db9af5631aa3;
    stim[3] = 137'h0ba0c0f9fd1cf9ba92d046ebb89c50dc7ea;
    stim[4] = 137'h1a627c8e5ecbdf6a00795cfed1033ab1f2c;
    stim[5] = 137'h07c1810301deb6ce230d8d62739f421ab09;
    stim[6] = 137'h00fa0fee2de5db87778538869a078b8f310;
    stim[7] = 137'h0c258becb741f558508e0f92370145c9247;
    stim[8] = 137'h0a9e21445737c35b8bdc872595ad6aeb4f3;
    stim[9] = 137'h09b68d53faa120dd77476c075913d3cda3a;
    stim[10] = 137'h1f990b9b2321977b538ca3c908ab5cf3cb1;
    stim[11] = 137'h14edacdd00a56ce37953f02026c35bc35a5;
    stim[12] = 137'h117a824eb66ee424c6cbdd147444448abf8;
    stim[13] = 137'h0df78447d61f15a5b1c490398c3f9ba00a8;
    stim[14] = 137'h0d2954555d4463e3f9c62bd81cb7276c9c6;
    stim[15] = 137'h108923d51a80dadd52b4f93de13192cd680;
    stim[16] = 137'h07cfd2068731490340d7b0b6b1a3a9cb775;
    stim[17] = 137'h19e5986ef64e250858f9f002c6fed16c7a3;
    stim[18] = 137'h16912a41b87bab8c85752c1881c992d080e;
    stim[19] = 137'h179116355c5c88d33ccdc302d5e683a84ed;
    stim[20] = 137'h1fac757a821c288fd00dc551cae51ab8dae;
    stim[21] = 137'h06ae64cc68080319e645f57bfa58844a7ee;
    stim[22] = 137'h10ca0d8f78788352b49c94233dd0623a4a2;
    stim[23] = 137'h0d2b5a57fd83fe357acb1d5e68735994bf6;
    stim[24] = 137'h0c7b80a15e212067c2f2f753572177cba5f;
    stim[25] = 137'h0e8a3310637cb3818562173f21865303425;
    stim[26] = 137'h1033789abec651d0ca3d97ea95f5bee402d;
    stim[27] = 137'h00ae27ab4c6df3cdfa0130d9f8831c750a0;
    stim[28] = 137'h17e79b5f8c3050c47f468cc7793f7855f35;
    stim[29] = 137'h00e416719374718ad07e5dd95a88b856a79;
    stim[30] = 137'h149c763dd6a30e42d50d787ea27fc200429;
    stim[31] = 137'h1758ac7c7807b1e48e7050a8c3a6f9d8d83;
    stim[32] = 137'h07a29e1eb47fdc5bf4b11e3b46f83675967;
    stim[33] = 137'h1b0a632636fe8a0f8b99d068f7eeff0c384;
    stim[34] = 137'h184e8c507b3c514cae088c6d28293237b5d;
    stim[35] = 137'h0016d47e4ac0530b4f536e8b83e0034a5c8;
    stim[36] = 137'h0ae68e90f90d5fffb793bf3271151979fc0;
    stim[37] = 137'h039c0e39854489242e6388df49a3fc88a19;
    stim[38] = 137'h10a371a696252e396bf3430aa9712c12a97;
    stim[39] = 137'h10586239ee7b7e5d5ce7908d2ae1545de50;
    stim[40] = 137'h0afca597412a97e40c953cf39edeaa8b92b;
    stim[41] = 137'h056b619af50cc4763b4e1ef6d6a11d76027;
    stim[42] = 137'h1f755c23d9fb825b451ad925b4192662018;
    stim[43] = 137'h07b2c4c8ff23ddc87fffae49d5b73f7d590;
    stim[44] = 137'h0b0ccf8467c195ab2b4080e1ede1e76504a;
    stim[45] = 137'h0ad0f4c7df20ae859372f59fea45fc96b01;
    stim[46] = 137'h088f706ae7d9ee4a3602e0d8a6d19c6de1d;
    stim[47] = 137'h087051fc8d7d06f6576a65c78689d1df28c;
    stim[48] = 137'h083879f7eb6b6e00c71a479ce3fc5ef5cc7;
    stim[49] = 137'h0f1bbfa91b4298a971361fa8510cfa4e6d4;
    stim[50] = 137'h11c3cbff5499e662f8a1451ebaaa7324add;
    stim[51] = 137'h15672e57823f11a12785ba1f2e500b610f6;
    stim[52] = 137'h124536ebf1a1e07ddf55f306fb6b83a5271;
    stim[53] = 137'h11e5324ca880773ef8980db847649de803e;
    stim[54] = 137'h14db7bf0be62615e1e62f4c1725de6716b7;
    stim[55] = 137'h1b93afba948a06138b8109b07fc1e094e00;
    stim[56] = 137'h05fd91bbd38067b6719c3d0888202915942;
    stim[57] = 137'h09a5b6040ac891f0d5724e839b4b34a7164;
    stim[58] = 137'h01eab653276f8e5c8e21084f5128a17bd91;
    stim[59] = 137'h0937f1bb4ad539830c60345450b311b44fd;
    stim[60] = 137'h09d8e1d4cfcd77a71fb98bef3f42645fbe0;
    stim[61] = 137'h016ae8bd097c1717c65295cff52b3149c7f;
    stim[62] = 137'h0e48c326a39cda79519b613d35920817a73;
    stim[63] = 137'h009751d30b2804d521d8965ab5ff0e04ab8;
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
      expv[0] = 170'h3ed154fc60000000000000000048d7e327475a99940;
      expv[1] = 170'h1866046eaf60c4fdb502ec368600000000000000000;
      expv[2] = 170'h04845b6e66156b4f74610c3aa700000000000000000;
      expv[3] = 170'h3411baee2ba0c0f9fd1cf9ba9200000000000000000;
      expv[4] = 170'h033ab1f2c00000000000000000a627c8e5ecbdf6a00;
      expv[5] = 170'h0363589ce7c1810301deb6ce2300000000000000000;
      expv[6] = 170'h214e21a680fa0fee2de5db877700000000000000000;
      expv[7] = 170'h2383e48dcc258becb741f5585000000000000000000;
      expv[8] = 170'h3721c9656a9e21445737c35b8b00000000000000000;
      expv[9] = 170'h11db01d649b68d53faa120dd7700000000000000000;
      expv[10] = 170'h2b5cf3cb100000000000000000f990b9b2321977b53;
      expv[11] = 170'h035bc35a5000000000000000004edacdd00a56ce379;
      expv[12] = 170'h04448abf80000000000000000017a824eb66ee424c6;
      expv[13] = 170'h31240e630df78447d61f15a5b100000000000000000;
      expv[14] = 170'h318af6072d2954555d4463e3f900000000000000000;
      expv[15] = 170'h3192cd6800000000000000000008923d51a80dadd52;
      expv[16] = 170'h35ec2dac67cfd206873149034000000000000000000;
      expv[17] = 170'h3ed16c7a3000000000000000009e5986ef64e250858;
      expv[18] = 170'h0992d080e000000000000000006912a41b87bab8c85;
      expv[19] = 170'h2683a84ed0000000000000000079116355c5c88d33c;
      expv[20] = 170'h251ab8dae00000000000000000fac757a821c288fd0;
      expv[21] = 170'h117d5efe96ae64cc68080319e600000000000000000;
      expv[22] = 170'h10623a4a2000000000000000000ca0d8f78788352b4;
      expv[23] = 170'h32c7579a1d2b5a57fd83fe357a00000000000000000;
      expv[24] = 170'h3cbdd4d5cc7b80a15e212067c200000000000000000;
      expv[25] = 170'h1885cfc86e8a3310637cb3818500000000000000000;
      expv[26] = 170'h35bee402d00000000000000000033789abec651d0ca;
      expv[27] = 170'h004c367e20ae27ab4c6df3cdfa00000000000000000;
      expv[28] = 170'h3f7855f35000000000000000007e79b5f8c3050c47f;
      expv[29] = 170'h1f977656a0e416719374718ad000000000000000000;
      expv[30] = 170'h3fc2004290000000000000000049c763dd6a30e42d5;
      expv[31] = 170'h26f9d8d8300000000000000000758ac7c7807b1e48e;
      expv[32] = 170'h2c478ed1b7a29e1eb47fdc5bf400000000000000000;
      expv[33] = 170'h2eff0c38400000000000000000b0a632636fe8a0f8b;
      expv[34] = 170'h293237b5d0000000000000000084e8c507b3c514cae;
      expv[35] = 170'h14dba2e0f016d47e4ac0530b4f00000000000000000;
      expv[36] = 170'h24efcc9c4ae68e90f90d5fffb700000000000000000;
      expv[37] = 170'h18e237d2639c0e39854489242e00000000000000000;
      expv[38] = 170'h312c12a97000000000000000000a371a696252e396b;
      expv[39] = 170'h21545de50000000000000000000586239ee7b7e5d5c;
      expv[40] = 170'h254f3ce7bafca597412a97e40c00000000000000000;
      expv[41] = 170'h1387bdb5a56b619af50cc4763b00000000000000000;
      expv[42] = 170'h19266201800000000000000000f755c23d9fb825b45;
      expv[43] = 170'h3feb927567b2c4c8ff23ddc87f00000000000000000;
      expv[44] = 170'h1020387b7b0ccf8467c195ab2b00000000000000000;
      expv[45] = 170'h1cbd67fa9ad0f4c7df20ae859300000000000000000;
      expv[46] = 170'h00b83629b88f706ae7d9ee4a3600000000000000000;
      expv[47] = 170'h1a9971e1a87051fc8d7d06f65700000000000000000;
      expv[48] = 170'h0691e738f83879f7eb6b6e00c700000000000000000;
      expv[49] = 170'h0d87ea144f1bbfa91b4298a97100000000000000000;
      expv[50] = 170'h2a7324add000000000000000001c3cbff5499e662f8;
      expv[51] = 170'h100b610f6000000000000000005672e57823f11a127;
      expv[52] = 170'h2b83a52710000000000000000024536ebf1a1e07ddf;
      expv[53] = 170'h249de803e000000000000000001e5324ca880773ef8;
      expv[54] = 170'h1de6716b7000000000000000004db7bf0be62615e1e;
      expv[55] = 170'h01e094e0000000000000000000b93afba948a06138b;
      expv[56] = 170'h270f422205fd91bbd38067b67100000000000000000;
      expv[57] = 170'h1c93a0e6d9a5b6040ac891f0d500000000000000000;
      expv[58] = 170'h084213d441eab653276f8e5c8e00000000000000000;
      expv[59] = 170'h180d15142937f1bb4ad539830c00000000000000000;
      expv[60] = 170'h2e62fbcfd9d8e1d4cfcd77a71f00000000000000000;
      expv[61] = 170'h14a573fd416ae8bd097c1717c600000000000000000;
      expv[62] = 170'h26d84f4d6e48c326a39cda795100000000000000000;
      expv[63] = 170'h362596ad709751d30b2804d52100000000000000000;
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
