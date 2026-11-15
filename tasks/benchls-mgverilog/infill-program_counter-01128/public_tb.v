// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 67;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01128 dut (
    .clk(clk),
    .rst(in_vec[66:66]),
    .p_data_i(in_vec[65:34]),
    .seq_stop_inc_pc_i(in_vec[33:33]),
    .jmp_pc_i(in_vec[32:1]),
    .jmp_pc_en_i(in_vec[0:0]),
    .p_addr_o(out_vec[63:32]),
    .inst_o(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 67'h66889c3ee50e79810;
    stim[1] = 67'h703bcc487bde5d9cd;
    stim[2] = 67'h383e4149df4448b7a;
    stim[3] = 67'h39d8a3987de1c6b48;
    stim[4] = 67'h1249a49b12cf33bc1;
    stim[5] = 67'h2e345faea496eaf27;
    stim[6] = 67'h393f6b4edb4a4faef;
    stim[7] = 67'h016d3f347ed81ad2a;
    stim[8] = 67'h0c7576b00e88c5751;
    stim[9] = 67'h01466be2eb9fb10e4;
    stim[10] = 67'h125294cea1d2711b8;
    stim[11] = 67'h101eb95138ce83b92;
    stim[12] = 67'h09cd4cf799d47f943;
    stim[13] = 67'h3beaaf226de46000f;
    stim[14] = 67'h32caad41a40e84258;
    stim[15] = 67'h0db289131b7ff4799;
    stim[16] = 67'h1b646b546c42fbbff;
    stim[17] = 67'h03ec68a26d7791a10;
    stim[18] = 67'h08cca6d8d57fb8147;
    stim[19] = 67'h38b013271a08c9d82;
    stim[20] = 67'h14e9fc3fca226b06b;
    stim[21] = 67'h3411ad43ade14e245;
    stim[22] = 67'h2fa501629631c800d;
    stim[23] = 67'h1d97c227c9c9276b6;
    stim[24] = 67'h2da17e995222b9a08;
    stim[25] = 67'h3e6f539c0bfbba4e9;
    stim[26] = 67'h3f6d4baa9460dcd98;
    stim[27] = 67'h232cea49d024ee6ff;
    stim[28] = 67'h1a7252bda5e34fb58;
    stim[29] = 67'h32c24b3fb2844d023;
    stim[30] = 67'h38c01e88b738fd066;
    stim[31] = 67'h3392780368a77853f;
    stim[32] = 67'h35b3ec0e9e4690ad5;
    stim[33] = 67'h12b24a748a26731c9;
    stim[34] = 67'h020ee3125676f09ca;
    stim[35] = 67'h205af787cd4045d11;
    stim[36] = 67'h3a367adf4788cdd30;
    stim[37] = 67'h0656d070c5cf3293a;
    stim[38] = 67'h102e42e6d17d34af5;
    stim[39] = 67'h2ca203c78f7dfc62c;
    stim[40] = 67'h085fd5d79f5723cbd;
    stim[41] = 67'h1745f71e37c1f46f8;
    stim[42] = 67'h392324636285bc071;
    stim[43] = 67'h0427b7c469a1b7d8e;
    stim[44] = 67'h52dfd9d585f8563eb;
    stim[45] = 67'h0eb7241b2868516bb;
    stim[46] = 67'h064e840f3b4357cb1;
    stim[47] = 67'h113ffff3a4f5f4440;
    stim[48] = 67'h094ee06098f578bdd;
    stim[49] = 67'h0195d97888725e645;
    stim[50] = 67'h00c9b074782879efa;
    stim[51] = 67'h2f2f511c02be860d9;
    stim[52] = 67'h1d3bb8196eccce065;
    stim[53] = 67'h020561825139e5aab;
    stim[54] = 67'h293ac72942803d1f3;
    stim[55] = 67'h02e79500e4f2f5ed4;
    stim[56] = 67'h02e826f1d51263e2d;
    stim[57] = 67'h2d3084a77336bbe80;
    stim[58] = 67'h2c3dbada8afe9ffaf;
    stim[59] = 67'h1224d723133b859e6;
    stim[60] = 67'h08ec747a388924170;
    stim[61] = 67'h3d75783ab4e4be262;
    stim[62] = 67'h3d39c49de64393951;
    stim[63] = 67'h3723c8cb50213baa3;
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
      expv[0] = 64'hxxxxxxxx9a2270fb;
      expv[1] = 64'h00000000c0ef3121;
      expv[2] = 64'h00000000e0f90527;
      expv[3] = 64'h00000001e7628e61;
      expv[4] = 64'h000000014926926c;
      expv[5] = 64'h96799de0b8d17eba;
      expv[6] = 64'h24b75793e4fdad3b;
      expv[7] = 64'hda527d7705b4fcd1;
      expv[8] = 64'hda527d7731d5dac0;
      expv[9] = 64'h74462ba80519af8b;
      expv[10] = 64'h74462ba8494a533a;
      expv[11] = 64'h74462ba8407ae544;
      expv[12] = 64'h74462ba8273533de;
      expv[13] = 64'hcea3fca1efaabc89;
      expv[14] = 64'h6f230007cb2ab506;
      expv[15] = 64'h6f23000736ca244c;
      expv[16] = 64'hdbffa3cc6d91ad51;
      expv[17] = 64'h6217ddff0fb1a289;
      expv[18] = 64'h6217ddff23329b63;
      expv[19] = 64'habfdc0a3e2c04c9c;
      expv[20] = 64'habfdc0a453a7f0ff;
      expv[21] = 64'h51135835d046b50e;
      expv[22] = 64'h6f0a7122be94058a;
      expv[23] = 64'hb18e4006765f089f;
      expv[24] = 64'hb18e4007b685fa65;
      expv[25] = 64'hb18e4008f9bd4e70;
      expv[26] = 64'h5fddd274fdb52eaa;
      expv[27] = 64'h5fddd2758cb3a927;
      expv[28] = 64'h8127737f69c94af6;
      expv[29] = 64'h8127737fcb092cfe;
      expv[30] = 64'h94226811e3007a22;
      expv[31] = 64'h94226811ce49e00d;
      expv[32] = 64'h453bc29fd6cfb03a;
      expv[33] = 64'hf234856a4ac929d2;
      expv[34] = 64'h513398e4083b8c49;
      expv[35] = 64'h513398e5816bde1f;
      expv[36] = 64'h6a022e88e8d9eb7d;
      expv[37] = 64'h6a022e89195b41c3;
      expv[38] = 64'h6a022e8a40b90b9b;
      expv[39] = 64'h8be9a57ab2880f1e;
      expv[40] = 64'h8be9a57b217f575e;
      expv[41] = 64'hfab91e5e5d17dc78;
      expv[42] = 64'hfab91e5ee48c918d;
      expv[43] = 64'h142de038109edf11;
      expv[44] = 64'h142de0384b7f6756;
      expv[45] = 64'h000000003adc906c;
      expv[46] = 64'h43428b5d193a103c;
      expv[47] = 64'hda1abe5844ffffce;
      expv[48] = 64'hda1abe58253b8182;
      expv[49] = 64'hc7abc5ee065765e2;
      expv[50] = 64'h4392f3220326c1d1;
      expv[51] = 64'h4392f322bcbd4470;
      expv[52] = 64'h15f4306c74eee065;
      expv[53] = 64'h7666703208158609;
      expv[54] = 64'h89cf2d55a4eb1ca5;
      expv[55] = 64'h1401e8f90b9e5403;
      expv[56] = 64'h1401e8f90ba09bc7;
      expv[57] = 64'ha8931f16b4c2129d;
      expv[58] = 64'ha8931f16b0f6eb6a;
      expv[59] = 64'h57f4ffd748935c8c;
      expv[60] = 64'h57f4ffd823b1d1e8;
      expv[61] = 64'h57f4ffd8f5d5e0ea;
      expv[62] = 64'h57f4ffd8f4e71277;
      expv[63] = 64'h321c9ca8dc8f232d;
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
