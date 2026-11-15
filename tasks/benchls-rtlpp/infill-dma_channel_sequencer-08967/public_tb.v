// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 174;
  localparam OW = 41;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_08967 dut (
    .clk(clk),
    .resetn(in_vec[173:173]),
    .phase(in_vec[172:141]),
    .phase_valid(in_vec[140:140]),
    .data(in_vec[139:116]),
    .data_valid(in_vec[115:115]),
    .data_filtered(in_vec[114:83]),
    .data_filtered_valid(in_vec[82:82]),
    .i_q(in_vec[81:50]),
    .i_q_valid(in_vec[49:49]),
    .i_q_filtered(in_vec[48:17]),
    .i_q_filtered_valid(in_vec[16:16]),
    .dma_wr_overflow(in_vec[15:15]),
    .dma_wr_xfer_req(in_vec[14:14]),
    .channel_enable(in_vec[13:0]),
    .phase_ready(out_vec[40:40]),
    .data_ready(out_vec[39:39]),
    .data_filtered_ready(out_vec[38:38]),
    .i_q_ready(out_vec[37:37]),
    .i_q_filtered_ready(out_vec[36:36]),
    .overflow(out_vec[35:35]),
    .dma_wr_data(out_vec[34:3]),
    .dma_wr_en(out_vec[2:2]),
    .dma_wr_sync(out_vec[1:1]),
    .processing_resetn(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 174'h16c9aac8dc476c00a18a227e8012830a96fd89a5c643;
    stim[1] = 174'h15af7c586077bdd40c0f1bca4970e7f71b2b6b2e2d55;
    stim[2] = 174'h26a2d9132826efb69eeb7941527074b972acba2e75df;
    stim[3] = 174'h2f25bd12b0fc89b73c5fde48750675209561bc02b569;
    stim[4] = 174'h3de483ee085b2244b12d7411a414dd503edb7e6598ed;
    stim[5] = 174'h2348bcac101b07db3ea5d56301afa17eb577ae2c88e5;
    stim[6] = 174'h36e76a79fc56cb3ced872ee62e05189432dd6cd39744;
    stim[7] = 174'h3cae1145d98e05aad5a4850f6be3c38db0c8888fa49c;
    stim[8] = 174'h2f5b58eb795f60e0188053854509591a0b7d39fc44c1;
    stim[9] = 174'h2d249fa594d9d5697247ed97353f8f8668c2aee074e8;
    stim[10] = 174'h225dc1eced90f47af85cddc54991ead87599531c1d65;
    stim[11] = 174'h23b516c008debd0295400e97563103a8a7dba533bc40;
    stim[12] = 174'h371ff5de115989fca6e56806163f4f0bf096c0e07b18;
    stim[13] = 174'h3bd5518ce5d9485ebb5c71ce668b3d0d2d25d1395058;
    stim[14] = 174'h32648472363aa888767c6e98a940b51324e81c78c5ef;
    stim[15] = 174'h2b20db4ceb68102dfd93440042cf0e6aac5006033a40;
    stim[16] = 174'h3afe6c945858d93bfbaf6fafe2fc9c44e6f1e83a54bc;
    stim[17] = 174'h36f1d2492148691fc9a1e64a28fd3eae20f4fb695cb5;
    stim[18] = 174'h2c34a711a9c0dcd5080466fa4f962c49b817bfa9dd45;
    stim[19] = 174'h3b3a3287f6206b97965c073a544db47f7d47af87bff5;
    stim[20] = 174'h215cd500a02b83711ef1ac885a99c324db9e7902c9f8;
    stim[21] = 174'h255db9a8a542fbf4d526ceab27e8af81ea75937807a7;
    stim[22] = 174'h23fa1e5fe0b1d6d18102a5c854184da31820ba94dacc;
    stim[23] = 174'h3830d1620bcf88366e341427741db30965506f0fc4f9;
    stim[24] = 174'h27aad2137f44fc1331007d282073c1adecee8e419225;
    stim[25] = 174'h2a7b3204f8214c275884f710a6b33cbe14097c721d15;
    stim[26] = 174'h206036660816ebf6b4b15c50864042fda96c7ce78e84;
    stim[27] = 174'h38f416c650382fbe9f9ac455439cb689918ed1c4a076;
    stim[28] = 174'h23aad917042bbe38404fc99bd6e97321ee4318cddda8;
    stim[29] = 174'h30d978c0e409dde8110280fda017763649ce327bf00f;
    stim[30] = 174'h3bb8218edfa5cd935d8b793cdda7a8376f0000fdf967;
    stim[31] = 174'h2e7eea34ded9f87445246e4d0b19bebf560de97e4264;
    stim[32] = 174'h259178218dcaed6cbd80fef73cba12c4f245524ca6f1;
    stim[33] = 174'h3195aa64a74de6705910daea0f8d3a79e2c5637b1a4f;
    stim[34] = 174'h22c2f3e10653faa634f470df9ce5ac462e69fd16d0c7;
    stim[35] = 174'h289429a5093eb7c2b80260f28f058ad684de45538dc9;
    stim[36] = 174'h3b5fd63371d84839e4ee1e7cb33964b3a47ba60bb0a1;
    stim[37] = 174'h2dbcfed11eb5f3be537f303f1a1cbc88054300099144;
    stim[38] = 174'h3b98393dd9d06be1c8f2e1f64aa273a2abf227be3df6;
    stim[39] = 174'h3b7dfb7fde944c678ad61f38e7c0a5cb4eb10855db5d;
    stim[40] = 174'h33d5cfe77512c84420795cec7f2ea41f9b95ae8bdd32;
    stim[41] = 174'h20813bcb23064140791e7070e9962ef3e833786697e4;
    stim[42] = 174'h2d121c2970ba4e5f8ee03f879dfc3d10658b2949978c;
    stim[43] = 174'h39414d1f3bd00b7a34795a337cf7a9057e57199763bb;
    stim[44] = 174'h2e4415df96e496cf1ddac278affbb645d093cc70831a;
    stim[45] = 174'h2cc731d63c63cf73afeb344991bf6892b1bfdff9c4ed;
    stim[46] = 174'h208e616333bd69effdfe3925b4e9f63288de2de87a60;
    stim[47] = 174'h2fa5c8e59328ce9eb600b7f591857d86126254ec1a19;
    stim[48] = 174'h294723f02822429b6163739e0d63496c734160fc2ec1;
    stim[49] = 174'h3bd53749198b16e6357a3ea86c73f3b0c98efcb137c7;
    stim[50] = 174'h3c18fa6aa60fc632986d692c823d8e243ddb248a8893;
    stim[51] = 174'h3e7947b31f48fb23125811be13bc52ae6533f63ca870;
    stim[52] = 174'h382343d4fd6adeabd57120ba6e96685bd66648f4bdfa;
    stim[53] = 174'h36d3f3d66a69bd914458b3814c3b091a750364191746;
    stim[54] = 174'h3cce088b030f118f757ab1252f853f9eb173d19f7bd7;
    stim[55] = 174'h23122b806b55f3fd7dc6bed9b4a0a2c6f8bbcc9c4453;
    stim[56] = 174'h288ca3611be89c20ffb548a7415117d47d0460bff779;
    stim[57] = 174'h34c4340931758a7a4206b205f4d5449137887018ff96;
    stim[58] = 174'h2767088ec6bba8d6fafd7eefbb72b934f641e82682f6;
    stim[59] = 174'h22e9023ea3003891eed896c2a228e7506d152deff591;
    stim[60] = 174'h29e5aacd91b28323c20c8eca6c1e85e033fe494a16ac;
    stim[61] = 174'h35b28a4f786b99cd7ade6e6c4503a54cb683ba0a134f;
    stim[62] = 174'h266f99cb1c99d574807bf89c926ee03d16b5f5a1c046;
    stim[63] = 174'h3096da6ddb5041b1069d10bbde6a158347a18079f6ff;
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
      expv[0] = 41'hxxxxxxxxxxx;
      expv[1] = 41'h10xxxxxxxxx;
      expv[2] = 41'h1056bdf161b;
      expv[3] = 41'h109a8b644ca;
      expv[4] = 41'h10bc96f44aa;
      expv[5] = 41'h10f7920fb82;
      expv[6] = 41'h108d22f2b02;
      expv[7] = 41'h10db9da9e7a;
      expv[8] = 41'h1072b845173;
      expv[9] = 41'h083d6d63adf;
      expv[10] = 41'h040026ceab0;
      expv[11] = 41'h10af85cddc0;
      expv[12] = 41'h100ed45b003;
      expv[13] = 41'h085c7fd7783;
      expv[14] = 41'h04802eca42b;
      expv[15] = 41'h040767c6e9a;
      expv[16] = 41'h105fd934403;
      expv[17] = 41'h086bf9b2513;
      expv[18] = 41'h04800a4348b;
      expv[19] = 41'h04d080466fa;
      expv[20] = 41'h10f965c073b;
      expv[21] = 41'h1005735402a;
      expv[22] = 41'h109576e6a2b;
      expv[23] = 41'h108fe8797fb;
      expv[24] = 41'h10e0c345882;
      expv[25] = 41'h101eab484da;
      expv[26] = 41'h10a9ecc813a;
      expv[27] = 41'h108180d9982;
      expv[28] = 41'h10e3d05b193;
      expv[29] = 41'h108eab645c3;
      expv[30] = 41'h10c365e303b;
      expv[31] = 41'h086ee0863b7;
      expv[32] = 41'h088076cfc38;
      expv[33] = 41'h10006e576b0;
      expv[34] = 41'h10c656a992b;
      expv[35] = 41'h108b0bcf842;
      expv[36] = 41'h10a250a6942;
      expv[37] = 41'h10ed7f58cda;
      expv[38] = 41'h1036f3fb442;
      expv[39] = 41'h10ee60e4f73;
      expv[40] = 41'h08edf7edff7;
      expv[41] = 41'h08802896420;
      expv[42] = 41'h108018320a0;
      expv[43] = 41'h10344870a5b;
      expv[44] = 41'h08e505347ce;
      expv[45] = 41'h10803724b61;
      expv[46] = 41'h08331cc758f;
      expv[47] = 41'h04001deb4f0;
      expv[48] = 41'h106b600b7f0;
      expv[49] = 41'h10251c8fc0a;
      expv[50] = 41'h10ef54dd242;
      expv[51] = 41'h10f063e9aaa;
      expv[52] = 41'h10f9e51ecc2;
      expv[53] = 41'h10608d0f53a;
      expv[54] = 41'h105b4fcf59b;
      expv[55] = 41'h107338222c3;
      expv[56] = 41'h108c48ae01b;
      expv[57] = 41'h08a2328d847;
      expv[58] = 41'h04800bac53c;
      expv[59] = 41'h10efafd7ee9;
      expv[60] = 41'h100ba408faa;
      expv[61] = 41'h102796ab362;
      expv[62] = 41'h10d6ca293db;
      expv[63] = 41'h0899be672c3;
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
