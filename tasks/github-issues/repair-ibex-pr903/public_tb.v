// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 237;
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
    .clk_i(clk),
    .rst_ni(in_vec[236:236]),
    .csr_pmp_cfg_i(in_vec[235:212]),
    .csr_pmp_addr_i(in_vec[211:76]),
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
    stim[0] = 237'h039a82b350df7cd86d16df958d0bcdd7cbee2a92809f37c02e818b8f3e7b;
    stim[1] = 237'h09f6f21286f33cd54f022cbda417e14f183d01a22a3def9a2d66913150b6;
    stim[2] = 237'h149139bed9ec9dac68963281e430530735757c827a87d429021ab014d279;
    stim[3] = 237'h113a83cec170564b15474267005bc7168c8ca7817522715ca1378ca865c3;
    stim[4] = 237'h1de6cbea013b31df48d9b588cd76bdd25813311b475e5f9f4416a64944ca;
    stim[5] = 237'h1c780f630d5a7569d0d63129c669b463359353490b6e9c39b40c29224bb4;
    stim[6] = 237'h10be16fd490018a9c64c85e5562b4274da70ad2da7d356122ca386135200;
    stim[7] = 237'h1aa54dbe1fce590d1c3fab175ff6f96a6b3426d2550f1211e4d2e80580ed;
    stim[8] = 237'h162c8afb4bb7c92bba120123eeae268ecd2c199a0122c2f462b3685f5cb7;
    stim[9] = 237'h1111346391da878dcb0ed2b74db9c99b9eb12002fd25a95358e743b5e699;
    stim[10] = 237'h1c556c844e08a89733b2a529a46cac5d6def481100e2047288bb24444a4a;
    stim[11] = 237'h15c9510400d19fb8cca18395d0f7619abe14054776ad60c26fc99ebb1ed6;
    stim[12] = 237'h13b1552e0bfca5a1e8d5a39c896cf28dd6f95ea2aa4ce8574407ebd9f0d2;
    stim[13] = 237'h1aa9d8076f1e8ec9bb37647e45752c3fed954a1d6dcccdd58939a5a3f756;
    stim[14] = 237'h1620eaef2b502c9a1552bd95e4d0925859dfeef7ee8f70d2cd5b5809c0dd;
    stim[15] = 237'h1902520e101587313a07369fb3663d218bb583816a8c5870c4aea007740a;
    stim[16] = 237'h1004e554767f3da1d3190fc100d9461d494ee6662acf3d97f6a1a1e85acb;
    stim[17] = 237'h132d9d96f64b08bfb086af20f5a13c94c9b01f5645635abd961f59366ca5;
    stim[18] = 237'h191703758692b46f12445b2d00c6e420cc8026ef375ac65ed5220931d9ca;
    stim[19] = 237'h14557484ed92be354687b83b9e23666d7cbaa9c97b6c8af8c3d890d5e5a4;
    stim[20] = 237'h1bf7ba4e122e93b13de740a32925de10e964499ba5c5922964bbb0f0e5dc;
    stim[21] = 237'h14eadf4913c2d1f2f6d63f9168de133fbfd91b41b8a7b58617cf21c6cc11;
    stim[22] = 237'h13536f7ff636c18ab77c2cd2475615d21c130a51a76a147c7d87e8e6978a;
    stim[23] = 237'h1d07e5f8b4291c555416c26760fe3245373acdb82c473a4f80749b9e7529;
    stim[24] = 237'h11e3cd1ccade4a6e26d41eb4e34005af3c61960694146bf890225a59df9f;
    stim[25] = 237'h104960346df45804dd898358b654f58a96ba9b74f5ebef604536fd55abe5;
    stim[26] = 237'h1ccddbe478391ea767b6d9993eb9c0e1d30c4e0b73fecadde0971cb4208c;
    stim[27] = 237'h190f11a65eb4343891d841b27742f6fcce1c61a2803329eb852b31482f4b;
    stim[28] = 237'h1bd2eb6e0b4bf58b3e465a913cbd1e2bcb56fc02a7d48d8c4076ca4d8c20;
    stim[29] = 237'h14a795a46ee0c59581acca08f979fba3ed15c0d7f530efd536d50375688b;
    stim[30] = 237'h151903d8046c7395d3c30226baa1302e5c1bb2e338ddc6230daa306ea049;
    stim[31] = 237'h1052e5b57b1088f79d7c54d6e3efdaa5de72eefeddfcb2793bb1e02a421f;
    stim[32] = 237'h1fed47ec623bcf6eabae19a8e3cae256d690f46fd268664d15dcecdb1830;
    stim[33] = 237'h16046e3b49dcbe13e7e6615acefbd45b035eee59b369e124a25e1d23870a;
    stim[34] = 237'h1af58cd1ed7a3fd4f4dbfdec29888513cff82112693cacca18466b0eb0ff;
    stim[35] = 237'h1454144324ceaa329f53cc47afd8cccbd5a428373cb20ac1956cf556af3a;
    stim[36] = 237'h14eab0d3d28a1229cde8627f3f85d05dba259e2c593f10348106412e95cc;
    stim[37] = 237'h13f40044f3cad4127f776c677240c17558451064cf28d92689e4eba5994f;
    stim[38] = 237'h1ef8ea175067229ab0cb4f4e22e6b3506ca013310e94b8cdca620512c354;
    stim[39] = 237'h1841c9c274957d3038ad0ddc10dd90e45074d1a0aa874c94bffdeac6e3f2;
    stim[40] = 237'h154127adb0cee81aca64e1e11c33c2eb1e2f95710faa5b1ab3dccf736204;
    stim[41] = 237'h106804651389db0a2860459b33e3d8e75b1fb76d0c0de4c33fed8fba26ee;
    stim[42] = 237'h160a7e11e4ae6a7c310b6e1970de669fad66e0b6917111e08ed4a2729815;
    stim[43] = 237'h11a796f51dca8ae0bd2f0ec7319ebe20df3f77cf1a703ec365f4a9646cfa;
    stim[44] = 237'h17abc030f0c8fc7531708e8811931a064e3a749e4fe5277c2968c8f7663b;
    stim[45] = 237'h195e0283f06a9c18e9a0816311988dfd627a92de1cbeffd67b6f89ea5b7b;
    stim[46] = 237'h13205b2500009cc76c28475de0e18051e09659b7fc6054916a629de8b407;
    stim[47] = 237'h17b45914a1275e350456e2d1605ef8bac495da522b8e3d5fbd779ad33005;
    stim[48] = 237'h1dd88565bbb1fe0adc8e0878c0771486d9131840308d7b1baaa10949a8dc;
    stim[49] = 237'h1e0026624aaa94c65b1b1f77c511981e76b61907d6b078b403683cc3bb0d;
    stim[50] = 237'h1e13ffd91b86b0abfebbf2ed4345a95e5c005a955d160b9b61f886e244a7;
    stim[51] = 237'h17aabc79f51826c375f5d9398fb66b6fbfb129fef8412536ae079da71928;
    stim[52] = 237'h16f02d8ffdb1bd0cf2dbdea0b9a1989e633ae7663b4f642e64bf04ef7e62;
    stim[53] = 237'h131e2d1e1c477fc5a179ebe13d446f62d8ec10d0e9829f39c4ed08bb7a00;
    stim[54] = 237'h1f7b621ab99fdd9969b87a24c63c332c0f06b2fba53ed7a47b28f002298b;
    stim[55] = 237'h15131f6557509dabd93f341d391cc6b27bf05188c2bffa72053c017549e5;
    stim[56] = 237'h13617bb50e0721cc3c551f161fa157d0d08ff2519f366b5aa36df5717d5e;
    stim[57] = 237'h1455098cb0af2f53a048205c3e22dc93006ff8014e55a97128bdf7c746dd;
    stim[58] = 237'h1951ba753e92f39df264872b3df8ff53332fa2894e8ed93543c6b24f4aaf;
    stim[59] = 237'h11d8f592b181da14cab5a66e26619f9540338141879fe95157f2ba2952cf;
    stim[60] = 237'h15fb485b29418bc213d4cbc1886ec626123b2db714d83d35443fb85855d0;
    stim[61] = 237'h13fe385450fa0e6ae78a1d151fc042ff6132284b05858747787c775494b8;
    stim[62] = 237'h1be45eb5a14cfd99aa6f394d6e71871506092448c9e71501b5a3b62e7d8f;
    stim[63] = 237'h1e90a9abdcb1705da1b2130e766b5e3f3b9d928b621edcaf7e702746fee1;
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
      expv[0] = 2'h3;
      expv[1] = 2'h3;
      expv[2] = 2'h2;
      expv[3] = 2'h3;
      expv[4] = 2'h2;
      expv[5] = 2'h2;
      expv[6] = 2'h2;
      expv[7] = 2'h2;
      expv[8] = 2'h3;
      expv[9] = 2'h1;
      expv[10] = 2'h3;
      expv[11] = 2'h3;
      expv[12] = 2'h1;
      expv[13] = 2'h1;
      expv[14] = 2'h1;
      expv[15] = 2'h3;
      expv[16] = 2'h3;
      expv[17] = 2'h3;
      expv[18] = 2'h2;
      expv[19] = 2'h2;
      expv[20] = 2'h3;
      expv[21] = 2'h3;
      expv[22] = 2'h0;
      expv[23] = 2'h1;
      expv[24] = 2'h3;
      expv[25] = 2'h3;
      expv[26] = 2'h2;
      expv[27] = 2'h3;
      expv[28] = 2'h0;
      expv[29] = 2'h3;
      expv[30] = 2'h3;
      expv[31] = 2'h1;
      expv[32] = 2'h3;
      expv[33] = 2'h2;
      expv[34] = 2'h3;
      expv[35] = 2'h1;
      expv[36] = 2'h3;
      expv[37] = 2'h0;
      expv[38] = 2'h1;
      expv[39] = 2'h3;
      expv[40] = 2'h0;
      expv[41] = 2'h1;
      expv[42] = 2'h3;
      expv[43] = 2'h1;
      expv[44] = 2'h0;
      expv[45] = 2'h1;
      expv[46] = 2'h1;
      expv[47] = 2'h2;
      expv[48] = 2'h3;
      expv[49] = 2'h3;
      expv[50] = 2'h1;
      expv[51] = 2'h3;
      expv[52] = 2'h2;
      expv[53] = 2'h0;
      expv[54] = 2'h3;
      expv[55] = 2'h3;
      expv[56] = 2'h0;
      expv[57] = 2'h1;
      expv[58] = 2'h1;
      expv[59] = 2'h2;
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
