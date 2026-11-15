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

  rtlpp_01918 dut (
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
    stim[0] = 73'h12b137d47787e5e7a13;
    stim[1] = 73'h0133febaa1ab2152e89;
    stim[2] = 73'h1e3be54f893c655c0e5;
    stim[3] = 73'h0ab46ecbab5b00ab53e;
    stim[4] = 73'h0a34171e7c8c1e7735b;
    stim[5] = 73'h0975ff7f01b892d6fbb;
    stim[6] = 73'h1fad1ce656bff8bee6f;
    stim[7] = 73'h193c212277708bd2d7f;
    stim[8] = 73'h1d10e720c7d80f2ea81;
    stim[9] = 73'h1c7da9b963897e1f229;
    stim[10] = 73'h1e87913d069f8d10652;
    stim[11] = 73'h1ced6728cc310adf94d;
    stim[12] = 73'h19e33d3886bf1b1d3fd;
    stim[13] = 73'h1ba36ce9bf4de659c13;
    stim[14] = 73'h19df4a688ad4c8dbb7f;
    stim[15] = 73'h1a7a62ac1532703771b;
    stim[16] = 73'h0fb6cc67cd00e1ed96d;
    stim[17] = 73'h0edf8979ed35eb6c857;
    stim[18] = 73'h1cc7d494813d96315a1;
    stim[19] = 73'h0dde7be8a3f6628b18a;
    stim[20] = 73'h0ae54a7a7ef94f96f13;
    stim[21] = 73'h0b5c4c65d2aad875882;
    stim[22] = 73'h194fd4a01ca41fe43af;
    stim[23] = 73'h0a7df43beb249f5545c;
    stim[24] = 73'h1b94e8a3b7407d0d222;
    stim[25] = 73'h1f129a7f4fe07c90c86;
    stim[26] = 73'h1b7816a6e1b1746f8fe;
    stim[27] = 73'h1ce938b8e962f5114f6;
    stim[28] = 73'h1979d9a07da2a1cd155;
    stim[29] = 73'h1c576e8e8cf6b5d6165;
    stim[30] = 73'h1ccbc186cf37d2d4f9e;
    stim[31] = 73'h1ff0d2f50078094407f;
    stim[32] = 73'h0e4c814856d18a0c071;
    stim[33] = 73'h1e8e404a2ab1e1b2156;
    stim[34] = 73'h0a574eb5113239ccfa1;
    stim[35] = 73'h1f3948f5d758629c3ac;
    stim[36] = 73'h0eba7caa1a5bbc9ccd5;
    stim[37] = 73'h1ce6f69d94a61860c89;
    stim[38] = 73'h0e5593e5097a1fda45b;
    stim[39] = 73'h0c31e8f185d1daa863e;
    stim[40] = 73'h1d9b3fb15a706ed8b0d;
    stim[41] = 73'h1fada6984147ffa00b4;
    stim[42] = 73'h1ea87b6af336214132b;
    stim[43] = 73'h08a6838dfd37934d1fb;
    stim[44] = 73'h0ee2d0c5590ed8795a0;
    stim[45] = 73'h1be6a23d442bbefb411;
    stim[46] = 73'h1b5a1890f0a6f33f2a7;
    stim[47] = 73'h1bfbda0c3f44b600b59;
    stim[48] = 73'h1b5be7749795fd0a6b4;
    stim[49] = 73'h0a30458064b9481a889;
    stim[50] = 73'h1ed055b22c3a2731486;
    stim[51] = 73'h0dda9b6b36d3089edc5;
    stim[52] = 73'h0c68307c64bd8135d4a;
    stim[53] = 73'h0c8ef16b3044ebf4efc;
    stim[54] = 73'h1e99f6ba8c31a9efb80;
    stim[55] = 73'h0cd0ca8238f51d813ba;
    stim[56] = 73'h1de8f48d3724a515e21;
    stim[57] = 73'h1efff7d22c6249d0d64;
    stim[58] = 73'h1e1b5b50a64202f1c96;
    stim[59] = 73'h09374fd2b394656e12d;
    stim[60] = 73'h0be280c96b37bb548fd;
    stim[61] = 73'h0dc3364e5ec8d149c39;
    stim[62] = 73'h1c0a198ad00e8116db4;
    stim[63] = 73'h0a805c9a50f2b1faa94;
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
      expv[0] = 84'h330000000006000000000;
      expv[1] = 84'h332000000006000000001;
      expv[2] = 84'hd30000000002000000000;
      expv[3] = 84'h130000000002000000001;
      expv[4] = 84'h130000000006000000000;
      expv[5] = 84'h132000000006000000001;
      expv[6] = 84'hd32000000002000000001;
      expv[7] = 84'h132000000002000000001;
      expv[8] = 84'hd32000000002000000000;
      expv[9] = 84'hd32000000006000000000;
      expv[10] = 84'hd32000000006000000001;
      expv[11] = 84'hd32000000002000000000;
      expv[12] = 84'h132000000006000000000;
      expv[13] = 84'h132000000002000000001;
      expv[14] = 84'h132000000002000000000;
      expv[15] = 84'h132000000002000000001;
      expv[16] = 84'hd32000000002000000000;
      expv[17] = 84'hd32000000006000000000;
      expv[18] = 84'hd30000000006000000001;
      expv[19] = 84'hd32000000002000000000;
      expv[20] = 84'h132000000006000000001;
      expv[21] = 84'h132000000002000000000;
      expv[22] = 84'h132000000002000000000;
      expv[23] = 84'h132000000006000000001;
      expv[24] = 84'h132000000002000000000;
      expv[25] = 84'hd32000000006000000001;
      expv[26] = 84'h132000000002000000000;
      expv[27] = 84'hd32000000006000000001;
      expv[28] = 84'h132000000002000000000;
      expv[29] = 84'hd30000000002000000000;
      expv[30] = 84'hd30000000002000000001;
      expv[31] = 84'hd32000000006000000000;
      expv[32] = 84'hd30000000002000000000;
      expv[33] = 84'hd30000000002000000000;
      expv[34] = 84'h132000000006000000001;
      expv[35] = 84'hd32000000006000000000;
      expv[36] = 84'hd32000000002000000001;
      expv[37] = 84'hd30000000006000000001;
      expv[38] = 84'hd32000000002000000001;
      expv[39] = 84'hd32000000006000000001;
      expv[40] = 84'hd32000000006000000000;
      expv[41] = 84'hd30000000006000000000;
      expv[42] = 84'hd32000000002000000000;
      expv[43] = 84'h130000000002000000000;
      expv[44] = 84'hd30000000002000000001;
      expv[45] = 84'h132000000006000000001;
      expv[46] = 84'h130000000006000000000;
      expv[47] = 84'h130000000002000000000;
      expv[48] = 84'h132000000006000000001;
      expv[49] = 84'h130000000002000000000;
      expv[50] = 84'hd32000000006000000001;
      expv[51] = 84'hd32000000002000000001;
      expv[52] = 84'hd32000000006000000001;
      expv[53] = 84'hd32000000002000000001;
      expv[54] = 84'hd32000000006000000000;
      expv[55] = 84'hd30000000002000000000;
      expv[56] = 84'hd30000000002000000001;
      expv[57] = 84'hd30000000006000000001;
      expv[58] = 84'hd30000000006000000001;
      expv[59] = 84'h130000000006000000000;
      expv[60] = 84'h130000000002000000000;
      expv[61] = 84'hd30000000002000000001;
      expv[62] = 84'hd30000000002000000001;
      expv[63] = 84'h130000000006000000000;
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
