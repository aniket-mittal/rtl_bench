// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 38;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_00580 dut (
    .sys_clk(clk),
    .we(in_vec[37:37]),
    .wa(in_vec[36:34]),
    .wd(in_vec[33:2]),
    .ra(in_vec[1:0]),
    .rd(out_vec[63:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 38'h10b517a129;
    stim[1] = 38'h07817ba996;
    stim[2] = 38'h1925e16ae8;
    stim[3] = 38'h3fc1b20a52;
    stim[4] = 38'h12f55c121e;
    stim[5] = 38'h2fe26dada1;
    stim[6] = 38'h03f0a0e9b9;
    stim[7] = 38'h3930a2149a;
    stim[8] = 38'h3dfef6f847;
    stim[9] = 38'h0651dc1a9b;
    stim[10] = 38'h2aa0a3cbcf;
    stim[11] = 38'h191f14242c;
    stim[12] = 38'h3dcd1a1f71;
    stim[13] = 38'h3364f0367f;
    stim[14] = 38'h06bb696b80;
    stim[15] = 38'h30c9c29418;
    stim[16] = 38'h214fe2c51d;
    stim[17] = 38'h2f4b4c80e2;
    stim[18] = 38'h25818fbc60;
    stim[19] = 38'h298153ae04;
    stim[20] = 38'h05bc695bf0;
    stim[21] = 38'h24c00f75d0;
    stim[22] = 38'h09461dd4e3;
    stim[23] = 38'h2eb908ee38;
    stim[24] = 38'h02cabd80d1;
    stim[25] = 38'h396d2dea14;
    stim[26] = 38'h15e1a10c1b;
    stim[27] = 38'h11ec231cd8;
    stim[28] = 38'h2883ba21b1;
    stim[29] = 38'h02b8cc5c12;
    stim[30] = 38'h337b18ec1b;
    stim[31] = 38'h24896fee12;
    stim[32] = 38'h0607d3fa6b;
    stim[33] = 38'h27bdca0b66;
    stim[34] = 38'h00b24cee43;
    stim[35] = 38'h3aff2c9aaa;
    stim[36] = 38'h1c9a899617;
    stim[37] = 38'h01b8b2eea5;
    stim[38] = 38'h20af0d4f55;
    stim[39] = 38'h1fcfb75f91;
    stim[40] = 38'h267f201d6c;
    stim[41] = 38'h224766cce2;
    stim[42] = 38'h17c5ce95cb;
    stim[43] = 38'h0ccc532ff9;
    stim[44] = 38'h1f8bd86460;
    stim[45] = 38'h3c0bb1c0ab;
    stim[46] = 38'h0c9d7952b1;
    stim[47] = 38'h1ad320faeb;
    stim[48] = 38'h2f19d95918;
    stim[49] = 38'h2b67f5280f;
    stim[50] = 38'h2873322ffe;
    stim[51] = 38'h1f71359ca2;
    stim[52] = 38'h2ac1b0981e;
    stim[53] = 38'h0b03251a01;
    stim[54] = 38'h3d3c45ee08;
    stim[55] = 38'h17fa08b181;
    stim[56] = 38'h2ba6bc6bad;
    stim[57] = 38'h181cbff617;
    stim[58] = 38'h0f40b97d6a;
    stim[59] = 38'h211f47556b;
    stim[60] = 38'h0d2730ef98;
    stim[61] = 38'h1a7c8c2ef8;
    stim[62] = 38'h0c473ccf11;
    stim[63] = 38'h2b75ec29f7;
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
      expv[0] = 64'hxxxxxxxxxxxxxxxx;
      expv[1] = 64'hxxxxxxxxxxxxxxxx;
      expv[2] = 64'hxxxxxxxxxxxxxxxx;
      expv[3] = 64'hxxxxxxxxxxxxxxxx;
      expv[4] = 64'hxxxxxxxxxxxxxxxx;
      expv[5] = 64'hxxxxxxxxxxxxxxxx;
      expv[6] = 64'hxxxxxxxxxxxxxxxx;
      expv[7] = 64'hxxxxxxxxf89b6b68;
      expv[8] = 64'hxxxxxxxxxxxxxxxx;
      expv[9] = 64'h4c288526f06c8294;
      expv[10] = 64'h4c2885267fbdbe11;
      expv[11] = 64'h4c2885267fbdbe11;
      expv[12] = 64'hxxxxxxxxxxxxxxxx;
      expv[13] = 64'ha828f2f3f89b6b68;
      expv[14] = 64'h4c288526734687dc;
      expv[15] = 64'hxxxxxxxxxxxxxxxx;
      expv[16] = 64'hxxxxxxxxxxxxxxxx;
      expv[17] = 64'ha828f2f3f89b6b68;
      expv[18] = 64'h3270a506xxxxxxxx;
      expv[19] = 64'h53f8b147xxxxxxxx;
      expv[20] = 64'h53f8b1476063ef18;
      expv[21] = 64'h53f8b1476063ef18;
      expv[22] = 64'h53f8b1476063ef18;
      expv[23] = 64'h4c288526734687dc;
      expv[24] = 64'h53f8b1473003dd74;
      expv[25] = 64'h6054eb81ae423b8e;
      expv[26] = 64'h53f8b1473003dd74;
      expv[27] = 64'h5b4b7a85734687dc;
      expv[28] = 64'h53f8b1473003dd74;
      expv[29] = 64'h6054eb81ae423b8e;
      expv[30] = 64'h3270a506xxxxxxxx;
      expv[31] = 64'h5b4b7a85734687dc;
      expv[32] = 64'hdec63b06xxxxxxxx;
      expv[33] = 64'h5b4b7a85734687dc;
      expv[34] = 64'hdec63b06xxxxxxxx;
      expv[35] = 64'h5b4b7a85734687dc;
      expv[36] = 64'hdec63b06xxxxxxxx;
      expv[37] = 64'hbfcb26aa734687dc;
      expv[38] = 64'h20ee886cae423b8e;
      expv[39] = 64'h20ee886cae423b8e;
      expv[40] = 64'h20ee886cae423b8e;
      expv[41] = 64'h2bc353d5ef7282d9;
      expv[42] = 64'hdec63b06xxxxxxxx;
      expv[43] = 64'hbfcb26aa734687dc;
      expv[44] = 64'h20ee886cae423b8e;
      expv[45] = 64'h91d9b3389fc8075b;
      expv[46] = 64'hbfcb26aa734687dc;
      expv[47] = 64'h20ee886cae423b8e;
      expv[48] = 64'hbfcb26aa02ec702a;
      expv[49] = 64'h91d9b3389fc8075b;
      expv[50] = 64'hbfcb26aa02ec702a;
      expv[51] = 64'hdec63b06xxxxxxxx;
      expv[52] = 64'hdec63b06xxxxxxxx;
      expv[53] = 64'hdec63b06xxxxxxxx;
      expv[54] = 64'hb06c2607c6765646;
      expv[55] = 64'h91d9b3389fc8075b;
      expv[56] = 64'hb06c2607c6765646;
      expv[57] = 64'hb06c2607c6765646;
      expv[58] = 64'hbfcb26aa4f117b82;
      expv[59] = 64'hdec63b06xxxxxxxx;
      expv[60] = 64'hbfcb26aa4f117b82;
      expv[61] = 64'h47d1d55a9fc8075b;
      expv[62] = 64'h47d1d55a9fc8075b;
      expv[63] = 64'he9af1aebc6765646;
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
