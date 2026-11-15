// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 95;
  localparam OW = 80;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_101055 dut (
    .N_data_i(in_vec[94:79]),
    .S_data_i(in_vec[78:63]),
    .E_data_i(in_vec[62:47]),
    .W_data_i(in_vec[46:31]),
    .L_data_i(in_vec[30:15]),
    .N_port_select(in_vec[14:12]),
    .S_port_select(in_vec[11:9]),
    .E_port_select(in_vec[8:6]),
    .W_port_select(in_vec[5:3]),
    .L_port_select(in_vec[2:0]),
    .N_data_o(out_vec[79:64]),
    .S_data_o(out_vec[63:48]),
    .E_data_o(out_vec[47:32]),
    .W_data_o(out_vec[31:16]),
    .L_data_o(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 95'h2bc83fb4977276b875b37442;
    stim[1] = 95'h58bdc6fb1ceff6506f98a5fe;
    stim[2] = 95'h35887cf2cabcf6fc56f14849;
    stim[3] = 95'h540b42e8c46641eb517aa3f2;
    stim[4] = 95'h0269a963863d25f44d65b9c7;
    stim[5] = 95'h38b7573cc970b9d4a05b808b;
    stim[6] = 95'h390e3d60e9bc20ebe8d3693d;
    stim[7] = 95'h2acb2d1bb4379d23f5b93ec5;
    stim[8] = 95'h3cfe5e460766edef8317c78d;
    stim[9] = 95'h67ed22cfb72fd06e75e80342;
    stim[10] = 95'h266edde7dbf388bb61fd0c47;
    stim[11] = 95'h1a7fdb46e84324c724347cb0;
    stim[12] = 95'h4f89c6920aae83a57cf4a45e;
    stim[13] = 95'h45efaf3d469cb79538aebe1d;
    stim[14] = 95'h283cc536d53aff37baed0122;
    stim[15] = 95'h5e758220a13af4e65b232979;
    stim[16] = 95'h556f739d8d0e96290a016256;
    stim[17] = 95'h2d50e217a2327dafe9ad69ae;
    stim[18] = 95'h49612b3fd159c3b02d93c202;
    stim[19] = 95'h417e02c3637690ae5cd77413;
    stim[20] = 95'h76d5bc6f46e51fefeb5b5e75;
    stim[21] = 95'h31f43634402892a2e071435e;
    stim[22] = 95'h3fe7cfb623e48eef4de9ba08;
    stim[23] = 95'h76aa16cc67e7a9396d1b2bb6;
    stim[24] = 95'h22f66e7b82166f9dd40253ed;
    stim[25] = 95'h364264c9661d0729f3d67adf;
    stim[26] = 95'h1cc80e94dd8a9df9a077320c;
    stim[27] = 95'h7fc839eec1e2841a9bbe9d9e;
    stim[28] = 95'h57f163589d07c5b2262861fa;
    stim[29] = 95'h1336e98dbdc3c32ebde57cb3;
    stim[30] = 95'h2196e5f19d5aec3c22246410;
    stim[31] = 95'h36f85919287789dc26a203f7;
    stim[32] = 95'h4941fe21ee5d462e5d0d424e;
    stim[33] = 95'h2bca364caf62d7c05c3bc885;
    stim[34] = 95'h6b039b8e1237634b1481265b;
    stim[35] = 95'h7321e09b0d962c3dbef5e514;
    stim[36] = 95'h7e7d3eb12a706abac572d714;
    stim[37] = 95'h3ab0c64a73d075b4af0690c2;
    stim[38] = 95'h73cd681dbb523754525cd61b;
    stim[39] = 95'h15cbad8e0ce5c80b7639c0e9;
    stim[40] = 95'h13b718ab7041d3820b15d92a;
    stim[41] = 95'h2f5b25d709b633fa371373d7;
    stim[42] = 95'h15252ca19108c6cede715f48;
    stim[43] = 95'h3fe35ba22ade5bfd80619d18;
    stim[44] = 95'h65acc0c8bafd7f895a6775bb;
    stim[45] = 95'h19f2acf8ebac5169ba7fb186;
    stim[46] = 95'h09016a0514cf17cb91cdbdec;
    stim[47] = 95'h0f04cf1f59485758113f3d01;
    stim[48] = 95'h1a8033037fc9c3d4400a646a;
    stim[49] = 95'h2bd481cc43d93ef83146972c;
    stim[50] = 95'h104a22ed33c6938de6b8006c;
    stim[51] = 95'h2762d811fccf7355a1ce1f9d;
    stim[52] = 95'h4b00cca98bbce08d7455c490;
    stim[53] = 95'h39634a96a08e2de47d3d4820;
    stim[54] = 95'h130c295d9d77e57f4d03b188;
    stim[55] = 95'h5455a74e99b7790f57876f87;
    stim[56] = 95'h656f8016e5d1a3e40d52d6a7;
    stim[57] = 95'h45d39bf30bfd9dda6178b95e;
    stim[58] = 95'h0d7718003f809d237fa7b154;
    stim[59] = 95'h042419edf873207dd96fa7c5;
    stim[60] = 95'h2aac7260e945cb7d1ae860df;
    stim[61] = 95'h2e11bf13548c783177832cbb;
    stim[62] = 95'h0d96f844d39eebb92101a063;
    stim[63] = 95'h5d066e67c98c95e7b5936208;
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
      expv[0] = 80'hxxxx2ee47f6957902ee4;
      expv[1] = 80'h39df39dfxxxxxxxxxxxx;
      expv[2] = 80'hade2ade2f9e5f9e5f9e5;
      expv[3] = 80'h88ccxxxxxxxxxxxx88cc;
      expv[4] = 80'h4be89acbxxxx04d3xxxx;
      expv[5] = 80'hxxxx716exxxxae7973a9;
      expv[6] = 80'hxxxxd1a6d1a6xxxxxxxx;
      expv[7] = 80'h3a47xxxx3a475596xxxx;
      expv[8] = 80'h062fdbdfxxxxbc8cxxxx;
      expv[9] = 80'hxxxxxxxxxxxxcfda6e5f;
      expv[10] = 80'hxxxxxxxxbbcf4cddxxxx;
      expv[11] = 80'hxxxxxxxxxxxxxxxx34ff;
      expv[12] = 80'h155d155d8d24xxxxxxxx;
      expv[13] = 80'h6f2axxxx8bdfxxxxxxxx;
      expv[14] = 80'hxxxx507975da75daaa75;
      expv[15] = 80'h4275b646xxxxxxxx0441;
      expv[16] = 80'hxxxxxxxxe73b1a1dxxxx;
      expv[17] = 80'hxxxxd35axxxxxxxxxxxx;
      expv[18] = 80'h5b27xxxx92c292c2a2b3;
      expv[19] = 80'hxxxxc6ed82fcc6ed215c;
      expv[20] = 80'hxxxxxxxx78dexxxxxxxx;
      expv[21] = 80'hc0e2xxxxxxxxxxxxxxxx;
      expv[22] = 80'h1ddexxxx7fcf9f6c7fcf;
      expv[23] = 80'hcfcfxxxxxxxxxxxxxxxx;
      expv[24] = 80'hxxxxxxxxxxxxxxxxxxxx;
      expv[25] = 80'hxxxxxxxx0e53xxxxxxxx;
      expv[26] = 80'h3bf3xxxx39901d29xxxx;
      expv[27] = 80'h73ddxxxxxxxxxxxxxxxx;
      expv[28] = 80'hxxxxafe2xxxxxxxx3a0f;
      expv[29] = 80'hxxxxxxxxxxxxxxxx865d;
      expv[30] = 80'hxxxx3ab5432d3ab5432d;
      expv[31] = 80'hxxxxxxxxxxxxxxxxxxxx;
      expv[32] = 80'hba1axxxxfc43fc43xxxx;
      expv[33] = 80'hb877b877xxxx5794xxxx;
      expv[34] = 80'h246ec696371cxxxxc696;
      expv[35] = 80'hxxxx1b2c7deb1b2cxxxx;
      expv[36] = 80'hxxxxd5758ae554e0xxxx;
      expv[37] = 80'h8c947561eb697561e7a0;
      expv[38] = 80'hxxxx6ea8e79axxxx6ea8;
      expv[39] = 80'hec732b979016xxxx5b1c;
      expv[40] = 80'hxxxx162b162bxxxxe083;
      expv[41] = 80'hxxxxxxxxxxxx136cxxxx;
      expv[42] = 80'hxxxxxxxxxxxx59432a4a;
      expv[43] = 80'hb744xxxx00c3xxxx7fc6;
      expv[44] = 80'hxxxx75faxxxxxxxxff12;
      expv[45] = 80'ha2d333e5xxxx33e5xxxx;
      expv[46] = 80'h2f97xxxxxxxxxxxxxxxx;
      expv[47] = 80'haeb0xxxx227e1e099e3e;
      expv[48] = 80'hxxxxff936606xxxxff93;
      expv[49] = 80'h03987df0628dxxxxxxxx;
      expv[50] = 80'hxxxx209445daxxxxxxxx;
      expv[51] = 80'hb023xxxxxxxxxxxxxxxx;
      expv[52] = 80'he8ab1779xxxx17799601;
      expv[53] = 80'hfa7afa7a72c6fa7a72c6;
      expv[54] = 80'hcafe2618xxxx52bb2618;
      expv[55] = 80'hxxxxxxxxxxxxa8abxxxx;
      expv[56] = 80'hxxxx47c8xxxx1aa5xxxx;
      expv[57] = 80'h3bb4c2f1xxxxxxxxxxxx;
      expv[58] = 80'h3a461aeexxxx7f01xxxx;
      expv[59] = 80'hf0e640fbxxxx0848xxxx;
      expv[60] = 80'hxxxx555896faxxxxxxxx;
      expv[61] = 80'ha918xxxxxxxxxxxxf062;
      expv[62] = 80'ha73d1b2df0894203d772;
      expv[63] = 80'hxxxxxxxxba0cdccfba0c;
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
