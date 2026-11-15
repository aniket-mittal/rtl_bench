// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 116;
  localparam OW = 72;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_020748 dut (
    .mem_w0(in_vec[115:87]),
    .mem_w1(in_vec[86:58]),
    .mem_w2(in_vec[57:29]),
    .mem_w3(in_vec[28:0]),
    .out0(out_vec[71:54]),
    .out1(out_vec[53:36]),
    .out2(out_vec[35:18]),
    .out3(out_vec[17:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 116'h9c3a6393d8b6d9c1e527512595597;
    stim[1] = 116'h64fe774400cc89ce0d88c76c6b536;
    stim[2] = 116'h177d60f4d59baa3f6180f1c54ecc1;
    stim[3] = 116'hd0ab73dd5dd687e6aedcb791ceee4;
    stim[4] = 116'h4634cd09ff06472fdd707fa697d8f;
    stim[5] = 116'h7c35dfbfa2e348f48430deafd55cc;
    stim[6] = 116'h5d959d1da1edb5bc19a6a1690c95b;
    stim[7] = 116'h32311be6cd161d035fe913047d869;
    stim[8] = 116'hbb1cf3948fd7f31a3be78d890c8b1;
    stim[9] = 116'h78062f297eaa06037e5d63d05fc00;
    stim[10] = 116'h586a60246c9be11176394a1d82901;
    stim[11] = 116'h23679a1cea9fecd9190dc64ad6efd;
    stim[12] = 116'hc6437f553253adece07b94db63c32;
    stim[13] = 116'h05a3fa4fe5ba690dba8555d6513ee;
    stim[14] = 116'h05d4c122b334ae1e6cc88107dd294;
    stim[15] = 116'h797f32bcd09b8f572cc16dd8c8e8c;
    stim[16] = 116'hb296254786eaf4d59d8b6745fa94e;
    stim[17] = 116'h82f54ee24aa7bf65002d309ac32c3;
    stim[18] = 116'h62d81266254a86c37f38d0facd4bf;
    stim[19] = 116'hc745e8160af138520def2f032eb08;
    stim[20] = 116'h005a600ceaf03c37cedd0d8a8c020;
    stim[21] = 116'hc23e305093d1d2083fb336d632720;
    stim[22] = 116'hb7d29ccabfab783bf1cbd42fb5ac6;
    stim[23] = 116'h1c70c990607c8b71561efbe0d3c29;
    stim[24] = 116'h4b3a9d63e1b5cfbcdb50e6ddf6aa5;
    stim[25] = 116'hd6fcd2b89c664e53b90e3dd7afc61;
    stim[26] = 116'h7f0d6fcfe4b45ac683db372a1900a;
    stim[27] = 116'ha4464a21dd179ba8f273263f885d6;
    stim[28] = 116'hf13a5765fe905af21bafbadb108d0;
    stim[29] = 116'h75550b295ab1a41491c599883a0c0;
    stim[30] = 116'h0f64527cfa6e6a0e64520a1e429f3;
    stim[31] = 116'h79e94b63b311e5b0495aa306d241c;
    stim[32] = 116'h699abf2b33fe4812d4845a18b517c;
    stim[33] = 116'h64cc11c4f8191880e10694eec1ad7;
    stim[34] = 116'hc0ce16bcdfa2205085a5189bbdcee;
    stim[35] = 116'hb2ff7d53e0b6f42ec880434d1d460;
    stim[36] = 116'h7f4c57da36f8a792c65d3f1524227;
    stim[37] = 116'hd37ae040badbc0123630911e8a538;
    stim[38] = 116'h8ea5f688bf702c0b66fa4f19f55ba;
    stim[39] = 116'h3d73b4b1aa7f8c05b2d3378de576f;
    stim[40] = 116'h713e6314f2e3cd979ee35693fa46f;
    stim[41] = 116'hdc4d7aa28d60932ec822929317197;
    stim[42] = 116'h2ae8d49a531e12f9c3060e84f69c4;
    stim[43] = 116'h801008df4e3c7bd6b45b7ec80fbb6;
    stim[44] = 116'h1fd1154f971869cd2ec314db5e9fb;
    stim[45] = 116'h109652c4c3d9e567999c7c7851b48;
    stim[46] = 116'hba3501aa20ec9fceacde3fd4d1fd3;
    stim[47] = 116'h65a26ec5370e3fa225fe3989f0610;
    stim[48] = 116'h8537444ea40335ddd38a4f32c6d77;
    stim[49] = 116'h26258e4097fc1a2ead4e19b86387a;
    stim[50] = 116'h05190613db9ff819c3b63812fdf04;
    stim[51] = 116'hb100a98487b4f2a96bf1fb5031ba9;
    stim[52] = 116'h295f0550cb35179e4c12f564544c3;
    stim[53] = 116'hd0b3a435ff4079d34db49f55e46c4;
    stim[54] = 116'h469ced31243edd5560c25fa1b8338;
    stim[55] = 116'hbba8c8528a084e27f56bd1935b57d;
    stim[56] = 116'hfc24bc67336d36b3063bf55468a1f;
    stim[57] = 116'h09932f92f7a8b5110c557215fa6ce;
    stim[58] = 116'h5022fc90b767ba55eb77229d07076;
    stim[59] = 116'ha382c9481dcadc0cd383f69347295;
    stim[60] = 116'hd217c007b437a9eaec3abc4a58733;
    stim[61] = 116'hee9545cce92b4358d16802218e9bf;
    stim[62] = 116'h1a066cc6f84e92e2130e4337a96cd;
    stim[63] = 116'h45bc2ac3b96006ea8ab2812b04d71;
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
      expv[0] = 72'hc3a6cc5e7794a0b297;
      expv[1] = 72'h4ffa006270378d8d36;
      expv[2] = 72'h77c78aca8d863ca9c1;
      expv[3] = 72'h8ab98ee9f2bb6c39e4;
      expv[4] = 72'h63485f81c774fed285;
      expv[5] = 72'h435dd1723a10e9facc;
      expv[6] = 72'h5948d0f56866d32198;
      expv[7] = 72'h231f268bb57e268fb0;
      expv[8] = 72'hb1d0e7ec10ef1b2199;
      expv[9] = 72'h00795f5185f8c40b80;
      expv[10] = 72'h06a1164845d895b001;
      expv[11] = 72'h3670f54824658d5afd;
      expv[12] = 72'he439f92a1b80056c32;
      expv[13] = 72'h5a3252da46eaaaca34;
      expv[14] = 72'h5d49199b81b300fb94;
      expv[15] = 72'h17f5c84bd4b2d9190c;
      expv[16] = 72'ha963c3753676ccbf4e;
      expv[17] = 72'haf54c557d400615843;
      expv[18] = 72'h2d9312a1b5fda159bf;
      expv[19] = 72'h7440a57910365c6588;
      expv[20] = 72'h05a07578473a1b5188;
      expv[21] = 72'h23e289ec80fe6cc620;
      expv[22] = 72'h7d265fd60fc761f6c6;
      expv[23] = 72'h470c903add589a1a06;
      expv[24] = 72'h33ab10dbeb6d79bea5;
      expv[25] = 72'hefcf8e3396e47af585;
      expv[26] = 72'h70de725b120e6d430a;
      expv[27] = 72'hc4658e8ee3c84df156;
      expv[28] = 72'h93a8ff48986ee16250;
      expv[29] = 72'h55594d590247310740;
      expv[30] = 72'h7653dd32819015c873;
      expv[31] = 72'h1e9b1989612544da1c;
      expv[32] = 72'h19b959fa0352b516fc;
      expv[33] = 72'h4cce3c0cb38529d857;
      expv[34] = 72'h8ce34fd012163177ee;
      expv[35] = 72'h2fea905d0b221fa3ac;
      expv[36] = 72'h74dedb79e3187ea485;
      expv[37] = 72'h37a21d6800d921d138;
      expv[38] = 72'h6a545fbb059a9f3eac;
      expv[39] = 72'h5725953b06ca6fbcb6;
      expv[40] = 72'h13f8b972167aac7f6f;
      expv[41] = 72'h44d506b4cb20a46297;
      expv[42] = 72'h2e84c98cb70c1c9ec4;
      expv[43] = 72'h8100871ef2d0fd01b6;
      expv[44] = 72'h7d0a4b8a74ba296bfb;
      expv[45] = 72'h097601e95e667d0a48;
      expv[46] = 72'h234d5077f2b27e9a4c;
      expv[47] = 72'h5a363b875096713e10;
      expv[48] = 72'h53627202374e9e58dd;
      expv[49] = 72'h62520bfe82b4310c7a;
      expv[50] = 72'h51908dce070e705f84;
      expv[51] = 72'h100c23da9dafd40629;
      expv[52] = 72'h15ea859de131ea8a8f;
      expv[53] = 72'h0b21bfa0a5373ebc92;
      expv[54] = 72'h69c9921f5582be3710;
      expv[55] = 72'h3a82850387d5a26b73;
      expv[56] = 72'h424319b5ac19128d19;
      expv[57] = 72'h193c9bd54430e4bf4e;
      expv[58] = 72'h02249bb697ac45a0f6;
      expv[59] = 72'h382a4ee7034fec6895;
      expv[60] = 72'h21601a1a7bb0fd4b33;
      expv[61] = 72'h694e5490d3440431bf;
      expv[62] = 72'h20661c24b84c3ef530;
      expv[63] = 72'h5bd61cb1ba2adf609c;
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
