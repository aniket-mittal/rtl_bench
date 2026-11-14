// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 84;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_05098 dut (
    .clock(clk),
    .idle_NormaliseProd(in_vec[83:83]),
    .zout_NormaliseProd(in_vec[82:50]),
    .productout_NormaliseProd(in_vec[49:0]),
    .FinalProduct(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 84'h7f5b8d9d66e371bb74226;
    stim[1] = 84'h69e77fc46fe9bfa8ac8b0;
    stim[2] = 84'h010c35bfe533650402bd8;
    stim[3] = 84'h6554efc76804668a156f4;
    stim[4] = 84'h261007ad6b212f283584a;
    stim[5] = 84'hb2951f5f3f23c04cf10e9;
    stim[6] = 84'h4f735bdc368cd512b154d;
    stim[7] = 84'h35e6d0a8cca0a3dc698a9;
    stim[8] = 84'h7f8db39d66130e773d922;
    stim[9] = 84'h9be4a3f79a0933cd08c9c;
    stim[10] = 84'haacfe9ce4adba4285acf1;
    stim[11] = 84'hcd9d2486f1ed33dce5730;
    stim[12] = 84'h1e683f1731afef8633801;
    stim[13] = 84'he89366dda520ac34aa26c;
    stim[14] = 84'h7e9e4268308df60bb9fe5;
    stim[15] = 84'h3112314fce671365c403d;
    stim[16] = 84'h197a615e1ad381db071df;
    stim[17] = 84'h015bc86158e3aca365435;
    stim[18] = 84'h82e02d2bb36fff3b54eca;
    stim[19] = 84'h9565c5c321dcdac18c712;
    stim[20] = 84'h624c26fe86cb0c2fa68a3;
    stim[21] = 84'he13702d51ae2d6153a253;
    stim[22] = 84'hd70192e73784b33ee7f55;
    stim[23] = 84'h04d326b801ea55c181ab7;
    stim[24] = 84'h5feb53371c5d2c5ed5520;
    stim[25] = 84'hcd542bc0acf08fe24a5b4;
    stim[26] = 84'hebaf40770ee15154374eb;
    stim[27] = 84'h7d4af88e9aa78043a2a29;
    stim[28] = 84'had9b4c1b063a488810a02;
    stim[29] = 84'h9579390bd96aa1056899a;
    stim[30] = 84'h973183b941e9a00b0fd32;
    stim[31] = 84'hd6be7641c26761ff533c2;
    stim[32] = 84'hc37979d7c3fcf74d853a2;
    stim[33] = 84'h5b7a7404bd1835e5e0629;
    stim[34] = 84'h95453eb4c4e72935bd27a;
    stim[35] = 84'h8ddcd9de09047efb5b681;
    stim[36] = 84'hbd045932ac150cea44f8a;
    stim[37] = 84'hf9d0183610747928c85dc;
    stim[38] = 84'h3f3a10ab840dbfb41f943;
    stim[39] = 84'ha246208e1b3b518c98ca3;
    stim[40] = 84'he24cf95521b528ae8f073;
    stim[41] = 84'h72fd45286cbdfa83ee7fc;
    stim[42] = 84'hb4cd8fb4ebb632e8b4851;
    stim[43] = 84'h6d4f726a5ad9e346127c7;
    stim[44] = 84'he17056d08809f394710cc;
    stim[45] = 84'h6d9041eebb4b4d8596550;
    stim[46] = 84'h392d6cb14b55e90d4fb96;
    stim[47] = 84'ha0c157afa38f9f1bd958f;
    stim[48] = 84'he845ca19853a2d1b56f26;
    stim[49] = 84'hb862b2deed7caec2537de;
    stim[50] = 84'h2d5f1fb121a17dbf6dc66;
    stim[51] = 84'ha559a9f02601bb5a5a277;
    stim[52] = 84'hd7651a9627d7c91fcb764;
    stim[53] = 84'hfd0e3d1c800527d807dde;
    stim[54] = 84'h12dc041dd5ca6d512fe73;
    stim[55] = 84'h71d2c821c8324d68f3756;
    stim[56] = 84'hb36e11ed986a8aa86fc46;
    stim[57] = 84'h597bd7183fa251836ecde;
    stim[58] = 84'h5c710ee1ce8df877021ee;
    stim[59] = 84'h6f9a3a07f4fe20efe098b;
    stim[60] = 84'hf091d40a4b9101e2f3b0a;
    stim[61] = 84'hc4f6467c765724466de49;
    stim[62] = 84'h3c13ced4380b7173345ae;
    stim[63] = 84'h976d91cc53e30a78fc22b;
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
      expv[0] = 32'hxxxxxxxx;
      expv[1] = 32'hbe6e3675;
      expv[2] = 32'h931dff11;
      expv[3] = 32'h41b0d6ff;
      expv[4] = 32'h8a53bf1d;
      expv[5] = 32'h0bc01eb5;
      expv[6] = 32'h652a3ebe;
      expv[7] = 32'hde4d6f70;
      expv[8] = 32'h2b1b42a3;
      expv[9] = 32'hbeb6ce75;
      expv[10] = 32'h37c947ef;
      expv[11] = 32'h559fd39c;
      expv[12] = 32'h9b3a490d;
      expv[13] = 32'h7c20fc5c;
      expv[14] = 32'hd126cdbb;
      expv[15] = 32'hbcf909a0;
      expv[16] = 32'h21c8c53f;
      expv[17] = 32'h72698578;
      expv[18] = 32'h426f2185;
      expv[19] = 32'h05c05a57;
      expv[20] = 32'h2acb8b86;
      expv[21] = 32'h84309bfa;
      expv[22] = 32'hc26e05aa;
      expv[23] = 32'hae0325ce;
      expv[24] = 32'h494c9ae0;
      expv[25] = 32'hff2d4cdc;
      expv[26] = 32'h9aa85781;
      expv[27] = 32'hd75e80ee;
      expv[28] = 32'hba2be23a;
      expv[29] = 32'h5b369836;
      expv[30] = 32'h2af27217;
      expv[31] = 32'h2e630772;
      expv[32] = 32'had7cec83;
      expv[33] = 32'h86f2f3af;
      expv[34] = 32'hf669d012;
      expv[35] = 32'h2a8a7d69;
      expv[36] = 32'h1bb9b3bc;
      expv[37] = 32'h7a08b265;
      expv[38] = 32'hf3a0306c;
      expv[39] = 32'h3de842ae;
      expv[40] = 32'h448c411c;
      expv[41] = 32'hc499f2aa;
      expv[42] = 32'ha57514a1;
      expv[43] = 32'h699b1f69;
      expv[44] = 32'h9a3dc9a9;
      expv[45] = 32'hc2e0ada1;
      expv[46] = 32'h9ac107ba;
      expv[47] = 32'h31b5b2c5;
      expv[48] = 32'h4182af5f;
      expv[49] = 32'hd08b9433;
      expv[50] = 32'h70c565bd;
      expv[51] = 32'h1a7c7ec4;
      expv[52] = 32'h4ab353e0;
      expv[53] = 32'haeca352c;
      expv[54] = 32'hfa1c7a39;
      expv[55] = 32'h65701077;
      expv[56] = 32'ha34b2087;
      expv[57] = 32'h66dc23db;
      expv[58] = 32'hf26f5c60;
      expv[59] = 32'hf8443b87;
      expv[60] = 32'h9ee8e81f;
      expv[61] = 32'he123a814;
      expv[62] = 32'h89ec8cf8;
      expv[63] = 32'h37cf3b50;
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
