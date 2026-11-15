// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 113;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_063918 dut (
    .rst_n(in_vec[112:112]),
    .input_addr(in_vec[111:107]),
    .input_expro_addr(in_vec[106:102]),
    .input_mempro_addr(in_vec[101:97]),
    .input_data(in_vec[96:65]),
    .input_expro_data(in_vec[64:33]),
    .input_mempro_data(in_vec[32:1]),
    .input_control(in_vec[0:0]),
    .output_data(out_vec[32:1]),
    .output_stop(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 113'h05e2309a26907b66105a1913201c8;
    stim[1] = 113'h0b991b13275ff373c878a27dab4e8;
    stim[2] = 113'h16346bdc33e7305d0cf824fa469ad;
    stim[3] = 113'h199cf2b8607e6f8a25524cd86c7bb;
    stim[4] = 113'h14f4f97d15bbb5a933f247b3f32ef;
    stim[5] = 113'h136a05dd25ce415ee1395968089b2;
    stim[6] = 113'h02e6fb0bdcf99f87578bb8a5cbe88;
    stim[7] = 113'h19d7856a234dfdb8d8084285720bb;
    stim[8] = 113'h12dbfd11acc6ce46d42b371ad2d5f;
    stim[9] = 113'h19f483a5e5fe674aeffaf1b54d018;
    stim[10] = 113'h1ea87ed8e6abc5be9e4a14dc99dc8;
    stim[11] = 113'h1f7838f31c1f8e5ec61465b19f0e5;
    stim[12] = 113'h16355ff56fd9e8ac0fc2bda7e3899;
    stim[13] = 113'h1da5d5fcd41cfca586384c2d0679c;
    stim[14] = 113'h1bac755eda66e0533b1b4dbfd6a55;
    stim[15] = 113'h1847fe9746aceb2a0457c70fa1ecd;
    stim[16] = 113'h1cb8d13563adb1f7553310fed9c61;
    stim[17] = 113'h1722a95851369affa54e7bf8908cd;
    stim[18] = 113'h1b355cd49f83096db94d759020c9a;
    stim[19] = 113'h17c46718cc0a596411baa59e36980;
    stim[20] = 113'h1fbe4ee338111de6ed6f2d5a56e22;
    stim[21] = 113'h1d36dbe901c509b6a42ea177d6db8;
    stim[22] = 113'h16c1bd8bb8d928ddb2c8743bf510d;
    stim[23] = 113'h18464a6d4168832fa306b05e01588;
    stim[24] = 113'h11857d70d313e8670572e9a89161c;
    stim[25] = 113'h112a4fbde15200ff10e9b53f43189;
    stim[26] = 113'h15296742b41c4af723d9f263ff6e9;
    stim[27] = 113'h1b71869a1a1444b632c62b5be5e0f;
    stim[28] = 113'h1d3870d5e59bf78fa06d05365d6cd;
    stim[29] = 113'h1215704495d6bedb10342fb5d381e;
    stim[30] = 113'h14e5cf6e35196e0901d93297ad81b;
    stim[31] = 113'h148b1bf9bd12fd6f94782736c7eef;
    stim[32] = 113'h1bd7c7c3e0bc2ae780f7a9081e499;
    stim[33] = 113'h1d26ac009b5914a98c961e067a029;
    stim[34] = 113'h1fdfa5197d7f50b1ad4b88463daa7;
    stim[35] = 113'h1218e5aa8db486c2a51308f103ede;
    stim[36] = 113'h14ebf8ed25c9cc66bb0512232010c;
    stim[37] = 113'h199650cdd7e43d08a5bb5fe2d93fd;
    stim[38] = 113'h166839fb715f79fc9c550b3890229;
    stim[39] = 113'h11a3015bc1df1c95c25845fc9106b;
    stim[40] = 113'h1c224f1f0cea6e2d22aa33efdb238;
    stim[41] = 113'h1b6c7a9521ffe06df16a070bec323;
    stim[42] = 113'h1e13ffc4e225a490da9e886e91818;
    stim[43] = 113'h164dbfd95be1390d9af20f9a091c8;
    stim[44] = 113'h1bed7bd3fa0dd5bd108f452cc5342;
    stim[45] = 113'h162acc0d5f9f6bba6a638c2558da2;
    stim[46] = 113'h158df54cb3dc2927f1f0aa7e6b3e5;
    stim[47] = 113'h159cbd7faab7ff053485928a363a7;
    stim[48] = 113'h1e7a073a2b6d9f06c50987bfb5315;
    stim[49] = 113'h1ca39f30eac87d6e243362075441f;
    stim[50] = 113'h15652874e68050784afe2c28885fd;
    stim[51] = 113'h1c5a70d84d7ceb66a86a1f76195c9;
    stim[52] = 113'h1727e961ec0843063000bdf9d6314;
    stim[53] = 113'h17bc16ebd1f838665e076159ef027;
    stim[54] = 113'h1073a7536da9497ade9322cb98eb0;
    stim[55] = 113'h1d1f6315b1b08f5c7f97db1d53e08;
    stim[56] = 113'h1958d06cdaf2e776c8bcf0e9b668e;
    stim[57] = 113'h19c5acc5cdcb2d9c750b155d8ff59;
    stim[58] = 113'h144b7f97ec37db0305448211e9fd6;
    stim[59] = 113'h117d5478235985d246f50e1e5be46;
    stim[60] = 113'h124caf6c79aa03b2c33ec16b0b5f5;
    stim[61] = 113'h19f796a52f36dcaf8bc1c24ec77fe;
    stim[62] = 113'h14b573344584f7f241b77515d53cf;
    stim[63] = 113'h1dd5d396176979ff0609fd5ebe483;
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
      expv[0] = 33'h000000000;
      expv[1] = 33'h000000000;
      expv[2] = 33'h0bdc33e72;
      expv[3] = 33'h12b8607e6;
      expv[4] = 33'h197d15bba;
      expv[5] = 33'h05dd25ce4;
      expv[6] = 33'h000000000;
      expv[7] = 33'h056a234de;
      expv[8] = 33'h1d11acc6c;
      expv[9] = 33'h03a5e5fe6;
      expv[10] = 33'h1ed8e6abc;
      expv[11] = 33'h0e5ec6146;
      expv[12] = 33'h1ff56fd9e;
      expv[13] = 33'h15fcd41ce;
      expv[14] = 33'h155eda66e;
      expv[15] = 33'h1e9746ace;
      expv[16] = 33'h113563ada;
      expv[17] = 33'h095851368;
      expv[18] = 33'h1cd49f830;
      expv[19] = 33'h0718cc0a4;
      expv[20] = 33'h0ee338110;
      expv[21] = 33'h1be901c50;
      expv[22] = 33'h143bf510c;
      expv[23] = 33'h0a6d41688;
      expv[24] = 33'h1d70d313e;
      expv[25] = 33'h0fbde1520;
      expv[26] = 33'h0af723d9e;
      expv[27] = 33'h069a1a144;
      expv[28] = 33'h10d5e59be;
      expv[29] = 33'h104495d6a;
      expv[30] = 33'h0f6e35196;
      expv[31] = 33'h1bf9bd12e;
      expv[32] = 33'h07c3e0bc2;
      expv[33] = 33'h0c009b590;
      expv[34] = 33'h05197d7f4;
      expv[35] = 33'h05aa8db48;
      expv[36] = 33'h18ed25c9c;
      expv[37] = 33'h10cdd7e42;
      expv[38] = 33'h19fb715f6;
      expv[39] = 33'h015bc1df0;
      expv[40] = 33'h0f1f0cea6;
      expv[41] = 33'h1a9521ffe;
      expv[42] = 33'h1fc4e225a;
      expv[43] = 33'h1fd95be12;
      expv[44] = 33'h1bd3fa0dc;
      expv[45] = 33'h0c0d5f9f6;
      expv[46] = 33'h154cb3dc2;
      expv[47] = 33'h1d7faab7e;
      expv[48] = 33'h073a2b6d8;
      expv[49] = 33'h1f30eac86;
      expv[50] = 33'h0874e6804;
      expv[51] = 33'h10d84d7ce;
      expv[52] = 33'h0961ec084;
      expv[53] = 33'h18665e076;
      expv[54] = 33'h000000000;
      expv[55] = 33'h0315b1b08;
      expv[56] = 33'h106cdaf2e;
      expv[57] = 33'h0cc5cdcb2;
      expv[58] = 33'h1f97ec37c;
      expv[59] = 33'h147823598;
      expv[60] = 33'h0f6c79aa0;
      expv[61] = 33'h16a52f36c;
      expv[62] = 33'h13344584e;
      expv[63] = 33'h139617696;
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
