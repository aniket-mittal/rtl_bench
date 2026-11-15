// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 98;
  localparam OW = 175;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_09757 dut (
    .clk(clk),
    .rstn(in_vec[97:97]),
    .accum_sample_enable(in_vec[96:96]),
    .if_sign(in_vec[95:95]),
    .if_mag(in_vec[94:94]),
    .pre_tic_enable(in_vec[93:93]),
    .tic_enable(in_vec[92:92]),
    .carr_nco_fc(in_vec[91:63]),
    .code_nco_fc(in_vec[62:35]),
    .prn_key(in_vec[34:25]),
    .prn_key_enable(in_vec[24:24]),
    .code_slew(in_vec[23:13]),
    .slew_enable(in_vec[12:12]),
    .epoch_enable(in_vec[11:11]),
    .epoch_load(in_vec[10:0]),
    .dump(out_vec[174:174]),
    .i_early(out_vec[173:158]),
    .q_early(out_vec[157:142]),
    .i_prompt(out_vec[141:126]),
    .q_prompt(out_vec[125:110]),
    .i_late(out_vec[109:94]),
    .q_late(out_vec[93:78]),
    .carrier_val(out_vec[77:46]),
    .code_val(out_vec[45:25]),
    .epoch(out_vec[24:14]),
    .epoch_check(out_vec[13:3]),
    .test_point_01(out_vec[2:2]),
    .test_point_02(out_vec[1:1]),
    .test_point_03(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 98'h1fd3757238ca406e8965d2e64;
    stim[1] = 98'h02d78491953a8e5c10cc5ffe5;
    stim[2] = 98'h2e4df8fc7b24a3da478ca0e2e;
    stim[3] = 98'h390aee721754768278f9c0cd7;
    stim[4] = 98'h30ce03942781d41b0605d000c;
    stim[5] = 98'h36e22c17886d4c940bb865427;
    stim[6] = 98'h3c0f86db31b3fe191027fd9ef;
    stim[7] = 98'h29a9b0fcd0239bb8faebadfb0;
    stim[8] = 98'h26a1fba42da810aa90c85eafe;
    stim[9] = 98'h2269b4d037126971b937948f4;
    stim[10] = 98'h2051b6454f2d9615c17a7ed0e;
    stim[11] = 98'h27b3f2af09f7a5543b5b424a1;
    stim[12] = 98'h3add02fdf541548e2724df736;
    stim[13] = 98'h259e0ca8e53d9735e51445fff;
    stim[14] = 98'h097876807c6c6e2fcd5d8aae7;
    stim[15] = 98'h3606a8dbe454da40b8c43b3b4;
    stim[16] = 98'h38bc8c5d1c2e0080873332218;
    stim[17] = 98'h320646054e3435629e5bb2f38;
    stim[18] = 98'h24aa713ceefc8c7e9a73e2171;
    stim[19] = 98'h3190fb7b7d89620546de488bd;
    stim[20] = 98'h21f0bbc1a23ac1be8cd5d9ac7;
    stim[21] = 98'h26eb7221c10b523c85ec94d34;
    stim[22] = 98'h2fb402d7248d21becff92ca33;
    stim[23] = 98'h217307f447ed15df78561184c;
    stim[24] = 98'h2eeaf5c37f8309333ac59355e;
    stim[25] = 98'h2c7321162efacdd878f0c431a;
    stim[26] = 98'h2ab52963a18773ecf5bc0f0b3;
    stim[27] = 98'h3e5e69d94989b8b09e458dd9d;
    stim[28] = 98'h2f3cfc84c5ea6673493999ee4;
    stim[29] = 98'h35c34f42a94c6a1b265b5fbdb;
    stim[30] = 98'h31e584681669f90be78008635;
    stim[31] = 98'h2b45d92503620a4cd088b1503;
    stim[32] = 98'h3cf5ac3e4c0b770d0f4d3cec0;
    stim[33] = 98'h3993900ce90429d6ac60b8b11;
    stim[34] = 98'h2fd2632675335ceea3eb75118;
    stim[35] = 98'h3e0889c12f6d9de52b6b4aa23;
    stim[36] = 98'h3e88dbe6762642685f494e057;
    stim[37] = 98'h357727bb1f3aa6c1b01317648;
    stim[38] = 98'h23b8679b2ee17f139f06b5f69;
    stim[39] = 98'h2286e75ef0d1c6a5af2071d48;
    stim[40] = 98'h24cd83a241ba43f626d978876;
    stim[41] = 98'h244963776550b3c9a1ec39c85;
    stim[42] = 98'h219854e1a6da79dc3bf386a79;
    stim[43] = 98'h3b97c05b34f2e72690026bc98;
    stim[44] = 98'h37063f8118f9b8fd6b0b5d2ff;
    stim[45] = 98'h3344b1b07df60af506a9961f7;
    stim[46] = 98'h21f6d2fe675035f11a5739630;
    stim[47] = 98'h3e2a51238713ac2ed33f0daee;
    stim[48] = 98'h35250c00a55e4df4203b7727c;
    stim[49] = 98'h2b2277853c6a15e391ce8d677;
    stim[50] = 98'h2810525e995c78d97fd6d9266;
    stim[51] = 98'h38a13b11344537a1b71fa067b;
    stim[52] = 98'h33b5a95ae3aebc4eaeae93a11;
    stim[53] = 98'h31f5b0254bf981906a4fe3cbd;
    stim[54] = 98'h3b5be9ca95edc4cae9879df72;
    stim[55] = 98'h2237a28b7110e92255e359d06;
    stim[56] = 98'h2e7e591882ce1833e53b024f3;
    stim[57] = 98'h2a905b25ce138b234d2067cc0;
    stim[58] = 98'h3594c5c08d712f72adf4e3ccf;
    stim[59] = 98'h200a91d47d5da12b2f831ffc8;
    stim[60] = 98'h32653036c454a8b5ccb1d9c77;
    stim[61] = 98'h3b7cebc10f02e2a2253550484;
    stim[62] = 98'h36255d2f421d4eca6d424fc39;
    stim[63] = 98'h37d22706fecffdee48d0937f4;
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
      expv[0] = 175'hx00x000x000x000x000x000xxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 175'hx00x000x000x000x000x000xxxxxxxxxxxxxxxxxxxxx;
      expv[2] = 175'hx00x000x000x000x000x000xxxxxxxxxxxxxxxxxxxxx;
      expv[3] = 175'hx00x000x000x000x000x000xxxxxxxxxxxxxxxxxxxxx;
      expv[4] = 175'hx00x000x000x000x000x000xxxxxxxxxxxxxxxxxxxxx;
      expv[5] = 175'hx00x000x000x000x000x000xxxxxxxxxxxxxxxxxxxxx;
      expv[6] = 175'hx00x000x000x000x000x000xxxxxxxxxxxxxxxxxxxxx;
      expv[7] = 175'hx00x000x000x000x000x000xxxxxxxxxxxxxxxxxxxxx;
      expv[8] = 175'hx00x000x000x000x000x000xxxxxxxxxxxxxxxxxxxxx;
      expv[9] = 175'hx00x000x000x000x000x000xxxxxxxxxxxxxxxxxxxxx;
      expv[10] = 175'hx00x000x000x000x000x000xxxxxxxxxxxxxxxxxxxxx;
      expv[11] = 175'hx00x000x000x000x000x000xxxxxxxxxxxxxxxxxxxxx;
      expv[12] = 175'hx00x000x000x000x000x000xxxxxxxxxxxxxxxxxxxxx;
      expv[13] = 175'hx00x000x000x000x000x000xxxxxxxxxxxxxxxxxxxxx;
      expv[14] = 175'hx00x000x000x000x000x000xxxxxxxxxxxxxxxxxxxxx;
      expv[15] = 175'hx00x000x000x000x000x000xxxxxxxxxxxxxxxxxxxxx;
      expv[16] = 175'hx00x000x000x000x000x000xxxxxxxxxxxxxxxxxxxxx;
      expv[17] = 175'hx00x000x000x000x000x000xxxxxxxxxxxxxxxxxxxxx;
      expv[18] = 175'hx00x000x000x000x000x000xxxxxxxxxxxxxxxxxxxxx;
      expv[19] = 175'hx00x000x000x000x000x000xxxxxxxxxxxxxxxxxxxxx;
      expv[20] = 175'hx00x000x000x000x000x000xxxxxxxxxxxxxxxxxxxxx;
      expv[21] = 175'hx00x000x000x000x000x000xxxxxxxxxxxxxxxxxxxxx;
      expv[22] = 175'hx00x000x000x000x000x000xxxxxxxxxxxxxxxxxxxxx;
      expv[23] = 175'hx00x000x000x000x000x000xxxxxxxxxxxxxxxxxxxxx;
      expv[24] = 175'hx00x000x000x000x000x000xxxxxxxxxxxxxxxxxxxxx;
      expv[25] = 175'hx00x000x000x000x000x000xxxxxxxxxxxxxxxxxxxxx;
      expv[26] = 175'hx00x000x000x000x000x000xxxxxxxxxxxxxxxxxxxxx;
      expv[27] = 175'hx00x000x000x000x000x000xxxxxxxxxxxxxxxxxxxxx;
      expv[28] = 175'hx00x000x000x000x000x000xxxxxxxxxxxxxxxxxxxxx;
      expv[29] = 175'hx00x000x000x000x000x000xxxxxxxxxxxxxxxxxxxxx;
      expv[30] = 175'hx00x000x000x000x000x000xxxxxxxxxxxxxxxxxxxxx;
      expv[31] = 175'hx00x000x000x000x000x000xxxxxxxxxxxxxxxxxxxxx;
      expv[32] = 175'hx00x000x000x000x000x000xxxxxxxxxxxxxxxxxxxxx;
      expv[33] = 175'hx00x000x000x000x000x000xxxxxxxxxxxxxxxxxxxxx;
      expv[34] = 175'hx00x000x000x000x000x000xxxxxxxxxxxxxxxxxxxxx;
      expv[35] = 175'hx00x000x000x000x000x000xxxxxxxxxxxxxxxxxxxxx;
      expv[36] = 175'hx00x000x000x000x000x000xxxxxxxxxxxxxxxxxxxxx;
      expv[37] = 175'hx00x000x000x000x000x000xxxxxxxxxxxxxxxxxxxxx;
      expv[38] = 175'hx00x000x000x000x000x000xxxxxxxxxxxxxxxxxxxxx;
      expv[39] = 175'hx00x000x000x000x000x000xxxxxxxxxxxxxxxxxxxxx;
      expv[40] = 175'hx00x000x000x000x000x000xxxxxxxxxxxxxxxxxxxxx;
      expv[41] = 175'hx00x000x000x000x000x000xxxxxxxxxxxxxxxxxxxxx;
      expv[42] = 175'hx00x000x000x000x000x000xxxxxxxxxxxxxxxxxxxxx;
      expv[43] = 175'hx00x000x000x000x000x000xxxxxxxxxxxxxxxxxxxxx;
      expv[44] = 175'hx00x000x000x000x000x000xxxxxxxxxxxxxxxxxxxxx;
      expv[45] = 175'hx00x000x000x000x000x000xxxxxxxxxxxxxxxxxxxxx;
      expv[46] = 175'hx00x000x000x000x000x000xxxxxxxxxxxxxxxxxxxxx;
      expv[47] = 175'hx00x000x000x000x000x000xxxxxxxxxxxxxxxxxxxxx;
      expv[48] = 175'hx00x000x000x000x000x000xxxxxxxxxxxxxxxxxxxxx;
      expv[49] = 175'hx00x000x000x000x000x000xxxxxxxxxxxxxxxxxxxxx;
      expv[50] = 175'hx00x000x000x000x000x000xxxxxxxxxxxxxxxxxxxxx;
      expv[51] = 175'hx00x000x000x000x000x000xxxxxxxxxxxxxxxxxxxxx;
      expv[52] = 175'hx00x000x000x000x000x000xxxxxxxxxxxxxxxxxxxxx;
      expv[53] = 175'hx00x000x000x000x000x000xxxxxxxxxxxxxxxxxxxxx;
      expv[54] = 175'hx00x000x000x000x000x000xxxxxxxxxxxxxxxxxxxxx;
      expv[55] = 175'hx00x000x000x000x000x000xxxxxxxxxxxxxxxxxxxxx;
      expv[56] = 175'hx00x000x000x000x000x000xxxxxxxxxxxxxxxxxxxxx;
      expv[57] = 175'hx00x000x000x000x000x000xxxxxxxxxxxxxxxxxxxxx;
      expv[58] = 175'hx00x000x000x000x000x000xxxxxxxxxxxxxxxxxxxxx;
      expv[59] = 175'hx00x000x000x000x000x000xxxxxxxxxxxxxxxxxxxxx;
      expv[60] = 175'hx00x000x000x000x000x000xxxxxxxxxxxxxxxxxxxxx;
      expv[61] = 175'hx00x000x000x000x000x000xxxxxxxxxxxxxxxxxxxxx;
      expv[62] = 175'hx00x000x000x000x000x000xxxxxxxxxxxxxxxxxxxxx;
      expv[63] = 175'hx00x000x000x000x000x000xxxxxxxxxxxxxxxxxxxxx;
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
