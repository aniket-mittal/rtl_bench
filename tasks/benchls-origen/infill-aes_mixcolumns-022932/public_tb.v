// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 129;
  localparam OW = 128;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_022932 dut (
    .i_clock(clk),
    .i_data(in_vec[128:1]),
    .i_active(in_vec[0:0]),
    .o_data(out_vec[127:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 129'h12d86dc74eb9fea647b1eb8a2c8d52293;
    stim[1] = 129'h1aa08f8529be66c11bbb5417fe33c78f0;
    stim[2] = 129'h0b261db76c3e86797e7a3edacfb8dbe92;
    stim[3] = 129'h11f656c35c96f95212e92a638d4618f89;
    stim[4] = 129'h1ba9a11a72e4171d7a696d4151ada95b2;
    stim[5] = 129'h10d2b8fa4b1fabed3f9e6d8cb99a51540;
    stim[6] = 129'h1104370cee84165ed482edbd72e55b490;
    stim[7] = 129'h1532144addbd7290cfb803f41eb1228fa;
    stim[8] = 129'h150e999ba39d9180d6c45f581fb4298f5;
    stim[9] = 129'h0c49473ff7c801bcf35566f79e1acf624;
    stim[10] = 129'h0874b95618abc351bc0bf7170a3d4eba7;
    stim[11] = 129'h06bb9b656576ec310ffb336471a09b598;
    stim[12] = 129'h15d81488b37a650d9ad1bd44ee0174ac9;
    stim[13] = 129'h03f54a62af5da94781fde7322b0acf001;
    stim[14] = 129'h1f8a4282ada00380ccf7fd42547f8b161;
    stim[15] = 129'h16536360d3eddaae39c0c00960288cdd3;
    stim[16] = 129'h0b94a08e47537fa4c9aad1fb7e4a706ef;
    stim[17] = 129'h0ca7b9e81e32e221d31f87fabce2cd486;
    stim[18] = 129'h1e1e02fad259d264776ed91bd02fa1425;
    stim[19] = 129'h0e4755559cdcae602c67451f296dec15e;
    stim[20] = 129'h027123c7994ac2df643688b35a3ea2f7b;
    stim[21] = 129'h1b8583303d4f20f1f11f966c4dc1b821d;
    stim[22] = 129'h0239d5fd52d076bb5747b8e8d1d14d888;
    stim[23] = 129'h192db7b89519523709b4d2fa0be796f5b;
    stim[24] = 129'h08344ce3519bc1b5f628b9406bd04dae5;
    stim[25] = 129'h05f2c09bcbb053fca8f76c969bc591a54;
    stim[26] = 129'h0fb327fa578010efc5ffff9c3f6de33ec;
    stim[27] = 129'h15ce355aec83dd72bed8d91bdda5960db;
    stim[28] = 129'h1fc5d59df1c7f19eef197b00fc996966d;
    stim[29] = 129'h14515cc99372628a0adcdc47712a37a94;
    stim[30] = 129'h0c677f068db5cb2918288d751461c0d0e;
    stim[31] = 129'h157f531b100669fe776f10f48d3fdf4f5;
    stim[32] = 129'h14fd2dc962cff97f2b4b0da911032422f;
    stim[33] = 129'h01a0182c9a96b88fb6aa3941c0b1d80b4;
    stim[34] = 129'h17981f23ad5c95823bfe0a1fdb8035b63;
    stim[35] = 129'h09aeae318e15ec73c7dee51d3d57fd9d7;
    stim[36] = 129'h0b8ae4f714ea727bc9a34b900688b3ff1;
    stim[37] = 129'h0f905b2dc5b55d1d74a3c8f450bcf2f9d;
    stim[38] = 129'h0761cbf8232660233703dcaee4a0effad;
    stim[39] = 129'h1c50b385d09ffe765d3cd4343ff9eba51;
    stim[40] = 129'h11f441263ac0bb63b86d764d4c8f9b5ff;
    stim[41] = 129'h19764b0069f2297535b3eb9b3285dafcb;
    stim[42] = 129'h1fd6954448f588d581224fb07c83c7e70;
    stim[43] = 129'h1b6d5b4879296268cbd5d68984913ad54;
    stim[44] = 129'h07eefe827ae02ccf4068b9b7a294b1351;
    stim[45] = 129'h12f7848f3b6675ce85eeedc59bcafe0b0;
    stim[46] = 129'h0b10013be952f858125ef8840907ec337;
    stim[47] = 129'h1361023b4d3a4269a5b00572dd8798ca0;
    stim[48] = 129'h0769dc8840c13ab172ea98d22e154f45d;
    stim[49] = 129'h05b93b6ea25e46021e8f7728c9ce65804;
    stim[50] = 129'h1f994270b8924d85ae83247483cd76106;
    stim[51] = 129'h024dfa53232240fd71e74042f841e1cb7;
    stim[52] = 129'h1a474796efc5bf66c01106446d20417d8;
    stim[53] = 129'h0287ab992c181cc83d5983946fe2b6f63;
    stim[54] = 129'h031530a949746fb22a85f202852de1e5f;
    stim[55] = 129'h090abffb4402b4aa3f5f90cd7943384c5;
    stim[56] = 129'h19cbd4a248bcf974db23fb2926bc1774c;
    stim[57] = 129'h0526031a18363e8e8131c1d1ec74a173c;
    stim[58] = 129'h12a5f087792ca63cb8da416962ab689c8;
    stim[59] = 129'h0ae3d02264f4e55eb4ec050a0461c0b98;
    stim[60] = 129'h06d5ce5e02ee5445a59a71c6f7dca4d52;
    stim[61] = 129'h083d0ef6e30c64f0950f8ef882b07e58a;
    stim[62] = 129'h0e1e7ae9026eecfa74c1612d883a67891;
    stim[63] = 129'h19f8369a9806de17835bd265e838cec72;
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
      expv[0] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 128'h3d83c77867c61dc1fd8df936ae51ecc5;
      expv[2] = 128'h3d83c77867c61dc1fd8df936ae51ecc5;
      expv[3] = 128'h3d83c77867c61dc1fd8df936ae51ecc5;
      expv[4] = 128'h642b64ba4b447771a1ec5c80879c98da;
      expv[5] = 128'h642b64ba4b447771a1ec5c80879c98da;
      expv[6] = 128'h642b64ba4b447771a1ec5c80879c98da;
      expv[7] = 128'h642b64ba4b447771a1ec5c80879c98da;
      expv[8] = 128'h642b64ba4b447771a1ec5c80879c98da;
      expv[9] = 128'hc6d223fa9d56f9482b2720822f0a4a05;
      expv[10] = 128'hc6d223fa9d56f9482b2720822f0a4a05;
      expv[11] = 128'h08e7a2d1e4da23113a3507b721d23fd1;
      expv[12] = 128'h08e7a2d1e4da23113a3507b721d23fd1;
      expv[13] = 128'hfd87f2070732ac95f6d5fd483cf686f6;
      expv[14] = 128'h9db02cf2ae5947519c103afe327cfec6;
      expv[15] = 128'h1471b973c04f5fa7ec3521d8aa182421;
      expv[16] = 128'hd4b415413356d3e3c68915d941caa9e8;
      expv[17] = 128'h3a7367a1192d2a6434b068a3febd2533;
      expv[18] = 128'h3a7367a1192d2a6434b068a3febd2533;
      expv[19] = 128'h31e44f5bc69804b6e1ca3fcf8677decb;
      expv[20] = 128'h31e44f5bc69804b6e1ca3fcf8677decb;
      expv[21] = 128'h8404e2da98a7a6e85a07aabd17a4d6eb;
      expv[22] = 128'h4f2e5a53cc9e175ec5c7af080422e862;
      expv[23] = 128'h4f2e5a53cc9e175ec5c7af080422e862;
      expv[24] = 128'h470b9203273788d32c68b55de048fa2b;
      expv[25] = 128'h02ad0332d893a2197f7d7e413e8490e9;
      expv[26] = 128'h02ad0332d893a2197f7d7e413e8490e9;
      expv[27] = 128'h02ad0332d893a2197f7d7e413e8490e9;
      expv[28] = 128'ha97ef28794eb1368b0fcc2a868130d6a;
      expv[29] = 128'hd6a2b95e3d88b0cf69811195e882e3db;
      expv[30] = 128'hd6a2b95e3d88b0cf69811195e882e3db;
      expv[31] = 128'hd6a2b95e3d88b0cf69811195e882e3db;
      expv[32] = 128'h182f092ff2c4231ac67d217a4be1f64b;
      expv[33] = 128'h50974fe39f57f4677915004b16ceea95;
      expv[34] = 128'h50974fe39f57f4677915004b16ceea95;
      expv[35] = 128'hdc2ab2dc5e47fed4002a963dbc8354aa;
      expv[36] = 128'hf8b855d0f70ea07bbf5ab954124bb0bb;
      expv[37] = 128'hde2396ffed71b095681d748ac0fc476d;
      expv[38] = 128'hd27de503bcaa6af896f2c8f27a3c1e63;
      expv[39] = 128'hfa07d3857f65032bdbc7eec6ea7cbda0;
      expv[40] = 128'hf962367848dd4be4f867ae3edab5f2d8;
      expv[41] = 128'hc0fa6c437eb75985f8b269536916adef;
      expv[42] = 128'h1b5fccaad402a8427eb5fa86734f3b8f;
      expv[43] = 128'h1b5fccaad402a8427eb5fa86734f3b8f;
      expv[44] = 128'h1b5fccaad402a8427eb5fa86734f3b8f;
      expv[45] = 128'h00c58ee4aa0594f1b9781becfd6d5b5b;
      expv[46] = 128'h00c58ee4aa0594f1b9781becfd6d5b5b;
      expv[47] = 128'hfd87b0c434e21910d91096de2b0e03ab;
      expv[48] = 128'hfd87b0c434e21910d91096de2b0e03ab;
      expv[49] = 128'h02d2606349fb38db9efffc09519f5c1c;
      expv[50] = 128'h02d2606349fb38db9efffc09519f5c1c;
      expv[51] = 128'h02d2606349fb38db9efffc09519f5c1c;
      expv[52] = 128'hde3872a2e8df23f35eea889cdb953cea;
      expv[53] = 128'hde3872a2e8df23f35eea889cdb953cea;
      expv[54] = 128'hfa43d1d43c8bb4043feee0a8c726d75a;
      expv[55] = 128'h1f8f7e908400ba3a5db57c6bc3c92945;
      expv[56] = 128'h4a228ddd8baf97721de3acb904c7ea5a;
      expv[57] = 128'h4a228ddd8baf97721de3acb904c7ea5a;
      expv[58] = 128'h4a228ddd8baf97721de3acb904c7ea5a;
      expv[59] = 128'h4a228ddd8baf97721de3acb904c7ea5a;
      expv[60] = 128'h4a228ddd8baf97721de3acb904c7ea5a;
      expv[61] = 128'h4a228ddd8baf97721de3acb904c7ea5a;
      expv[62] = 128'h4a228ddd8baf97721de3acb904c7ea5a;
      expv[63] = 128'h71a7ee240b87c4982fc70b2b98f032bc;
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
