// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 67;
  localparam OW = 66;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_00303 dut (
    .clk(clk),
    .resetn(in_vec[66:66]),
    .s_valid(in_vec[65:65]),
    .s_data(in_vec[64:1]),
    .m_ready(in_vec[0:0]),
    .s_ready(out_vec[65:65]),
    .m_valid(out_vec[64:64]),
    .m_data(out_vec[63:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 67'h1d9cf661e4d9b5bbe;
    stim[1] = 67'h08654daec1cb62198;
    stim[2] = 67'h63df257e70caaa3f4;
    stim[3] = 67'h63084115beb4be2f3;
    stim[4] = 67'h73cdc24b97f273be6;
    stim[5] = 67'h76d33d7b9204c08e3;
    stim[6] = 67'h6d70e98a3b9696860;
    stim[7] = 67'h4e03808fee0781e79;
    stim[8] = 67'h5f862f141b3c68c54;
    stim[9] = 67'h61ba277076a44dba2;
    stim[10] = 67'h4b74e3bc8f41816cc;
    stim[11] = 67'h5cdfecbe14e02089e;
    stim[12] = 67'h73bcecf8e350e3e51;
    stim[13] = 67'h48b798470e561186f;
    stim[14] = 67'h5ba2ab665aeab1cc9;
    stim[15] = 67'h68f084ae93dd30f71;
    stim[16] = 67'h5f26bfc9ae5331a4e;
    stim[17] = 67'h7be62ad75853caedb;
    stim[18] = 67'h5f892c1d71c0c7bde;
    stim[19] = 67'h6442c82806144e68f;
    stim[20] = 67'h526dc9babf83638b2;
    stim[21] = 67'h54059400e2953693a;
    stim[22] = 67'h556a24c9952ad0ed2;
    stim[23] = 67'h72370d56f327f6b2e;
    stim[24] = 67'h413fd5fafabe143ad;
    stim[25] = 67'h4b4b3718a23f9b337;
    stim[26] = 67'h5026c9d9839e9100d;
    stim[27] = 67'h7e2f3a3614423c571;
    stim[28] = 67'h6681eadada36f35bb;
    stim[29] = 67'h4473e10f0fbc28928;
    stim[30] = 67'h79ff9017f0baf558f;
    stim[31] = 67'h4104d847eec811aa5;
    stim[32] = 67'h6aa5ccf543dbbb79f;
    stim[33] = 67'h62ba012e905a4f27a;
    stim[34] = 67'h513aec28cb4400145;
    stim[35] = 67'h52d97da91e4b54e23;
    stim[36] = 67'h52a3a6d8987848fc8;
    stim[37] = 67'h438d4f19ac7c035ef;
    stim[38] = 67'h5c5bec0acd9788c41;
    stim[39] = 67'h4c2d35b686a205aee;
    stim[40] = 67'h6011379b9300e5045;
    stim[41] = 67'h5bec19494e6d067f2;
    stim[42] = 67'h7dd4862278102513a;
    stim[43] = 67'h487cbd76574c1d9eb;
    stim[44] = 67'h5b9d11c2fdca5716a;
    stim[45] = 67'h57ba01bb6564e695f;
    stim[46] = 67'h42010e84609cc2e91;
    stim[47] = 67'h63ca3ea8ffa1bcad9;
    stim[48] = 67'h7a44c2589064ce228;
    stim[49] = 67'h4c62ec0d0d410dc9b;
    stim[50] = 67'h74840891f3dade158;
    stim[51] = 67'h457421c115a80e5bb;
    stim[52] = 67'h7059d2bca9bdc77a9;
    stim[53] = 67'h689a8beb69d7faddc;
    stim[54] = 67'h5d8e55aca05ced476;
    stim[55] = 67'h65f16974e4bbfe2b0;
    stim[56] = 67'h7443b3993db8ae4f4;
    stim[57] = 67'h5250607c2f094309a;
    stim[58] = 67'h505a422a9ae498978;
    stim[59] = 67'h6f4bc91c3d7cc73f3;
    stim[60] = 67'h5fad56448afb42eca;
    stim[61] = 67'h662da6e53873e7f59;
    stim[62] = 67'h72730eea0d550675f;
    stim[63] = 67'h50973085f3a459e71;
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
      expv[0] = 66'h0ece7b30f26cdaddf;
      expv[1] = 66'h0432a6d760e5b10cc;
      expv[2] = 66'h11ef92bf3865551fa;
      expv[3] = 66'h3184208adf5a5f179;
      expv[4] = 66'h19e6e125cbf939df3;
      expv[5] = 66'h3b699ebdc90260471;
      expv[6] = 66'h16b874c51dcb4b430;
      expv[7] = 66'h2701c047f703c0f3c;
      expv[8] = 66'h0fc3178a0d9e3462a;
      expv[9] = 66'h10dd13b83b5226dd1;
      expv[10] = 66'h05ba71de47a0c0b66;
      expv[11] = 66'h0e6ff65f0a701044f;
      expv[12] = 66'h39de767c71a871f28;
      expv[13] = 66'h245bcc23872b08c37;
      expv[14] = 66'h2dd155b32d7558e64;
      expv[15] = 66'h3478425749ee987b8;
      expv[16] = 66'h0f935fe4d72998d27;
      expv[17] = 66'h3df3156bac29e576d;
      expv[18] = 66'h0fc4960eb8e063def;
      expv[19] = 66'h32216414030a27347;
      expv[20] = 66'h0936e4dd5fc1b1c59;
      expv[21] = 66'h0a02ca00714a9b49d;
      expv[22] = 66'h0ab51264ca9568769;
      expv[23] = 66'h191b86ab7993fb597;
      expv[24] = 66'h209feafd7d5f0a1d6;
      expv[25] = 66'h25a59b8c511fcd99b;
      expv[26] = 66'h281364ecc1cf48806;
      expv[27] = 66'h3f179d1b0a211e2b8;
      expv[28] = 66'h3340f56d6d1b79add;
      expv[29] = 66'h0239f08787de14494;
      expv[30] = 66'h3cffc80bf85d7aac7;
      expv[31] = 66'h20826c23f76408d52;
      expv[32] = 66'h3552e67aa1edddbcf;
      expv[33] = 66'h115d0097482d2793d;
      expv[34] = 66'h289d761465a2000a2;
      expv[35] = 66'h296cbed48f25aa711;
      expv[36] = 66'h0951d36c4c3c247e4;
      expv[37] = 66'h21c6a78cd63e01af7;
      expv[38] = 66'h2e2df60566cbc4620;
      expv[39] = 66'h06169adb435102d77;
      expv[40] = 66'h30089bcdc98072822;
      expv[41] = 66'h0df60ca4a736833f9;
      expv[42] = 66'h1eea43113c081289d;
      expv[43] = 66'h243e5ebb2ba60ecf5;
      expv[44] = 66'h0dce88e17ee52b8b5;
      expv[45] = 66'h2bdd00ddb2b2734af;
      expv[46] = 66'h21008742304e61748;
      expv[47] = 66'h31e51f547fd0de56c;
      expv[48] = 66'h1d22612c483267114;
      expv[49] = 66'h2631760686a086e4d;
      expv[50] = 66'h1a420448f9ed6f0ac;
      expv[51] = 66'h22ba10e08ad4072dd;
      expv[52] = 66'h382ce95e54dee3bd4;
      expv[53] = 66'h144d45f5b4ebfd6ee;
      expv[54] = 66'h0ec72ad6502e76a3b;
      expv[55] = 66'h12f8b4ba725dff158;
      expv[56] = 66'h1a21d9cc9edc5727a;
      expv[57] = 66'h0928303e1784a184d;
      expv[58] = 66'h082d21154d724c4bc;
      expv[59] = 66'h37a5e48e1ebe639f9;
      expv[60] = 66'h0fd6ab22457da1765;
      expv[61] = 66'h3316d3729c39f3fac;
      expv[62] = 66'h3939877506aa833af;
      expv[63] = 66'h284b9842f9d22cf38;
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
