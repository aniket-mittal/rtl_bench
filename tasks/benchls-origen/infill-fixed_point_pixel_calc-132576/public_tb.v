// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 161;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_132576 dut (
    .clk(clk),
    .rstn(in_vec[160:160]),
    .dx_fx(in_vec[159:128]),
    .dy_fx(in_vec[127:96]),
    .cmp_i(in_vec[95:0]),
    .curr_i(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 161'h0095cd25ec2f5264661655477c83cc08c13009f4c;
    stim[1] = 161'h00a969daba948098320284ae37f76adc15e66dd28;
    stim[2] = 161'h180b5f0c685d50e0c5ea4936c4ba492c63f61cc9b;
    stim[3] = 161'h105bdff995fd7e82d2328e24ee2530dc811ced674;
    stim[4] = 161'h1e0043735457606391166330a4b48b999a5584389;
    stim[5] = 161'h136a87bc584c3414cd6507b95003f0ac496305c02;
    stim[6] = 161'h1c1887d9dd79ac68b4413065f4acd8582bfc797ca;
    stim[7] = 161'h1a4bd91850ba97401340f435e6d6bf188f7080917;
    stim[8] = 161'h1192dd6ec16f12863f034571afc388073d4a2da33;
    stim[9] = 161'h170786215613e39fba8c7bac07257a40405f8f602;
    stim[10] = 161'h07eadcedc83c244e350c61db0d0b0a835411a1ef3;
    stim[11] = 161'h1445ee3af14aa0a475c6e7da9f125352feebc4147;
    stim[12] = 161'h1d952230f36a95f45dfac1421667c2c2f29a22f09;
    stim[13] = 161'h1e269a11058ae81484ce0090e9a51a63aba7b1352;
    stim[14] = 161'h1018413795aa15e7527023ae58fa090096816a036;
    stim[15] = 161'h170cd52f9cc2faf157fd9f8bb587e0b307bab81e4;
    stim[16] = 161'h19a7f74b012c2e4ea132e7f1a6df550a2f0c41dd6;
    stim[17] = 161'h172d9e8c5df84c854013a04eafac1aa30754800b6;
    stim[18] = 161'h1102c449041bd04001806f0d4c092c9010d9b45a1;
    stim[19] = 161'h15d848f13b4e5a1312fb9e8de4a7cb0cc40976cab;
    stim[20] = 161'h125b16004068cae710a732f508382ee7b935b3802;
    stim[21] = 161'h1d3a2ef4d8149279d0ab291afab097b7508cd2482;
    stim[22] = 161'h12b2760e44ad406bd6c02c012db136584cff0ad71;
    stim[23] = 161'h173f591f006cda25a8477c069af8b948f8b22e7ce;
    stim[24] = 161'h180c25ad8e379c790f63c8a3472fb82f181f1371d;
    stim[25] = 161'h1227c408a14faeec2e7c0aec0d23396cc7dcae507;
    stim[26] = 161'h1786d44adf18b50dbd25ca703addae492b56c1d03;
    stim[27] = 161'h14ef8ca77b179c195875318d19a8d254d50dd8dbf;
    stim[28] = 161'h102c78106c06cd067fb10a878eb8812db59486f67;
    stim[29] = 161'h1c17f57647c969e66874a04a1819dd813f81fc829;
    stim[30] = 161'h19772712d9e98f2b0f9f9d7cf667df6c350cf551c;
    stim[31] = 161'h1fe5718ec4d8ccfa5b54406abef86c12b7c9e5cd8;
    stim[32] = 161'h19c23db7863503699e7c1b8f662f6875c1f6de649;
    stim[33] = 161'h1b5a1097153d29b192db8b93784e07d5541767e11;
    stim[34] = 161'h145fa3533f45b5fc08585d965afce9a19024b2a4a;
    stim[35] = 161'h10201d3bc5105a4fa9243c8ded928b8d29bc0d242;
    stim[36] = 161'h1a655a3c2d38b46e712cfad126c69632879624a2c;
    stim[37] = 161'h1f7df6e532002ce2acf22872fe306e1862320cc87;
    stim[38] = 161'h195f0b4462076391e4ed909653cb26cd2b5ce84a5;
    stim[39] = 161'h151284bbb9bca5c8caf636bcc059a0d1cba21e6b8;
    stim[40] = 161'h16b9c90cb07b8633cb8db6fcea8d2a8ba3f453bba;
    stim[41] = 161'h123b3f62dd94624ebce39b2ad9f6f6082916e100f;
    stim[42] = 161'h1ddcfe69ea2de2d66804779e2fb22cf2005e8a010;
    stim[43] = 161'h17dfe6300cc3808dbc91c3b48b5763e7a76e72836;
    stim[44] = 161'h16084cae17397842a7a14cca2ac032943854b33d7;
    stim[45] = 161'h18b28523495a0f8b07e018098bae8449c27f90e55;
    stim[46] = 161'h104844960a0d832c54e7e209801f1a03bc750d885;
    stim[47] = 161'h18184219ce86ab31373d135af0b6c54e573539fe1;
    stim[48] = 161'h19dd889165810155c11ab5248e158bb209db91c31;
    stim[49] = 161'h1702bfa527c6b0faaf89e7ac6104c1dbbee9a8d06;
    stim[50] = 161'h133c38866b11d6573340abf519f0afa3dd3f72f1e;
    stim[51] = 161'h12dec7b12328ea44d70be4e820e9e3ac459f62e6f;
    stim[52] = 161'h1948a06ab006885763d3c783c3cc85cc924de266e;
    stim[53] = 161'h17af5eab700778f992bbaff820927c9547e8e1473;
    stim[54] = 161'h1b44ded213280f94ed75b22527ccc54e80e936108;
    stim[55] = 161'h1174afb82be8539d4fd959fdf3cd38653722688fe;
    stim[56] = 161'h14280f81efec2df8e52278e5fbbb61cae18cc982f;
    stim[57] = 161'h17338588be8555b2a6f578c852dad9952a92ce185;
    stim[58] = 161'h11211e30505120078bba70233651fccbef87f2859;
    stim[59] = 161'h193163dfbf00de70dd26f7250c591f77e3d08cf59;
    stim[60] = 161'h1479a11a1c5c762bad6ed4e29ebb63759a7ba17ce;
    stim[61] = 161'h1fc020f5d7742738cb49692aa3d35127733ee53fc;
    stim[62] = 161'h1f87828de2441058483d43bfa916c461e4b49c6af;
    stim[63] = 161'h17b856fc93947ba590e089a01370c928be426a1af;
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
      expv[0] = 8'h00;
      expv[1] = 8'h00;
      expv[2] = 8'h00;
      expv[3] = 8'hcc;
      expv[4] = 8'hd6;
      expv[5] = 8'h00;
      expv[6] = 8'hff;
      expv[7] = 8'h00;
      expv[8] = 8'hff;
      expv[9] = 8'h00;
      expv[10] = 8'h00;
      expv[11] = 8'h00;
      expv[12] = 8'h41;
      expv[13] = 8'h2f;
      expv[14] = 8'hfb;
      expv[15] = 8'h00;
      expv[16] = 8'h00;
      expv[17] = 8'hff;
      expv[18] = 8'h00;
      expv[19] = 8'hff;
      expv[20] = 8'h00;
      expv[21] = 8'h70;
      expv[22] = 8'h00;
      expv[23] = 8'h49;
      expv[24] = 8'h00;
      expv[25] = 8'h5a;
      expv[26] = 8'hff;
      expv[27] = 8'h00;
      expv[28] = 8'h28;
      expv[29] = 8'h00;
      expv[30] = 8'h00;
      expv[31] = 8'h00;
      expv[32] = 8'h00;
      expv[33] = 8'h00;
      expv[34] = 8'h00;
      expv[35] = 8'h00;
      expv[36] = 8'hff;
      expv[37] = 8'h00;
      expv[38] = 8'h17;
      expv[39] = 8'h00;
      expv[40] = 8'h00;
      expv[41] = 8'h06;
      expv[42] = 8'h00;
      expv[43] = 8'h4d;
      expv[44] = 8'h00;
      expv[45] = 8'h00;
      expv[46] = 8'hff;
      expv[47] = 8'he9;
      expv[48] = 8'h00;
      expv[49] = 8'hff;
      expv[50] = 8'hff;
      expv[51] = 8'hff;
      expv[52] = 8'had;
      expv[53] = 8'hef;
      expv[54] = 8'h57;
      expv[55] = 8'h6c;
      expv[56] = 8'hc8;
      expv[57] = 8'hff;
      expv[58] = 8'hff;
      expv[59] = 8'h00;
      expv[60] = 8'h00;
      expv[61] = 8'h6c;
      expv[62] = 8'h00;
      expv[63] = 8'h00;
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
