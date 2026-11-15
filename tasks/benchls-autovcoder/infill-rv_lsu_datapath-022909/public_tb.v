// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 145;
  localparam OW = 100;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_022909 dut (
    .cmd_type_bus(in_vec[144:137]),
    .cmd_op_memory(in_vec[136:129]),
    .exu_pause(in_vec[128:128]),
    .exu_rs1_data(in_vec[127:96]),
    .exu_rs2_data(in_vec[95:64]),
    .exu_imm32(in_vec[63:32]),
    .lsu_load_data(in_vec[31:0]),
    .lsu_store_addr(out_vec[99:68]),
    .lsu_store_en(out_vec[67:67]),
    .lsu_store_data(out_vec[66:35]),
    .lsu_store_size(out_vec[34:33]),
    .lsu_rd_valid(out_vec[32:32]),
    .lsu_rd_data(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 145'h0315a618f7d174cf9fbb05690002e6c69996b;
    stim[1] = 145'h0c6d35f8ee527052e0e2f780bbeab5c240660;
    stim[2] = 145'h0684a135d886d2188764827b5ea5863f45503;
    stim[3] = 145'h156cbe686d8d1d28689984907e3968c9cab07;
    stim[4] = 145'h0d3d8d6a5826d75c38f7f860ef144c805792b;
    stim[5] = 145'h0b5e7e0f19aeb530de97da1f5c7fd6e9f3b91;
    stim[6] = 145'h046f82c79e2fb3aa9e01a37e4dab8e61b3709;
    stim[7] = 145'h1963b59121792da340f1e0fabfda919646058;
    stim[8] = 145'h16a09e6b91c02a6839768559fff1908ea6ec3;
    stim[9] = 145'h1479d9b6a5b7e227c0579d2d8baa3e219e252;
    stim[10] = 145'h133af8513cd794c70fa1f9bc125116874f4aa;
    stim[11] = 145'h0ae4ff3d5ae42aed4c8a1413330c25bbc5c4e;
    stim[12] = 145'h07322b40874f51ee12d52f01ef45ac30612c4;
    stim[13] = 145'h09c68478b02ef736617f1e7df34fa50a9ea7c;
    stim[14] = 145'h1cb5bffef2e2ee66d84d08886403ff70470a9;
    stim[15] = 145'h02cde27b2f4fea41d995efef18c07b6987c74;
    stim[16] = 145'h081afa94676a33e4065c576a8623c1521738d;
    stim[17] = 145'h0e5c415ef4e005a8111049960b4877bcef731;
    stim[18] = 145'h187fc2298da6a029edddba0784bcc685fcf63;
    stim[19] = 145'h0252979171fab3081b4e3d9d3aeb397e75cca;
    stim[20] = 145'h1a9b287b21215a2d083478bc83bc64bcd7e3e;
    stim[21] = 145'h10d4f5d2b8236cc02bf1943d712eb81704217;
    stim[22] = 145'h077e507ceec156f2dbaa17c958868af6254bb;
    stim[23] = 145'h1d7d16f00889499a77bc32ad49f6b2c5e0ceb;
    stim[24] = 145'h1a08cb585720036accf26a3f9bd1b386b257c;
    stim[25] = 145'h045215d72f7a11cac5a7078204c3f7af2233b;
    stim[26] = 145'h0b9057f9c478ef0cc105d484183e672b4d7a1;
    stim[27] = 145'h14c08f8ed1a9f875f22e84abe228b4517a297;
    stim[28] = 145'h02404949b3d66a688937a69205acfd247089f;
    stim[29] = 145'h0a7173d52bce6b0d2c722cf7183b0d333a49e;
    stim[30] = 145'h131d0e89c4ec1d2432a849d78d5206e401d98;
    stim[31] = 145'h0ff76e9c911c5f58de840f44e99a61cbd340a;
    stim[32] = 145'h1ce5e534ec4c9b5ed33b6f00898fd1222cc78;
    stim[33] = 145'h1c22ad01f67b2067966fda525cb9d05a3b32c;
    stim[34] = 145'h103b9ba9fb471a080489d8af53665fd20dc9c;
    stim[35] = 145'h022050dd3fcf4e54bd30b16e0f6bc3e345bf9;
    stim[36] = 145'h110c1f303f81841410245f84514e4715cac8e;
    stim[37] = 145'h0589d40bb0b95af6eab902e702e07c6695710;
    stim[38] = 145'h18fa61cdb4ca2474abfc8b1a46ba07e7f8230;
    stim[39] = 145'h1b2b03c6b10782309e95b27ad37cb32027536;
    stim[40] = 145'h02286eba3529c35b8b813d1050247e81543d7;
    stim[41] = 145'h0e9a98daabb8a3d0a1f931e4d91494bfcd4f6;
    stim[42] = 145'h08f2842fcfdba6614974f24a76fc3b2f9b234;
    stim[43] = 145'h15a49b73203762f350ca2686918ec1ab51541;
    stim[44] = 145'h0d57c38802bb374e9e8c59c69c02ffed231ca;
    stim[45] = 145'h02c15a23a3cdb9bed0cdf004dbee1a7e2292a;
    stim[46] = 145'h0dae7b899e6766898cdc7db25fdd0da4c865a;
    stim[47] = 145'h0b11f8e21b333bc085a111cbbc3309940563f;
    stim[48] = 145'h13a54571a0987660bd5cac7b0958ef25b26be;
    stim[49] = 145'h0aec019a8998936aa19722073a2376ac9aa30;
    stim[50] = 145'h06137d653b13dc432d6705e7ee549d00ce43e;
    stim[51] = 145'h0b1816bd88776e481ea905a31f84b4d693e90;
    stim[52] = 145'h0a438be7bdc09cec3cba67300a2fe90b8fbc1;
    stim[53] = 145'h0dbd0b0360cf4ad243828a07554673a3f37f9;
    stim[54] = 145'h1b5819d483dd34f316f19df5d43a790b73825;
    stim[55] = 145'h0a14a014af9c3c191073cde9d8c37fa921167;
    stim[56] = 145'h1c72510775eb24a609258f355433aa78998d3;
    stim[57] = 145'h14f676a7df03530f9f7e60c596e27912ced94;
    stim[58] = 145'h18fa85b8347fe2c9e7615ccf6f93e281b3de3;
    stim[59] = 145'h052d22b6d3c38caa0c802a796d5b9055e35b4;
    stim[60] = 145'h17fb410a8783434861c96efa8c90c13f42ffd;
    stim[61] = 145'h1f644ccb711093c113f42a8792d2df05cbf70;
    stim[62] = 145'h1b1ba8f8d17bd4e568b24b423ae67f07936fe;
    stim[63] = 145'h1bdb2b9308cd4b2a173b41f648ff519cdf8cb;
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
      expv[0] = 100'hb81f7d4500000000000000000;
      expv[1] = 100'hd79aa3d20000000015c240660;
      expv[2] = 100'h3b1372c5b4e43f24000000000;
      expv[3] = 100'h2f8ebc67000000001ffffab07;
      expv[4] = 100'h5cb473b100000000000000000;
      expv[5] = 100'h82e762e8000000001ffffff91;
      expv[6] = 100'h645ebdb3000000001e61b3709;
      expv[7] = 100'h68be153b00000000100006058;
      expv[8] = 100'h3c591b1b34343434000000000;
      expv[9] = 100'h6e431621000000001ffffe252;
      expv[10] = 100'h20d4f28a00000000000000000;
      expv[11] = 100'h3508df0477faf4d095bbc5c4e;
      expv[12] = 100'ha427694f00000000000000000;
      expv[13] = 100'h2f6a37e9f8f8f8f8950a9ea7c;
      expv[14] = 100'h88756e6d7b7eea68000000000;
      expv[15] = 100'h26a48105ffafefaf1b6987c74;
      expv[16] = 100'h1feed8df00000000000000000;
      expv[17] = 100'haf500287000000001fffff731;
      expv[18] = 100'hc3112636000000001ffffcf63;
      expv[19] = 100'h52eace5e000000001ffffffca;
      expv[20] = 100'h137a4ddbd16841a3c00000000;
      expv[21] = 100'ha10295217f8ddf8c981704217;
      expv[22] = 100'h8464747d000000001ffffffbb;
      expv[23] = 100'h99d527ff000000001ffffffeb;
      expv[24] = 100'h597f2f1b00000000000000000;
      expv[25] = 100'hd59343e00000000010000003b;
      expv[26] = 100'hc7ddcb74082e882ea00000000;
      expv[27] = 100'h43ab3d2af4747474000000000;
      expv[28] = 100'hfdbb983500000000000000000;
      expv[29] = 100'h0cc44096000000001ffffff9e;
      expv[30] = 100'h861523e100000000000000000;
      expv[31] = 100'hde17ab6bfee6f42031cbd340a;
      expv[32] = 100'h43575dc6dbffdbdb11222cc78;
      expv[33] = 100'h7545334f00000000000000000;
      expv[34] = 100'h4594ead600000000000000000;
      expv[35] = 100'h24b4f3b000000000000000000;
      expv[36] = 100'heb490cfc00000000000000000;
      expv[37] = 100'h6f2b399c5dc85dc8000000000;
      expv[38] = 100'hce7fb842ffe55fe43ffff8230;
      expv[39] = 100'h6418484300000000000000000;
      expv[40] = 100'hbca854e300000000000000000;
      expv[41] = 100'habf84cd349c9c9c9800000000;
      expv[42] = 100'h67a46d7da7a7a7a7900000034;
      expv[43] = 100'h1f9b1c6251515151000000000;
      expv[44] = 100'hd4e9ebe2000000001ffffffca;
      expv[45] = 100'ha287fbbc066f866fb0000292a;
      expv[46] = 100'h93bfe44676efe6e3a00000000;
      expv[47] = 100'haadd766300000000000000000;
      expv[48] = 100'h1eca9f15eae56ae5200000000;
      expv[49] = 100'h3a1c3bc0000000001ffffaa30;
      expv[50] = 100'h34d2968600000000000000000;
      expv[51] = 100'hc60a7fc100000000000000000;
      expv[52] = 100'h317c7f070000000010000fbc1;
      expv[53] = 100'h50ab615b00000000000000000;
      expv[54] = 100'h7ca5817a00000000100003825;
      expv[55] = 100'hdfe885fa00000000000000000;
      expv[56] = 100'h03cca1ec000000001ffffffd3;
      expv[57] = 100'h76d75e5c7bfffbf33ffffff94;
      expv[58] = 100'h287a413c8a8a8a8a9ffffffe3;
      expv[59] = 100'hd30411f100000000000000000;
      expv[60] = 100'h005141408e4b0e4b3fffffffd;
      expv[61] = 100'h75303e36000000001f05cbf70;
      expv[62] = 100'h43b0c62400000000000000000;
      expv[63] = 100'hd8951cc9d950b9da5ffffffcb;
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
