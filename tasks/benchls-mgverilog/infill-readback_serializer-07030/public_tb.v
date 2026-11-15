// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 108;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_07030 dut (
    .clk(clk),
    .rst(in_vec[107:107]),
    .tx_en(in_vec[106:106]),
    .tx_data_loaded(in_vec[105:105]),
    .rb0(in_vec[104:98]),
    .rb1(in_vec[97:91]),
    .rb2(in_vec[90:84]),
    .rb3(in_vec[83:77]),
    .rb4(in_vec[76:70]),
    .rb5(in_vec[69:63]),
    .rb6(in_vec[62:56]),
    .rb7(in_vec[55:49]),
    .rb8(in_vec[48:42]),
    .rb9(in_vec[41:35]),
    .rb10(in_vec[34:28]),
    .rb11(in_vec[27:21]),
    .rb12(in_vec[20:14]),
    .rb13(in_vec[13:7]),
    .rb14(in_vec[6:0]),
    .tx_data_ready(out_vec[8:8]),
    .tx_data(out_vec[7:1]),
    .tx_complete(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 108'hf85455fab9f8d9ef616107c182f;
    stim[1] = 108'h81acf23f8f7baa267e791baa609;
    stim[2] = 108'h0753e9bec67822c0afd449a7587;
    stim[3] = 108'h5dd52bec560e966658db01521d0;
    stim[4] = 108'h67c8b5dc19f6ce227d30423d26e;
    stim[5] = 108'h3eedae0458985bac3b5327430b3;
    stim[6] = 108'h6fb2d53b229dc846ee25b273be6;
    stim[7] = 108'h501c59c93e2b482a8d42a01ed08;
    stim[8] = 108'h17716d6cfafd08cd2f483f09825;
    stim[9] = 108'h2135f97350799a98c60185942e9;
    stim[10] = 108'h98d5cc645c18db8d44417063ec2;
    stim[11] = 108'h00f74a3a86693a0c0f35d50da45;
    stim[12] = 108'h77d11adeb97f6cb817bab973e51;
    stim[13] = 108'h7f67f5fbe99003b0a1d76cb6480;
    stim[14] = 108'h13d075979af8c4db817f2a17eba;
    stim[15] = 108'h73699dd96a3ccd8e13260413424;
    stim[16] = 108'h7bbf6acb7518193751184e91d45;
    stim[17] = 108'h4f8282fc1e847f62f8342e2bc23;
    stim[18] = 108'h73976d75113780b358aa8d6ea69;
    stim[19] = 108'h5c1cd903e458c765de857e97f50;
    stim[20] = 108'h214f157ca11df5b8b4523df6ce7;
    stim[21] = 108'h4b868b2f10e45e6e89068d62cae;
    stim[22] = 108'h0c833204ec74ad78bffc09d0fe0;
    stim[23] = 108'h456fe514c9a755efe04775229d9;
    stim[24] = 108'h391306d6d51c9932ac1fb80b565;
    stim[25] = 108'h03516a18559c110bb3d505a2156;
    stim[26] = 108'h49a2764b9f5b2f3f9100de1a65b;
    stim[27] = 108'h069c6a2cd219d3e3f0267fb5849;
    stim[28] = 108'h03de9b6aecc4550a5dc66604835;
    stim[29] = 108'h5da0b2cae8d63d0cf9634f5ce4d;
    stim[30] = 108'h022eac3165d86c99254a0c03389;
    stim[31] = 108'h3da4742d2f9b3f0431abfad2ef1;
    stim[32] = 108'h038eb7e5a8820d72781b8d0405f;
    stim[33] = 108'h13a2e649acd1eb9734fb9749c0b;
    stim[34] = 108'h5a6925edfa20234a6817a33be4c;
    stim[35] = 108'h561a3235185042f080a006227e7;
    stim[36] = 108'h656199e8e20883611f72d0483ea;
    stim[37] = 108'h1e49bcc4c39b3e148b4d23f1120;
    stim[38] = 108'h440207fd0368be2a2b396494549;
    stim[39] = 108'h10c230d224048f33469537b7b15;
    stim[40] = 108'h6b74601db5959ae040af912b9ed;
    stim[41] = 108'h4d88e026dcb06d406aaaac43178;
    stim[42] = 108'h484e3e7d54d987ec5dc2de25f2d;
    stim[43] = 108'h5f85cc0857715ebf0124a0a1ffb;
    stim[44] = 108'h4783256e19022d0f0c161a812b1;
    stim[45] = 108'h6a38dfb370e1e61a8c44bb04f34;
    stim[46] = 108'h6e3694bcec0a0be4e4d9f4a0ef9;
    stim[47] = 108'h2d25a083b9b60fe65719f3d90c0;
    stim[48] = 108'h7d3f113e7b09788aaadaa6f9f2d;
    stim[49] = 108'h242d7d97d95adf0029c17bbf70f;
    stim[50] = 108'h0c930ad870b4cc10966b469d7bc;
    stim[51] = 108'h46fea6399c7f88a07c3871c1873;
    stim[52] = 108'h1d42e1587f8c61836efbb62d183;
    stim[53] = 108'h26d77ae587043fb700b7065249f;
    stim[54] = 108'h58daa33b095ffba4debbdc6c314;
    stim[55] = 108'h1a40b00640c963c373e49403e89;
    stim[56] = 108'haa49de7be66a766e4a3897b603d;
    stim[57] = 108'h65ba9ddd694ed07a5b778910718;
    stim[58] = 108'h2748e1a2a9ffa198ad07540bdff;
    stim[59] = 108'h48550443bb04ef78c5729bea439;
    stim[60] = 108'h00e5183dada6d7898f8f61e45cd;
    stim[61] = 108'h220e63e1350fb3b885dcc86f6f6;
    stim[62] = 108'h774f36868627913e0ad07bfd474;
    stim[63] = 108'h73361b5c387499e3319ad6f28ea;
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
      expv[0] = 9'hxxx;
      expv[1] = 9'h000;
      expv[2] = 9'h000;
      expv[3] = 9'h000;
      expv[4] = 9'h13a;
      expv[5] = 9'h1ee;
      expv[6] = 9'h13e;
      expv[7] = 9'h0b6;
      expv[8] = 9'h0ca;
      expv[9] = 9'h070;
      expv[10] = 9'h0c4;
      expv[11] = 9'h000;
      expv[12] = 9'h000;
      expv[13] = 9'h106;
      expv[14] = 9'h1be;
      expv[15] = 9'h1fa;
      expv[16] = 9'h040;
      expv[17] = 9'h1a6;
      expv[18] = 9'h0d4;
      expv[19] = 9'h004;
      expv[20] = 9'h1da;
      expv[21] = 9'h1b2;
      expv[22] = 9'h12a;
      expv[23] = 9'h116;
      expv[24] = 9'h164;
      expv[25] = 9'h1ca;
      expv[26] = 9'h10c;
      expv[27] = 9'h018;
      expv[28] = 9'h04a;
      expv[29] = 9'h02c;
      expv[30] = 9'h16a;
      expv[31] = 9'h1ca;
      expv[32] = 9'h130;
      expv[33] = 9'h12c;
      expv[34] = 9'h1e4;
      expv[35] = 9'h148;
      expv[36] = 9'h1ec;
      expv[37] = 9'h134;
      expv[38] = 9'h1e8;
      expv[39] = 9'h060;
      expv[40] = 9'h080;
      expv[41] = 9'h112;
      expv[42] = 9'h1da;
      expv[43] = 9'h02c;
      expv[44] = 9'h136;
      expv[45] = 9'h1dc;
      expv[46] = 9'h140;
      expv[47] = 9'h138;
      expv[48] = 9'h102;
      expv[49] = 9'h0c0;
      expv[50] = 9'h02e;
      expv[51] = 9'h05a;
      expv[52] = 9'h098;
      expv[53] = 9'h0f0;
      expv[54] = 9'h08c;
      expv[55] = 9'h186;
      expv[56] = 9'h1fe;
      expv[57] = 9'h000;
      expv[58] = 9'h100;
      expv[59] = 9'h12c;
      expv[60] = 9'h022;
      expv[61] = 9'h054;
      expv[62] = 9'h094;
      expv[63] = 9'h138;
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
