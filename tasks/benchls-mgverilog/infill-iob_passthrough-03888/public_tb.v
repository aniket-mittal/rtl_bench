// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 98;
  localparam OW = 97;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_03888 dut (
    .clk(clk),
    .reset(in_vec[97:97]),
    .m_iob_poweron(in_vec[96:96]),
    .m_iob_reset(in_vec[95:95]),
    .m_datao_clear(in_vec[94:94]),
    .m_datao_set(in_vec[93:93]),
    .m_cono_clear(in_vec[92:92]),
    .m_cono_set(in_vec[91:91]),
    .m_iob_fm_datai(in_vec[90:90]),
    .m_iob_fm_status(in_vec[89:89]),
    .m_rdi_pulse(in_vec[88:88]),
    .m_ios(in_vec[87:81]),
    .m_iob_write(in_vec[80:45]),
    .s0_pi_req(in_vec[44:38]),
    .s0_iob_read(in_vec[37:2]),
    .s0_dr_split(in_vec[1:1]),
    .s0_rdi_data(in_vec[0:0]),
    .m_pi_req(out_vec[96:90]),
    .m_iob_read(out_vec[89:54]),
    .m_dr_split(out_vec[53:53]),
    .m_rdi_data(out_vec[52:52]),
    .s0_iob_poweron(out_vec[51:51]),
    .s0_iob_reset(out_vec[50:50]),
    .s0_datao_clear(out_vec[49:49]),
    .s0_datao_set(out_vec[48:48]),
    .s0_cono_clear(out_vec[47:47]),
    .s0_cono_set(out_vec[46:46]),
    .s0_iob_fm_datai(out_vec[45:45]),
    .s0_iob_fm_status(out_vec[44:44]),
    .s0_rdi_pulse(out_vec[43:43]),
    .s0_ios(out_vec[42:36]),
    .s0_iob_write(out_vec[35:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 98'h33a9195efc072c3766f96a3e0;
    stim[1] = 98'h20345ccf73e2a25098f8a55e0;
    stim[2] = 98'h0b7e56fbe6241e246ddc77971;
    stim[3] = 98'h1e8d6ad6afc0060d53dfe5ad8;
    stim[4] = 98'h19acfb3f8a13c4ecde168c0a4;
    stim[5] = 98'h0a68d8c0ea6f63b23bd562050;
    stim[6] = 98'h1043e14dd7b11b357074ccc18;
    stim[7] = 98'h1ccbbcba6e60f0032fa71a825;
    stim[8] = 98'h1d31f9ac4532c3d316e34b531;
    stim[9] = 98'h17f76e0f08b0a89ee6310a225;
    stim[10] = 98'h198e79e8ec8f248ba508f880d;
    stim[11] = 98'h2bcdabba785bf8ae3f4082382;
    stim[12] = 98'h15a6d0498e209121a69bf6f3a;
    stim[13] = 98'h1fe71144af11024fdd30e46a9;
    stim[14] = 98'h1a48ce159fc2ad445febe100b;
    stim[15] = 98'h1e0450aed01d5172d725b3bc4;
    stim[16] = 98'h188821c18c04c8feebab934f9;
    stim[17] = 98'h11dc020bb4557d2dc1dfaa7a1;
    stim[18] = 98'h195f65b9ed43fdddcccb63e81;
    stim[19] = 98'h011199c01f5113814caca3d78;
    stim[20] = 98'h0f528abdea34d34b4ce83e738;
    stim[21] = 98'h10b894554b880f70705584caf;
    stim[22] = 98'h12bda79229a4a8c80b92d3ef8;
    stim[23] = 98'h04532d84b297824c961c143f6;
    stim[24] = 98'h162fbc23bd15a5033faee3f3a;
    stim[25] = 98'h1c69f51b2ffc7596481b42ce2;
    stim[26] = 98'h0c6cc473f5d3a0ce679c361fa;
    stim[27] = 98'h1c6e584d50cfdf12d22ac533a;
    stim[28] = 98'h07c89cb5f79fa03c7bf515cf5;
    stim[29] = 98'h1a6a5212608b089053c8dfaed;
    stim[30] = 98'h1aebf2c57969b3645019d64ab;
    stim[31] = 98'h01e6b4c502b2ae521197cf692;
    stim[32] = 98'h03db3ba9ecb7785061e6740df;
    stim[33] = 98'h0a07622acbdd00b3c5772216a;
    stim[34] = 98'h032a6cd174c56df6d4eab6bb1;
    stim[35] = 98'h16d664c5e79db4f7ab9d08eac;
    stim[36] = 98'h0fd8b70bfa822e4d4055afaa4;
    stim[37] = 98'h119d476fff73d8a3aeac948e6;
    stim[38] = 98'h17b57c5bf5e8c369ef91bfcf6;
    stim[39] = 98'h09900c7a22dd7e2f2d29c84ca;
    stim[40] = 98'h0b15a51fb34751340b89f90ec;
    stim[41] = 98'h076e1b0ffe39068ce5e50dbd1;
    stim[42] = 98'h07a1575015ce0c2ff0745d651;
    stim[43] = 98'h1fee6819337af3737f4c46584;
    stim[44] = 98'h117299c98d20252135d0c17cc;
    stim[45] = 98'h0c2850a8c0a75d5a88d84848c;
    stim[46] = 98'h046ab0c6793d69e7de2173369;
    stim[47] = 98'h0a89980ad93bc712f6ece8045;
    stim[48] = 98'h09ec7ea923ae5cb8134d6daf3;
    stim[49] = 98'h167a9195013ea86771fa91220;
    stim[50] = 98'h16d0ec395725eb4a4bdae4e74;
    stim[51] = 98'h08c77e3fa4b79bcd6707aec76;
    stim[52] = 98'h15b548510ee09d63b1515da71;
    stim[53] = 98'h04c6633324f77899289a1d994;
    stim[54] = 98'h10b036be4146af1e645937866;
    stim[55] = 98'h010e078e9f6b6d97fdc860a32;
    stim[56] = 98'h08ae901abd658d326b0b1b34f;
    stim[57] = 98'h0186cead8dc4d7ec4517eacb2;
    stim[58] = 98'h138063ad28cd0c6b94a3c7184;
    stim[59] = 98'h0c6847b645020cdf7f49d5fbc;
    stim[60] = 98'h0e216dbb5e43f91cd6e1bb538;
    stim[61] = 98'h1da56eb4aa3bdfd0b963bbe03;
    stim[62] = 98'h0e18e7cc752846c8d89f4c91d;
    stim[63] = 98'h16a61c245bdde7f12edae2bae;
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
      expv[0] = 97'h0376fffeaff89d48caf7e0396;
      expv[1] = 97'h05399fefd5e401a2e67b9f151;
      expv[2] = 97'h026fffcf797d5bf2b7df3120f;
      expv[3] = 97'h00d5bdffdadcf46b56b57e003;
      expv[4] = 97'h0effff7ce7accd67d9fc509e2;
      expv[5] = 97'h1b33bdd6fed45346c607537b1;
      expv[6] = 97'h13579fefee3c821f0a6ebd88d;
      expv[7] = 97'h003bfefde9e5e65de5d373078;
      expv[8] = 97'h1d337ebef5b5e98fcd6229961;
      expv[9] = 97'h09fe7f11e375bfbb707845854;
      expv[10] = 97'h08bbd1df9e4dcc73cf4764792;
      expv[11] = 97'h0af7f4f8b7f25e6d5dd3c2dfc;
      expv[12] = 97'h123afbbf6f3aad36824c71048;
      expv[13] = 97'h04ffdb5e66adff388a2578881;
      expv[14] = 97'h145dffbf955bd24670acfe156;
      expv[15] = 97'h172d7ffb3be4f022857680ea8;
      expv[16] = 97'h0fefbbb93df9c4410e0c60264;
      expv[17] = 97'h12dc1ffaaff98ee0105da2abe;
      expv[18] = 97'h1ddffffebff9cafb2dcf6a1fe;
      expv[19] = 97'h1837cafebf7c088cce00fa889;
      expv[20] = 97'h14b5ffd7efbc7a9455ef51a69;
      expv[21] = 97'h172fafdf5cbf85c4a2aa5c407;
      expv[22] = 97'h0c8fbd7f7ff895ed3c914d254;
      expv[23] = 97'h04db69e56ff622996c2594bc1;
      expv[24] = 97'h103bfffe3f7ab17de11de8ad2;
      expv[25] = 97'h196eb7fffceae34fa8d97fe3a;
      expv[26] = 97'h0ceeffebe7fa6366239fae9d0;
      expv[27] = 97'h113dbaaddfbee372c26a867ef;
      expv[28] = 97'h03ffffff7ff53e44e5afbcfd0;
      expv[29] = 97'h09253ccdfefdd352909304584;
      expv[30] = 97'h16658bfff7efd75f962bcb4d9;
      expv[31] = 97'h05299b7df7de0f35a62815957;
      expv[32] = 97'h05375fff6eff1ed9dd4f65bbc;
      expv[33] = 97'h0b3c57f7bb6a503b11565ee80;
      expv[34] = 97'h1f7deeebebf91953668ba62b6;
      expv[35] = 97'h0f7bbbdfbfecb6b3262f3ceda;
      expv[36] = 97'h04fe17fffefc7ec5b85fd4117;
      expv[37] = 97'h0a3effffeff68cea3b7ffb9ec;
      expv[38] = 97'h16befffbfdf6bdabe2dfaf461;
      expv[39] = 97'h02faf6ddbefe4c8063d116ebf;
      expv[40] = 97'h134abfff9eec58ad28fd9a3a8;
      expv[41] = 97'h08fe5ffcfbdd3b70d87ff1c83;
      expv[42] = 97'h02ffa76fde593d0aba80ae706;
      expv[43] = 97'h1737f6e6f5e4ff7340c99bd79;
      expv[44] = 97'h1233df1e57cc8b94ce4c69012;
      expv[45] = 97'h15a9dd85cebc61428546053ae;
      expv[46] = 97'h1e7deef77bf923558633c9eb4;
      expv[47] = 97'h113f7ffef7cd544cc056c9de3;
      expv[48] = 97'h0bbd76d7defb4f63f5491d72e;
      expv[49] = 97'h06773fab7f70b3d48ca809f54;
      expv[50] = 97'h14bcffae4ff4b68761cab92f5;
      expv[51] = 97'h1cfe7f7bef76463bf1fd25bcd;
      expv[52] = 97'h163bb71ddb79adaa42887704e;
      expv[53] = 97'h0996efe9fff42633199927bbc;
      expv[54] = 97'h11ef7d93fd7e8581b5f20a357;
      expv[55] = 97'h197fddbedefa08703c74fb5b6;
      expv[56] = 97'h1326b5fbfb5f457480d5eb2c6;
      expv[57] = 97'h1edd5b7fadbe0c36756c6e26b;
      expv[58] = 97'h06bf5a7dfb9c9c031d6946686;
      expv[59] = 97'h0dfffc9f5fbc63423db228106;
      expv[60] = 97'h11df7ebfb7f8710b6ddaf21fc;
      expv[61] = 97'h1d1fff7fffbfed2b75a551def;
      expv[62] = 97'h0c8f99fed99d70c73e63a9423;
      expv[63] = 97'h1f3aedbfbbeeb530e122deef3;
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
