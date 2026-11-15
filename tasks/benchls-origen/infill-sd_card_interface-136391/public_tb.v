// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 169;
  localparam OW = 68;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_136391 dut (
    .clk(clk),
    .rst(in_vec[168:168]),
    .host_cmd(in_vec[167:120]),
    .host_dat_in(in_vec[119:88]),
    .host_cmd_en(in_vec[87:87]),
    .host_dat_en(in_vec[86:86]),
    .host_dat_dir(in_vec[85:85]),
    .host_dat_ack(in_vec[84:84]),
    .device_cmd(in_vec[83:36]),
    .device_dat_in(in_vec[35:4]),
    .device_cmd_en(in_vec[3:3]),
    .device_dat_en(in_vec[2:2]),
    .device_dat_dir(in_vec[1:1]),
    .device_dat_ack(in_vec[0:0]),
    .host_cmd_ack(out_vec[67:67]),
    .host_dat_rdy(out_vec[66:66]),
    .host_dat_out(out_vec[65:34]),
    .device_cmd_ack(out_vec[33:33]),
    .device_dat_rdy(out_vec[32:32]),
    .device_dat_out(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 169'h1d283303b564a1d788e3c4598131f1a17078ce7d11c;
    stim[1] = 169'h1d757a786ea0d1da47ad5e851db2648b46d5aa9a368;
    stim[2] = 169'h0e527ace8529a3d138ee4d841ab9037fc59552e67f4;
    stim[3] = 169'h03d5a2c2fd07fd9988c26ba78329c897bbd937540ee;
    stim[4] = 169'h04bdc1305b58475895eaeea01b46e9ef3dcf2e9ec41;
    stim[5] = 169'h0482d9b338d425c79a076cbc843bd7a87685b4bcd0e;
    stim[6] = 169'h0b52b46f5aec5a3e9950b3f537f9fa61017d4983676;
    stim[7] = 169'h0ee27e165d8c8ebae49aad0376748c0a4bd9078722b;
    stim[8] = 169'h02f3a132f708ca2f7bd83f1e004a8ddea6b3704bac3;
    stim[9] = 169'h06f01c48976bde01550e2ea5a7703f0f875f1cfad9b;
    stim[10] = 169'h19e482d356a098fb5d537926566a96adf54568156e1;
    stim[11] = 169'h0aa12b8fcf1e224c1089de738bd54802d91937cb3ff;
    stim[12] = 169'h05f4e563c4b9df7719d2a1af09cbf0dbce91bf114c3;
    stim[13] = 169'h0c5c701928543b89f727ffd146c522ab1ee196b7139;
    stim[14] = 169'h06c3a0bb8ae4b9b46de6a312dcecba7e752255bf9f6;
    stim[15] = 169'h0215f1a9498ffac9ee7009d247ee320ce3d031d2011;
    stim[16] = 169'h047aec8cdfcae0cabef38e359ad47b66d0f3aa3b22c;
    stim[17] = 169'h0be01707a27e2c76c61dac4d38b9fd721fe3513dcd8;
    stim[18] = 169'h0b90f7a021393b5868001ed3aad3a857a697213a7c5;
    stim[19] = 169'h0c103ba8984c70d5ee48220e46a7b90f7de7b739de9;
    stim[20] = 169'h0b067f48f5a680fda99df626ad973c1e1248d6c30e2;
    stim[21] = 169'h0f4bace84f7767e623df3a1ef6df45be98edcc879d4;
    stim[22] = 169'h0edb57999a7bd77e0fe73cfbf1d068b2a172898ccb7;
    stim[23] = 169'h06b9ba50e9bb883cc84fe0566d91139099dc001825a;
    stim[24] = 169'h0f4da25c9f653a3ee98f26866a64c77cd8ee7ad1bdd;
    stim[25] = 169'h0d9ae6430a72b6b25c3a95dccd4eaea2dd792b093de;
    stim[26] = 169'h0ccf7a5fc5c062ea034baea3bb292dced7e60f1da45;
    stim[27] = 169'h0e7c9d1cd9d1120aa5ac330289b2410d78af3e04342;
    stim[28] = 169'h0a6c3c166e3aeccb2683bb839deb549b57323c5bd95;
    stim[29] = 169'h031e5c44b98b45f6173897ad27f3f1c65d4237d3c14;
    stim[30] = 169'h0c81998a28043853cf02964fb3fdc52cddb70ba6d64;
    stim[31] = 169'h0fc1676162c7824cd212f2c70e97b4572209f8e16da;
    stim[32] = 169'h084b78d4511a2733e3b56cfe5fbbbdad13cc11df0ed;
    stim[33] = 169'h004639127c9e346194baec71b0bcd0684dae45d823b;
    stim[34] = 169'h0e84ccf48ff9c1435ea3d50b12d0a7156c876fc874c;
    stim[35] = 169'h01c9c961e5d7e99decbc7251e6d5b00b024389217c1;
    stim[36] = 169'h0c4dbbf7f5464e5dca74c206d47d87f1c4e41eea299;
    stim[37] = 169'h03190f3f32b84aa9d12d460cdf295700d20b1e4102c;
    stim[38] = 169'h01e995ee7bba2a3729b2647ee7723b15f92554732c7;
    stim[39] = 169'h04a8c1e62034e8e44aa0375cd0e244fe5567585b870;
    stim[40] = 169'h09d0511fcbd05d3d6b6103faa510d53b5742553eeab;
    stim[41] = 169'h0c90161187572f7443b80a2f2a278a603c57a0a616a;
    stim[42] = 169'h045af6e04035a6a3a674c8a5e966918cee1931ab053;
    stim[43] = 169'h0f95639664035fa9a4d3478b197fab21fe5e61dbfd6;
    stim[44] = 169'h0830c9815e874bc376006a235db5349680d0ba297d8;
    stim[45] = 169'h0efee7697040951fa313f00ec8fe8317fe0d1fe2b94;
    stim[46] = 169'h00ab629e9c0808601846e007ae72366731856d6635f;
    stim[47] = 169'h0644646c2f4fce50c1c91e9bc04f546322abab2caed;
    stim[48] = 169'h02f6f89c04372f0ba4b63c27261dd9fbfd484b7e9ce;
    stim[49] = 169'h0b9376a4043dc48c06c713538b5115e737abcc9d5d1;
    stim[50] = 169'h053fb7a8507bb484ffa52a5bc140ef9f6b659d46fae;
    stim[51] = 169'h0d01c267af4a560f783d931fb3b13777865a2ea0f1e;
    stim[52] = 169'h08cfc4c336038edf60b3c56a654b39bf4bc710b6a71;
    stim[53] = 169'h04b5e799a23ff10d5259f954cd5557723a249ef5993;
    stim[54] = 169'h05b1750810e1082b792bc9762bce9b9dee26b7a1920;
    stim[55] = 169'h06caea55178e8f2bab1441ccd7b589b827e204a5f3d;
    stim[56] = 169'h08c511d997fd7fa2f2919a36ee84a019c91e462e37a;
    stim[57] = 169'h0c16f77c3fde0a402f654419e56bce812d0426812dd;
    stim[58] = 169'h04413cd328d4a82b38599b59bede160ef9fb7b52c94;
    stim[59] = 169'h0e4bd6d66e33ae7eaff81d91603daa483ea71bb5e1a;
    stim[60] = 169'h0ec592161895038095b9aac468b1b207dfa6e9fd6c1;
    stim[61] = 169'h08e272a26e655a91666e23b91126d8b6975c690ebac;
    stim[62] = 169'h05ca64a7c7cf50a4dbbd3a5bebfc1cc0789a85b434b;
    stim[63] = 169'h09c543d788ded418f4c25f0209e3330cff42fb0b60e;
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
      expv[0] = 68'hxxxxxxxxxxxxxxxxx;
      expv[1] = 68'hxxxxxxxxxxxxxxxxx;
      expv[2] = 68'hxxxxxxxxxxxxxxxxx;
      expv[3] = 68'hxxxxxxxxxxxxxxxxx;
      expv[4] = 68'hxxxxxxxxxxxxxxxxx;
      expv[5] = 68'hxxxxxxxxxxxxxxxxx;
      expv[6] = 68'hxxxxxxxxxxxxxxxxx;
      expv[7] = 68'hxxxxxxxxxxxxxxxxx;
      expv[8] = 68'hxxxxxxxxxxxxxxxxx;
      expv[9] = 68'hxxxxxxxxxa2f7bd83;
      expv[10] = 68'hxxxxxxxxxe01550e2;
      expv[11] = 68'hxxxxxxxxxe01550e2;
      expv[12] = 68'hxxxxxxxxxe01550e2;
      expv[13] = 68'hxxxxxxxxxe01550e2;
      expv[14] = 68'hxxxxxxxxxe01550e2;
      expv[15] = 68'hxxxxxxxxxe01550e2;
      expv[16] = 68'hxxxxxxxxxe01550e2;
      expv[17] = 68'hxxxxxxxxx0cabef38;
      expv[18] = 68'hxxxxxxxxx0cabef38;
      expv[19] = 68'hxxxxxxxxxb5868001;
      expv[20] = 68'hxxxxxxxxxb5868001;
      expv[21] = 68'hxxxxxxxxx0fda99df;
      expv[22] = 68'h7b7321e750fda99df;
      expv[23] = 68'h7b7321e750fda99df;
      expv[24] = 68'h7b7321e750fda99df;
      expv[25] = 68'h7b7321e75a3ee98f2;
      expv[26] = 68'h7b7321e75a3ee98f2;
      expv[27] = 68'h7b7321e752ea034ba;
      expv[28] = 68'h7b7321e752ea034ba;
      expv[29] = 68'h4c8f16f652ea034ba;
      expv[30] = 68'h4c8f16f655f617389;
      expv[31] = 68'h4c8f16f65853cf029;
      expv[32] = 68'h4c8f16f65853cf029;
      expv[33] = 68'h730477c39853cf029;
      expv[34] = 68'h730477c39853cf029;
      expv[35] = 68'h61dbf21d1853cf029;
      expv[36] = 68'h61dbf21d1853cf029;
      expv[37] = 68'h61dbf21d1853cf029;
      expv[38] = 68'h61dbf21d1aa9d12d4;
      expv[39] = 68'h61dbf21d1aa9d12d4;
      expv[40] = 68'h61dbf21d18e44aa03;
      expv[41] = 68'h61dbf21d18e44aa03;
      expv[42] = 68'h61dbf21d18e44aa03;
      expv[43] = 68'h61dbf21d18e44aa03;
      expv[44] = 68'h61dbf21d1fa9a4d34;
      expv[45] = 68'h61dbf21d1fa9a4d34;
      expv[46] = 68'h4347f8ae5fa9a4d34;
      expv[47] = 68'h4347f8ae5fa9a4d34;
      expv[48] = 68'h4347f8ae5e50c1c91;
      expv[49] = 68'h4347f8ae5e50c1c91;
      expv[50] = 68'h4347f8ae5e50c1c91;
      expv[51] = 68'h4347f8ae5e50c1c91;
      expv[52] = 68'h4347f8ae5e50c1c91;
      expv[53] = 68'h4347f8ae5e50c1c91;
      expv[54] = 68'h4347f8ae5e50c1c91;
      expv[55] = 68'h4347f8ae5e50c1c91;
      expv[56] = 68'h7881297cde50c1c91;
      expv[57] = 68'h7881297cde50c1c91;
      expv[58] = 68'h4109a04b5e50c1c91;
      expv[59] = 68'h7eded4b25e50c1c91;
      expv[60] = 68'h7eded4b25e50c1c91;
      expv[61] = 68'h7eded4b25e50c1c91;
      expv[62] = 68'h571a43ae9e50c1c91;
      expv[63] = 68'h571a43ae9e50c1c91;
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
