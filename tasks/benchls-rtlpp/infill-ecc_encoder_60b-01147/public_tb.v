// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 60;
  localparam OW = 68;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_01147 dut (
    .din(in_vec[59:0]),
    .dout(out_vec[67:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 60'hf20fd1b2f9db1e0;
    stim[1] = 60'hfc979fc85d61454;
    stim[2] = 60'hd04c8c52cfe735a;
    stim[3] = 60'h0bdf22deaaff5cc;
    stim[4] = 60'hb90304613e0a82c;
    stim[5] = 60'h1e62d5a285a83e1;
    stim[6] = 60'haac3bd73f7e4fdc;
    stim[7] = 60'h27204c0af6b7e99;
    stim[8] = 60'he8ba391e2388f38;
    stim[9] = 60'h99382433ef49059;
    stim[10] = 60'h77e97ed610239ac;
    stim[11] = 60'hc01142f084563be;
    stim[12] = 60'ha52ccd92f59ddf0;
    stim[13] = 60'ha0b9c90ae70c958;
    stim[14] = 60'ha52753b8eb55d31;
    stim[15] = 60'h6987f195753a772;
    stim[16] = 60'h459ef3e4c8e67bd;
    stim[17] = 60'h5c404671cef3fe8;
    stim[18] = 60'h99c98f4b40e9d6c;
    stim[19] = 60'hf752f73a48ac19f;
    stim[20] = 60'h3971648c4a6bc16;
    stim[21] = 60'hcc7d61d5ec41330;
    stim[22] = 60'h84ff129b65d46a3;
    stim[23] = 60'hb860ffc33108f8b;
    stim[24] = 60'hae37bf591cea4ee;
    stim[25] = 60'hc010034eec3cf77;
    stim[26] = 60'h967046b7e2a03cb;
    stim[27] = 60'h697bc2cf316b668;
    stim[28] = 60'h29795a70cc8bbba;
    stim[29] = 60'h830883f07df3974;
    stim[30] = 60'h1976af0876c8820;
    stim[31] = 60'he836005ee941851;
    stim[32] = 60'h136cb23c1e8866b;
    stim[33] = 60'h18c764c4fd6bbf6;
    stim[34] = 60'h28e05783ab42845;
    stim[35] = 60'h3a16783ef2a6fcc;
    stim[36] = 60'h8c71fa12f7372c7;
    stim[37] = 60'h40481c5e259c250;
    stim[38] = 60'h18bbda7a637c3a9;
    stim[39] = 60'h9c5c10a704b8b91;
    stim[40] = 60'h4a36579c1023c5e;
    stim[41] = 60'h21f4eeaa9153a76;
    stim[42] = 60'h78579d8bd81f76a;
    stim[43] = 60'h36be787af3446e7;
    stim[44] = 60'h998d49c65ec3900;
    stim[45] = 60'hdde4896abd0a261;
    stim[46] = 60'h6223415814171ae;
    stim[47] = 60'hdba4da514c0390c;
    stim[48] = 60'hb7f910ea9442526;
    stim[49] = 60'hea658bc0e2bbed1;
    stim[50] = 60'h0a93db33f29b467;
    stim[51] = 60'hdce6669923a6eaf;
    stim[52] = 60'ha24df6085ba7e66;
    stim[53] = 60'hc83b3ca6e70e327;
    stim[54] = 60'hfd2484f8aaaca5c;
    stim[55] = 60'h406d25d8469102d;
    stim[56] = 60'h7f8258f53267361;
    stim[57] = 60'h2884d104dea5456;
    stim[58] = 60'h378cac83d2d454c;
    stim[59] = 60'h8cdc3a0d08638af;
    stim[60] = 60'hab6d1bf53bd6d29;
    stim[61] = 60'hf53e2ebfc96cd2f;
    stim[62] = 60'h67471e4e3c4cfb6;
    stim[63] = 60'hb5a263b203bbf32;
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
      expv[0] = 68'hf20fd1b2f9db1e05b;
      expv[1] = 68'hfc979fc85d614548d;
      expv[2] = 68'hd04c8c52cfe735a74;
      expv[3] = 68'h0bdf22deaaff5ccc9;
      expv[4] = 68'hb90304613e0a82c56;
      expv[5] = 68'h1e62d5a285a83e152;
      expv[6] = 68'haac3bd73f7e4fdc19;
      expv[7] = 68'h27204c0af6b7e9986;
      expv[8] = 68'he8ba391e2388f3861;
      expv[9] = 68'h99382433ef4905973;
      expv[10] = 68'h77e97ed610239ac63;
      expv[11] = 68'hc01142f084563be09;
      expv[12] = 68'ha52ccd92f59ddf0e6;
      expv[13] = 68'ha0b9c90ae70c95806;
      expv[14] = 68'ha52753b8eb55d31dd;
      expv[15] = 68'h6987f195753a772ad;
      expv[16] = 68'h459ef3e4c8e67bdc8;
      expv[17] = 68'h5c404671cef3fe8b3;
      expv[18] = 68'h99c98f4b40e9d6c59;
      expv[19] = 68'hf752f73a48ac19f11;
      expv[20] = 68'h3971648c4a6bc16ce;
      expv[21] = 68'hcc7d61d5ec41330d3;
      expv[22] = 68'h84ff129b65d46a398;
      expv[23] = 68'hb860ffc33108f8bd4;
      expv[24] = 68'hae37bf591cea4ee66;
      expv[25] = 68'hc010034eec3cf77bb;
      expv[26] = 68'h967046b7e2a03cb5d;
      expv[27] = 68'h697bc2cf316b6683c;
      expv[28] = 68'h29795a70cc8bbbab0;
      expv[29] = 68'h830883f07df39747c;
      expv[30] = 68'h1976af0876c88203d;
      expv[31] = 68'he836005ee94185122;
      expv[32] = 68'h136cb23c1e8866b0a;
      expv[33] = 68'h18c764c4fd6bbf62e;
      expv[34] = 68'h28e05783ab428453f;
      expv[35] = 68'h3a16783ef2a6fcc6d;
      expv[36] = 68'h8c71fa12f7372c768;
      expv[37] = 68'h40481c5e259c250e9;
      expv[38] = 68'h18bbda7a637c3a954;
      expv[39] = 68'h9c5c10a704b8b9186;
      expv[40] = 68'h4a36579c1023c5e04;
      expv[41] = 68'h21f4eeaa9153a767a;
      expv[42] = 68'h78579d8bd81f76ac0;
      expv[43] = 68'h36be787af3446e75b;
      expv[44] = 68'h998d49c65ec390018;
      expv[45] = 68'hdde4896abd0a26191;
      expv[46] = 68'h6223415814171aee9;
      expv[47] = 68'hdba4da514c0390ca9;
      expv[48] = 68'hb7f910ea94425265a;
      expv[49] = 68'hea658bc0e2bbed190;
      expv[50] = 68'h0a93db33f29b46774;
      expv[51] = 68'hdce6669923a6eaf2b;
      expv[52] = 68'ha24df6085ba7e6661;
      expv[53] = 68'hc83b3ca6e70e327c1;
      expv[54] = 68'hfd2484f8aaaca5c17;
      expv[55] = 68'h406d25d8469102d8f;
      expv[56] = 68'h7f8258f53267361e3;
      expv[57] = 68'h2884d104dea54561d;
      expv[58] = 68'h378cac83d2d454c5c;
      expv[59] = 68'h8cdc3a0d08638af67;
      expv[60] = 68'hab6d1bf53bd6d290c;
      expv[61] = 68'hf53e2ebfc96cd2fe4;
      expv[62] = 68'h67471e4e3c4cfb645;
      expv[63] = 68'hb5a263b203bbf32e3;
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
