// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 161;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01141 dut (
    .clk(clk),
    .rst(in_vec[160:160]),
    .data_a(in_vec[159:128]),
    .addr_a(in_vec[127:96]),
    .addr_b(in_vec[95:64]),
    .data_b_in(in_vec[63:32]),
    .data_b_we(in_vec[31:0]),
    .data_b(out_vec[32:1]),
    .strobe_b(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 161'h10860e9929f2ec733eb07d0115d151c718560504f;
    stim[1] = 161'h1e2b6e04a23e538ae96d84515785f8350fbcf509e;
    stim[2] = 161'h0808043f215905b5c8f60fc906fa56e58d3041cbf;
    stim[3] = 161'h0af3da897112f10c9e8001966487339c84513b331;
    stim[4] = 161'h02dc42211c5da5aba164662bd211deccdfaf6c7e4;
    stim[5] = 161'h0b78ba6d3af8bbe21e09f792b6b3e68ea00e02b3b;
    stim[6] = 161'h099d2cbc9bf9996a9f468a82fcb5756222ecc5dd6;
    stim[7] = 161'h15f952ed6dacc7f56523c8e23dbccf67e31ab5776;
    stim[8] = 161'h004dc2769d65d74ba05f1501ef57170ce3510a5e5;
    stim[9] = 161'h0d934a137a9327059bb1320ccd9d5d8c849fbe03f;
    stim[10] = 161'h0b50004aa421d4f036f83b6c9a8f7279f8a854f4b;
    stim[11] = 161'h0b7d8babdcfa3e540e0b569abef164dde48fe4f31;
    stim[12] = 161'h019c8ae2033667fb8998a93323cab6a72c28775c7;
    stim[13] = 161'h07fa0510c4139f2b8b89da9405fb094062b20bc63;
    stim[14] = 161'h0a6c037c7f0926328475eadb6327974b25698ef7f;
    stim[15] = 161'h0741c75920455bbdffef269f84b6134af84e385cd;
    stim[16] = 161'h0736d2adf83b458d90c2768381e27e0240489a7b4;
    stim[17] = 161'h010ef6b77853b23bababc42ad41f273cd32e785b2;
    stim[18] = 161'h008f310f68ad48877901c70dfbbc06728dc7ce540;
    stim[19] = 161'h04e026befc531b01fd3587b332cc3329c2dc2a595;
    stim[20] = 161'h0225b798ce2f5953906dfbe7267bfd5a40417f6bb;
    stim[21] = 161'h0d1f76bb762181e4bca237dfc6c1845ec0e420ec5;
    stim[22] = 161'h084a5eb5a6ab6011009ff2204c2e6b431030a77da;
    stim[23] = 161'h0fb64ad115b4ca034dafe8b15e0d517b9a7bf5d4e;
    stim[24] = 161'h052e6e877fa7b6ac508d7bdbf018bab43e4e03a43;
    stim[25] = 161'h0de79512e0b2c9ba34993ce8a6a9be1d5097c4e05;
    stim[26] = 161'h024c2e9da8a6a5c44ee274e2de833227db2a92ab7;
    stim[27] = 161'h0a7424597b7a7c9b58caa7ec90cb2a4a4ce6c2f9d;
    stim[28] = 161'h02d0e737958da5573a28d6a3afa9e0aa2bd39ff2b;
    stim[29] = 161'h011d48605abf66ac88561eb1ac3c8ffa218b87dc4;
    stim[30] = 161'h0d6c132bbebfe84cc9b7c09281c3651cdcde7c379;
    stim[31] = 161'h0dad30c7f627936972a92b321055bb63e555dc65f;
    stim[32] = 161'h08c4f9f2842d0bdd182b506cb5bfcf86b21de070b;
    stim[33] = 161'h097b8d14cd388f5779c1cd60955b6c273ebfbba9b;
    stim[34] = 161'h0af0b5579b34ba4c620feead31394a07fd65954ee;
    stim[35] = 161'h057c5a4832073f29f0b450f1033e8fffd48046986;
    stim[36] = 161'h0659226a30a5a437ac1ea25ba00065def7006e7b6;
    stim[37] = 161'h04cf388fd14cacd718a21ac203ba23005c69bef88;
    stim[38] = 161'h00f8bea57a8e48c4cbf35d12ef394e804af7d6f80;
    stim[39] = 161'h03d282fbbc1d6a7181a6354a5fae35367f60ae8c4;
    stim[40] = 161'h09c6d5e4fdfbcc42b673f9719885f7b5b87f95f60;
    stim[41] = 161'h0c2fbae111e628ad41f30e68f67132e6aaf4cd455;
    stim[42] = 161'h060bfb5daa4ac4a0d9b055530b2948d9247ca3aad;
    stim[43] = 161'h005e1f1268e8f2a29b36dbd71200922fb9085b98e;
    stim[44] = 161'h0674a11928ee46b6609499b4e16c52c900d2638c5;
    stim[45] = 161'h148b85cef11ed086d4dd04063c64b2855076aca67;
    stim[46] = 161'h0c11a8ff41291c2006694c2960c922b278c0bb786;
    stim[47] = 161'h0eece3c742b5b33e697f975f45acedba9d70764ea;
    stim[48] = 161'h060d94f5cdd67fe42acf174cbd2a8e9cb1bffb8ec;
    stim[49] = 161'h0caceaed4f925e28e49cbcb81a2b89b0e3dea46c0;
    stim[50] = 161'h07080fbb2e0a7e01b44a90b1b475df800df326641;
    stim[51] = 161'h05154b7c19d6cd1a44fee94ddebcaa8c138d1b832;
    stim[52] = 161'h062100bf95a6d284d85cb6358bbcc1913be8c0957;
    stim[53] = 161'h01482180427f78146704aef5776dd8d9c1d9de202;
    stim[54] = 161'h0a4fa40d726f6b08d79f45836298cf5abcfd5f19f;
    stim[55] = 161'h0192021ecb1075027c6fc98a0aa661bef01075fec;
    stim[56] = 161'h07e8a5605b1d20a8857f5821a4ce6a5768a4e1a41;
    stim[57] = 161'h095e9e6d530db8afa667b49697edc6124cbaa8aba;
    stim[58] = 161'h0e57ece664a70d7c13baa629761fa188aa5694beb;
    stim[59] = 161'h001b224367b5cce9d08cb5efb3216b89707d78493;
    stim[60] = 161'h0b8f3717febb7b7745e50b1ca351114a4920f8e53;
    stim[61] = 161'h055ffc550e2806e8bb74050bffafaceb7433fb862;
    stim[62] = 161'h0c6a2e110200f7581c2263047db5409f319282aa0;
    stim[63] = 161'h0cf0d92fa8c7161b3b45ad83a0a68830de2fb3377;
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
      expv[0] = 33'hxxxxxxxxx;
      expv[1] = 33'hxxxxxxxxx;
      expv[2] = 33'hxxxxxxxxx;
      expv[3] = 33'h000000000;
      expv[4] = 33'h000000000;
      expv[5] = 33'h000000000;
      expv[6] = 33'h000000000;
      expv[7] = 33'h000000000;
      expv[8] = 33'h000000000;
      expv[9] = 33'h000000000;
      expv[10] = 33'h000000000;
      expv[11] = 33'h000000000;
      expv[12] = 33'h000000000;
      expv[13] = 33'h000000000;
      expv[14] = 33'h000000000;
      expv[15] = 33'h000000000;
      expv[16] = 33'h000000000;
      expv[17] = 33'h000000000;
      expv[18] = 33'h000000000;
      expv[19] = 33'h000000000;
      expv[20] = 33'h000000000;
      expv[21] = 33'h000000000;
      expv[22] = 33'h000000000;
      expv[23] = 33'h000000000;
      expv[24] = 33'h000000000;
      expv[25] = 33'h000000000;
      expv[26] = 33'h000000000;
      expv[27] = 33'h000000000;
      expv[28] = 33'h000000000;
      expv[29] = 33'h000000000;
      expv[30] = 33'h000000000;
      expv[31] = 33'h000000000;
      expv[32] = 33'h000000000;
      expv[33] = 33'h000000000;
      expv[34] = 33'h000000000;
      expv[35] = 33'h000000000;
      expv[36] = 33'h000000000;
      expv[37] = 33'h000000000;
      expv[38] = 33'h000000000;
      expv[39] = 33'h000000000;
      expv[40] = 33'h000000000;
      expv[41] = 33'h000000000;
      expv[42] = 33'h000000000;
      expv[43] = 33'h000000000;
      expv[44] = 33'h000000000;
      expv[45] = 33'h000000000;
      expv[46] = 33'h000000000;
      expv[47] = 33'h000000000;
      expv[48] = 33'h000000000;
      expv[49] = 33'h000000000;
      expv[50] = 33'h000000000;
      expv[51] = 33'h000000000;
      expv[52] = 33'h000000000;
      expv[53] = 33'h000000000;
      expv[54] = 33'h000000000;
      expv[55] = 33'h000000000;
      expv[56] = 33'h000000000;
      expv[57] = 33'h000000000;
      expv[58] = 33'h000000000;
      expv[59] = 33'h000000000;
      expv[60] = 33'h000000000;
      expv[61] = 33'h000000000;
      expv[62] = 33'h000000000;
      expv[63] = 33'h000000000;
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
