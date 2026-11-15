// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 195;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_063864 dut (
    .clk(clk),
    .rst(in_vec[194:194]),
    .enable(in_vec[193:193]),
    .glitch_delay(in_vec[192:161]),
    .glitch_width(in_vec[160:129]),
    .glitch_count(in_vec[128:97]),
    .glitch_gap(in_vec[96:65]),
    .glitch_max(in_vec[64:33]),
    .reset_target(in_vec[32:1]),
    .vstart(in_vec[0:0]),
    .glitched(out_vec[3:3]),
    .vout(out_vec[2:2]),
    .finished(out_vec[1:1]),
    .reset_out(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 195'h63f47ef1c2bc71ab84907d26fce92f2fb039893eb93aadbf9;
    stim[1] = 195'h4f9b764088f4e722b428115cd364bac5fab57bde478672c60;
    stim[2] = 195'h07b984ce468411c5f160e887ec7352f45b90a3b7fb0adf2af;
    stim[3] = 195'h1b3bcd85730ca9b8c1a3ea31c41079601ca74750b92842788;
    stim[4] = 195'h34313904385fe7f61bf4d76eabb6790b2319697b60a23e2b3;
    stim[5] = 195'h022afadf7a2395f5413f8cd271aac87abcd9205aebebe45cd;
    stim[6] = 195'h25d319c903f01b35fad40c3986d22f212a1e5a6106fbcd7c8;
    stim[7] = 195'h30d2f63634bbf455074c01c4f4255a9efdbb6e030071c6296;
    stim[8] = 195'h10e1276664dacad77e007e5bc2a0889a0580bfb3ac4d81fe3;
    stim[9] = 195'h15b9735852f630f587980b1886826be539ee2a99b51ce45c9;
    stim[10] = 195'h35b7ac986b9c89ef9f703b28dc75d426e8195596caa8d38bd;
    stim[11] = 195'h2caae3f52be499907dd0dc6c8ef92f9b1c90e454f2c1c5c14;
    stim[12] = 195'h21e725ab673dc4a642911963944c6d833645044022a440c4b;
    stim[13] = 195'h05353fdc843cddc30517f69c53dff1f5cea04969c5cb55ab4;
    stim[14] = 195'h01f607a6843f95c5853e61635276d0d504aafbde908f76679;
    stim[15] = 195'h082c44d13a33f08a4afcd512ed2dfeae5236af910968ed099;
    stim[16] = 195'h0f5df29d49fd8bd4b88b3a486040c478ab6816e62a5ccbfae;
    stim[17] = 195'h32f24473cc42b62549d0c215faf11a7788623ec8e50d1904f;
    stim[18] = 195'h278457abaef69c3ce3e264722bd36c0c1385fa5f046fa1fe9;
    stim[19] = 195'h0db908efb1bb8b6cca837cb59e2d232475a80121040ac02a8;
    stim[20] = 195'h3b38d04e29f783eecc631f6a0e72af25dc342ebc9e2ed6ee6;
    stim[21] = 195'h1e3bef082317d16db341f037eaddad68306d5873c7d625bcb;
    stim[22] = 195'h28f32b3b91025d42bf7db4cc5f5ba7d623370bc4206e6f95d;
    stim[23] = 195'h03e3565a9ee1a05364b3d87dffcfcd80ce060152b892da259;
    stim[24] = 195'h2200c71e9901561f95bdd96c516bc1611716d354816cebe2d;
    stim[25] = 195'h37c622ed46fb708082ac9271d06531e2389bf3aaeacb4e2ec;
    stim[26] = 195'h005009c9116ee12bf08c3f90d30b5415d03e0d76bce53d22e;
    stim[27] = 195'h0deb7bd3256439c076d0cb5bc18b426480171e88aa046e54d;
    stim[28] = 195'h1d0ab31fd8d346cc3851b0d162d5458caea61e9d23a882d61;
    stim[29] = 195'h0c05db693c1b7af5a3c6027b97ca8bcb4a82e09ba3aa0775f;
    stim[30] = 195'h07be79d566018d8ec5fad2b8aff903306814405b904d74815;
    stim[31] = 195'h2410fa8f49c58c2268d9527e96c8f93541ee356a9e4071f54;
    stim[32] = 195'h2783ecf6b846cec97ba1be32a347c0079b4f405f6f1a0a08f;
    stim[33] = 195'h0ac640e7f1ca6acbfe0f43a3d5dee5f8f470a3fed0c476c01;
    stim[34] = 195'h202ab4d460ca6c9391fc25b4c84372ad8f3dd7769e1d34a95;
    stim[35] = 195'h268753e6d656e5f5c281e7142876698b75f71ccb29967636d;
    stim[36] = 195'h3d40ac556e9babc2332c75e787713f4404f12a511c02802a8;
    stim[37] = 195'h2a063195904df40c0526eddbcc727ee8a9c4a9e7f48091e54;
    stim[38] = 195'h2ce4186381798d2664c73dee62477bfeeb34e2d4be05c34e7;
    stim[39] = 195'h22f84ef12164413b6eb97390ab763b08d3964c615341be27c;
    stim[40] = 195'h33c05014c546b2d0798125909b7172b70505bf63aa3b5d3da;
    stim[41] = 195'h33188935cdbb81afbd50f594e17023b4877c8384ef1e0ac74;
    stim[42] = 195'h26930b90739e2a127e3fd85b8d924f8781e261f7405332734;
    stim[43] = 195'h129032d20afb7bca5484ec89b7bdb13d5c787cb3a6d38b31b;
    stim[44] = 195'h1aeef5b8633937c42cf6ef96bc64c07b80d8c493d9e4ec496;
    stim[45] = 195'h27689dd9ef021baf82f260165a02f18376b366c5b261fd438;
    stim[46] = 195'h29a8f483a506e2ffa8e385161acd2b41295c730333cd1afaa;
    stim[47] = 195'h22b3477c477ec037498a024e2c0a05950434504bd3b05807f;
    stim[48] = 195'h551166b2a81e01097405c236e9285d4248ee39c941a3003cc;
    stim[49] = 195'h30dc66dd9d9468e01576e3131ee7b2ce4ea2e89e11bd4b01f;
    stim[50] = 195'h1cac36cd1258b30675c2de03742fbbb19d6d63e0822d09896;
    stim[51] = 195'h24197ede1edbc3e57012788865ac1b8e549908d410ba40699;
    stim[52] = 195'h16b6af8af1927fe51405e9b157182fc79b7fe647f59a6c7ba;
    stim[53] = 195'h347f20e9d463204b27f5cb5e714fba7d3c02b6e07f9cb1c27;
    stim[54] = 195'h22a4a796939d4be9cddc50b08c6c614ebf95b5765d2dcb74d;
    stim[55] = 195'h3779bd85ddccd1bf9f20ce5adb8ad43c10a2ea229963946c8;
    stim[56] = 195'h1d2af33dc4624b301132b0f60a67964cd6bfb76872a4131ef;
    stim[57] = 195'h17c758cc261f83b07b394d999b71372cf1105eae0b6f04181;
    stim[58] = 195'h0ea3f75ea060127d443635f845f6cbc7be7ba284345b216a0;
    stim[59] = 195'h0bf20ba18adfa1616b8c9105ae61ec288899245aff3ba27b7;
    stim[60] = 195'h0f294447b5b9d91c8512765115ee33e35b02d15ba380027fb;
    stim[61] = 195'h22ff86cde9f8fe53326b1595e810578cb29127901d320ea84;
    stim[62] = 195'h1db5cd639beea4dbf537b9bdaf40e3b2b24a1c90b3b32bfa9;
    stim[63] = 195'h290b6bd90549326fbf29815f6051330e9324218ce2a597500;
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
      expv[0] = 4'h4;
      expv[1] = 4'hd;
      expv[2] = 4'h1;
      expv[3] = 4'h5;
      expv[4] = 4'h0;
      expv[5] = 4'hd;
      expv[6] = 4'hc;
      expv[7] = 4'hc;
      expv[8] = 4'hd;
      expv[9] = 4'hd;
      expv[10] = 4'hc;
      expv[11] = 4'hc;
      expv[12] = 4'hc;
      expv[13] = 4'hd;
      expv[14] = 4'hd;
      expv[15] = 4'hd;
      expv[16] = 4'hd;
      expv[17] = 4'hc;
      expv[18] = 4'hc;
      expv[19] = 4'hd;
      expv[20] = 4'hc;
      expv[21] = 4'hd;
      expv[22] = 4'hc;
      expv[23] = 4'hd;
      expv[24] = 4'hc;
      expv[25] = 4'hc;
      expv[26] = 4'hd;
      expv[27] = 4'hd;
      expv[28] = 4'hd;
      expv[29] = 4'hd;
      expv[30] = 4'hd;
      expv[31] = 4'hc;
      expv[32] = 4'hc;
      expv[33] = 4'hd;
      expv[34] = 4'hc;
      expv[35] = 4'hc;
      expv[36] = 4'hc;
      expv[37] = 4'hc;
      expv[38] = 4'hc;
      expv[39] = 4'hc;
      expv[40] = 4'hc;
      expv[41] = 4'hc;
      expv[42] = 4'hc;
      expv[43] = 4'hd;
      expv[44] = 4'hd;
      expv[45] = 4'hc;
      expv[46] = 4'hc;
      expv[47] = 4'hc;
      expv[48] = 4'hd;
      expv[49] = 4'h0;
      expv[50] = 4'hd;
      expv[51] = 4'hc;
      expv[52] = 4'hd;
      expv[53] = 4'hc;
      expv[54] = 4'hc;
      expv[55] = 4'hc;
      expv[56] = 4'hd;
      expv[57] = 4'hd;
      expv[58] = 4'hd;
      expv[59] = 4'hd;
      expv[60] = 4'hd;
      expv[61] = 4'hc;
      expv[62] = 4'hd;
      expv[63] = 4'hc;
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
