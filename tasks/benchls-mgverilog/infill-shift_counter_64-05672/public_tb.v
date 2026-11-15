// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 100;
  localparam OW = 96;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_05672 dut (
    .clock(clk),
    .resetn(in_vec[99:99]),
    .enable(in_vec[98:98]),
    .shift(in_vec[97:97]),
    .incr_cntl(in_vec[96:96]),
    .shift_in(in_vec[95:32]),
    .incr_val(in_vec[31:0]),
    .data_out(out_vec[95:64]),
    .shift_out(out_vec[63:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 100'h709ab884ca52497541df80f68;
    stim[1] = 100'h1bca424c5897db5d7c1d637cc;
    stim[2] = 100'hac8b4b9c6903fd5711626348b;
    stim[3] = 100'haf12dbeb4faa7de3f954c2732;
    stim[4] = 100'h94d4b8dca667c95808af5b6d9;
    stim[5] = 100'hdf264fa095631f0047d8dc272;
    stim[6] = 100'hb550ad664cbfa7f0b3ac2a61d;
    stim[7] = 100'hebff08122abbff46f55f92a81;
    stim[8] = 100'ha018d0c3c6424074d9747cb14;
    stim[9] = 100'hebc75230e18f0efde5ac6d8a7;
    stim[10] = 100'hd859e2fe26bbe2f315a2660fa;
    stim[11] = 100'h8d1a24855ca8e4da7944a0841;
    stim[12] = 100'ha636284d634212fe859057cc2;
    stim[13] = 100'hcc35090f3cc6cfad6acad35c4;
    stim[14] = 100'hceff0478464ae995bee659882;
    stim[15] = 100'hac26ab13479d8d0ed4bfb2444;
    stim[16] = 100'hc13f130781345a6a1f3e1916c;
    stim[17] = 100'h9ed21a766157312602729de47;
    stim[18] = 100'ha0b3d8f64dbabcf46cfb34107;
    stim[19] = 100'ha2fe91789cbba9c26d3dc9d3a;
    stim[20] = 100'haa5b7db9972bceb4b7c17620e;
    stim[21] = 100'h9b32e1eaa829b38a808770661;
    stim[22] = 100'h88c23f50726574685238ac57a;
    stim[23] = 100'hf58591b924e94ebae267ba00b;
    stim[24] = 100'ha8fafb918d57563595100d21f;
    stim[25] = 100'hc0f472c02ee69f91e809832c6;
    stim[26] = 100'he0246032c81fe1d4b710b1fdd;
    stim[27] = 100'hcf55508acc888296b6142000f;
    stim[28] = 100'hba2a10346b5908d98630c9feb;
    stim[29] = 100'hf4515fb37078f615a84a2d5f7;
    stim[30] = 100'hf298ced6902971157dd06d59e;
    stim[31] = 100'hdff73f1667633b07d88268424;
    stim[32] = 100'hbbd9d834c925e634d3dae9b48;
    stim[33] = 100'h89a0ab88a6571ce49c4824f8b;
    stim[34] = 100'hd74a6c29118c8f4f60c2cf2d2;
    stim[35] = 100'hb9edd3094ba828be45923b6a6;
    stim[36] = 100'h97fac15a7f52109141ecd3b8d;
    stim[37] = 100'hb5d990ab4af80a659c5feda30;
    stim[38] = 100'hd5036e181f7a93e22bbf1a69a;
    stim[39] = 100'h83dba5238a03f98da7d2963e6;
    stim[40] = 100'hef32bf0045ec6a13fd5f0a6b6;
    stim[41] = 100'hfd78efaf56c0d5d1800f367fc;
    stim[42] = 100'ha7113a4a7ed26c5c964ba4187;
    stim[43] = 100'habb90f154d8285dec05e06493;
    stim[44] = 100'h8a1a08e36df12286b98ec8a7a;
    stim[45] = 100'h95332e8bded34fb893239e918;
    stim[46] = 100'ha9b085144fb41852f3216b01a;
    stim[47] = 100'h89c1a082bb8a1b974ebd84536;
    stim[48] = 100'h91293d32b01d722d59f66364e;
    stim[49] = 100'hb2f4e9619fdac462a853cb36e;
    stim[50] = 100'he2d592784078061a8eb38196b;
    stim[51] = 100'hf9cbb829579098cea8bee008a;
    stim[52] = 100'ha30a239c9e0e85563a1e78ee2;
    stim[53] = 100'ha55639c48faf5bc7825be3e30;
    stim[54] = 100'hd37b188db981bce2a094e1f06;
    stim[55] = 100'h8658e302af9475bf18bdc2f7d;
    stim[56] = 100'he74533ae011a1064abb8e7f2c;
    stim[57] = 100'hb8908254b990eaf28a9b31ef3;
    stim[58] = 100'hcc5b2886e368827f1cc66ee93;
    stim[59] = 100'he1b56975cbe3b52bfcb4d5902;
    stim[60] = 100'h74b29a4865df20d1e39aaaf11;
    stim[61] = 100'h8a8a520296e832ba2bdea4e15;
    stim[62] = 100'hc22f701f7ff3e17458bfaa617;
    stim[63] = 100'hf21985e216387352dbee9de8e;
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
      expv[0] = 96'h000000000000000000000000;
      expv[1] = 96'h000000000000000000000000;
      expv[2] = 96'h000000000000000000000000;
      expv[3] = 96'h903fd571c8b4b9c6903fd571;
      expv[4] = 96'hfaa7de3ff12dbeb4faa7de3f;
      expv[5] = 96'hfaa7de3ff12dbeb4faa7de3f;
      expv[6] = 96'h7835a0b1f12dbeb57835a0b1;
      expv[7] = 96'hcbfa7f0b550ad664cbfa7f0b;
      expv[8] = 96'habbff46fbff08122abbff46f;
      expv[9] = 96'h6424074d018d0c3c6424074d;
      expv[10] = 96'h18f0efdebc75230e18f0efde;
      expv[11] = 96'h731750d8bc75230e731750d8;
      expv[12] = 96'h731750d8bc75230e731750d8;
      expv[13] = 96'h34212fe8636284d634212fe8;
      expv[14] = 96'h34212fe8636284d634212fe8;
      expv[15] = 96'h34212fe8636284d634212fe8;
      expv[16] = 96'h79d8d0edc26ab13479d8d0ed;
      expv[17] = 96'h79d8d0edc26ab13479d8d0ed;
      expv[18] = 96'h79d8d0edc26ab13479d8d0ed;
      expv[19] = 96'hdbabcf460b3d8f64dbabcf46;
      expv[20] = 96'hcbba9c262fe91789cbba9c26;
      expv[21] = 96'h72bceb4ba5b7db9972bceb4b;
      expv[22] = 96'h72bceb4ba5b7db9972bceb4b;
      expv[23] = 96'h72bceb4ba5b7db9972bceb4b;
      expv[24] = 96'h4e94ebae58591b924e94ebae;
      expv[25] = 96'hd57563598fafb918d5756359;
      expv[26] = 96'hd57563598fafb918d5756359;
      expv[27] = 96'h81fe1d4b0246032c81fe1d4b;
      expv[28] = 96'h81fe1d4b0246032c81fe1d4b;
      expv[29] = 96'hb5908d98a2a10346b5908d98;
      expv[30] = 96'h078f615a4515fb37078f615a;
      expv[31] = 96'h02971157298ced6902971157;
      expv[32] = 96'h8abd957b298ced698abd957b;
      expv[33] = 96'h925e634dbd9d834c925e634d;
      expv[34] = 96'h925e634dbd9d834c925e634d;
      expv[35] = 96'h9e8b561fbd9d834c9e8b561f;
      expv[36] = 96'hba828be49edd3094ba828be4;
      expv[37] = 96'hba828be49edd3094ba828be4;
      expv[38] = 96'haf80a6595d990ab4af80a659;
      expv[39] = 96'h6b724cf35d990ab56b724cf3;
      expv[40] = 96'h6b724cf35d990ab56b724cf3;
      expv[41] = 96'h5ec6a13ff32bf0045ec6a13f;
      expv[42] = 96'h6c0d5d18d78efaf56c0d5d18;
      expv[43] = 96'hed26c5c97113a4a7ed26c5c9;
      expv[44] = 96'hd8285decbb90f154d8285dec;
      expv[45] = 96'hd8285decbb90f154d8285dec;
      expv[46] = 96'hd8285decbb90f154d8285dec;
      expv[47] = 96'hfb41852f9b085144fb41852f;
      expv[48] = 96'hfb41852f9b085144fb41852f;
      expv[49] = 96'hfb41852f9b085144fb41852f;
      expv[50] = 96'hfdac462a2f4e9619fdac462a;
      expv[51] = 96'h078061a82d592784078061a8;
      expv[52] = 96'h79098cea9cbb829579098cea;
      expv[53] = 96'he0e8556330a239c9e0e85563;
      expv[54] = 96'hfaf5bc7855639c48faf5bc78;
      expv[55] = 96'h0443db7e55639c490443db7e;
      expv[56] = 96'h0443db7e55639c490443db7e;
      expv[57] = 96'h11a1064a74533ae011a1064a;
      expv[58] = 96'h990eaf288908254b990eaf28;
      expv[59] = 96'h990eaf288908254b990eaf28;
      expv[60] = 96'h000000000000000000000000;
      expv[61] = 96'h000000000000000000000000;
      expv[62] = 96'h000000000000000000000000;
      expv[63] = 96'h000000000000000000000000;
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
