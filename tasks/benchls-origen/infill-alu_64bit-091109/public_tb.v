// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 134;
  localparam OW = 68;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_091109 dut (
    .dataA(in_vec[133:70]),
    .dataB(in_vec[69:6]),
    .fs(in_vec[5:1]),
    .c0(in_vec[0:0]),
    .out(out_vec[67:4]),
    .status(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 134'h1f823409eae639ebb1aa49bc25f3887233;
    stim[1] = 134'h01ebe050149eedba583736787211458723;
    stim[2] = 134'h172a1e0ee3121753b78a42d7cb1be261e7;
    stim[3] = 134'h1a7aea72a612f8c4f8f9ab777cb7d87061;
    stim[4] = 134'h2c5cd9a24213fcb5b6e630cd14ecc6e6d5;
    stim[5] = 134'h2b53214cbf9e9e66955287bf2967221431;
    stim[6] = 134'h3daca77f21dda98c4884b4dd0b9f5697d8;
    stim[7] = 134'h0d18af440980baba39fc4980ba0b877fba;
    stim[8] = 134'h1f7e7191eeb588867bd2624ec172a64cb5;
    stim[9] = 134'h3abf66c2fa7b2dc36018073cf4cdb4887b;
    stim[10] = 134'h05eadf7afb78d1e14e7bf8b7f8e1e3de75;
    stim[11] = 134'h1ce2cd3d2f06907dd493eb04cf6768f540;
    stim[12] = 134'h101f3e0b65a11bc518c1847aed55e0f68a;
    stim[13] = 134'h309302a863fc55f84164e1247c274cf5d1;
    stim[14] = 134'h045aaa89b0870744b42e0ae049e1f71251;
    stim[15] = 134'h34da3e065c0c1fc47d410cbf5bf396e038;
    stim[16] = 134'h1182616736f95b57a13a70392c22429afa;
    stim[17] = 134'h148ad5a6e8a1c873876e31a05c879eb421;
    stim[18] = 134'h2368705ce06e6be01712c783c55724c2ad;
    stim[19] = 134'h0010e9de9fe98d923798781d6086f70db5;
    stim[20] = 134'h1b27ffd8a1507de80e211d27913c61fe99;
    stim[21] = 134'h00da8bceb41d8545300f3f0fdc043e0c00;
    stim[22] = 134'h2472e9f33bb27e4839432840eaf692c63c;
    stim[23] = 134'h2818d9f00a94b92f719069a4d75db73038;
    stim[24] = 134'h187b4f03a51feff76d3f622090ad1b5f00;
    stim[25] = 134'h0fdad0deaf106ea36d009091ceeb776767;
    stim[26] = 134'h3f554744b430c8f8235eb33e3b9005239d;
    stim[27] = 134'h143dcf7c7568d669a3857da519ab7763c2;
    stim[28] = 134'h115f6038e30ea6fd6569e7a89632d37ed4;
    stim[29] = 134'h2e32752d3277f5f6ab0a1a9d4caf912983;
    stim[30] = 134'h37305e4d017e977972d44235e1303b0aca;
    stim[31] = 134'h3f663cbee23f968aeb21438ab292587f0a;
    stim[32] = 134'h30c695088d73bf91fd922460f39ff84a14;
    stim[33] = 134'h3ebc97695b584fd56cd287d6ec0f2e4f4e;
    stim[34] = 134'h0ee706a036ce09e066d56500956c279990;
    stim[35] = 134'h1edad0e5961f6ff2cee72982d72ce2e9cb;
    stim[36] = 134'h22cba8157d8019ed60129f603101f34396;
    stim[37] = 134'h0138f40bd31f28a41d7e44b9c6481702b5;
    stim[38] = 134'h2af494ad7fd0e7e053d3651fc5c73a38f4;
    stim[39] = 134'h2479bfd29d01347c43b5b7a7373f0d327a;
    stim[40] = 134'h39f945648397bac382c8d97492e51ebc5c;
    stim[41] = 134'h0122ae74ef99b1e87afd72681f334a2e56;
    stim[42] = 134'h0298ad26ab54d7fb70ac8074d00a328379;
    stim[43] = 134'h3909f909da8d4409d2f14623944fe0e0f3;
    stim[44] = 134'h3924235f76320e3ced77aaa2b1b4453994;
    stim[45] = 134'h3c0c35d1a325a0256dc13059ba05079b01;
    stim[46] = 134'h0e4a838d7ed2b8e4952e384fb05af69086;
    stim[47] = 134'h3e7f2110575165db191d6d29b1431dd88c;
    stim[48] = 134'h2af42ec0b91dba20d5060f51c25e96930d;
    stim[49] = 134'h262ee72bdd346af8ab335b80e8d2eb71c6;
    stim[50] = 134'h128d84fe8651433ea75434229aca9f71b2;
    stim[51] = 134'h162f8432fe1b50a3a29ff11d6fc6334406;
    stim[52] = 134'h06620d3667e714ba345cdb77979088ce1d;
    stim[53] = 134'h1b8440c9dd04930ccf100c8166464e4519;
    stim[54] = 134'h0d33da0a1ecdab52b7dd549ffc19cf29e9;
    stim[55] = 134'h1d59c6bf6031f345d3f9e4e4021f363cbb;
    stim[56] = 134'h20603a064b57078b137ca8437379a42219;
    stim[57] = 134'h0d0710486166f5f4f058505561e4d4e559;
    stim[58] = 134'h01dbc441ecbeb33b1b3a89e60ba3e1bcbc;
    stim[59] = 134'h289c7fbf65dfca99376e906bfbfcdeb34b;
    stim[60] = 134'h2c1989d020e786518cfa25d29aff821e50;
    stim[61] = 134'h37f5cda8c5154ec5480ba9c232493ff2e8;
    stim[62] = 134'h39b81aeaba913d8386d937368651618027;
    stim[63] = 134'h1ed98ed37a59f738328477fddc41c249bd;
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
      expv[0] = 68'h00000000000000009;
      expv[1] = 68'h0527bb6e900000000;
      expv[2] = 68'h543c1dc6242ea7000;
      expv[3] = 68'hd3d753953097c6266;
      expv[4] = 68'h2a255cab4b6328c54;
      expv[5] = 68'h00000000000000005;
      expv[6] = 68'hd4a04e88a90bfc6e6;
      expv[7] = 68'h00000000000000001;
      expv[8] = 68'h0000000000000000d;
      expv[9] = 68'h00000000000000005;
      expv[10] = 68'h00000000000000005;
      expv[11] = 68'h520b24103c1801d58;
      expv[12] = 68'hdcfdfe3ddeac7f352;
      expv[13] = 68'hc7df8f33808e8bb92;
      expv[14] = 68'he222d5a7e9a3f95c2;
      expv[15] = 68'h00000000000000005;
      expv[16] = 68'h00000000000000009;
      expv[17] = 68'h569ba28721ce00000;
      expv[18] = 68'h002368705ce06e6b8;
      expv[19] = 68'h00000000000000005;
      expv[20] = 68'h541b8bfcc1b0705a8;
      expv[21] = 68'h00282c3a501010100;
      expv[22] = 68'h00000000000000005;
      expv[23] = 68'h0000000000000000d;
      expv[24] = 68'h20ed080200342d5c4;
      expv[25] = 68'h57883751a00000004;
      expv[26] = 68'h8fd02e15c17cc8912;
      expv[27] = 68'h50e20961910200208;
      expv[28] = 68'h502a1dbecc90b205c;
      expv[29] = 68'h10c19480c94193584;
      expv[30] = 68'hfcefff3c7fff5ff56;
      expv[31] = 68'hfffaf3ffbdfede2b6;
      expv[32] = 68'h332e3d6198b0e2e04;
      expv[33] = 68'h4dbde2fedfdfc6ea0;
      expv[34] = 68'hd6f1ae8330e8c5e72;
      expv[35] = 68'hff6b5bf6fb7dffdb6;
      expv[36] = 68'hf486e22945f7cb3ba;
      expv[37] = 68'h00000000000000005;
      expv[38] = 68'h00000000000000009;
      expv[39] = 68'h00000000000000005;
      expv[40] = 68'h13398fbfba356e000;
      expv[41] = 68'h0f7f7c8bc4cc0fa44;
      expv[42] = 68'h00000000000000001;
      expv[43] = 68'h00000000000000005;
      expv[44] = 68'hd14e1d0cee08dbf22;
      expv[45] = 68'hb000c146881400046;
      expv[46] = 68'h824510c00494042de;
      expv[47] = 68'h6677ffbee7be7ff30;
      expv[48] = 68'h543f7dff1bfb5f7c8;
      expv[49] = 68'h43000150082450188;
      expv[50] = 68'h00000000000000009;
      expv[51] = 68'h25002b00008230614;
      expv[52] = 68'h3704a6f83e218e2f4;
      expv[53] = 68'h52513122ed0b75278;
      expv[54] = 68'h0000000000699ed04;
      expv[55] = 68'h00000000000000005;
      expv[56] = 68'hcc724914e0ba8ea42;
      expv[57] = 68'hf57d0074020884462;
      expv[58] = 68'h00000000000000005;
      expv[59] = 68'ha275fefd977faf762;
      expv[60] = 68'he44ebe8aef9c21bf2;
      expv[61] = 68'h001bfae6d4628aa74;
      expv[62] = 68'he6e06baaea44f60e2;
      expv[63] = 68'h0000000000000000d;
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
