// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 155;
  localparam OW = 152;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_059536 dut (
    .clk(clk),
    .reset(in_vec[154:154]),
    .if_write_ce(in_vec[153:153]),
    .if_write(in_vec[152:152]),
    .if_din(in_vec[151:2]),
    .if_read_ce(in_vec[1:1]),
    .if_read(in_vec[0:0]),
    .if_full_n(out_vec[151:151]),
    .if_empty_n(out_vec[150:150]),
    .if_dout(out_vec[149:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 155'h52b2da09c2c9b64373582d267ef55bc5c9803c5;
    stim[1] = 155'h4d95835bde2a8de92f7f5d6e7c881115518fc3b;
    stim[2] = 155'h077933ae29280565122c5960baece776973a081;
    stim[3] = 155'h307f6d23a08685e0e910f24924f58ac9f4f6c08;
    stim[4] = 155'h2fb39115f8e559efb543f10d36f3582d8bf80d5;
    stim[5] = 155'h2c4497bffc9910ddcd292b86a4aea16c766653a;
    stim[6] = 155'h1b9d10fc32d9624c13d34484dc52d408c9371c6;
    stim[7] = 155'h0d1faf491ae3f6f0da9181a01b071146a5e9338;
    stim[8] = 155'h2c666a56a7441c794848ff5540afef39158ecb8;
    stim[9] = 155'h2127a9838941edcac659775488a9f3eae7c601a;
    stim[10] = 155'h3e04505a1724a3e249885d59ae8bae658c69e62;
    stim[11] = 155'h026e364418e33523dae66db8a2dd7f785932087;
    stim[12] = 155'h3f9586c1f7f0774a8c55bae526993e7fea580b1;
    stim[13] = 155'h268644a44826dac3fecf54ed7fec383df1e7ab5;
    stim[14] = 155'h3075567c3ada6340d158973787968493e3c5343;
    stim[15] = 155'h3089d92316cea949fc0c92dcb11a32bc1ec4f0d;
    stim[16] = 155'h2ee7a8df0e95c34123400729427963c62f8d86c;
    stim[17] = 155'h31c8da75d93b7675d532f3a5e763810c74c607c;
    stim[18] = 155'h364677a54d9ce9e056393e99aa5f49ac60063ab;
    stim[19] = 155'h3f8a5e86addbf10fcbcec1d9dd8d939a217b762;
    stim[20] = 155'h1f1a66b5e618a67d239aed7b72c34305cf5125b;
    stim[21] = 155'h0eac55773c9ac6b612f61538ba48a8e0e8dd18b;
    stim[22] = 155'h26605dd7f1f43bf472596e2240ca072474a9514;
    stim[23] = 155'h08e08abdead1c2171eb418f91f8a3c0da176d7e;
    stim[24] = 155'h26a6e82ab1e34fe04fe21f5548c43a286ac3f75;
    stim[25] = 155'h265d1deca5bead0bc17e5ade0a4625a4c0be7ab;
    stim[26] = 155'h21bbad4e5456761f5721303afcab4102b78a93d;
    stim[27] = 155'h3c510f7796cf948e9e6e338a4931f2ee651c2d0;
    stim[28] = 155'h36885e0a8789d44a52889e9401ba6561eeeda3a;
    stim[29] = 155'h3112523fa27ecc34a7d23135128a18586d0fd38;
    stim[30] = 155'h1f143741112998851a8526a80c5ad51a6370f26;
    stim[31] = 155'h3341f9af07fa6166eec588ae80c707d385ab950;
    stim[32] = 155'h3ad173ed65bda9315f4b638422cbcc5c5f71511;
    stim[33] = 155'h3731fad7defc6104d102224754eb046a67e6d24;
    stim[34] = 155'h137d15189d16d6d11b7f9053ff3e81d02d2dd73;
    stim[35] = 155'h2e76be4212cd77bc88fb823fb62d2750cfa1a18;
    stim[36] = 155'h3ba53567dcc17e56916a38d449736bc534a3e14;
    stim[37] = 155'h2a114d9ac16d1defcdbb13e4bf016eccac6a92e;
    stim[38] = 155'h196502f1870c0b39697db338fc5696cac1840bb;
    stim[39] = 155'h3c5c8dc8e39f754a411864397e4bacf69d34ef5;
    stim[40] = 155'h36416a2b80ccfb9f6809b20fd57f5a205796443;
    stim[41] = 155'h07348092160ba7d0e99cea6b0f0fe84dc98f92d;
    stim[42] = 155'h154154cedd28a943869bb59aab21f9f70350405;
    stim[43] = 155'h2cc030dc0491543399a33a31e59d8c03d13f41c;
    stim[44] = 155'h3709935b4ff0622446a321126cea7c4d5e514a5;
    stim[45] = 155'h0723e7c4b5de7360092ce414be13c48bab05ba0;
    stim[46] = 155'h0ece0da583759320fdb5967e0a271402021b3bd;
    stim[47] = 155'h119f7d80610875e3a868e0b38c4c645e1830624;
    stim[48] = 155'h103e9a7be0531c56272987fb5a862c043924b4c;
    stim[49] = 155'h337da5c33960a8ff1dcc30822a259068a156774;
    stim[50] = 155'h2e01aacfde7035b5ca077b06a978bc8355edc83;
    stim[51] = 155'h26846743c4508b0f718b358d6414f4941bcc041;
    stim[52] = 155'h01e77abfb2106a5678e5655834ea25b1ea69579;
    stim[53] = 155'h2f7f3a090e489662d8f8b25284928a47b434507;
    stim[54] = 155'h2889c61d3be7ce5b1441e78c56cf6e706a99cd1;
    stim[55] = 155'h135b25deb4479ecf1bf7e38c876e0b3722e6e9a;
    stim[56] = 155'h3b96dde9d0a30ea3438e41dbf4d840b70027770;
    stim[57] = 155'h2358bfd106f77afe49881128eb7fbcbd54dcf58;
    stim[58] = 155'h01cc31ad0551da19450265bda8e7c7894ac84d2;
    stim[59] = 155'h202ba146aa71a5a97c84e3edb1f6fd4f4f62a58;
    stim[60] = 155'h281daf35bca93c875a5dd5f6ac7261c52fabd73;
    stim[61] = 155'h35eef5235eb692afebb9b4864aecb95a95baea3;
    stim[62] = 155'h39be00b3639598b470c9dae2e66d9bdf9ebc347;
    stim[63] = 155'h3c77faa8bc1211f794cbb04e17c647e512985d4;
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
      expv[0] = 152'h80000000000000000000000000000000000000;
      expv[1] = 152'h80000000000000000000000000000000000000;
      expv[2] = 152'h80000000000000000000000000000000000000;
      expv[3] = 152'h80000000000000000000000000000000000000;
      expv[4] = 152'h80000000000000000000000000000000000000;
      expv[5] = 152'h80000000000000000000000000000000000000;
      expv[6] = 152'hc1fdb48e821a1783a443c92493d62b27d3db02;
      expv[7] = 152'hc1fdb48e821a1783a443c92493d62b27d3db02;
      expv[8] = 152'hc1fdb48e821a1783a443c92493d62b27d3db02;
      expv[9] = 152'hc1fdb48e821a1783a443c92493d62b27d3db02;
      expv[10] = 152'hc1fdb48e821a1783a443c92493d62b27d3db02;
      expv[11] = 152'hc1fdb48e821a1783a443c92493d62b27d3db02;
      expv[12] = 152'hf81141685c928f8926217566ba2eb99631a798;
      expv[13] = 152'hf81141685c928f8926217566ba2eb99631a798;
      expv[14] = 152'hf81141685c928f8926217566ba2eb99631a798;
      expv[15] = 152'hfe561b07dfc1dd2a3156eb949a64f9ffa9602c;
      expv[16] = 152'hfe561b07dfc1dd2a3156eb949a64f9ffa9602c;
      expv[17] = 152'hfe561b07dfc1dd2a3156eb949a64f9ffa9602c;
      expv[18] = 152'hfe561b07dfc1dd2a3156eb949a64f9ffa9602c;
      expv[19] = 152'hc1d559f0eb698d0345625cde1e5a124f8f14d0;
      expv[20] = 152'h41d559f0eb698d0345625cde1e5a124f8f14d0;
      expv[21] = 152'hc227648c5b3aa527f0324b72c468caf07b13c3;
      expv[22] = 152'hc72369d764edd9d754cbce979d8e0431d3181f;
      expv[23] = 152'hc72369d764edd9d754cbce979d8e0431d3181f;
      expv[24] = 152'hc72369d764edd9d754cbce979d8e0431d3181f;
      expv[25] = 152'hc72369d764edd9d754cbce979d8e0431d3181f;
      expv[26] = 152'hd919de953673a78158e4fa66a97d26b18018ea;
      expv[27] = 152'hd919de953673a78158e4fa66a97d26b18018ea;
      expv[28] = 152'hd919de953673a78158e4fa66a97d26b18018ea;
      expv[29] = 152'hd919de953673a78158e4fa66a97d26b18018ea;
      expv[30] = 152'h5919de953673a78158e4fa66a97d26b18018ea;
      expv[31] = 152'h5919de953673a78158e4fa66a97d26b18018ea;
      expv[32] = 152'h5919de953673a78158e4fa66a97d26b18018ea;
      expv[33] = 152'h5919de953673a78158e4fa66a97d26b18018ea;
      expv[34] = 152'h5919de953673a78158e4fa66a97d26b18018ea;
      expv[35] = 152'hfe297a1ab76fc43f2f3b076776364e6885edd8;
      expv[36] = 152'hfe297a1ab76fc43f2f3b076776364e6885edd8;
      expv[37] = 152'h7e297a1ab76fc43f2f3b076776364e6885edd8;
      expv[38] = 152'h7e297a1ab76fc43f2f3b076776364e6885edd8;
      expv[39] = 152'hf1443dde5b3e523a79b8ce2924c7cbb99470b4;
      expv[40] = 152'h71443dde5b3e523a79b8ce2924c7cbb99470b4;
      expv[41] = 152'hda21782a1e2751294a227a5006e99587bbb68e;
      expv[42] = 152'hda21782a1e2751294a227a5006e99587bbb68e;
      expv[43] = 152'hda21782a1e2751294a227a5006e99587bbb68e;
      expv[44] = 152'hda21782a1e2751294a227a5006e99587bbb68e;
      expv[45] = 152'h5a21782a1e2751294a227a5006e99587bbb68e;
      expv[46] = 152'h5a21782a1e2751294a227a5006e99587bbb68e;
      expv[47] = 152'h5a21782a1e2751294a227a5006e99587bbb68e;
      expv[48] = 152'h5a21782a1e2751294a227a5006e99587bbb68e;
      expv[49] = 152'h5a21782a1e2751294a227a5006e99587bbb68e;
      expv[50] = 152'h5a21782a1e2751294a227a5006e99587bbb68e;
      expv[51] = 152'hc44948fe89fb30d29f48c4d44a286161b43f4e;
      expv[52] = 152'hc44948fe89fb30d29f48c4d44a286161b43f4e;
      expv[53] = 152'hc44948fe89fb30d29f48c4d44a286161b43f4e;
      expv[54] = 152'hee94d59f7305f95a45a8e35125cdaf14d28f85;
      expv[55] = 152'hee94d59f7305f95a45a8e35125cdaf14d28f85;
      expv[56] = 152'hee94d59f7305f95a45a8e35125cdaf14d28f85;
      expv[57] = 152'hee94d59f7305f95a45a8e35125cdaf14d28f85;
      expv[58] = 152'hee94d59f7305f95a45a8e35125cdaf14d28f85;
      expv[59] = 152'hee94d59f7305f95a45a8e35125cdaf14d28f85;
      expv[60] = 152'hee94d59f7305f95a45a8e35125cdaf14d28f85;
      expv[61] = 152'hf17237238e7dd529046190e5f92eb3da74d3bd;
      expv[62] = 152'hdc264d6d3fc188911a8c8449b3a9f135794529;
      expv[63] = 152'hee5b77a7428c3a8d0e39076fd36102dc009ddc;
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
