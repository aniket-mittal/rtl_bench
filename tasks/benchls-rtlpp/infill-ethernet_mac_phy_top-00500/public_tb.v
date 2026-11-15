// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 87;
  localparam OW = 87;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00500 dut (
    .clk(clk),
    .ff_tx_data(in_vec[86:55]),
    .ff_tx_eop(in_vec[54:54]),
    .ff_tx_err(in_vec[53:53]),
    .ff_tx_mod(in_vec[52:51]),
    .ff_tx_sop(in_vec[50:50]),
    .ff_tx_wren(in_vec[49:49]),
    .ff_tx_clk(in_vec[48:48]),
    .ff_rx_rdy(in_vec[47:47]),
    .ff_rx_clk(in_vec[46:46]),
    .address(in_vec[45:38]),
    .read(in_vec[37:37]),
    .writedata(in_vec[36:5]),
    .write(in_vec[4:4]),
    .reset(in_vec[3:3]),
    .mdio_in(in_vec[2:2]),
    .rxp(in_vec[1:1]),
    .ref_clk(in_vec[0:0]),
    .ff_tx_rdy(out_vec[86:86]),
    .ff_rx_data(out_vec[85:54]),
    .ff_rx_dval(out_vec[53:53]),
    .ff_rx_eop(out_vec[52:52]),
    .ff_rx_mod(out_vec[51:50]),
    .ff_rx_sop(out_vec[49:49]),
    .rx_err(out_vec[48:43]),
    .readdata(out_vec[42:11]),
    .waitrequest(out_vec[10:10]),
    .mdio_out(out_vec[9:9]),
    .mdio_oen(out_vec[8:8]),
    .mdc(out_vec[7:7]),
    .led_an(out_vec[6:6]),
    .led_char_err(out_vec[5:5]),
    .led_link(out_vec[4:4]),
    .led_disp_err(out_vec[3:3]),
    .led_crs(out_vec[2:2]),
    .led_col(out_vec[1:1]),
    .txp(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 87'h3b59dc700417b53c20a4fe;
    stim[1] = 87'h007e2ef399049fc915081a;
    stim[2] = 87'h63f472e175489eda3b1031;
    stim[3] = 87'h1e9bbb6878804aceb8e591;
    stim[4] = 87'h2dc3f9c20af0c165c57f24;
    stim[5] = 87'h1078e86bbfa716b113f951;
    stim[6] = 87'h1618b57d859e600d5bc290;
    stim[7] = 87'h05106972a9e70f7b2ae741;
    stim[8] = 87'h383943aa72e42831a0ae81;
    stim[9] = 87'h3600409ae33b9aef585976;
    stim[10] = 87'h5603dbf5a5dc091591b791;
    stim[11] = 87'h728038ab4ca7512439b284;
    stim[12] = 87'h4d59fc7608447d16261ef0;
    stim[13] = 87'h6c7fa940fafdad183764d5;
    stim[14] = 87'h68e0ce2654bdf6a69fbae5;
    stim[15] = 87'h541aeecaaaa97c8513c815;
    stim[16] = 87'h0cae39f2d8269530f04725;
    stim[17] = 87'h113daad816b90899eecd33;
    stim[18] = 87'h70b67aa6e5bd5f6a090b22;
    stim[19] = 87'h4f89b93b48a57eee92fe31;
    stim[20] = 87'h524585510f858776f089f0;
    stim[21] = 87'h47737553ea5ad13a4fdbc3;
    stim[22] = 87'h2fc1ca67d884b156c1b326;
    stim[23] = 87'h713b4f2b1affd744ebe416;
    stim[24] = 87'h3816bdc61422444f29e814;
    stim[25] = 87'h36a481055eca562d615c63;
    stim[26] = 87'h2fab5a0ac4bf9c8cc3fdb3;
    stim[27] = 87'h0a7bf3044f40c9cc591123;
    stim[28] = 87'h742cb85f7f2eb35f8474c2;
    stim[29] = 87'h7aabda61c39c1009d4aa33;
    stim[30] = 87'h029b3f86924400652e4912;
    stim[31] = 87'h1414d27b99704032d4e270;
    stim[32] = 87'h34a25f3cab9fa79ecb95e4;
    stim[33] = 87'h59fd3ffffb856cb3da83b7;
    stim[34] = 87'h4492ddcee44b4722b4fd13;
    stim[35] = 87'h04deb4f2d01ebc76223040;
    stim[36] = 87'h7be3e6bcf471750f5fd985;
    stim[37] = 87'h5c645cc0fd72541e43b473;
    stim[38] = 87'h6758d71bf62e37f47a5275;
    stim[39] = 87'h01c13c4028ec031ba236e3;
    stim[40] = 87'h26c78b54b765a347942387;
    stim[41] = 87'h6c0a8895b21d0a7e232aa6;
    stim[42] = 87'h015ba72b390130f5a841e6;
    stim[43] = 87'h1fa0f65c3c311323dd1c03;
    stim[44] = 87'h05466355d1fe8c52a94f13;
    stim[45] = 87'h4d9cdc972f339597519db1;
    stim[46] = 87'h708e4eaf91f5742b337d77;
    stim[47] = 87'h30f4c1f7e7265f65f953d2;
    stim[48] = 87'h0775bedf168208e0070ad3;
    stim[49] = 87'h345ec2020bc03f493c7494;
    stim[50] = 87'h08ce5e2419bbcf6f7aa383;
    stim[51] = 87'h62b334e3d746868d924d82;
    stim[52] = 87'h467813e75d0bab28c61217;
    stim[53] = 87'h735d3410532a317ce2d8f4;
    stim[54] = 87'h73bf13277aaf229bade8b5;
    stim[55] = 87'h00849a8a7565b3f9bcb282;
    stim[56] = 87'h08ef5691c2ddcf8574c382;
    stim[57] = 87'h1a0a2619d6da528ba58362;
    stim[58] = 87'h3d55f6a5ff2456cf6f50b7;
    stim[59] = 87'h665b5274486aad286b2d31;
    stim[60] = 87'h55b24db60027809a0bda03;
    stim[61] = 87'h1a4ac4fb55b4696c620536;
    stim[62] = 87'h763d699f211e3161b85e23;
    stim[63] = 87'h362e1c3f01c42471a48ff7;
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
      expv[0] = 87'h0000000000000000000201;
      expv[1] = 87'h0000000000000000000001;
      expv[2] = 87'h0000000000000000000000;
      expv[3] = 87'h31fa39709a07b68ec40800;
      expv[4] = 87'h0f4dddb41c02b3ae396200;
      expv[5] = 87'h56e1fce1240059715fc800;
      expv[6] = 87'h483c7435ee05ac44fe5000;
      expv[7] = 87'h0b0c5abec2000356f0a000;
      expv[8] = 87'h028834b94403decab9d000;
      expv[9] = 87'h5c1ca1d538020c682ba201;
      expv[10] = 87'h5b00204d7006bbd6165800;
      expv[11] = 87'h2b01edfac20245646de200;
      expv[12] = 87'h39401c559604490e6ca000;
      expv[13] = 87'h26acfe3b0407458987ba00;
      expv[14] = 87'h763fd4a07c03460dd93200;
      expv[15] = 87'h347067131a05a9a7eeba00;
      expv[16] = 87'h6a0d776564072144f20200;
      expv[17] = 87'h06571cf95c054c3c11c801;
      expv[18] = 87'h489ed56c2a02267bb34801;
      expv[19] = 87'h385b3d535207da8242c800;
      expv[20] = 87'h27c4dc9d9407bba4bf8800;
      expv[21] = 87'h6922c2a8a601ddbc227801;
      expv[22] = 87'h63b9baa9f4044e93f6f201;
      expv[23] = 87'h17e0e533dc0455b06cca01;
      expv[24] = 87'h789da795ac05d13af90200;
      expv[25] = 87'h1c0b5ee30a0113ca7a0001;
      expv[26] = 87'h5b524082be058b58571801;
      expv[27] = 87'h17d5ad0552072330ff6801;
      expv[28] = 87'h453df98236027316444801;
      expv[29] = 87'h7a165c2fbe04d7e11d3001;
      expv[30] = 87'h7d55ed30f00402752a8801;
      expv[31] = 87'h414d9fc36800194b924000;
      expv[32] = 87'h0a0a693dcc000cb5389a00;
      expv[33] = 87'h5a512f9e6401e7b2e57a01;
      expv[34] = 87'h6cfe9ffffc032cf6a0e801;
      expv[35] = 87'h22496ee75201c8ad3f4000;
      expv[36] = 87'h026f5a7958071d888c1200;
      expv[37] = 87'h3df1f35e5a0543d7f66001;
      expv[38] = 87'h2e322e605e050790ed1a00;
      expv[39] = 87'h73ac6b8dfa05fd1e949801;
      expv[40] = 87'h00e09e200400c6e88dba01;
      expv[41] = 87'h5363c5aa6a00d1e508e201;
      expv[42] = 87'h7605444ae8029f88caaa01;
      expv[43] = 87'h00add3958c043d6a107801;
      expv[44] = 87'h0fd07b2e0e04c8f7470001;
      expv[45] = 87'h02a331aad80314aa53c000;
      expv[46] = 87'h66ce6e4ba60565d4676a01;
      expv[47] = 87'h38472757c8050accdf5801;
      expv[48] = 87'h587a60fbf207d97e54f001;
      expv[49] = 87'h43badf6faa023801c2b200;
      expv[50] = 87'h5a2f61012407d24f1d2001;
      expv[51] = 87'h04672f120c03dbdea8e001;
      expv[52] = 87'h71599a71fa01a364936201;
      expv[53] = 87'h233c09f39e02ca31848200;
      expv[54] = 87'h79ae9a0838045f38b63a00;
      expv[55] = 87'h79df8993bc00a6eb7a2801;
      expv[56] = 87'h00424d451a04fe6f2ca001;
      expv[57] = 87'h4477ab48f003e15d30e001;
      expv[58] = 87'h4d05130cfa04a2e960da01;
      expv[59] = 87'h5eaafb52fe05b3dbd42800;
      expv[60] = 87'h332da93a14034a1acb4801;
      expv[61] = 87'h2ad926db00002682f68201;
      expv[62] = 87'h0d25627d9a025b18814801;
      expv[63] = 87'h3b1eb4cf8004586e178a01;
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
