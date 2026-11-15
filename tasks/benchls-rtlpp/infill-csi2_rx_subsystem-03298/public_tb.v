// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 73;
  localparam OW = 84;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_03298 dut (
    .lite_aclk(in_vec[72:72]),
    .lite_aresetn(in_vec[71:71]),
    .dphy_clk_200M(in_vec[70:70]),
    .video_aclk(in_vec[69:69]),
    .video_aresetn(in_vec[68:68]),
    .csirxss_s_axi_araddr(in_vec[67:60]),
    .csirxss_s_axi_arvalid(in_vec[59:59]),
    .csirxss_s_axi_awaddr(in_vec[58:51]),
    .csirxss_s_axi_awvalid(in_vec[50:50]),
    .csirxss_s_axi_bready(in_vec[49:49]),
    .csirxss_s_axi_rready(in_vec[48:48]),
    .csirxss_s_axi_wdata(in_vec[47:16]),
    .csirxss_s_axi_wstrb(in_vec[15:12]),
    .csirxss_s_axi_wvalid(in_vec[11:11]),
    .video_out_tready(in_vec[10:10]),
    .mipi_phy_if_clk_n(in_vec[9:9]),
    .mipi_phy_if_clk_p(in_vec[8:8]),
    .mipi_phy_if_data_n(in_vec[7:4]),
    .mipi_phy_if_data_p(in_vec[3:0]),
    .rxbyteclkhs(out_vec[83:83]),
    .clkoutphy_out(out_vec[82:82]),
    .system_rst_out(out_vec[81:81]),
    .pll_lock_out(out_vec[80:80]),
    .csirxss_csi_irq(out_vec[79:79]),
    .frame_rcvd_pulse_out(out_vec[78:78]),
    .csirxss_s_axi_arready(out_vec[77:77]),
    .csirxss_s_axi_awready(out_vec[76:76]),
    .csirxss_s_axi_bresp(out_vec[75:74]),
    .csirxss_s_axi_bvalid(out_vec[73:73]),
    .csirxss_s_axi_rdata(out_vec[72:41]),
    .csirxss_s_axi_rresp(out_vec[40:39]),
    .csirxss_s_axi_rvalid(out_vec[38:38]),
    .csirxss_s_axi_wready(out_vec[37:37]),
    .video_out_tdata(out_vec[36:13]),
    .video_out_tdest(out_vec[12:3]),
    .video_out_tlast(out_vec[2:2]),
    .video_out_tuser(out_vec[1:1]),
    .video_out_tvalid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 73'h15d8aec91420deffe95;
    stim[1] = 73'h00ca3b3c605c440c38b;
    stim[2] = 73'h0cdca3554d987907a17;
    stim[3] = 73'h1b617a78589e4e0d818;
    stim[4] = 73'h0cea7185d3efde46f45;
    stim[5] = 73'h18e7f4c2e95b136f48a;
    stim[6] = 73'h0d6bca401b372533f52;
    stim[7] = 73'h0e0b7f54ce276acfdbf;
    stim[8] = 73'h1fc85d6186ab85bd2e1;
    stim[9] = 73'h0f6cd0407c0d101edba;
    stim[10] = 73'h18917ebe8d861aef5f8;
    stim[11] = 73'h0f89521773f9820d961;
    stim[12] = 73'h1ab478b099b6d9a489e;
    stim[13] = 73'h188c6c46efad4c6b6ed;
    stim[14] = 73'h1b0bae632cd55e36b51;
    stim[15] = 73'h0a950f9bf75cfd48736;
    stim[16] = 73'h0e668e7ab1f87783e20;
    stim[17] = 73'h08af6e4f6493565af5e;
    stim[18] = 73'h0be4ae47ad61de40608;
    stim[19] = 73'h192b4947c820289678b;
    stim[20] = 73'h095e8c6964075e3fc11;
    stim[21] = 73'h090565f210bcfdc8e72;
    stim[22] = 73'h0e3e99e68c7fcac2677;
    stim[23] = 73'h0f67205204ac66c7abc;
    stim[24] = 73'h0e967c5952bbe527358;
    stim[25] = 73'h1ca1ab8a236519defab;
    stim[26] = 73'h195600b095614642dc2;
    stim[27] = 73'h1ba9a9f0a5e904f04c7;
    stim[28] = 73'h0bfbccbf1e1c2a989b9;
    stim[29] = 73'h0e84fa3963c2ac12ca4;
    stim[30] = 73'h11522ee361dc480e472;
    stim[31] = 73'h1beff40b92403e29bab;
    stim[32] = 73'h1eec22a56752463b5cc;
    stim[33] = 73'h0a9717b9c443ce13475;
    stim[34] = 73'h0ac5aad7842cba4b349;
    stim[35] = 73'h0a48d4913ead6ae8c1d;
    stim[36] = 73'h19ed3d5df19038ff9b5;
    stim[37] = 73'h0ebce04ce61e30d046d;
    stim[38] = 73'h18bdf44ec96ce75de8c;
    stim[39] = 73'h0c569048039d35399bd;
    stim[40] = 73'h1e1f2c74e9e6397c4fb;
    stim[41] = 73'h0c05710a487d9a365f9;
    stim[42] = 73'h0ddf8ec045048b4774f;
    stim[43] = 73'h1aba39532b6423294eb;
    stim[44] = 73'h0f8b6a933d014a49471;
    stim[45] = 73'h0b602b6d4f654e57d07;
    stim[46] = 73'h1e8d7d175400e2161a9;
    stim[47] = 73'h0a29719c0295873f478;
    stim[48] = 73'h195ba61967717a1f5ef;
    stim[49] = 73'h0b2b82d6b8189a697a3;
    stim[50] = 73'h198698e6d14e4dbac7c;
    stim[51] = 73'h0cdfd6dd98e8e546f87;
    stim[52] = 73'h1980e70d8a7c06bdd96;
    stim[53] = 73'h0c217b436d9f71c7020;
    stim[54] = 73'h0fc087dbd38e975f4bf;
    stim[55] = 73'h1aa0a2adcf6d8ebe444;
    stim[56] = 73'h097110023a03f8a7688;
    stim[57] = 73'h1a4f9ae20a70d175f5e;
    stim[58] = 73'h1e832ea6d6cd10e6ed7;
    stim[59] = 73'h0ce6107ab076f03ddc5;
    stim[60] = 73'h1adca7e283339b3fa06;
    stim[61] = 73'h1e9d6c3ae8f51c62af9;
    stim[62] = 73'h1bec598057684da0e5d;
    stim[63] = 73'h1af0516c657cbbc8db0;
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
      expv[0] = 84'h200000000000000000000;
      expv[1] = 84'h200000000000000000000;
      expv[2] = 84'h000000000000000000000;
      expv[3] = 84'h000000000000000000000;
      expv[4] = 84'h000000000000000000000;
      expv[5] = 84'h000000000000000000000;
      expv[6] = 84'h000000000000000000000;
      expv[7] = 84'h000000000000000000000;
      expv[8] = 84'h000000000000000000000;
      expv[9] = 84'h000000000000000000000;
      expv[10] = 84'h000000000000000000000;
      expv[11] = 84'h000000000000000000000;
      expv[12] = 84'h000000000000000000000;
      expv[13] = 84'h000000000000000000000;
      expv[14] = 84'h000000000000000000000;
      expv[15] = 84'h000000000000000000000;
      expv[16] = 84'h000000000000000000000;
      expv[17] = 84'h000000000000000000000;
      expv[18] = 84'h000000000000000000000;
      expv[19] = 84'h000000000000000000000;
      expv[20] = 84'h000000000000000000000;
      expv[21] = 84'h000000000000000000000;
      expv[22] = 84'h000000000000000000000;
      expv[23] = 84'h000000000000000000000;
      expv[24] = 84'h000000000000000000000;
      expv[25] = 84'h000000000000000000000;
      expv[26] = 84'h000000000000000000000;
      expv[27] = 84'h000000000000000000000;
      expv[28] = 84'h000000000000000000000;
      expv[29] = 84'h000000000000000000000;
      expv[30] = 84'h200000000000000000000;
      expv[31] = 84'h000000000000000000000;
      expv[32] = 84'h000000000000000000000;
      expv[33] = 84'h000000000000000000000;
      expv[34] = 84'h000000000000000000000;
      expv[35] = 84'h000000000000000000000;
      expv[36] = 84'h000000000000000000000;
      expv[37] = 84'h000000000000000000000;
      expv[38] = 84'h000000000000000000000;
      expv[39] = 84'h000000000000000000000;
      expv[40] = 84'h000000000000000000000;
      expv[41] = 84'h000000000000000000000;
      expv[42] = 84'h000000000000000000000;
      expv[43] = 84'h000000000000000000000;
      expv[44] = 84'h000000000000000000000;
      expv[45] = 84'h000000000000000000000;
      expv[46] = 84'h000000000000000000000;
      expv[47] = 84'h000000000000000000000;
      expv[48] = 84'h000000000000000000000;
      expv[49] = 84'h000000000000000000000;
      expv[50] = 84'h000000000000000000000;
      expv[51] = 84'h000000000000000000000;
      expv[52] = 84'h000000000000000000000;
      expv[53] = 84'h000000000000000000000;
      expv[54] = 84'h000000000000000000000;
      expv[55] = 84'h000000000000000000000;
      expv[56] = 84'h000000000000000000000;
      expv[57] = 84'h000000000000000000000;
      expv[58] = 84'h000000000000000000000;
      expv[59] = 84'h000000000000000000000;
      expv[60] = 84'h000000000000000000000;
      expv[61] = 84'h000000000000000000000;
      expv[62] = 84'h000000000000000000000;
      expv[63] = 84'h000000000000000000000;
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
