// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 76;
  localparam OW = 75;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_186253 dut (
    .clk(clk),
    .reset(in_vec[75:75]),
    .RegWriteM(in_vec[74:74]),
    .MemtoRegM(in_vec[73:73]),
    .readdata(in_vec[72:41]),
    .ALUResultM(in_vec[40:9]),
    .WriteAddrM(in_vec[8:5]),
    .StoreM(in_vec[4:4]),
    .CmpM(in_vec[3:3]),
    .PCSrcM(in_vec[2:2]),
    .BranchM(in_vec[1:1]),
    .LoadM(in_vec[0:0]),
    .LoadW(out_vec[74:74]),
    .BranchW(out_vec[73:73]),
    .PCSrcW(out_vec[72:72]),
    .CmpW(out_vec[71:71]),
    .StoreW(out_vec[70:70]),
    .RegWriteW(out_vec[69:69]),
    .MemtoRegW(out_vec[68:68]),
    .ReadDataW(out_vec[67:36]),
    .ALUOutW(out_vec[35:4]),
    .WriteAddrW(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 76'hd2401e7cab6dc9cba41;
    stim[1] = 76'h8c442f1d3c324e5807c;
    stim[2] = 76'h33d59cc34ada29966f4;
    stim[3] = 76'h7d0d05af3ff06d480a8;
    stim[4] = 76'h4ceeaa4ab757d7a138d;
    stim[5] = 76'h66f499cdd0af3253ad2;
    stim[6] = 76'h0fde3e67e51e83daaa5;
    stim[7] = 76'h4c20746013c03b100d3;
    stim[8] = 76'h37599f7e422a1209d7b;
    stim[9] = 76'h1d98ce034735a988735;
    stim[10] = 76'h2eb389505079617d791;
    stim[11] = 76'h18f675744fa7b32daad;
    stim[12] = 76'h4c39b27cabf7747ca65;
    stim[13] = 76'h435552d934b89002a63;
    stim[14] = 76'h5d4bbdc76e5ffac1168;
    stim[15] = 76'h00005954618e91a9fa2;
    stim[16] = 76'h7f089790f53c4cd4f4c;
    stim[17] = 76'h37c2e305f1a699547f2;
    stim[18] = 76'h373135bb2a03e805b54;
    stim[19] = 76'h35489588c50774f6543;
    stim[20] = 76'h6f9335e78daf61f3eaa;
    stim[21] = 76'h631e436b52c3a919aa9;
    stim[22] = 76'h0c4b95bf3d4241884b9;
    stim[23] = 76'h7d21654ac6477f1acf4;
    stim[24] = 76'h546a68e6c385597f6a2;
    stim[25] = 76'h2a1cc20097af7f81303;
    stim[26] = 76'h615dee24aeeee783ade;
    stim[27] = 76'h5abfe54fc3bc18c1ea4;
    stim[28] = 76'h6375208dcfc822e281d;
    stim[29] = 76'h0ffebd9efad0310acf9;
    stim[30] = 76'h22ce58042f6d071d69f;
    stim[31] = 76'h0070de382823cc84021;
    stim[32] = 76'h205675fbefdf7861f2e;
    stim[33] = 76'h5cbb67a60b8edc3491b;
    stim[34] = 76'h5a650ef8d6e1cd53ad3;
    stim[35] = 76'h970b7ed05b50b8f210f;
    stim[36] = 76'h079df946e4c1d07198f;
    stim[37] = 76'h151109a9542d1977608;
    stim[38] = 76'h218e2306aac6389fb95;
    stim[39] = 76'h3c8f8ec20bb68d2cb50;
    stim[40] = 76'h706d9796c8a3fc6e830;
    stim[41] = 76'h44f4f46d9343f402c85;
    stim[42] = 76'h3b4538f186de6fca7da;
    stim[43] = 76'h78a67bfe01131512c06;
    stim[44] = 76'h5fdec4c50e8cf0e357b;
    stim[45] = 76'h1f50607cdf58b1bfb99;
    stim[46] = 76'h39172b354ee5986c264;
    stim[47] = 76'h457ae80f22a6972001c;
    stim[48] = 76'h257d64c43eb36959467;
    stim[49] = 76'h7fabe16ea6df40a50a7;
    stim[50] = 76'h194b65b260e4bedec09;
    stim[51] = 76'h56f593adb294a27e0cc;
    stim[52] = 76'h10a3051c11e8f4b9b54;
    stim[53] = 76'h380c8f62ab7f36f66a1;
    stim[54] = 76'h45063c66edd77852451;
    stim[55] = 76'h607f13ad03549d3682c;
    stim[56] = 76'h362f2754aa6d558aaad;
    stim[57] = 76'h11cb55d1e81a4223295;
    stim[58] = 76'h303ecd803deae462747;
    stim[59] = 76'h397755428fb0d4f89b0;
    stim[60] = 76'h17a886408fdb5356399;
    stim[61] = 76'h67c6baaec5f92ad1343;
    stim[62] = 76'h79ee97bd0368c14b903;
    stim[63] = 76'h31722e6ecf3e8ebb32a;
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
      expv[0] = 75'hxxxxxxxxxxxxxxxxxxx;
      expv[1] = 75'h0000000000000000000;
      expv[2] = 75'h0000000000000000000;
      expv[3] = 75'h159eace61a56d14cb37;
      expv[4] = 75'h0be8682d79ff836a405;
      expv[5] = 75'h5a67755255babebd09c;
      expv[6] = 75'h2737a4ce6e8579929d6;
      expv[7] = 75'h507ef1f33f28f41ed55;
      expv[8] = 75'h666103a3009e01d8806;
      expv[9] = 75'h6dbaccfbf21150904eb;
      expv[10] = 75'h54ecc6701a39ad4c439;
      expv[11] = 75'h45759c4a8283cb0bebc;
      expv[12] = 75'h58c7b3aba27d3d996d5;
      expv[13] = 75'h5261cd93e55fbba3e53;
      expv[14] = 75'h621aaa96c9a5c480153;
      expv[15] = 75'h0aea5dee3b72ffd608b;
      expv[16] = 75'h200002caa30c748d4fd;
      expv[17] = 75'h1bf844bc87a9e266a7a;
      expv[18] = 75'h25be17182f8d34caa3f;
      expv[19] = 75'h15b989add9501f402da;
      expv[20] = 75'h61aa44ac46283ba7b2a;
      expv[21] = 75'h2b7c99af3c6d7b0f9f5;
      expv[22] = 75'h4b18f21b5a961d48cd5;
      expv[23] = 75'h4c625cadf9ea120c425;
      expv[24] = 75'h17e90b2a56323bf8d67;
      expv[25] = 75'h22a35347361c2acbfb5;
      expv[26] = 75'h6150e61004bd7bfc098;
      expv[27] = 75'h3f0aef712577773c1d6;
      expv[28] = 75'h12d5ff2a7e1de0c60f5;
      expv[29] = 75'h5f1ba9046e7e4117140;
      expv[30] = 75'h4c7ff5ecf7d68188567;
      expv[31] = 75'h7d1672c0217b6838eb4;
      expv[32] = 75'h400386f1c1411e64201;
      expv[33] = 75'h3902b3afdf7efbc30f9;
      expv[34] = 75'h6ee5db3d305c76e1a48;
      expv[35] = 75'h66d32877c6b70e6a9d6;
      expv[36] = 75'h0000000000000000000;
      expv[37] = 75'h783cefca37260e838cc;
      expv[38] = 75'h08a8884d4aa168cbbb0;
      expv[39] = 75'h550c7118355631c4fdc;
      expv[40] = 75'h05e47c76105db46965a;
      expv[41] = 75'h07836cbcb6451fe3741;
      expv[42] = 75'h5227a7a36c9a1fa0164;
      expv[43] = 75'h2dda29c78c36f37e53e;
      expv[44] = 75'h33c533dff00898a8960;
      expv[45] = 75'h6efef626287467871ab;
      expv[46] = 75'h4cfa8303e6fac58dfdc;
      expv[47] = 75'h11c8b959aa772cc3613;
      expv[48] = 75'h1e2bd740791534b9000;
      expv[49] = 75'h712beb2621f59b4aca3;
      expv[50] = 75'h73fd5f0b7536fa05285;
      expv[51] = 75'h48ca5b2d930725f6f60;
      expv[52] = 75'h1ab7ac9d6d94a513f06;
      expv[53] = 75'h14851828e08f47a5cda;
      expv[54] = 75'h41c0647b155bf9b7b35;
      expv[55] = 75'h462831e3376ebbc2922;
      expv[56] = 75'h1b03f89d681aa4e9b41;
      expv[57] = 75'h59b1793aa5536aac555;
      expv[58] = 75'h548e5aae8f40d211194;
      expv[59] = 75'h7181f66c01ef572313a;
      expv[60] = 75'h05cbbaaa147d86a7c4d;
      expv[61] = 75'h4cbd4432047eda9ab1c;
      expv[62] = 75'h633e35d5762fc95689a;
      expv[63] = 75'h63cf74bde81b460a5c8;
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
