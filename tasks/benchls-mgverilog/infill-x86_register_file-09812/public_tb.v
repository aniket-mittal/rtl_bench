// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 68;
  localparam OW = 106;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_09812 dut (
    .clk(clk),
    .d(in_vec[67:36]),
    .wr(in_vec[35:35]),
    .wrfl(in_vec[34:34]),
    .wrhi(in_vec[33:33]),
    .rst(in_vec[32:32]),
    .addr_a(in_vec[31:28]),
    .addr_b(in_vec[27:24]),
    .addr_c(in_vec[23:20]),
    .addr_d(in_vec[19:16]),
    .addr_s(in_vec[15:14]),
    .iflags(in_vec[13:5]),
    .word_op(in_vec[4:4]),
    .a_byte(in_vec[3:3]),
    .b_byte(in_vec[2:2]),
    .c_byte(in_vec[1:1]),
    .wr_ip0(in_vec[0:0]),
    .a(out_vec[105:90]),
    .b(out_vec[89:74]),
    .c(out_vec[73:58]),
    .cs(out_vec[57:42]),
    .ip(out_vec[41:26]),
    .s(out_vec[25:10]),
    .flags(out_vec[9:1]),
    .cx_zero(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 68'h97be48e7b9ba515a3;
    stim[1] = 68'h370dfa677858a2f2e;
    stim[2] = 68'h2625275228795affa;
    stim[3] = 68'h51fe9cb96f221fcae;
    stim[4] = 68'h1925819b239cf2bef;
    stim[5] = 68'he81d074cce5156a90;
    stim[6] = 68'haec7a8bca62da0704;
    stim[7] = 68'h1671843ae0d9e0185;
    stim[8] = 68'h79e935a5e20bb656b;
    stim[9] = 68'h352fa78de91fb841f;
    stim[10] = 68'hc74cf456885b42ac9;
    stim[11] = 68'hec0e986f46c7920be;
    stim[12] = 68'hf7ca4f8e87e90b3d6;
    stim[13] = 68'hfd5bbcb4ec95e2b02;
    stim[14] = 68'ha732afa721faf9424;
    stim[15] = 68'h054373cf012f9f0fa;
    stim[16] = 68'h91a16e310fbbbbe67;
    stim[17] = 68'h9bd638f06566cd275;
    stim[18] = 68'h43d484f0863a8b65e;
    stim[19] = 68'he1dacc0746e3509df;
    stim[20] = 68'h9fb3ec0ea78c297b0;
    stim[21] = 68'h80e834ebebe459ab0;
    stim[22] = 68'h31d3931b8f221c7b2;
    stim[23] = 68'h29e0d500887233c86;
    stim[24] = 68'h9c0ccc7a20e7be575;
    stim[25] = 68'h5a7325604c5793c16;
    stim[26] = 68'h1b154d4ba203548c8;
    stim[27] = 68'hb4a80ffa0b9ec88e8;
    stim[28] = 68'hbea4da40e8ddcd632;
    stim[29] = 68'h4d379beccf78e804a;
    stim[30] = 68'h73957259eea21ddc3;
    stim[31] = 68'hf22bf288027ea96ac;
    stim[32] = 68'h91fef56ea6b921327;
    stim[33] = 68'haaa2259d802d7c810;
    stim[34] = 68'hb9c3729067afd9c22;
    stim[35] = 68'h548e204f4e7b8415c;
    stim[36] = 68'hadd0025263555fc89;
    stim[37] = 68'h025b7e30c14d13a3e;
    stim[38] = 68'h150ed86ac9cea9e19;
    stim[39] = 68'hb26c1f26af19df219;
    stim[40] = 68'h08c498ad2e1c2fa49;
    stim[41] = 68'h85067d4c29c98d024;
    stim[42] = 68'hca380d81a2b8145ae;
    stim[43] = 68'hef01e8be61d7825fb;
    stim[44] = 68'h7dbae27960d8e7738;
    stim[45] = 68'h5aeb9f718c66de3ed;
    stim[46] = 68'h0fbb9ad6e94e0bc71;
    stim[47] = 68'h1efb340a861f9f16b;
    stim[48] = 68'hc5662245405a7a577;
    stim[49] = 68'h8e1af7f4e61e3e1ae;
    stim[50] = 68'h8096ad86492e70152;
    stim[51] = 68'hd93fd45981478a604;
    stim[52] = 68'h8c27be41ad40aca17;
    stim[53] = 68'h4f5bde5ca7224fa2d;
    stim[54] = 68'hac6cb988474066b37;
    stim[55] = 68'h7088ee7c64bb2424e;
    stim[56] = 68'hc892882f8ded49f3d;
    stim[57] = 68'hdcd784e74443adf5c;
    stim[58] = 68'hb47bcf628046ec7e7;
    stim[59] = 68'h1bb9865c83e6f33df;
    stim[60] = 68'hf4cf57ed69c78db33;
    stim[61] = 68'he8c0197060120d9cd;
    stim[62] = 68'h777faf45ab8200863;
    stim[63] = 68'ha85e8dace8c5c2188;
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
      expv[0] = 106'hxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 106'h0000000000003c003ffc0000001;
      expv[2] = 106'h000000003c003c003ffc0000001;
      expv[3] = 106'h3ffc000940097c003ffc0000000;
      expv[4] = 106'h00003c0000003c003ffc00003cb;
      expv[5] = 106'h3ffc000000003c003ffc3c003cb;
      expv[6] = 106'h0000000940003c003ffc00002a9;
      expv[7] = 106'h000000003c003c003ffc00002a9;
      expv[8] = 106'h001c400000003c003ffc3c00019;
      expv[9] = 106'h3c0000003ffc3c003ffc3fef257;
      expv[10] = 106'h000001d329e37c003ffc0000041;
      expv[11] = 106'h000d400000003c003ffc0000041;
      expv[12] = 106'h00003ffc3c003c003ffc3fef20b;
      expv[13] = 106'h00003c0000003c003ffc000020b;
      expv[14] = 106'h00003ffc3fef3c003ffc3fef2b1;
      expv[15] = 106'h000029ccbffc3c003ffc29e36b1;
      expv[16] = 106'h3ffc29e369e37c003ffc3fef2b1;
      expv[17] = 106'h01d33fe9c0003c003ffc29e36b1;
      expv[18] = 106'h3fe6c0003fef3c003ffc3fef127;
      expv[19] = 106'h3fe6fffc00003c003ffc213c127;
      expv[20] = 106'h0000213c00003c003ffc3fef09d;
      expv[21] = 106'h29e37ffc00003c003ffc3fef09d;
      expv[22] = 106'h3ffc203a3ffa3c003ffc29e35aa;
      expv[23] = 106'h213c00003ffa3c003ffc213c1aa;
      expv[24] = 106'h13e3bffc00003c003ffc29e35aa;
      expv[25] = 106'h00003fe4c0003c003ffc213c1aa;
      expv[26] = 106'h000313e380003c003ffc3c003c0;
      expv[27] = 106'h29e37c003ffc3c003ffc3fef3c0;
      expv[28] = 106'h213c000000003c003ffc29e37c0;
      expv[29] = 106'h3ffc0000213c3c003ffc3fef162;
      expv[30] = 106'h3ffb3fef3fe93c003ffc29e3404;
      expv[31] = 106'h3fe540003ffc3c003ffc3fef1dc;
      expv[32] = 106'h000029e37c003c003ffc213c1dc;
      expv[33] = 106'h13e3a47f80003c003ffc29e35dc;
      expv[34] = 106'h09677fef3ffc3c003ffc3fef1dc;
      expv[35] = 106'h3ffc000029e37c003ffc3c001c2;
      expv[36] = 106'h00000d3acd3afc003ffc29e3414;
      expv[37] = 106'h00164013c0003c003ffc213c3c8;
      expv[38] = 106'h3c0036903ffc3c003ffc3fef3a2;
      expv[39] = 106'h3ffc1f8c3c003c003ffc29e35e0;
      expv[40] = 106'h3ffc1f8c36903c003ffc29e35e0;
      expv[41] = 106'h3c0036903c003c003ffc29e35e0;
      expv[42] = 106'h0001a9e3613c3c003ffc3c001e0;
      expv[43] = 106'h3fe047c980003c003ffc213c1e0;
      expv[44] = 106'h3fe387c9a13c3c003ffc3c0025e;
      expv[45] = 106'h3690001f40003c003ffc29e3772;
      expv[46] = 106'h3c0000003ffc3c003ffc361ab72;
      expv[47] = 106'h0003dfa07ffc3c003ffc29e37c6;
      expv[48] = 106'h26b5801fb61a8002bffc361abc6;
      expv[49] = 106'h0003ffe07ffc0002bffc29e3656;
      expv[50] = 106'h0002a386bffc0002bffc213c21a;
      expv[51] = 106'h1fa07fe689674002bffc361a814;
      expv[52] = 106'h07dc7fe6bff58002bffc29e3414;
      expv[53] = 106'h00000009e309c002bffc29e3414;
      expv[54] = 106'h096740173ff58002bffc0002814;
      expv[55] = 106'h001729e369e34002bffc0002ab2;
      expv[56] = 106'h07dc7ffc07dc4002bffc2f90424;
      expv[57] = 106'h00170017003d0002bffc29e3424;
      expv[58] = 106'h17358017001c0002bffc29e35f4;
      expv[59] = 106'h3ffd3ffc001c0002bffc00165f4;
      expv[60] = 106'h0002b69000000002a19729e35f4;
      expv[61] = 106'h3ff5bfe07d33c002a19729e35b2;
      expv[62] = 106'h29e340167ff00002a197001659c;
      expv[63] = 106'h001676900d3ac002a197001659c;
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
