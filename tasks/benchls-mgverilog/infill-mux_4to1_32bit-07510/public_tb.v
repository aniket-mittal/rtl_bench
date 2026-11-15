// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 130;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_07510 dut (
    .Sel(in_vec[129:128]),
    .S0(in_vec[127:96]),
    .S1(in_vec[95:64]),
    .S2(in_vec[63:32]),
    .S3(in_vec[31:0]),
    .out(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 130'h161f61a3f080be4548b0a4886f0b80877;
    stim[1] = 130'h3f6dad7e5828ddd4faca241aab03af976;
    stim[2] = 130'h1fdae31d1fe4d7d9cc600653c1641cf78;
    stim[3] = 130'h269a8d780c64d4288e26f21ed3c428fda;
    stim[4] = 130'h23585720c0682f5185e0ff389aad667c8;
    stim[5] = 130'h3bdad0551e3b4143eed10ccccb1f2ccbe;
    stim[6] = 130'h399a9008700be11a84a86c92e0f2d48f6;
    stim[7] = 130'h3be8b240ed4e603bdb53d204e7300a51d;
    stim[8] = 130'h3feef5ab76423ac8092819e4d06b6be11;
    stim[9] = 130'h3456eb875692d3b7205f8858ad7923995;
    stim[10] = 130'h1a59644a1235ec1e2c189fd4033cf2120;
    stim[11] = 130'h0e9a3a5b79d14f9673f98eaba6e7f5467;
    stim[12] = 130'h3a060c0e7e643cd2d44067a4efa02258e;
    stim[13] = 130'h3d0755dd0389388907947ae0beada47b6;
    stim[14] = 130'h2b973648b3709cac779acfddca3c3e2c7;
    stim[15] = 130'h063da2d47a6daa7bb8701adcbd76a6dd7;
    stim[16] = 130'h1a60f4e99974c3ac2d0122b8671f6bb98;
    stim[17] = 130'h2e85d70fd7854d9c1aecf1f47849dbc8a;
    stim[18] = 130'h1b760834f31c27a28c391bc463653569a;
    stim[19] = 130'h361c022065c4a10d40b71d063e1c8bcba;
    stim[20] = 130'h3b8dd9ea9a267e8655bea34ea7a2154d5;
    stim[21] = 130'h3e46903934cf5175e08339dc4a2f7f33c;
    stim[22] = 130'h23ce89677f87ff7252015fd9341c4be9c;
    stim[23] = 130'h3d3656ec3868c3b61d0761f8606717d48;
    stim[24] = 130'h33bc10964a32cc49d46bcb33391c2f59b;
    stim[25] = 130'h31524d60e1fbb8c2ee546390f56549c53;
    stim[26] = 130'h120ec829445ee251b1728f4ed3cc91474;
    stim[27] = 130'h129ba45372f6119d5c61e1a1db090f54c;
    stim[28] = 130'h0308fc1d109c18167ffdd663a49f347d5;
    stim[29] = 130'h2e685e2c97b3122d19f12f25d5d77bca4;
    stim[30] = 130'h279ede1911c9a4c476dc26057b1c6d5d4;
    stim[31] = 130'h29d57a7e64b5b62461277af550d65ff41;
    stim[32] = 130'h06338b7941191c17b130a52326b51e3a8;
    stim[33] = 130'h2fc6428300188264add3530fd03be2929;
    stim[34] = 130'h34f0dd3ab0e7f1af1453bef244cdba882;
    stim[35] = 130'h24e26bde9c173e7bf052966cbde8f7fcb;
    stim[36] = 130'h2f1b304ec1968c9b843e1328e32446a83;
    stim[37] = 130'h361521685f6752d6cade9fee8ced6a58f;
    stim[38] = 130'h1434d284ab8b6e33dfe82e9278e2e6614;
    stim[39] = 130'h001c7a573349cf5953e43ca979c24e593;
    stim[40] = 130'h20843d9705ba8c8b5dbebcbb36912dcf3;
    stim[41] = 130'h2203aaf804b096dce90459479c98f7081;
    stim[42] = 130'h057bfbfd271bc4c1c9f04b5285ad79406;
    stim[43] = 130'h1b6f68de4def3393f6e3a465794a2f245;
    stim[44] = 130'h1fe9df09f9dfa7ce7ebad803b48bf4b1d;
    stim[45] = 130'h3946b425167ee45825561efe1c9d1df19;
    stim[46] = 130'h395d99a6613cea642806a83a36d152387;
    stim[47] = 130'h3aa16a80817017c3df7dce12703455e14;
    stim[48] = 130'h2012a453f63d34b316c114d3770fd52ff;
    stim[49] = 130'h354798b0ef186b03354be6e2c8e164573;
    stim[50] = 130'h315b4ed95c243ac011f3fb2117bc29ccb;
    stim[51] = 130'h0819c248657a72b352b2b1f290703f83d;
    stim[52] = 130'h0b704c865fbc7d65f6e26e851db35410c;
    stim[53] = 130'h1f4d649312a92929f77a3691eb038b2af;
    stim[54] = 130'h297b87a1afa06a92c97005f63002058af;
    stim[55] = 130'h3c204448400f08346dbfe73048cf73106;
    stim[56] = 130'h03ee06dabff67274f9fbf7fe5c769d780;
    stim[57] = 130'h2e64ab61579b19b150dbdfdc08e423fb1;
    stim[58] = 130'h382fb7b939e185784309645f1e5a3b0f0;
    stim[59] = 130'h3c8edb397dd90993228b508ab8f7f3fdd;
    stim[60] = 130'h0de875801ff75522635ab0a965707c182;
    stim[61] = 130'h136ce9ed85056bbabd38e9cb3dd5ad8f1;
    stim[62] = 130'h1939434bf3682ab0132a281fb2e895821;
    stim[63] = 130'h36d79610163876cba8d94da1286813c0d;
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
      expv[0] = 32'h080be454;
      expv[1] = 32'hb03af976;
      expv[2] = 32'hfe4d7d9c;
      expv[3] = 32'he26f21ed;
      expv[4] = 32'h5e0ff389;
      expv[5] = 32'hb1f2ccbe;
      expv[6] = 32'h0f2d48f6;
      expv[7] = 32'h7300a51d;
      expv[8] = 32'h06b6be11;
      expv[9] = 32'hd7923995;
      expv[10] = 32'h235ec1e2;
      expv[11] = 32'he9a3a5b7;
      expv[12] = 32'hfa02258e;
      expv[13] = 32'heada47b6;
      expv[14] = 32'h79acfddc;
      expv[15] = 32'h63da2d47;
      expv[16] = 32'h974c3ac2;
      expv[17] = 32'haecf1f47;
      expv[18] = 32'h31c27a28;
      expv[19] = 32'he1c8bcba;
      expv[20] = 32'h7a2154d5;
      expv[21] = 32'ha2f7f33c;
      expv[22] = 32'h2015fd93;
      expv[23] = 32'h06717d48;
      expv[24] = 32'h91c2f59b;
      expv[25] = 32'h56549c53;
      expv[26] = 32'h45ee251b;
      expv[27] = 32'h2f6119d5;
      expv[28] = 32'h308fc1d1;
      expv[29] = 32'h9f12f25d;
      expv[30] = 32'h6dc26057;
      expv[31] = 32'h1277af55;
      expv[32] = 32'h6338b794;
      expv[33] = 32'hdd3530fd;
      expv[34] = 32'h4cdba882;
      expv[35] = 32'h052966cb;
      expv[36] = 32'h43e1328e;
      expv[37] = 32'hced6a58f;
      expv[38] = 32'hb8b6e33d;
      expv[39] = 32'h01c7a573;
      expv[40] = 32'hdbebcbb3;
      expv[41] = 32'h90459479;
      expv[42] = 32'h57bfbfd2;
      expv[43] = 32'hdef3393f;
      expv[44] = 32'h9dfa7ce7;
      expv[45] = 32'hc9d1df19;
      expv[46] = 32'h6d152387;
      expv[47] = 32'h03455e14;
      expv[48] = 32'h6c114d37;
      expv[49] = 32'h8e164573;
      expv[50] = 32'h7bc29ccb;
      expv[51] = 32'h819c2486;
      expv[52] = 32'hb704c865;
      expv[53] = 32'h2a92929f;
      expv[54] = 32'h97005f63;
      expv[55] = 32'h8cf73106;
      expv[56] = 32'h3ee06dab;
      expv[57] = 32'h0dbdfdc0;
      expv[58] = 32'he5a3b0f0;
      expv[59] = 32'h8f7f3fdd;
      expv[60] = 32'hde875801;
      expv[61] = 32'h5056bbab;
      expv[62] = 32'h3682ab01;
      expv[63] = 32'h86813c0d;
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
