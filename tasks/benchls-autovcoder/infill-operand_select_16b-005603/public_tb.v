// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 48;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_005603 dut (
    .instr(in_vec[47:32]),
    .rsVal(in_vec[31:16]),
    .rtVal(in_vec[15:0]),
    .opA(out_vec[31:16]),
    .opB(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 48'h9573d0f71615;
    stim[1] = 48'hbfda3f11ee5d;
    stim[2] = 48'hef6197b6f016;
    stim[3] = 48'h1aca1cecf3f7;
    stim[4] = 48'hddbccd960fbb;
    stim[5] = 48'h4aab954b59a0;
    stim[6] = 48'h476ca87ac7bc;
    stim[7] = 48'haee1c902f68c;
    stim[8] = 48'h86eb503b95c9;
    stim[9] = 48'hbc09661de3af;
    stim[10] = 48'h25b614616ab9;
    stim[11] = 48'hca9d31e51a8d;
    stim[12] = 48'hd5d2ab697170;
    stim[13] = 48'h9bfbab1dd056;
    stim[14] = 48'h050e272f5b9b;
    stim[15] = 48'h4d671c62b892;
    stim[16] = 48'h6499a76cd21c;
    stim[17] = 48'h651802bc91fb;
    stim[18] = 48'h08d0e034bf60;
    stim[19] = 48'he8b0339c4e95;
    stim[20] = 48'h8ee660f8e0ed;
    stim[21] = 48'h5eed156f3470;
    stim[22] = 48'hbc866d24252c;
    stim[23] = 48'h2b6aa7f5baa3;
    stim[24] = 48'hbb48c0d023a6;
    stim[25] = 48'hf617a56e6b43;
    stim[26] = 48'h0a6f789240e4;
    stim[27] = 48'h0c7aa9da0457;
    stim[28] = 48'ha1833ceaef57;
    stim[29] = 48'h79e22aa84ba3;
    stim[30] = 48'h81b82db3109c;
    stim[31] = 48'h9a02ad8955d3;
    stim[32] = 48'he8544917055a;
    stim[33] = 48'h7be0bc100bf9;
    stim[34] = 48'hf36847db6b0f;
    stim[35] = 48'hf0e95b47cb1e;
    stim[36] = 48'ha3b517b30ec9;
    stim[37] = 48'h2423ed367432;
    stim[38] = 48'h2f48501f1910;
    stim[39] = 48'hf462b5e0ae1f;
    stim[40] = 48'h6cc2d07748c0;
    stim[41] = 48'hd0000edb358b;
    stim[42] = 48'h1d79b6cfd539;
    stim[43] = 48'h6dc439f9cc5f;
    stim[44] = 48'hd25ec1da1e23;
    stim[45] = 48'h8e3e43154a56;
    stim[46] = 48'h48ae4350f61e;
    stim[47] = 48'h81f8b6f316e7;
    stim[48] = 48'h5ddfb7ce368e;
    stim[49] = 48'h171ea644b113;
    stim[50] = 48'h5abdb19fc35e;
    stim[51] = 48'hd49c548c0fc1;
    stim[52] = 48'hc3b41bafd79c;
    stim[53] = 48'hcd1a50ae5559;
    stim[54] = 48'h13beaae5ae63;
    stim[55] = 48'h916a9981bf6c;
    stim[56] = 48'h9a3e6f6f5fb4;
    stim[57] = 48'h0c5df3b299e1;
    stim[58] = 48'h20d072309a7d;
    stim[59] = 48'h84027379a124;
    stim[60] = 48'he5df268c6b41;
    stim[61] = 48'hd9eed5abd188;
    stim[62] = 48'hdb33bb83a14a;
    stim[63] = 48'hbca6650b40d6;
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
      expv[0] = 32'hd0f70073;
      expv[1] = 32'h3f11001a;
      expv[2] = 32'h97b6f016;
      expv[3] = 32'h1cec0000;
      expv[4] = 32'hcd960fbb;
      expv[5] = 32'h954b000b;
      expv[6] = 32'ha87a000c;
      expv[7] = 32'hc9020001;
      expv[8] = 32'h503b000b;
      expv[9] = 32'h661d0009;
      expv[10] = 32'h1461fdb6;
      expv[11] = 32'h31e50001;
      expv[12] = 32'hab697170;
      expv[13] = 32'hab1dfffb;
      expv[14] = 32'h272f0000;
      expv[15] = 32'h1c620007;
      expv[16] = 32'ha76cff99;
      expv[17] = 32'h02bc0018;
      expv[18] = 32'he0340000;
      expv[19] = 32'h339c4e95;
      expv[20] = 32'h60f80006;
      expv[21] = 32'h156f000d;
      expv[22] = 32'h6d240006;
      expv[23] = 32'ha7f5006a;
      expv[24] = 32'hc0d00008;
      expv[25] = 32'ha56e6b43;
      expv[26] = 32'h78920000;
      expv[27] = 32'ha9da0000;
      expv[28] = 32'h3cea0003;
      expv[29] = 32'h2aa8ffe2;
      expv[30] = 32'h2db3fff8;
      expv[31] = 32'had890002;
      expv[32] = 32'h4917055a;
      expv[33] = 32'hbc10ffe0;
      expv[34] = 32'h47db6b0f;
      expv[35] = 32'h5b47cb1e;
      expv[36] = 32'h17b30015;
      expv[37] = 32'hed36fc23;
      expv[38] = 32'h501f0048;
      expv[39] = 32'hb5e0ae1f;
      expv[40] = 32'hd077ffc2;
      expv[41] = 32'h0edb358b;
      expv[42] = 32'hb6cf0000;
      expv[43] = 32'h39f9ffc4;
      expv[44] = 32'hc1da1e23;
      expv[45] = 32'h4315fffe;
      expv[46] = 32'h4350000e;
      expv[47] = 32'hb6f3fff8;
      expv[48] = 32'hb7ce001f;
      expv[49] = 32'ha6440000;
      expv[50] = 32'hb19f001d;
      expv[51] = 32'h548c0fc1;
      expv[52] = 32'h1bafffb4;
      expv[53] = 32'h50ae0001;
      expv[54] = 32'haae50000;
      expv[55] = 32'h9981006a;
      expv[56] = 32'h6f6ffffe;
      expv[57] = 32'hf3b20000;
      expv[58] = 32'h723000d0;
      expv[59] = 32'h73790002;
      expv[60] = 32'h268c6b41;
      expv[61] = 32'hd5abd188;
      expv[62] = 32'hbb83a14a;
      expv[63] = 32'h650b0006;
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
