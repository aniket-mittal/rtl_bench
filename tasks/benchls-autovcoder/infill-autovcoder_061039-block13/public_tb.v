// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 150;
  localparam OW = 94;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_061039 dut (
    .clk_core(clk),
    .rst_x(in_vec[149:149]),
    .i_req_sys(in_vec[148:148]),
    .i_wr_sys(in_vec[147:147]),
    .i_adrs_sys(in_vec[146:125]),
    .i_be_sys(in_vec[124:121]),
    .i_dbw_sys(in_vec[120:89]),
    .i_req_dma(in_vec[88:88]),
    .i_adrs_dma(in_vec[87:66]),
    .i_dbw_dma(in_vec[65:34]),
    .i_ack(in_vec[33:33]),
    .i_strr(in_vec[32:32]),
    .i_dbr(in_vec[31:0]),
    .o_ack_sys(out_vec[93:93]),
    .o_strr_sys(out_vec[92:92]),
    .o_dbr_sys(out_vec[91:60]),
    .o_req(out_vec[59:59]),
    .o_wr(out_vec[58:58]),
    .o_adrs(out_vec[57:36]),
    .o_be(out_vec[35:32]),
    .o_dbw(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 150'h30e6cf663c20362fa75d57c957a68bef987e51;
    stim[1] = 150'h35504c6c7fc7a6ac25e2356919dd7d49ffe5e7;
    stim[2] = 150'h17a3870d0f1fe877098ac4da57a1adb9012115;
    stim[3] = 150'h0307eab9e7cc6d5d2c20f81974a30d0301ec57;
    stim[4] = 150'h0afae59dfaf78ba5f37a3db43d800d8b5b1fff;
    stim[5] = 150'h0f1e5a4291b33f1671221d1b2ac86a96b317c0;
    stim[6] = 150'h0c9b2369cdd2326fbb25ef17ebcb061dbe4ce6;
    stim[7] = 150'h0d0acc108a89305539c44ad9880b4e803532eb;
    stim[8] = 150'h1bfdfb72099476455766d22034f96f195381c2;
    stim[9] = 150'h12e802bd71a78a1305818e5b0f13e53d811059;
    stim[10] = 150'h1b1a8225097644d6bf14897f548d65ddffc89b;
    stim[11] = 150'h0189d0f22c5d66794ff844ede99128fe13548d;
    stim[12] = 150'h1f4aaa2fb52abc68789ade569e2112882a240b;
    stim[13] = 150'h0c215353db970e183f9896c749fa207f0ba509;
    stim[14] = 150'h1c91a7cb526937a6552830a0e6bf966ef5c063;
    stim[15] = 150'h1e10e97db152a75409b34e2ee1e9cc93bfd247;
    stim[16] = 150'h0c6ec51630a78cca71da1c5ce8b6d813d4d82d;
    stim[17] = 150'h039bc93c2196936f093c4cd0aaaa1e3d783414;
    stim[18] = 150'h1a3c390863807afa38258ca84f5f65e28c8776;
    stim[19] = 150'h0776af22ce28aa447647a50da3904764fce6e1;
    stim[20] = 150'h1e6167b0a69cd5126319d0c812f585ca371b30;
    stim[21] = 150'h0b6be06eba64975b71fd91c33feb0820f13112;
    stim[22] = 150'h049c4be9ed50ada17f799b678a6e5f7bcef66e;
    stim[23] = 150'h0c02f184a83ff194fdefbbb29da6301ab49d86;
    stim[24] = 150'h1367a73091d0dd91b5133f13b736f53016a6fe;
    stim[25] = 150'h18f41d11e7d761890159eb675c3aa5cb88a0c0;
    stim[26] = 150'h37c1f77b14da9ad89e17dab38f158776d8291c;
    stim[27] = 150'h107b007870dd16a15235f432b6481ebc19195f;
    stim[28] = 150'h11022529559e6ee03fa2bd7472085d5acc1550;
    stim[29] = 150'h13a6462ab3753862930cd82b99c145032699e5;
    stim[30] = 150'h0eb20698aa35554d78398dbe8b25bf779bc4b3;
    stim[31] = 150'h08001e8188dde5c4756862009ca12f40973ed5;
    stim[32] = 150'h19fdd5cdd3f6cb5305a98a9d2c2e883352c792;
    stim[33] = 150'h165a06bddce8bd34c2077d12b95f0de6bc68fc;
    stim[34] = 150'h1e62eb42a4d74c14d4372b66e31df998b66093;
    stim[35] = 150'h2debc3a737c1c6020cfc7914afe74ab503983d;
    stim[36] = 150'h01b2aefd2ecf7ebc39a7e781c9b5377b936ae0;
    stim[37] = 150'h0bc15d0c42edc9d4cdecef0ff9e09f85f016bb;
    stim[38] = 150'h0c48b628a2b4e5611091b979f0caee8b73b4b3;
    stim[39] = 150'h128c0d54dbf6aab15b204c497760f7e0eace48;
    stim[40] = 150'h0ee86762109063de19b4c906d59b1982c71dd8;
    stim[41] = 150'h14065fe474ef96bdbfa2e030f77f8a5032d8a7;
    stim[42] = 150'h1733510fe918e05e933e3e464244ca486fbf59;
    stim[43] = 150'h097b48187db0f06767007f47f61100d27bb52c;
    stim[44] = 150'h097e3a7729fe06ad716a3258fc0f3d81042ba4;
    stim[45] = 150'h0c28a9dfacf567fdb464a15910176c2c9d8259;
    stim[46] = 150'h1dce70d4675a6289aa773069e7663dd8a46b94;
    stim[47] = 150'h1ffdd7ec734700c6c0677e442525b500cb2a1a;
    stim[48] = 150'h1264376696de46b6e582b603b5f3d74362c54e;
    stim[49] = 150'h14d9723e55d1883c6261a63d53eb8851eb3c66;
    stim[50] = 150'h19cff105c16ce27eec075d93ccb02ddc2589ea;
    stim[51] = 150'h004f36beadf1b3579c2854277cc19aded4292d;
    stim[52] = 150'h19211680e88b9f9508470db9dfc1d648f62245;
    stim[53] = 150'h0ab581dedb4917e130faedbcdc0aa2a63c3573;
    stim[54] = 150'h1918a1de35a69d3bf4de0c36617f7a42d1fd57;
    stim[55] = 150'h1bbc2f2d77ed213457deb037fa477e848899a1;
    stim[56] = 150'h13d6380a0a4a51c1fb922a9f380c44df96ff7e;
    stim[57] = 150'h080d6c6dc5b43fc12c4b90c1f00799722d17ce;
    stim[58] = 150'h1394f90b20e3f85e349287ac6d98808e8eac33;
    stim[59] = 150'h041ee8e83854fd7681352a591689b041d42ea8;
    stim[60] = 150'h194afc2330bf87ddc797f0dacc1bc84c7e5443;
    stim[61] = 150'h1afd10cff6f462735ea317a50786929c73667a;
    stim[62] = 150'h0544d9fa249e4869df1daddcf11ab4a5649697;
    stim[63] = 150'h06951022288877bd01f6416e62fd15c6885b39;
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
      expv[0] = 94'h3ef987e51xxxxxxxxxxxxxxx;
      expv[1] = 94'h149ffe5e7e9d755ff255e9a2;
      expv[2] = 94'h1b90121152a826363fe3d356;
      expv[3] = 94'h10301ec573d1c386878ff43b;
      expv[4] = 94'h18b5b1fff183f55cf3e636ae;
      expv[5] = 94'h296b317c057d72cefd7bc5d2;
      expv[6] = 94'h21dbe4ce678f2d2148d99f8b;
      expv[7] = 94'h2803532eb64d91b4e6e91937;
      expv[8] = 94'h3195381c268566084544982a;
      expv[9] = 94'h13d8110595fefdb904ca3b22;
      expv[10] = 94'h1ddffc89b174015eb8d3c509;
      expv[11] = 94'h0fe13548d58d411284bb226b;
      expv[12] = 94'h2882a240b0c4e879162eb33c;
      expv[13] = 94'h07f0ba5097a55517da955e34;
      expv[14] = 94'h26ef5c063610a9a9edcb870c;
      expv[15] = 94'h093bfd247648d3e5a9349bd3;
      expv[16] = 94'h013d4d82d70874bed8a953aa;
      expv[17] = 94'h23d783414637628b1853c665;
      expv[18] = 94'h1e28c87761cde49e10cb49b7;
      expv[19] = 94'h364fce6e151e1c8431c03d7d;
      expv[20] = 94'h1ca371b303bb579167145522;
      expv[21] = 94'h020f13112730b3d8534e6a89;
      expv[22] = 94'h37bcef66e5b5f0375d324bad;
      expv[23] = 94'h01ab49d8624e25f4f6a856d0;
      expv[24] = 94'h13016a6fe60178c2541ff8ca;
      expv[25] = 94'h1cb88a0c01b3d39848e86ec8;
      expv[26] = 94'h376d8291c47a0e88f3ebb0c4;
      expv[27] = 94'h2bc19195f3e0fbbd8a6d4d6c;
      expv[28] = 94'h15acc155003d803c386e8b50;
      expv[29] = 94'h1032699e50811294aacf3770;
      expv[30] = 94'h3779bc4b31d3231559ba9c31;
      expv[31] = 94'h340973ed5759034c551aaaa6;
      expv[32] = 94'h03352c7924000f40c46ef2e2;
      expv[33] = 94'h1e6bc68fc4feeae6e9fb65a9;
      expv[34] = 94'h198b6609332d035eee745e9a;
      expv[35] = 94'h2b503983d73175a1526ba60a;
      expv[36] = 94'h37b936ae06f5e1d39be0e301;
      expv[37] = 94'h385f016bb0d9577e9767bf5e;
      expv[38] = 94'h28b73b4b35e0ae862176e4ea;
      expv[39] = 94'h3e0eace486245b14515a72b0;
      expv[40] = 94'h182c71dd814606aa6dfb5558;
      expv[41] = 94'h25032d8a777433b1084831ef;
      expv[42] = 94'h2486fbf592032ff23a77cb5e;
      expv[43] = 94'h0d27bb52c399a887f48c702f;
      expv[44] = 94'h181042ba44bda40c3ed87833;
      expv[45] = 94'h02c9d82594bf1d3b94ff0356;
      expv[46] = 94'h1d8a46b9461454efd67ab3fe;
      expv[47] = 94'h100cb2a1a6e7386a33ad3144;
      expv[48] = 94'h34362c54e7feebf639a38063;
      expv[49] = 94'h051eb3c661321bb34b6f235b;
      expv[50] = 94'h1dc2589ea26cb91f2ae8c41e;
      expv[51] = 94'h2ded4292d4e7f882e0b6713f;
      expv[52] = 94'h248f622450279b5f56f8d9ab;
      expv[53] = 94'h2a63c35734908b407445cfca;
      expv[54] = 94'h242d1fd5755ac0ef6da48bf0;
      expv[55] = 94'h2848899a148c50ef1ad34e9d;
      expv[56] = 94'h0df96ff7e5de1796bbf6909a;
      expv[57] = 94'h1722d17ce1eb1c05052528e0;
      expv[58] = 94'h08e8eac33406b636e2da1fe0;
      expv[59] = 94'h041d42ea81ca7c859071fc2f;
      expv[60] = 94'h04c7e544320f74741c2a7ebb;
      expv[61] = 94'h29c73667a4a57e11985fc3ee;
      expv[62] = 94'h0a564969757e8867fb7a3139;
      expv[63] = 94'h1c6885b392a26cfd124f2434;
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
