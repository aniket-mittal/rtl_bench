// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 194;
  localparam OW = 263;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_03350 dut (
    .aclk(clk),
    .aresetn(in_vec[193:193]),
    .s_axi_awaddr(in_vec[192:161]),
    .s_axi_awprot(in_vec[160:158]),
    .s_axi_awvalid(in_vec[157:157]),
    .s_axi_wdata(in_vec[156:125]),
    .s_axi_wstrb(in_vec[124:121]),
    .s_axi_wvalid(in_vec[120:120]),
    .s_axi_bready(in_vec[119:119]),
    .s_axi_araddr(in_vec[118:87]),
    .s_axi_arprot(in_vec[86:84]),
    .s_axi_arvalid(in_vec[83:83]),
    .s_axi_rready(in_vec[82:82]),
    .m_axi_awready(in_vec[81:80]),
    .m_axi_wready(in_vec[79:78]),
    .m_axi_bresp(in_vec[77:74]),
    .m_axi_bvalid(in_vec[73:72]),
    .m_axi_arready(in_vec[71:70]),
    .m_axi_rdata(in_vec[69:6]),
    .m_axi_rresp(in_vec[5:2]),
    .m_axi_rvalid(in_vec[1:0]),
    .s_axi_awready(out_vec[262:262]),
    .s_axi_wready(out_vec[261:261]),
    .s_axi_bresp(out_vec[260:259]),
    .s_axi_bvalid(out_vec[258:258]),
    .s_axi_arready(out_vec[257:257]),
    .s_axi_rdata(out_vec[256:225]),
    .s_axi_rresp(out_vec[224:223]),
    .s_axi_rvalid(out_vec[222:222]),
    .m_axi_awaddr(out_vec[221:158]),
    .m_axi_awprot(out_vec[157:152]),
    .m_axi_awvalid(out_vec[151:150]),
    .m_axi_wdata(out_vec[149:86]),
    .m_axi_wstrb(out_vec[85:78]),
    .m_axi_wvalid(out_vec[77:76]),
    .m_axi_bready(out_vec[75:74]),
    .m_axi_araddr(out_vec[73:10]),
    .m_axi_arprot(out_vec[9:4]),
    .m_axi_arvalid(out_vec[3:2]),
    .m_axi_rready(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 194'h0ee2a32c27ebd3d2c9a9675300f99dcad94aa0f7d69d5d3b2;
    stim[1] = 194'h0af06ee9b892ce649521f4434d901bc65f2f0fcf646951f1d;
    stim[2] = 194'h39060d5a6e726f2240586954fa034e62f22f7e168b9842a70;
    stim[3] = 194'h27e0bf3ea7492f97f2531be0e2d6652dc137078e1ae575d39;
    stim[4] = 194'h244d2b8fd013172a667d05e7de5b19130516f58d8e95249e0;
    stim[5] = 194'h3bafbfae0df8500d28070c84c91a2cb0aad05660b7fc2825f;
    stim[6] = 194'h288a061fad46000ac747e582ec4d927d91b8bdc5bf08f8bd0;
    stim[7] = 194'h3b38e52f6666ff80a129742f09fcd5c4a9db96daa35d9c09f;
    stim[8] = 194'h296e28615a17d4a1c3672e8ab288e9857978cd35b28a73df8;
    stim[9] = 194'h3632efb849ee6b8c2f9c774e3c9f6e5e56eb90e061562f409;
    stim[10] = 194'h3234b60dc860a469cf78f653c4a433003a6b033c6f41b3b1b;
    stim[11] = 194'h313ee4ce9b469468d5dbbfaa8646b48c969d12a987215e202;
    stim[12] = 194'h3b12c1ebd3890c734c3ef2ca1e55a75d419295991a578bed8;
    stim[13] = 194'h1eaa68673a46fbe38cf041b401fe1cd446ca1faffd4d50809;
    stim[14] = 194'h3f9a7eb1b2d5805c64bc77727f837d19ff304886c61eb2c08;
    stim[15] = 194'h398f19e54b555e4a6d093fbd4734bf62f704ef90f9eb45308;
    stim[16] = 194'h37dc242ea548451a5c4486b281096d1b26a8dd5fd75a97545;
    stim[17] = 194'h29c585e62de3411aa4bbfbdbe2932720ef275d9611016cb1e;
    stim[18] = 194'h32864d81b371914d4f0704bc2b19082f67d677b72c5620e56;
    stim[19] = 194'h377a5f32fbaddbfa4e15dad8a834f210dc6986ed7e9bb3817;
    stim[20] = 194'h331305dddf28b64f2b679b591db47fdeb9c0a30c9aebcd58b;
    stim[21] = 194'h2c19fab6876cc8bedb28d93b82e7287583c4d47c38dfadf6c;
    stim[22] = 194'h3645ccdb2a0ba72628af72071576728545510312c750c8825;
    stim[23] = 194'h29bb3c2288c9348291693f672baa7cf462f43662d1b52c5e1;
    stim[24] = 194'h3c9a628ed00390b5147ce70a4eb8133405e4bbbade75f4ea7;
    stim[25] = 194'h2eb2807739517aea2cd2df065e222f1d872fc2ce35713ff6b;
    stim[26] = 194'h37e4f1ea72089a601666e8659ed2a03c59ef7195e24fb3907;
    stim[27] = 194'h29e9fd2366ebc670e9073f2e0ee26a1edfcbbe1fb019192b7;
    stim[28] = 194'h24759f190a137732fd10f6d1a47caa59b5f5ea63e3ffecf7b;
    stim[29] = 194'h3bec8b32aae1e2ba1598fd5344ff31349aa4116b79e5a8715;
    stim[30] = 194'h2573b801d6064c8508e473463da38ad80dfc451c5ee77cd27;
    stim[31] = 194'h24a2dc7ccef7cfe6b37723c0141f1bddb0dc2bac0f70d693b;
    stim[32] = 194'h2d6690b46023e2df9369c99ebb666d641f0368c90d7aba70b;
    stim[33] = 194'h336ff246a3ecd8772ae8c49f6ec2680205cbed8c96bcf426f;
    stim[34] = 194'h2a6b724e2f416afb5f28fa25bb747bd68e2836a848564c117;
    stim[35] = 194'h3b5200942b18e298990975eed3b0d5034c013409657eb7d3e;
    stim[36] = 194'h2e8bbecf10dda72c63b517d2aa7d2140478480d227b68ac24;
    stim[37] = 194'h353eaa6b7e9a6cf9ae2393a83a314b3bfbdda49835dc43f58;
    stim[38] = 194'h3bb2d0ec5a196cf1dbae9487d06fc517a7e45cdfa5ca85f25;
    stim[39] = 194'h3f14260e6f96736a7d56783ffe4d95468eb11a8962187ed9e;
    stim[40] = 194'h2e21e1157ec0e078cc3d004414b2452bf9151b6720187fc84;
    stim[41] = 194'h30108c7baa4b2f45b4230d5d0fb3a7df115544ee2ffa6edee;
    stim[42] = 194'h3874f3a54d14e7b4bb8c0e5ab0008603c929dfa33095cc6f0;
    stim[43] = 194'h303eddc5b2d6e0df18d7a3a7d76b05585c9c43661633f9c86;
    stim[44] = 194'h3872d43eab2bcef3f13e0001040981df076e210293f3e91c5;
    stim[45] = 194'h38f2d33acbfa66ae9d2d27814f21c3269b7fc85d429576661;
    stim[46] = 194'h308f9cddd31b9b388e345e746ae66eac5f0c9fb6de59992f8;
    stim[47] = 194'h3d3a6d3f7f941397ba1ae7a3eb5752e020e991c4b2cf71ba5;
    stim[48] = 194'h39497f394b783ec7f3c45f4534cd12f25f1fb2a2a955a249f;
    stim[49] = 194'h274a488556de3fd96f29f0ed36fc5abb5302919ebde2996c4;
    stim[50] = 194'h3189a5b2020623187b6c528e94e73b70abb818d92be896353;
    stim[51] = 194'h34fbfb4f8667c5c75040d47b8d3e5684ad5c6279df2424390;
    stim[52] = 194'h31fc00c8e746406136842062570fa9f373d1f064d46d86681;
    stim[53] = 194'h35714804b2f3defb5d1d301eedf3d9cf56423283b9b93488c;
    stim[54] = 194'h29835925d638de022899e235fc2ab0cc0507783196ebcdff9;
    stim[55] = 194'h3a5a9e9196118ad98e90592596bdd71d09e2052b218e36b02;
    stim[56] = 194'h3c004392a20f3598db95a2ab7be4ed34748ebf7c4f74f79d9;
    stim[57] = 194'h2d7feac6c9e65a872c023bd323bf7544a259eb491760a8c17;
    stim[58] = 194'h225dadf5b1ccb7d08b274046c93e7e6b7bb3ff247f2694a28;
    stim[59] = 194'h3d8fe9572f79ac2ca060c4a7221c86b6b13136c26138c285c;
    stim[60] = 194'h3f31dc6b98a13752ce15511f3baf56b6dae4d311b11e21178;
    stim[61] = 194'h242b4b7b4994880cee494580da912986e7fa77b92bcd7916f;
    stim[62] = 194'h25dd72450655b702f6fae0d96b1e77db7d8d7ad5053eb95d1;
    stim[63] = 194'h346baf8f68d312d20a7992645afb73c1be1227efb9709d2d2;
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
      expv[0] = 263'h0000000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 263'h0000000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[2] = 263'h0000000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[3] = 263'h61bd5b7ddexxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[4] = 263'h05bd5b7ddexxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[5] = 263'h21bd5b7ddexxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[6] = 263'h01bd5b7ddexxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[7] = 263'h03bd5b7ddexxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[8] = 263'h41bd5b7ddexxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[9] = 263'h03bd5b7ddexxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[10] = 263'h21bd5b7ddexxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[11] = 263'h05bd5b7ddexxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[12] = 263'h63bd5b7ddexxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[13] = 263'h0000000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[14] = 263'h0000000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[15] = 263'h61bd5b7ddexxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[16] = 263'h03bd5b7ddexxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[17] = 263'h01bd5b7ddexxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[18] = 263'h21bd5b7ddexxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[19] = 263'h41bd5b7ddexxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[20] = 263'h23bd5b7ddexxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[21] = 263'h41bd5b7ddexxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[22] = 263'h01bd5b7ddexxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[23] = 263'h41bd5b7ddexxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[24] = 263'h01bd5b7ddexxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[25] = 263'h21bd5b7ddexxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[26] = 263'h05bd5b7ddexxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[27] = 263'h43bd5b7ddexxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[28] = 263'h01bd5b7ddexxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[29] = 263'h63bd5b7ddexxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[30] = 263'h05bd5b7ddexxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[31] = 263'h43bd5b7ddexxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[32] = 263'h21bd5b7ddexxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[33] = 263'h01bd5b7ddexxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[34] = 263'h41bd5b7ddexxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[35] = 263'h01bd5b7ddexxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[36] = 263'h43bd5b7ddexxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[37] = 263'h21bd5b7ddexxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[38] = 263'h41bd5b7ddexxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[39] = 263'h03bd5b7ddexxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[40] = 263'h61bd5b7ddexxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[41] = 263'h05bd5b7ddexxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[42] = 263'h43bd5b7ddexxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[43] = 263'h01bd5b7ddexxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[44] = 263'h61bd5b7ddexxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[45] = 263'h07bd5b7ddexxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[46] = 263'h41bd5b7ddexxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[47] = 263'h21bd5b7ddexxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[48] = 263'h45bd5b7ddexxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[49] = 263'h01bd5b7ddexxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[50] = 263'h41bd5b7ddexxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[51] = 263'h01bd5b7ddexxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[52] = 263'h41bd5b7ddexxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[53] = 263'h03bd5b7ddexxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[54] = 263'h61bd5b7ddexxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[55] = 263'h07bd5b7ddexxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[56] = 263'h61bd5b7ddexxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[57] = 263'h07bd5b7ddexxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[58] = 263'h01bd5b7ddexxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[59] = 263'h01bd5b7ddexxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[60] = 263'h43bd5b7ddexxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[61] = 263'h21bd5b7ddexxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[62] = 263'h01bd5b7ddexxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[63] = 263'h61bd5b7ddexxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
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
