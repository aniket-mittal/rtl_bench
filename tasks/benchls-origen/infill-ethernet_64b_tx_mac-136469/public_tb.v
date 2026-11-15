// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 197;
  localparam OW = 172;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_136469 dut (
    .clk(clk),
    .rst_n(in_vec[196:196]),
    .tx_data(in_vec[195:132]),
    .tx_keep(in_vec[131:124]),
    .tx_valid(in_vec[123:123]),
    .tx_sop(in_vec[122:122]),
    .tx_eop(in_vec[121:121]),
    .ptp_ts(in_vec[120:25]),
    .ifg_delay(in_vec[24:17]),
    .prbs31_enable(in_vec[16:16]),
    .user_tag(in_vec[15:0]),
    .tx_ready(out_vec[171:171]),
    .serdes_tx_data(out_vec[170:107]),
    .serdes_tx_header(out_vec[106:99]),
    .tx_ptp_ts(out_vec[98:3]),
    .tx_ptp_ts_valid(out_vec[2:2]),
    .tx_start(out_vec[1:1]),
    .tx_underflow_error(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 197'h0d6261e41802c6323b72777d756fa6b5433d5e68cfba8b0587;
    stim[1] = 197'h0e3c45c83721bd6d8707929a490d8f3bada58a462fdcfd6656;
    stim[2] = 197'h1df763390f8588ae6d9e0e500bf0fe04694c72378c568cec92;
    stim[3] = 197'h1b6784a959ffcac4f0462451a4be68e9a96627efd006838ed2;
    stim[4] = 197'h1fe7aea6e7b002f323d32728cb7daed975dcaffd837565438e;
    stim[5] = 197'h148b3f0bae2dafcabdb5010fb2dec1809e6f3152ed087f10dc;
    stim[6] = 197'h1ca74c0bf25d94c944e5781ba57b60818a488b11f885347ef3;
    stim[7] = 197'h1f4640a0927d1611f726ae0285e74f22c1b1177916f9055c3c;
    stim[8] = 197'h1cb4f3e85361004ff1638a444faccdf76969579dedee88bc0a;
    stim[9] = 197'h17820f21218b0c0df925ce2e5043511af76fdda3d1cea60f38;
    stim[10] = 197'h1ebdbf8837964c0624c6c65d3546e080d247515fcc1d320f66;
    stim[11] = 197'h12524dac3a36522fbb12cfdd968e77fb64eea057cf08942d94;
    stim[12] = 197'h15c082c68b7d1e2ebf95f8097754e25602501d3302707f64e9;
    stim[13] = 197'h04bc8ed88b968fd38bee946d39a4a9adfda234ec737c72fd0b;
    stim[14] = 197'h1a4f1711e5d065d8969ef8b0b0a4dcbf581950bf1c98cf7575;
    stim[15] = 197'h1a35075957ee885de953dc5959a99b3e693e831e76d11537f7;
    stim[16] = 197'h1c18687c2cfe31d4ca0a6825dce04c8813a7b4f5bfa9554fd6;
    stim[17] = 197'h1761af9bb3dafb7d21cd94585a874a42c7d9133baec6ed93de;
    stim[18] = 197'h1735c440b717c3aeef66e74f701075337cdb336946f6368812;
    stim[19] = 197'h1a018f7f8afc945d73e3940736b0a9f92e564f526e65efd2f7;
    stim[20] = 197'h1076efedc638a399e35922f7bb94c27a90099ef4afe94f7dbc;
    stim[21] = 197'h14383c03a90eacd47b121ee40a700bd87ae3a80c7d15a560bd;
    stim[22] = 197'h1f9a26508795cfe13d0265acfca6db4ee9bd2b33d047cb4007;
    stim[23] = 197'h165e60d27c63ef720b0ac615b109e95cdc7c8811c8e37dc839;
    stim[24] = 197'h1bb4d6b8a350e8d37873f4776f5003f33436bc024e41b251c8;
    stim[25] = 197'h136a1134b0c03f6259d2631f90e918e6e5868c2cd269e21dee;
    stim[26] = 197'h1afd3e7abb57e8bcc86f4b4b5d48ef26db3c0ef8ba1555cc66;
    stim[27] = 197'h1df3cf0d5585fb9545f715d74b22a1fa77b394c10023cfacc4;
    stim[28] = 197'h1ba6b6ab1a87c50c1efeb958181e1dfb268d2fd07719481d2a;
    stim[29] = 197'h1de4aa26ea367f26ce13b61c0941e730756a9cd75a30a78a46;
    stim[30] = 197'h127cd8fc10ee8c734de36e96fd61b5bc2d0549e798d8f629da;
    stim[31] = 197'h19b7ae20b6ad8a8e8caf03f46b6bb03c81fe8006e133965150;
    stim[32] = 197'h1e014d0d08b6c292ed9b89d7f7c7a3d892997fe4d2bc1f70e5;
    stim[33] = 197'h177694a5369ff96e6951abeaa20c295a9bc1455e01074d9f81;
    stim[34] = 197'h15cd8a8bb1468b1a1d7c930a90d37e1b455f137f3d83278c93;
    stim[35] = 197'h16bacf115882a87f746b1a4a878f54310e545be06fd5c4e7c8;
    stim[36] = 197'h1cdbf873cd004a834667da3283a1e6b0d0d008119b7f0dfcea;
    stim[37] = 197'h1143956574dc675e245cdbd12782e39031f3a6860bace6aea1;
    stim[38] = 197'h1757737a14c6909deb601af2784995a694e71621ff977617d7;
    stim[39] = 197'h11ec1389c01605772737c084684b0869411c21722a6cc726e5;
    stim[40] = 197'h0c25419b424280bd5196ed9da001746f77daf058a5bbf4b68a;
    stim[41] = 197'h14e6691f06f59501afbb696440f3625715fa9e9b74d9033b53;
    stim[42] = 197'h1d19d7af0328e1061882b9b22e4d9209238d58fff846529ad3;
    stim[43] = 197'h1eb09a1698650b1b85d6dba08e8f03b1576bce8706c8ca2cb4;
    stim[44] = 197'h1108469b7f1883b74d2bf866829aab215a23497953ddce8495;
    stim[45] = 197'h1e1587c41b4caf7665d65eceff7a99481e5217bae4267de06e;
    stim[46] = 197'h11f77e9ebac3a7ca5989b6a421936d72870dd7ad0012085084;
    stim[47] = 197'h15da2fc104f078f346c549cf50ab6401a2cbc710330ec4b426;
    stim[48] = 197'h1a727fb6504b608cfb20a87edd68f4c3417e409bf1b8c67b26;
    stim[49] = 197'h171ec58e357fb8341335cb2bf7e2ebf4ff8d8f622a49e12d4d;
    stim[50] = 197'h1966a98a8c9a8abefc6ce4b7efd27b725db7d7a5159990c60f;
    stim[51] = 197'h103d8ea497d84ab54f2f9a8da9b7557b137386c1313832d295;
    stim[52] = 197'h104d360357e80279653d13880f360bee09af48c89ada743bf7;
    stim[53] = 197'h164271366357dc94b706fafab9046541a1e76fc169ea7deb4c;
    stim[54] = 197'h12bd22017e755bda311313a73aa43fea40fc6e95ae02e6b827;
    stim[55] = 197'h1042ce14181bb173953a8526b8fe93b573dff7235934bd7b22;
    stim[56] = 197'h1a58bc68b8c96e536cbc5a61ff73322ec888de57fbd8c6f1cc;
    stim[57] = 197'h1838b9c215f4a7f887f10a0293f3e73145d73262060c023b05;
    stim[58] = 197'h19bdd7f29dd2caf5427dbc8297f368ce44b2b0551a80bc2dd4;
    stim[59] = 197'h1ea3e4cb8f9a78803d8e136f7545261b54d5a266d3b3b8e448;
    stim[60] = 197'h1ed032f0f8e5019a363153f25ccd3f440a1da247778d2c8baf;
    stim[61] = 197'h16afb8b7ff060cd654aef54d4d9f7bc6803a3561d3eb1edf03;
    stim[62] = 197'h18caf20fd31d51bb87cb05381452309e0e70638b0bf68336d0;
    stim[63] = 197'h195e2eb14dc804c9fea492b960f515738542dbffa86e5325e3;
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
      expv[0] = 172'h8000000000000000000000000000000000000000000;
      expv[1] = 172'h8000000000000000000000000000000000000000000;
      expv[2] = 172'h8000000000000000000000000000000000000000002;
      expv[3] = 172'h6fbb19c87c2c4573088000000000000000000000001;
      expv[4] = 172'h6fbb19c87c2c4573088914692f9a3a6a5989fbf401c;
      expv[5] = 172'h6fbb19c87c2c4573088914692f9a3a6a5989fbf401c;
      expv[6] = 172'h6fbb19c87c2c4573088914692f9a3a6a5989fbf401c;
      expv[7] = 172'h6fbb19c87c2c4573088914692f9a3a6a5989fbf401c;
      expv[8] = 172'h6fbb19c87c2c4573088914692f9a3a6a5989fbf401c;
      expv[9] = 172'h6fbb19c87c2c4573088914692f9a3a6a5989fbf401c;
      expv[10] = 172'h6fbb19c87c2c4573088914692f9a3a6a5989fbf401c;
      expv[11] = 172'h6fbb19c87c2c4573088914692f9a3a6a5989fbf401c;
      expv[12] = 172'h6fbb19c87c2c4573088914692f9a3a6a5989fbf401c;
      expv[13] = 172'h8000000000000000000000000000000000000000002;
      expv[14] = 172'h8000000000000000000000000000000000000000002;
      expv[15] = 172'h5278b88f2e832ec4888000000000000000000000001;
      expv[16] = 172'h5278b88f2e832ec488f716566a66cf9a4fa0c79db44;
      expv[17] = 172'h5278b88f2e832ec488f716566a66cf9a4fa0c79db44;
      expv[18] = 172'h5278b88f2e832ec488f716566a66cf9a4fa0c79db44;
      expv[19] = 172'h5278b88f2e832ec488f716566a66cf9a4fa0c79db44;
      expv[20] = 172'h5278b88f2e832ec488f716566a66cf9a4fa0c79db44;
      expv[21] = 172'h5278b88f2e832ec488f716566a66cf9a4fa0c79db44;
      expv[22] = 172'h5278b88f2e832ec488f716566a66cf9a4fa0c79db44;
      expv[23] = 172'h5278b88f2e832ec488f716566a66cf9a4fa0c79db44;
      expv[24] = 172'h5278b88f2e832ec488f716566a66cf9a4fa0c79db44;
      expv[25] = 172'h5278b88f2e832ec488f716566a66cf9a4fa0c79db44;
      expv[26] = 172'h5278b88f2e832ec488f716566a66cf9a4fa0c79db44;
      expv[27] = 172'h5278b88f2e832ec488f716566a66cf9a4fa0c79db44;
      expv[28] = 172'h5278b88f2e832ec488f716566a66cf9a4fa0c79db44;
      expv[29] = 172'h5278b88f2e832ec488f716566a66cf9a4fa0c79db44;
      expv[30] = 172'h5278b88f2e832ec488f716566a66cf9a4fa0c79db44;
      expv[31] = 172'h5278b88f2e832ec488f716566a66cf9a4fa0c79db44;
      expv[32] = 172'h5278b88f2e832ec488f716566a66cf9a4fa0c79db44;
      expv[33] = 172'h5278b88f2e832ec488f716566a66cf9a4fa0c79db44;
      expv[34] = 172'h5278b88f2e832ec488f716566a66cf9a4fa0c79db44;
      expv[35] = 172'h5278b88f2e832ec488f716566a66cf9a4fa0c79db44;
      expv[36] = 172'h5278b88f2e832ec488f716566a66cf9a4fa0c79db44;
      expv[37] = 172'h5278b88f2e832ec488f716566a66cf9a4fa0c79db44;
      expv[38] = 172'h5278b88f2e832ec488f716566a66cf9a4fa0c79db44;
      expv[39] = 172'h5278b88f2e832ec488f716566a66cf9a4fa0c79db44;
      expv[40] = 172'h8000000000000000000000000000000000000000000;
      expv[41] = 172'h8000000000000000000000000000000000000000000;
      expv[42] = 172'h8000000000000000000000000000000000000000000;
      expv[43] = 172'h8000000000000000000000000000000000000000000;
      expv[44] = 172'h8000000000000000000000000000000000000000000;
      expv[45] = 172'h8000000000000000000000000000000000000000000;
      expv[46] = 172'h8000000000000000000000000000000000000000000;
      expv[47] = 172'h8000000000000000000000000000000000000000000;
      expv[48] = 172'h8000000000000000000000000000000000000000000;
      expv[49] = 172'h8000000000000000000000000000000000000000000;
      expv[50] = 172'h8000000000000000000000000000000000000000002;
      expv[51] = 172'h4b354c5464d455f7880000000000000000000000000;
      expv[52] = 172'h01ec7524bec255aa00e6a36a6dd55ec4dce1b04c4e4;
      expv[53] = 172'h01ec7524bec255aa00e6a36a6dd55ec4dce1b04c4e4;
      expv[54] = 172'h01ec7524bec255aa00e6a36a6dd55ec4dce1b04c4e4;
      expv[55] = 172'h01ec7524bec255aa00e6a36a6dd55ec4dce1b04c4e4;
      expv[56] = 172'h01ec7524bec255aa00e6a36a6dd55ec4dce1b04c4e4;
      expv[57] = 172'h01ec7524bec255aa00e6a36a6dd55ec4dce1b04c4e4;
      expv[58] = 172'h01ec7524bec255aa00e6a36a6dd55ec4dce1b04c4e4;
      expv[59] = 172'h01ec7524bec255aa00e6a36a6dd55ec4dce1b04c4e4;
      expv[60] = 172'h01ec7524bec255aa00e6a36a6dd55ec4dce1b04c4e4;
      expv[61] = 172'h01ec7524bec255aa00e6a36a6dd55ec4dce1b04c4e4;
      expv[62] = 172'h01ec7524bec255aa00e6a36a6dd55ec4dce1b04c4e4;
      expv[63] = 172'h01ec7524bec255aa00e6a36a6dd55ec4dce1b04c4e4;
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
