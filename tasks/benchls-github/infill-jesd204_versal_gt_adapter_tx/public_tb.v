// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 70;
  localparam OW = 174;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  jesd204_versal_gt_adapter_tx dut (
    .usr_clk(clk),
    .tx_data(in_vec[69:6]),
    .tx_header(in_vec[5:4]),
    .tx_charisk(in_vec[3:0]),
    .txdata(out_vec[173:46]),
    .txheader(out_vec[45:40]),
    .txctrl0(out_vec[39:24]),
    .txctrl1(out_vec[23:8]),
    .txctrl2(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 70'h3acf34537b89830002;
    stim[1] = 70'h2cedb3fbbb64521433;
    stim[2] = 70'h0fdb366355d1e94b18;
    stim[3] = 70'h1815bb0911e400379e;
    stim[4] = 70'h075b6af93aefcbc48e;
    stim[5] = 70'h018b8667842a98a082;
    stim[6] = 70'h2950c6d75caf3b38fb;
    stim[7] = 70'h04823a47b772192b5c;
    stim[8] = 70'h09dfb4df36b938d5e1;
    stim[9] = 70'h163a51fd6ea4cb9746;
    stim[10] = 70'h087426852fc0cede53;
    stim[11] = 70'h01dd4c04fea142e060;
    stim[12] = 70'h31196d9f437b59d990;
    stim[13] = 70'h266a939a57aa9e6d44;
    stim[14] = 70'h1474e233ffa02fc077;
    stim[15] = 70'h3ffbf7d4713de371dd;
    stim[16] = 70'h1d3c76294a68c0affc;
    stim[17] = 70'h3f59ae64de5fcadf01;
    stim[18] = 70'h24c72d49eabd44894c;
    stim[19] = 70'h39a4e984a467e36108;
    stim[20] = 70'h13de5ecc5f296edadc;
    stim[21] = 70'h2795845c245b3f437f;
    stim[22] = 70'h3f65ee057a9e02a438;
    stim[23] = 70'h23382dbfe8dc08a696;
    stim[24] = 70'h06e3800021ebe3b7b5;
    stim[25] = 70'h151514179f7b78bab3;
    stim[26] = 70'h2e4a548e0924b352f6;
    stim[27] = 70'h1df55503d5319f3474;
    stim[28] = 70'h3bc1865e361422408f;
    stim[29] = 70'h2740ba99f06b0d7f4c;
    stim[30] = 70'h184ee30984ae9373af;
    stim[31] = 70'h14cd9a39ad3473f32c;
    stim[32] = 70'h1ebdb005fd3f1fac5c;
    stim[33] = 70'h30bd39fab0c96804ee;
    stim[34] = 70'h35c9001b8bf12716d5;
    stim[35] = 70'h3e953c475081efae89;
    stim[36] = 70'h00aa1ba810307a849b;
    stim[37] = 70'h3cc18f1eba03ef1ec2;
    stim[38] = 70'h2040e23bae8067f819;
    stim[39] = 70'h324f27d381951d1c77;
    stim[40] = 70'h2709dfb8fef6cbb564;
    stim[41] = 70'h0314aa75235222b1fb;
    stim[42] = 70'h30a957bb54fd64685c;
    stim[43] = 70'h0c29ac3731f01f76a9;
    stim[44] = 70'h240dffb883b9503dfe;
    stim[45] = 70'h2025fe17b6de95ce4e;
    stim[46] = 70'h3d8f07e5cd237fa1a9;
    stim[47] = 70'h113555d1a0673af6b7;
    stim[48] = 70'h13f69b5a5ae3350b01;
    stim[49] = 70'h079f83d1734b809fb9;
    stim[50] = 70'h08426f0735b5570a9b;
    stim[51] = 70'h39668802a5ea79cff7;
    stim[52] = 70'h2d43af41daa8809cfa;
    stim[53] = 70'h0af2975c6b6e6b8b8d;
    stim[54] = 70'h0c6b750b6122d43b41;
    stim[55] = 70'h3cfc800963234aafc5;
    stim[56] = 70'h128d3d3164419d8cde;
    stim[57] = 70'h2b80c93e1da16fad26;
    stim[58] = 70'h3137278aa6c0497aac;
    stim[59] = 70'h39a0145467d0fa528e;
    stim[60] = 70'h0805c7474ce441b30c;
    stim[61] = 70'h2837007f045c3fe781;
    stim[62] = 70'h1c620af6bd43bbf99e;
    stim[63] = 70'h2011af0c68f53a5817;
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
      expv[0] = 174'h0000000000000000xxxxxxxxxxxxxxxxxx0000000000;
      expv[1] = 174'h0000000000000000000c191deca2cf35c00000000000;
      expv[2] = 174'h00000000000000000284a26dddfcdb73430000000000;
      expv[3] = 174'h00000000000000000d2978baac66cdbf020000000000;
      expv[4] = 174'h00000000000000001ec00278890dda81820000000000;
      expv[5] = 174'h0000000000000000123d3f75c9f56dae000000000000;
      expv[6] = 174'h0000000000000000105195421e661d18000000000000;
      expv[7] = 174'h000000000000000031cdcf53aeb630a9430000000000;
      expv[8] = 174'h00000000000000002d4984eede25c412020000000000;
      expv[9] = 174'h00000000000000003ab1c9d6cfb2dfb9010000000000;
      expv[10] = 174'h00000000000000002e9d32576bf8a5c6800000000000;
      expv[11] = 174'h000000000000000027b7303f4a1642e1020000000000;
      expv[12] = 174'h000000000000000020742857f2032bb8010000000000;
      expv[13] = 174'h000000000000000019b9adec2f9b6988c20000000000;
      expv[14] = 174'h00000000000000002b67955ea59c9566400000000000;
      expv[15] = 174'h0000000000000000203f405ffcc472e2830000000000;
      expv[16] = 174'h000000000000000038ec7bc8e2befdffc20000000000;
      expv[17] = 174'h00000000000000003f5031652946e3cb830000000000;
      expv[18] = 174'h00000000000000000fb53fa7b26759afc00000000000;
      expv[19] = 174'h000000000000000029122bd5792b4e32400000000000;
      expv[20] = 174'h0000000000000000086c7e6252197259c00000000000;
      expv[21] = 174'h000000000000000035b7694fa337a7bc820000000000;
      expv[22] = 174'h00000000000000002c2fcda243a21a9e430000000000;
      expv[23] = 174'h000000000000000002540795ea077a6fc30000000000;
      expv[24] = 174'h0000000000000000165103b17fdb41cc420000000000;
      expv[25] = 174'h00000000000000001edc7d7840001c76030000000000;
      expv[26] = 174'h000000000000000015d1edef9e828a8a830000000000;
      expv[27] = 174'h000000000000000034acd2490712a527430000000000;
      expv[28] = 174'h000000000000000022cf98cabc0aaafb830000000000;
      expv[29] = 174'h000000000000000010244286c7a6183dc00000000000;
      expv[30] = 174'h00000000000000002feb0d60f995d02e400000000000;
      expv[31] = 174'h00000000000000001cec9752190c7721810000000000;
      expv[32] = 174'h00000000000000000cfce2cb59c59b32810000000000;
      expv[33] = 174'h0000000000000000235f8fcbfa00dbd7820000000000;
      expv[34] = 174'h000000000000000032016930d5f9cbd0c10000000000;
      expv[35] = 174'h0000000000000000368e48fd1d80093ac20000000000;
      expv[36] = 174'h0000000000000000175f7810ae23ca97c00000000000;
      expv[37] = 174'h00000000000000001215e0c0815d8550020000000000;
      expv[38] = 174'h0000000000000000378f7c05d78f1833c00000000000;
      expv[39] = 174'h000000000000000001fe60175dc47020420000000000;
      expv[40] = 174'h0000000000000000238b8a981cbe4f24c30000000000;
      expv[41] = 174'h00000000000000002add36f7f1dfb90e410000000000;
      expv[42] = 174'h000000000000000038d444ac4ae5528c030000000000;
      expv[43] = 174'h000000000000000021626bf2addea950c20000000000;
      expv[44] = 174'h000000000000000016ef80f8cec35943010000000000;
      expv[45] = 174'h00000000000000003bc0a9dc11dffb02430000000000;
      expv[46] = 174'h0000000000000000273a97b6de87fa40400000000000;
      expv[47] = 174'h0000000000000000185fec4b3a7e0f1bc10000000000;
      expv[48] = 174'h000000000000000016f5ce6058baaac8830000000000;
      expv[49] = 174'h00000000000000000d0acc75a5ad96fc800000000000;
      expv[50] = 174'h00000000000000001f901d2ce8bc1f9e030000000000;
      expv[51] = 174'h0000000000000000150eaadace0f6421020000000000;
      expv[52] = 174'h00000000000000003f39e57a54011669c30000000000;
      expv[53] = 174'h000000000000000033901155b82f5c2b430000000000;
      expv[54] = 174'h00000000000000001d1d676d63ae94f5000000000000;
      expv[55] = 174'h00000000000000002dc2b4486d0aed63000000000000;
      expv[56] = 174'h00000000000000003f552c4c690013f3c00000000000;
      expv[57] = 174'h0000000000000000331b982268cbcb14820000000000;
      expv[58] = 174'h00000000000000000b5f685b87c9301d410000000000;
      expv[59] = 174'h000000000000000015e92036551e4ec8c10000000000;
      expv[60] = 174'h000000000000000014a5f0be62a28059c00000000000;
      expv[61] = 174'h00000000000000000cd822732e2e3a01000000000000;
      expv[62] = 174'h00000000000000001e7fc3a20fe00ec1400000000000;
      expv[63] = 174'h000000000000000019fddc2bd6f50463820000000000;
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
