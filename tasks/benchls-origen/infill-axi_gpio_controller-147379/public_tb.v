// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 76;
  localparam OW = 73;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_147379 dut (
    .s_axi_aclk(clk),
    .s_axi_aresetn(in_vec[75:75]),
    .s_axi_awaddr(in_vec[74:66]),
    .s_axi_awvalid(in_vec[65:65]),
    .s_axi_wdata(in_vec[64:33]),
    .s_axi_wstrb(in_vec[32:29]),
    .s_axi_wvalid(in_vec[28:28]),
    .s_axi_bready(in_vec[27:27]),
    .s_axi_araddr(in_vec[26:18]),
    .s_axi_arvalid(in_vec[17:17]),
    .s_axi_rready(in_vec[16:16]),
    .gpio_io_i(in_vec[15:12]),
    .gpio2_io_i(in_vec[11:0]),
    .s_axi_awready(out_vec[72:72]),
    .s_axi_wready(out_vec[71:71]),
    .s_axi_bresp(out_vec[70:69]),
    .s_axi_bvalid(out_vec[68:68]),
    .s_axi_arready(out_vec[67:67]),
    .s_axi_rdata(out_vec[66:35]),
    .s_axi_rresp(out_vec[34:33]),
    .s_axi_rvalid(out_vec[32:32]),
    .gpio_io_o(out_vec[31:28]),
    .gpio_io_t(out_vec[27:24]),
    .gpio2_io_o(out_vec[23:12]),
    .gpio2_io_t(out_vec[11:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 76'h3b1a0670d1b4a8c7345;
    stim[1] = 76'h558355a43ba368a3367;
    stim[2] = 76'hfb485135a87a2bd4ba7;
    stim[3] = 76'h8850c92301a445d8e50;
    stim[4] = 76'h8babb69290919f1c10b;
    stim[5] = 76'hdb2da60fe9db5c005fd;
    stim[6] = 76'hff0265825717488f864;
    stim[7] = 76'haefb8599cacb55e2801;
    stim[8] = 76'h9f0a6ca9d79504c0813;
    stim[9] = 76'hfb1118d37fca1c8c309;
    stim[10] = 76'hf4043578c5c4612bae3;
    stim[11] = 76'hcf55bbfa7b2610c91cd;
    stim[12] = 76'hc96a9d3e873c385a386;
    stim[13] = 76'h92624b501527b21b1aa;
    stim[14] = 76'hfcf93a8181f1023846b;
    stim[15] = 76'ha9827e6b17abb708887;
    stim[16] = 76'h9c595b737dad1837023;
    stim[17] = 76'haa6c60cf90e59c27a7d;
    stim[18] = 76'hbeda33c6390138ed985;
    stim[19] = 76'heb5b95a525c3f10e41f;
    stim[20] = 76'h9b595fe1ef7defefe85;
    stim[21] = 76'hfe2c3ce0f4b6fa732cf;
    stim[22] = 76'hf0887ef5034e85a8da6;
    stim[23] = 76'ha0d5dee4d380fce4a0b;
    stim[24] = 76'he775d35a7c84de68cdc;
    stim[25] = 76'h853e5fa1aedb9bcae26;
    stim[26] = 76'hba2b34d0eaa905c4cd5;
    stim[27] = 76'hebdf5319ccfcadba162;
    stim[28] = 76'hbc95865a6fcff7c821c;
    stim[29] = 76'hd25f89de5e42d2b3b39;
    stim[30] = 76'h81902013fadcf2b5915;
    stim[31] = 76'hd899ff72e632b2f1202;
    stim[32] = 76'h97d9b48040c3778cd58;
    stim[33] = 76'h1e43d06d2d324ceaa03;
    stim[34] = 76'hc894db31d6b488acf7a;
    stim[35] = 76'h9c102940e8fc0591566;
    stim[36] = 76'hb672f1ce520e5be7df4;
    stim[37] = 76'haa314f5fa0891b26f24;
    stim[38] = 76'h89de7b5ccbbfa9a33e0;
    stim[39] = 76'h9a7d311885443a1d0b4;
    stim[40] = 76'hb6768326b3352be4038;
    stim[41] = 76'hce64dbb5cc8bc0d88d2;
    stim[42] = 76'h9745ca7b8fb953a5663;
    stim[43] = 76'h8a7f679a9655ee48782;
    stim[44] = 76'h9344077eff9fcf509c3;
    stim[45] = 76'hff437eca3e0e6e62e65;
    stim[46] = 76'hc8b7af9727128812032;
    stim[47] = 76'h8c5e897130aaf945b4c;
    stim[48] = 76'h9996133165ad1003946;
    stim[49] = 76'hc3426f909474c5fc06c;
    stim[50] = 76'hd56922e076c9dd25e9e;
    stim[51] = 76'hb51a9f0826314dccdad;
    stim[52] = 76'hdd5549b5b7b16cb931a;
    stim[53] = 76'hc6c952e373a5095960d;
    stim[54] = 76'hdf2a59c28570665454a;
    stim[55] = 76'h96a3da4229ca6aec36d;
    stim[56] = 76'ha2be34389eb6630c942;
    stim[57] = 76'he662017f3b822ded1e9;
    stim[58] = 76'ha7158c9dec336f21a01;
    stim[59] = 76'hfd40d3e588dc2c85d7c;
    stim[60] = 76'h8ec64dec25e58790291;
    stim[61] = 76'hbd16bb8eb0aa11f46b6;
    stim[62] = 76'hfa1d4f308f2805a2911;
    stim[63] = 76'he04a61b335e08a64e8a;
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
      expv[0] = 73'h00000000000xxxxxxxx;
      expv[1] = 73'h00000000000xxxxxxxx;
      expv[2] = 73'h000000000007x345xxx;
      expv[3] = 73'h000000000003x367xxx;
      expv[4] = 73'h000000000004xba7xxx;
      expv[5] = 73'h190000000008xe50xxx;
      expv[6] = 73'h19000000000cx10bxxx;
      expv[7] = 73'h190000000000x5fdxxx;
      expv[8] = 73'h19800000001fx864xxx;
      expv[9] = 73'h198000000012x801xxx;
      expv[10] = 73'h198000000010x813xxx;
      expv[11] = 73'h19800000001cx309xxx;
      expv[12] = 73'h19800000001bxae3xxx;
      expv[13] = 73'h190000000009x1cdxxx;
      expv[14] = 73'h00000000000ax386xxx;
      expv[15] = 73'h19800000001bx1aaxxx;
      expv[16] = 73'h008000000018x46bxxx;
      expv[17] = 73'h000000000008x887xxx;
      expv[18] = 73'h198000000017x023xxx;
      expv[19] = 73'h198000000017xa7dxxx;
      expv[20] = 73'h00800000001dx985xxx;
      expv[21] = 73'h00800000001ex41fxxx;
      expv[22] = 73'h00000000000fxe85xxx;
      expv[23] = 73'h008000000013x2cfxxx;
      expv[24] = 73'h008000000018xda6xxx;
      expv[25] = 73'h008000000014xa0bxxx;
      expv[26] = 73'h198000000018xcdcxxx;
      expv[27] = 73'h19800000001axe26xxx;
      expv[28] = 73'h000000000004xcd5xxx;
      expv[29] = 73'h00000000000ax162xxx;
      expv[30] = 73'h008000000018x21cxxx;
      expv[31] = 73'h000000000003xb39xxx;
      expv[32] = 73'h008000000015x915xxx;
      expv[33] = 73'h000000000001x202xxx;
      expv[34] = 73'h00000000000cxd58xxx;
      expv[35] = 73'h00800005019axa03xxx;
      expv[36] = 73'h00000005018cxf7axxx;
      expv[37] = 73'h008000000011x566xxx;
      expv[38] = 73'h198000000017xdf4xxx;
      expv[39] = 73'h008000000016xf24xxx;
      expv[40] = 73'h000000000003x3e0xxx;
      expv[41] = 73'h19800000001dx0b4xxx;
      expv[42] = 73'h000000000004x038xxx;
      expv[43] = 73'h008000000018x8d2xxx;
      expv[44] = 73'h198000000015x663xxx;
      expv[45] = 73'h000000000008x782xxx;
      expv[46] = 73'h008000000010x9c3xxx;
      expv[47] = 73'h000000000002xe65xxx;
      expv[48] = 73'h000000000002x032xxx;
      expv[49] = 73'h000000000005xb4cxxx;
      expv[50] = 73'h008000000013x946xxx;
      expv[51] = 73'h19800000001cx06cxxx;
      expv[52] = 73'h198000000015xe9exxx;
      expv[53] = 73'h19000000000cxdadxxx;
      expv[54] = 73'h190000000009x31axxx;
      expv[55] = 73'h190000000009x60dxxx;
      expv[56] = 73'h198000000014x54axxx;
      expv[57] = 73'h19800000001cx36dxxx;
      expv[58] = 73'h19800000001cx942xxx;
      expv[59] = 73'h19800000001dx1e9xxx;
      expv[60] = 73'h198000000011xa01xxx;
      expv[61] = 73'h000000000005xd7cxxx;
      expv[62] = 73'h008000000010x291xxx;
      expv[63] = 73'h008000000014x6b6xxx;
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
