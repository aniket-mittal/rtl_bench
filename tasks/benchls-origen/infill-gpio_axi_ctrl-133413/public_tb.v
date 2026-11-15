// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 37;
  localparam OW = 20;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_133413 dut (
    .s_axi_aclk(clk),
    .s_axi_aresetn(in_vec[36:36]),
    .is_read(in_vec[35:35]),
    .is_write_reg(in_vec[34:34]),
    .start2(in_vec[33:33]),
    .ip2bus_rdack_i_D1(in_vec[32:32]),
    .ip2bus_wrack_i_D1(in_vec[31:31]),
    .gpio2_io_t(in_vec[30:27]),
    .Dual_gpio2_Data_In_reg(in_vec[26:23]),
    .bus2ip_addr_i_reg(in_vec[22:20]),
    .bus2ip_rnw_i_reg(in_vec[19:19]),
    .rst_reg(in_vec[18:18]),
    .GPIO2_DBus_i(in_vec[17:14]),
    .GPIO_DBus_i(in_vec[13:10]),
    .gpio_io_t(in_vec[9:6]),
    .Dual_gpio_Data_In_reg(in_vec[5:2]),
    .gpio_xferAck_Reg(in_vec[1:1]),
    .GPIO_xferAck_i(in_vec[0:0]),
    .MEM_DECODE_GEN_0_cs_out_i_reg_0(out_vec[19:19]),
    .s_axi_arready(out_vec[18:18]),
    .s_axi_wready(out_vec[17:17]),
    .Read_Reg2_In(out_vec[16:13]),
    .E(out_vec[12:12]),
    .Dual_gpio2_Data_Out_reg(out_vec[11:11]),
    .D(out_vec[10:7]),
    .Read_Reg_In(out_vec[6:3]),
    .Dual_gpio_OE_reg(out_vec[2:2]),
    .Dual_gpio_Data_Out_reg(out_vec[1:1]),
    .Read_Reg_Rst(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 37'h110d2c10b2;
    stim[1] = 37'h04f39d0c87;
    stim[2] = 37'h195fab8d4f;
    stim[3] = 37'h0198f6c7fb;
    stim[4] = 37'h0e678aee26;
    stim[5] = 37'h1367d175bd;
    stim[6] = 37'h0b8501e34f;
    stim[7] = 37'h1024499f7a;
    stim[8] = 37'h0bb90ab9ac;
    stim[9] = 37'h0fb2727983;
    stim[10] = 37'h120d415ef5;
    stim[11] = 37'h037b22a78c;
    stim[12] = 37'h0aae2b2fa1;
    stim[13] = 37'h1a3753f512;
    stim[14] = 37'h0f11e40123;
    stim[15] = 37'h083ba87aea;
    stim[16] = 37'h10aa0aa0c6;
    stim[17] = 37'h0a0bf9edae;
    stim[18] = 37'h0680128203;
    stim[19] = 37'h06c8131c2a;
    stim[20] = 37'h0d6b4bb232;
    stim[21] = 37'h0ac0c8b7c5;
    stim[22] = 37'h0ce47a01bd;
    stim[23] = 37'h0458138c0e;
    stim[24] = 37'h06cb6a15ec;
    stim[25] = 37'h092271928c;
    stim[26] = 37'h14699abeab;
    stim[27] = 37'h060ebab428;
    stim[28] = 37'h0624295cbd;
    stim[29] = 37'h1ec1da65b5;
    stim[30] = 37'h186883f5e6;
    stim[31] = 37'h15ed72408c;
    stim[32] = 37'h048c02a75d;
    stim[33] = 37'h022b313643;
    stim[34] = 37'h076093da16;
    stim[35] = 37'h1697822305;
    stim[36] = 37'h0b2768bcb6;
    stim[37] = 37'h16edc1fb2e;
    stim[38] = 37'h15f958dd7d;
    stim[39] = 37'h11080aba54;
    stim[40] = 37'h1cfbab9e2d;
    stim[41] = 37'h0e7cfb9658;
    stim[42] = 37'h1cdf03256f;
    stim[43] = 37'h1952b9bb47;
    stim[44] = 37'h1e1b70786e;
    stim[45] = 37'h1811689e67;
    stim[46] = 37'h02a71b2cab;
    stim[47] = 37'h00b1b9c5c8;
    stim[48] = 37'h1404917917;
    stim[49] = 37'h007763953f;
    stim[50] = 37'h19dd08d021;
    stim[51] = 37'h16507891b2;
    stim[52] = 37'h15c31b3bb3;
    stim[53] = 37'h0f077b6e4a;
    stim[54] = 37'h0b6dc9ba96;
    stim[55] = 37'h0b322b5a62;
    stim[56] = 37'h16feab6927;
    stim[57] = 37'h1fc20013a8;
    stim[58] = 37'h13b9eb698b;
    stim[59] = 37'h193de9aeb1;
    stim[60] = 37'h0371fad755;
    stim[61] = 37'h075bb9909a;
    stim[62] = 37'h10687b25f0;
    stim[63] = 37'h1bb5fa3c0d;
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
      expv[0] = 20'h00000;
      expv[1] = 20'h00000;
      expv[2] = 20'h00000;
      expv[3] = 20'h00000;
      expv[4] = 20'h00000;
      expv[5] = 20'h00000;
      expv[6] = 20'h00000;
      expv[7] = 20'h00000;
      expv[8] = 20'h00000;
      expv[9] = 20'h00000;
      expv[10] = 20'h00000;
      expv[11] = 20'h00000;
      expv[12] = 20'h00000;
      expv[13] = 20'h00000;
      expv[14] = 20'h00000;
      expv[15] = 20'h00000;
      expv[16] = 20'h00000;
      expv[17] = 20'h00000;
      expv[18] = 20'h00000;
      expv[19] = 20'h00000;
      expv[20] = 20'h00000;
      expv[21] = 20'h00000;
      expv[22] = 20'h00000;
      expv[23] = 20'h00000;
      expv[24] = 20'h00000;
      expv[25] = 20'h00000;
      expv[26] = 20'h00000;
      expv[27] = 20'h00000;
      expv[28] = 20'h00000;
      expv[29] = 20'h00000;
      expv[30] = 20'h80000;
      expv[31] = 20'hc0048;
      expv[32] = 20'h00000;
      expv[33] = 20'h00000;
      expv[34] = 20'h00000;
      expv[35] = 20'h00000;
      expv[36] = 20'h00000;
      expv[37] = 20'h00000;
      expv[38] = 20'h80000;
      expv[39] = 20'ha0000;
      expv[40] = 20'h00000;
      expv[41] = 20'h00000;
      expv[42] = 20'h00000;
      expv[43] = 20'h00000;
      expv[44] = 20'h00000;
      expv[45] = 20'h80000;
      expv[46] = 20'h00000;
      expv[47] = 20'h00000;
      expv[48] = 20'h00000;
      expv[49] = 20'h00000;
      expv[50] = 20'h00000;
      expv[51] = 20'h00000;
      expv[52] = 20'h80000;
      expv[53] = 20'h00000;
      expv[54] = 20'h00000;
      expv[55] = 20'h00000;
      expv[56] = 20'h00000;
      expv[57] = 20'h80000;
      expv[58] = 20'ha0002;
      expv[59] = 20'h00000;
      expv[60] = 20'h00000;
      expv[61] = 20'h00000;
      expv[62] = 20'h00000;
      expv[63] = 20'h00000;
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
