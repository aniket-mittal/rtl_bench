// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 103;
  localparam OW = 102;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_061062 dut (
    .clk_core(clk),
    .rst_x(in_vec[102:102]),
    .i_req(in_vec[101:101]),
    .i_wr(in_vec[100:100]),
    .i_adrs(in_vec[99:78]),
    .i_len(in_vec[77:72]),
    .i_strw(in_vec[71:71]),
    .i_be(in_vec[70:67]),
    .i_dbw(in_vec[66:35]),
    .i_ack(in_vec[34:34]),
    .i_ackw(in_vec[33:33]),
    .i_strr(in_vec[32:32]),
    .i_dbr(in_vec[31:0]),
    .o_ack(out_vec[101:101]),
    .o_ackw(out_vec[100:100]),
    .o_strr(out_vec[99:99]),
    .o_dbr(out_vec[98:67]),
    .o_req(out_vec[66:66]),
    .o_wr(out_vec[65:65]),
    .o_adrs(out_vec[64:43]),
    .o_len(out_vec[42:37]),
    .o_strw(out_vec[36:36]),
    .o_be(out_vec[35:32]),
    .o_dbw(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 103'h61a41b37344965515cb4b21f93;
    stim[1] = 103'h758b20b12b7163b759de15fec8;
    stim[2] = 103'h31fb6fba8aaf9c77828e582db5;
    stim[3] = 103'h2d53ae718aff7d479f544588f8;
    stim[4] = 103'h3c0d33e670551aa3bed635feb7;
    stim[5] = 103'h2f655df960d6a01626e3871358;
    stim[6] = 103'h37755092f3d598f3d84c9b1021;
    stim[7] = 103'h33769e4267dc28449f1ae9b70f;
    stim[8] = 103'h1d402b7c25fc6e8aacab38743e;
    stim[9] = 103'h03aef20a6b5a5221f075a35611;
    stim[10] = 103'h35610bd6cb013317e3fa1f1e0a;
    stim[11] = 103'h116d960afc2e44823f81130d7b;
    stim[12] = 103'h390b4594137d0678c38dcc4ba8;
    stim[13] = 103'h36f340433da9dab45ed573b186;
    stim[14] = 103'h264a66680d9707c42de7339548;
    stim[15] = 103'h3d68f1b032d868ad0069fe9f0a;
    stim[16] = 103'h0981d3f549b64ab85fbcd5bda4;
    stim[17] = 103'h32f7126c632e5f03bf49902dfd;
    stim[18] = 103'h16b28302923691040a1a1b8ea7;
    stim[19] = 103'h2bfa9aae9d68b0df046d4940c9;
    stim[20] = 103'h3faba7eb40935b4d773b3ce072;
    stim[21] = 103'h2dc56ea8c359ed2e404e10c088;
    stim[22] = 103'h0e5aee15ef9ab6f801cc93ba81;
    stim[23] = 103'h18c0335ed93a628181b8dc3d71;
    stim[24] = 103'h39046998ee8dc5ddf24b5720e0;
    stim[25] = 103'h340121c8c37eb0ceb9704482bb;
    stim[26] = 103'h0fd818a42799b6dbae9c5781fc;
    stim[27] = 103'h0ba2c02a4860be4dc413bf1300;
    stim[28] = 103'h18cd5b28dad5ed403f7ebd2807;
    stim[29] = 103'h1f35a43ded702bc6ea8d5925b8;
    stim[30] = 103'h253f16ebb548926d8b8e78b482;
    stim[31] = 103'h515073358f5c20553c65750ef7;
    stim[32] = 103'h2e8b6fbf350fa40074a2c54b17;
    stim[33] = 103'h0a67655ee2fbc26c75de4a1f85;
    stim[34] = 103'h2e1d8f2ea850bc595af591f10a;
    stim[35] = 103'h006d614577fff095f4464f4403;
    stim[36] = 103'h3d20ed9ba008bb1a9ae99fe552;
    stim[37] = 103'h1406446a92cc468be3a973f900;
    stim[38] = 103'h31a9c235a29cd0a538886f27a1;
    stim[39] = 103'h2252333edc40b17cc26d57cd05;
    stim[40] = 103'h1ce1bd5351d64b271a70744ad7;
    stim[41] = 103'h2cb26119025374578f9c7beb3a;
    stim[42] = 103'h3d5ccc7b64a874e37d079dc348;
    stim[43] = 103'h1f4a68309012f1f12c81e98002;
    stim[44] = 103'h114b5259f369472c9a6c92c03b;
    stim[45] = 103'h0e0eea7893bacc1c02cd26fa20;
    stim[46] = 103'h2f1ea698a2fd1af1c83abd7fad;
    stim[47] = 103'h05e971f8552fb7e832b7fa9eb3;
    stim[48] = 103'h3a34ed878a9b72116a6b6ca017;
    stim[49] = 103'h396874438cfe87724b604ecb7e;
    stim[50] = 103'h3c4f85bb718b2f5aed532f16fe;
    stim[51] = 103'h2e3675a9c8d47384da3b8a9cc4;
    stim[52] = 103'h10c9e8cadce34d0f30e39ef238;
    stim[53] = 103'h19ee2af4b24fe1c931eab03ed5;
    stim[54] = 103'h73691b8f8e358ce1a028bd3c26;
    stim[55] = 103'h166c80ee0ed580447ec5c4cacc;
    stim[56] = 103'h29bedd8921532130d75c487205;
    stim[57] = 103'h59540dadf3093b99e9017d7cf8;
    stim[58] = 103'h221961d1d0b03c7d65833b5c48;
    stim[59] = 103'h34ac7e02c8f174499ed9e3bf0d;
    stim[60] = 103'h268fcbd258bb46512fe522a8c2;
    stim[61] = 103'h220423ba01ae48fdd492d87377;
    stim[62] = 103'h1c487fb3aa8e1a786578f38e63;
    stim[63] = 103'h03dada2297e6bb5501250b4e0f;
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
      expv[0] = 102'h05a590fc9xxxxxxxxxxxxxxxxx;
      expv[1] = 102'h0ef0aff640348366e6892caa2b;
      expv[2] = 102'h0472c16da8b16416256e2c76eb;
      expv[3] = 102'h0aa22c47c03f6df74155f38ef0;
      expv[4] = 102'h06b1aff5b9aa75ce215fefa8f3;
      expv[5] = 102'h071c389ac181a67cce0aa35477;
      expv[6] = 102'h0264d88109ecabbf2c1ad402c4;
      expv[7] = 102'h08d74db878eeaa124e7ab31e7b;
      expv[8] = 102'h0559c3a1f06ed3c84cfb850893;
      expv[9] = 102'h03ad1ab089a8056f84bf8dd155;
      expv[10] = 102'h0fd0f8f05075de414d6b4a443e;
      expv[11] = 102'h0c08986bd8ac217ac9602662fc;
      expv[12] = 102'h0c6e625d402db2c14f85c89047;
      expv[13] = 102'h06ab9d8c312168b2826fa0cf18;
      expv[14] = 102'h0f399caa40de680867b53b568b;
      expv[15] = 102'h034ff4f850c94ccd01b2e0f885;
      expv[16] = 102'h0de6aded21ad1e36065b0d15a0;
      expv[17] = 102'h0a4c816fe9303a7ea936c9570b;
      expv[18] = 102'h00d0dc75385ee24d8c65cbe077;
      expv[19] = 102'h036a4a0648d650604246d22081;
      expv[20] = 102'h09d9e703917f5355c3ad161be0;
      expv[21] = 102'h0270860441f574fd68126b69ae;
      expv[22] = 102'h0e649dd409b8add5086b3da5c8;
      expv[23] = 102'h0dc6e1eb89cb5dc2adf356df00;
      expv[24] = 102'h025ab9070118066bcb274c5030;
      expv[25] = 102'h0b822415d9208d330dd1b8bbbe;
      expv[26] = 102'h04e2bc0fe0802439086fd619d7;
      expv[27] = 102'h009df89801fb031484f336db75;
      expv[28] = 102'h0bf5e94039745805490c17c9b8;
      expv[29] = 102'h046ac92dc119ab650b5abda807;
      expv[30] = 102'h0c73c5a411e6b487adae0578dd;
      expv[31] = 102'h032ba877b8a7e2dd66a9124db1;
      expv[32] = 102'h05162a58b82a0e66a1eb840aa7;
      expv[33] = 102'h0ef250fc29d16df7e6a1f4800e;
      expv[34] = 102'h07ac8f88514cecabcc5f784d8e;
      expv[35] = 102'h02327a2019c3b1e5c50a178b2b;
      expv[36] = 102'h074cff2a900dac28aefffe12be;
      expv[37] = 102'h0d4b9fc801a41db36401176353;
      expv[38] = 102'h0443793d0880c88d425988d17c;
      expv[39] = 102'h036abe6828353846a4539a14a7;
      expv[40] = 102'h0383a256b84a4667cb88162f98;
      expv[41] = 102'h0ce3df59d19c37aa6a3ac964e3;
      expv[42] = 102'h083cee1a41964c23204a6e8af1;
      expv[43] = 102'h040f4c0011ab998f6c950e9c6f;
      expv[44] = 102'h03649601d9e94d0602025e3e25;
      expv[45] = 102'h066937d100296a4b2e6d28e593;
      expv[46] = 102'h01d5ebfd69c1dd4f0277598380;
      expv[47] = 102'h05bfd4f599e3d4d3045fa35e39;
      expv[48] = 102'h035b6500b8bd2e3f0aa5f6fd06;
      expv[49] = 102'h0b02765bf1469db0e1536e422d;
      expv[50] = 102'h0a9978b7f12d0e88619fd0ee49;
      expv[51] = 102'h01dc54e62189f0b76e3165eb5d;
      expv[52] = 102'h071cf791c1c6ceb5291a8e709b;
      expv[53] = 102'h0f5581f6a8193d194b9c69a1e6;
      expv[54] = 102'h0145e9e1313dc55e8649fc3926;
      expv[55] = 102'h062e2656606d2371e1c6b19c34;
      expv[56] = 102'h0ae2439028cd901dc1dab0088f;
      expv[57] = 102'h080bebe7c137dbb1242a64261a;
      expv[58] = 102'h0c19dae2412a81b5ae6127733d;
      expv[59] = 102'h06cf1df868432c3a2a16078fac;
      expv[60] = 102'h0f29154610958fc0491e2e8933;
      expv[61] = 102'h0496c39bb8d1f97a4b1768ca25;
      expv[62] = 102'h0bc79c73184084774035c91fba;
      expv[63] = 102'h09285a7079890ff66551c34f0c;
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
