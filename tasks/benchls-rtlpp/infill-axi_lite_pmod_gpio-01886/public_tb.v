// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 68;
  localparam OW = 57;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_01886 dut (
    .s_axi_aclk(clk),
    .AXI_LITE_GPIO_araddr(in_vec[67:59]),
    .AXI_LITE_GPIO_arvalid(in_vec[58:58]),
    .AXI_LITE_GPIO_awaddr(in_vec[57:49]),
    .AXI_LITE_GPIO_awvalid(in_vec[48:48]),
    .AXI_LITE_GPIO_bready(in_vec[47:47]),
    .AXI_LITE_GPIO_rready(in_vec[46:46]),
    .AXI_LITE_GPIO_wdata(in_vec[45:14]),
    .AXI_LITE_GPIO_wstrb(in_vec[13:10]),
    .AXI_LITE_GPIO_wvalid(in_vec[9:9]),
    .Pmod_out_pin10_i(in_vec[8:8]),
    .Pmod_out_pin1_i(in_vec[7:7]),
    .Pmod_out_pin2_i(in_vec[6:6]),
    .Pmod_out_pin3_i(in_vec[5:5]),
    .Pmod_out_pin4_i(in_vec[4:4]),
    .Pmod_out_pin7_i(in_vec[3:3]),
    .Pmod_out_pin8_i(in_vec[2:2]),
    .Pmod_out_pin9_i(in_vec[1:1]),
    .s_axi_aresetn(in_vec[0:0]),
    .AXI_LITE_GPIO_arready(out_vec[56:56]),
    .AXI_LITE_GPIO_awready(out_vec[55:55]),
    .AXI_LITE_GPIO_bresp(out_vec[54:53]),
    .AXI_LITE_GPIO_bvalid(out_vec[52:52]),
    .AXI_LITE_GPIO_rdata(out_vec[51:20]),
    .AXI_LITE_GPIO_rresp(out_vec[19:18]),
    .AXI_LITE_GPIO_rvalid(out_vec[17:17]),
    .AXI_LITE_GPIO_wready(out_vec[16:16]),
    .Pmod_out_pin10_o(out_vec[15:15]),
    .Pmod_out_pin10_t(out_vec[14:14]),
    .Pmod_out_pin1_o(out_vec[13:13]),
    .Pmod_out_pin1_t(out_vec[12:12]),
    .Pmod_out_pin2_o(out_vec[11:11]),
    .Pmod_out_pin2_t(out_vec[10:10]),
    .Pmod_out_pin3_o(out_vec[9:9]),
    .Pmod_out_pin3_t(out_vec[8:8]),
    .Pmod_out_pin4_o(out_vec[7:7]),
    .Pmod_out_pin4_t(out_vec[6:6]),
    .Pmod_out_pin7_o(out_vec[5:5]),
    .Pmod_out_pin7_t(out_vec[4:4]),
    .Pmod_out_pin8_o(out_vec[3:3]),
    .Pmod_out_pin8_t(out_vec[2:2]),
    .Pmod_out_pin9_o(out_vec[1:1]),
    .Pmod_out_pin9_t(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 68'hae038606ab8353728;
    stim[1] = 68'hdebac1848b8e1f42e;
    stim[2] = 68'hf56e17fd56596e9f7;
    stim[3] = 68'hcf5b84aa5e6f2fc85;
    stim[4] = 68'hd2a114cf21391d887;
    stim[5] = 68'h3252375445284c453;
    stim[6] = 68'h0146bc6b9b9276103;
    stim[7] = 68'h8f716f0b17e5083a9;
    stim[8] = 68'hc65376be7703927d7;
    stim[9] = 68'ha592d1efd6d14e7fd;
    stim[10] = 68'h5fd70391a729c56ff;
    stim[11] = 68'h3e5cb45a41e0a4625;
    stim[12] = 68'h6cf4d109948bc92c1;
    stim[13] = 68'h6c067ec6e84c940af;
    stim[14] = 68'h8cd79f9e014e4d4a7;
    stim[15] = 68'h694d6c62a37290dd1;
    stim[16] = 68'h261e15bcb8f486325;
    stim[17] = 68'h9b848a88d4cf79f7b;
    stim[18] = 68'h8d75a7c074b2039d9;
    stim[19] = 68'he6955ca1654df8cc5;
    stim[20] = 68'ha623824e6de1b3e17;
    stim[21] = 68'h96e1ac07b69922c8f;
    stim[22] = 68'h15aae72e9462111ad;
    stim[23] = 68'h3d0982d50753e809b;
    stim[24] = 68'h73ccf4eb0b89285ad;
    stim[25] = 68'h2717175f16765901b;
    stim[26] = 68'hfce68e756ec84a76d;
    stim[27] = 68'h818c709cbb656af31;
    stim[28] = 68'he0cd657be53868519;
    stim[29] = 68'hb1fbe69d93b82a4c1;
    stim[30] = 68'hc2a0dc356e86c7157;
    stim[31] = 68'h1a4b66e7488ccdda7;
    stim[32] = 68'hef5c3f77f5c47c755;
    stim[33] = 68'ha85e70e8b8779a0f9;
    stim[34] = 68'hc6a4fc86488280eb8;
    stim[35] = 68'h2f6992a2aac3e9101;
    stim[36] = 68'h8c4d5c168a16d111b;
    stim[37] = 68'he881f094318ee9567;
    stim[38] = 68'h8bd2efa5b18fd3e93;
    stim[39] = 68'h937c9b19a4b29d827;
    stim[40] = 68'hc8e1c3da1e57479e3;
    stim[41] = 68'hfd3804791c439fb3f;
    stim[42] = 68'hc7c1886958b09b4f5;
    stim[43] = 68'h8002b889190b857f7;
    stim[44] = 68'h13a47b6f28eded491;
    stim[45] = 68'h210de57f25fe4645d;
    stim[46] = 68'h75e7351a6df0e54eb;
    stim[47] = 68'h9d449f35a728c1463;
    stim[48] = 68'h5dddfe72116b588af;
    stim[49] = 68'h6f671b4c239b5df0b;
    stim[50] = 68'h13e767071feac7e1d;
    stim[51] = 68'hec0999112830c447b;
    stim[52] = 68'h681ccce7670f5e3fa;
    stim[53] = 68'h332c629d92ad89a37;
    stim[54] = 68'hf1a91d58c8a6afba5;
    stim[55] = 68'h0df1fb7ffc5b62ebd;
    stim[56] = 68'h3e4a50aad0ab2f863;
    stim[57] = 68'h195817f2be5edc457;
    stim[58] = 68'h99c00b085396d0601;
    stim[59] = 68'h156b4fbb0c7d774cf;
    stim[60] = 68'hd33c93786964b0a85;
    stim[61] = 68'h681416eca33b01f63;
    stim[62] = 68'h08e15e823932a99e3;
    stim[63] = 68'hb540f1e25f75cf475;
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
      expv[0] = 57'hxxxxxxxxxxxxxxx;
      expv[1] = 57'h000000000000000;
      expv[2] = 57'h000000000000000;
      expv[3] = 57'h000000000000000;
      expv[4] = 57'h000000000000000;
      expv[5] = 57'h000000000000000;
      expv[6] = 57'h000000000000000;
      expv[7] = 57'h000000000000000;
      expv[8] = 57'h000000000000000;
      expv[9] = 57'h000000000000000;
      expv[10] = 57'h000000000000000;
      expv[11] = 57'h000000000000000;
      expv[12] = 57'h000000000000000;
      expv[13] = 57'h000000000000000;
      expv[14] = 57'h000000000000000;
      expv[15] = 57'h000000000000000;
      expv[16] = 57'h000000000000000;
      expv[17] = 57'h000000000000000;
      expv[18] = 57'h000000000000000;
      expv[19] = 57'h000000000000000;
      expv[20] = 57'h000000000000000;
      expv[21] = 57'h000000000000000;
      expv[22] = 57'h000000000000000;
      expv[23] = 57'h000000000000000;
      expv[24] = 57'h000000000000000;
      expv[25] = 57'h000000000000000;
      expv[26] = 57'h000000000000000;
      expv[27] = 57'h000000000000000;
      expv[28] = 57'h000000000000000;
      expv[29] = 57'h000000000000000;
      expv[30] = 57'h000000000000000;
      expv[31] = 57'h000000000000000;
      expv[32] = 57'h000000000000000;
      expv[33] = 57'h000000000000000;
      expv[34] = 57'h000000000000000;
      expv[35] = 57'h000000000000000;
      expv[36] = 57'h000000000000000;
      expv[37] = 57'h000000000000000;
      expv[38] = 57'h000000000000000;
      expv[39] = 57'h000000000000000;
      expv[40] = 57'h000000000000000;
      expv[41] = 57'h000000000000000;
      expv[42] = 57'h000000000000000;
      expv[43] = 57'h000000000000000;
      expv[44] = 57'h000000000000000;
      expv[45] = 57'h000000000000000;
      expv[46] = 57'h000000000000000;
      expv[47] = 57'h000000000000000;
      expv[48] = 57'h000000000000000;
      expv[49] = 57'h000000000000000;
      expv[50] = 57'h000000000000000;
      expv[51] = 57'h000000000000000;
      expv[52] = 57'h000000000000000;
      expv[53] = 57'h000000000000000;
      expv[54] = 57'h000000000000000;
      expv[55] = 57'h000000000000000;
      expv[56] = 57'h000000000000000;
      expv[57] = 57'h000000000000000;
      expv[58] = 57'h000000000000000;
      expv[59] = 57'h000000000000000;
      expv[60] = 57'h000000000000000;
      expv[61] = 57'h000000000000000;
      expv[62] = 57'h000000000000000;
      expv[63] = 57'h000000000000000;
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
