// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 104;
  localparam OW = 96;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_160550 dut (
    .clk(clk),
    .rst_n(in_vec[103:103]),
    .hwlp_start_data_i(in_vec[102:71]),
    .hwlp_end_data_i(in_vec[70:39]),
    .hwlp_cnt_data_i(in_vec[38:7]),
    .hwlp_we_i(in_vec[6:4]),
    .hwlp_regid_i(in_vec[3:3]),
    .valid_i(in_vec[2:2]),
    .hwlp_dec_cnt_i(in_vec[1:0]),
    .hwlp_start_addr_o(out_vec[95:64]),
    .hwlp_end_addr_o(out_vec[63:32]),
    .hwlp_counter_o(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 104'h08fb78f3bd5438c32a0c9069f3;
    stim[1] = 104'h1f0b724840efdbcbeee5e6b4d6;
    stim[2] = 104'hd90fd7bdd877192f7179079a3d;
    stim[3] = 104'hfeb3d882498dff8c6fd81ec403;
    stim[4] = 104'hac543726cee169e818fe66ea3d;
    stim[5] = 104'hd7f3ab7cf7ff519acca7f795e4;
    stim[6] = 104'hfc67bb3c21c0440b07e4d8b944;
    stim[7] = 104'h9c1d73937b147dfcb3e7069bf5;
    stim[8] = 104'h8bb67050563b30a6f3ec98f632;
    stim[9] = 104'hebd8e0c0cbb07887222a831b52;
    stim[10] = 104'h9b995a4adbb877ae3a1a779d7f;
    stim[11] = 104'h87d8acdb96815a12d10066928d;
    stim[12] = 104'hb0f352807ee222203f47a2bef7;
    stim[13] = 104'hab11944497dd72a3219b99f2fb;
    stim[14] = 104'hb0006af78abfb1e8e0a9f42e64;
    stim[15] = 104'hcac443bf6706928a469ed466c9;
    stim[16] = 104'ha31a809c30e3bcd8d3a5bf9961;
    stim[17] = 104'hdeff22bcabd5d76cbc1cad8ed2;
    stim[18] = 104'ha4cd4275d314878c9c4305b0d9;
    stim[19] = 104'hca8a0c169be73cf8aac4ff1fd8;
    stim[20] = 104'hce1269b7634c3f69fe95ec1bb8;
    stim[21] = 104'hb29bf49999a94858a57c220737;
    stim[22] = 104'h9c3be982ca6c1b8a85bf856683;
    stim[23] = 104'he5aa1502bca3c897b8f785e637;
    stim[24] = 104'hc9c2c4a0a1c468b8a759eca793;
    stim[25] = 104'hf89608aa92ba634fa43f19d4a3;
    stim[26] = 104'hf79d67af404fa5276a5c9cfe62;
    stim[27] = 104'h96e4a793c15a92e391e37849f3;
    stim[28] = 104'hc7636d79e36545e17119740461;
    stim[29] = 104'haff88326ba2ff000af20411af5;
    stim[30] = 104'hfb8364fa6d076e343b9a649e6e;
    stim[31] = 104'h80c4361871090dd2213e4445f5;
    stim[32] = 104'hc7e9991d7e3ed1e972f1082c1f;
    stim[33] = 104'hd3139d13499478e578f26e39ad;
    stim[34] = 104'h8bc6d7cf9358a5a6afb37d8bb5;
    stim[35] = 104'ha1648716d453f860dc52374502;
    stim[36] = 104'haa7257c7d321e7f394e4d267d1;
    stim[37] = 104'ha87c6fa3b20309aa74f1b83572;
    stim[38] = 104'he9d0442c291c450387d1b9b513;
    stim[39] = 104'hbc83edaa68e4901416326fcddb;
    stim[40] = 104'h8c148c089372b98b830dd197ca;
    stim[41] = 104'hc07373a82061ac1153890350ab;
    stim[42] = 104'h7bbc24d7332630a6f10a48ea4c;
    stim[43] = 104'hf5993962f58bb2edfe7aa7a9c7;
    stim[44] = 104'hb2340451cb8dd957fbcdf7711f;
    stim[45] = 104'h96da1be81bfaef9907b7b88f28;
    stim[46] = 104'hbbce3b9cb64adfc8ce54128e75;
    stim[47] = 104'h8b9fbd2c2c7c4420194f8126cb;
    stim[48] = 104'hf2b4046e2e58042f177157339c;
    stim[49] = 104'h9c800e118fd2a6d6f17f7b874c;
    stim[50] = 104'hc1b827b11b5e1bb5735831ed1c;
    stim[51] = 104'h98c284f903857e3af95b427bc2;
    stim[52] = 104'hcc4fc013a215748139283cb5bd;
    stim[53] = 104'h81fc24b4a5a7e57a6c2d2e540e;
    stim[54] = 104'hb4351e012c85b8bb428432be25;
    stim[55] = 104'hddd01c493821b5c92376ac3d59;
    stim[56] = 104'h82d94f7d0f49873851e864ee67;
    stim[57] = 104'hda673791c072a9dac9e7386c50;
    stim[58] = 104'hc21d58a1498c2921c64dec602c;
    stim[59] = 104'hec9090edc5f0887540184f74ec;
    stim[60] = 104'hb825f3e58032780e707ca9c3f1;
    stim[61] = 104'he8780d6101bb1f83a129f687c9;
    stim[62] = 104'hdd9b48217af8ef28302502c2c6;
    stim[63] = 104'hf5f512dc5603c8ac42abad81e7;
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
      expv[0] = 96'h000000000000000000000000;
      expv[1] = 96'h000000000000000000000000;
      expv[2] = 96'h000000000000000000000000;
      expv[3] = 96'h0000000000000000ffffffff;
      expv[4] = 96'hb21faf7bb0ee325e00000000;
      expv[5] = 96'h0000000000000000fffffffe;
      expv[6] = 96'h00000000effea335994fef2b;
      expv[7] = 96'h00000000effea3350fc9b172;
      expv[8] = 96'h383ae726f628fbf90fc9b171;
      expv[9] = 96'h176ce0a0ac76614d0fc9b171;
      expv[10] = 96'h58a86e4d9dc2d3d000000000;
      expv[11] = 96'h3732b495b770ef5cffffffff;
      expv[12] = 96'hd7b1c181ac76614d44550634;
      expv[13] = 96'h3732b495b770ef5cfffffffe;
      expv[14] = 96'h61e6a500fdc4444044550633;
      expv[15] = 96'h562328892fbae546433733e5;
      expv[16] = 96'h61e6a500157f63d1c153e85c;
      expv[17] = 96'h61e6a50061c779b1a74b7f32;
      expv[18] = 96'h562328892fbae5468d3da8cd;
      expv[19] = 96'h499a84eb2fbae54638860b61;
      expv[20] = 96'h9514182d2fbae5465589fe3f;
      expv[21] = 96'hbdfe457961c779b178395b1d;
      expv[22] = 96'h6537e933335290b178395b1c;
      expv[23] = 96'h6537e933335290b178395b1c;
      expv[24] = 96'hcb542a057947912f78395b1b;
      expv[25] = 96'h938589417947912f78395b1b;
      expv[26] = 96'h938589412574c69f78395b1b;
      expv[27] = 96'h93858941809f4a4ed4b939fc;
      expv[28] = 96'h2dc94f2782b525c723c6f093;
      expv[29] = 96'h2dc94f27c6ca8bc2e232e808;
      expv[30] = 96'h9c24d36ec6987ed35589fe3d;
      expv[31] = 96'h5ff1064d745fe001e232e807;
      expv[32] = 96'h9c24d36eda0edc685589fe3c;
      expv[33] = 96'h8fd3323ada0edc685589fe3b;
      expv[34] = 96'h01886c30e2121ba4e232e804;
      expv[35] = 96'h178daf9f26b14b4de232e803;
      expv[36] = 96'h178daf9f26b14b4de232e803;
      expv[37] = 96'h54e4af8f26b14b4d29c9a4cf;
      expv[38] = 96'h50f8df4764061354e9e3706a;
      expv[39] = 96'h8fd3323a9328f1ca5589fe3b;
      expv[40] = 96'h7907db549328f1ca2c64df9b;
      expv[41] = 96'h7907db549328f1ca061ba32f;
      expv[42] = 96'h000000000000000000000000;
      expv[43] = 96'h000000000000000000000000;
      expv[44] = 96'h0000000000000000ffffffff;
      expv[45] = 96'h646808a300000000fffffffe;
      expv[46] = 96'h0000000000000000fffffffe;
      expv[47] = 96'h646808a337f5df32fffffffe;
      expv[48] = 96'h646808a337f5df32329f024d;
      expv[49] = 96'he56808dc37f5df32329f024d;
      expv[50] = 96'he56808dc37f5df32e2fef70e;
      expv[51] = 96'h779c77396c95bf91fffffffd;
      expv[52] = 96'h83704f6237f5df32e2fef70e;
      expv[53] = 96'h989f8027442ae902e2fef70e;
      expv[54] = 96'h779c77396c95bf91f2b684f6;
      expv[55] = 96'h989f8027442ae902e2fef70d;
      expv[56] = 96'h779c7739590b7176f2b684f5;
      expv[57] = 96'h779c77391e930e70f2b684f4;
      expv[58] = 96'hbba03892442ae90246ed5879;
      expv[59] = 96'hbba038929318524346ed5879;
      expv[60] = 96'hb4ce6f231e930e7093ce70d8;
      expv[61] = 96'hbba038928be110ea80309ee9;
      expv[62] = 96'h704be7cb0064f01ce0f95387;
      expv[63] = 96'h704be7cb0064f01c604a0585;
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
