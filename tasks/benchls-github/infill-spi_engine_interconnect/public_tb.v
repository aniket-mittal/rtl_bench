// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 78;
  localparam OW = 68;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  spi_engine_interconnect dut (
    .clk(clk),
    .resetn(in_vec[77:77]),
    .interconnect_dir(in_vec[76:76]),
    .m_cmd_ready(in_vec[75:75]),
    .m_sdo_ready(in_vec[74:74]),
    .m_sdi_valid(in_vec[73:73]),
    .m_sdi_data(in_vec[72:65]),
    .m_sync_valid(in_vec[64:64]),
    .m_sync(in_vec[63:56]),
    .s0_cmd_valid(in_vec[55:55]),
    .s0_cmd_data(in_vec[54:39]),
    .s0_sdo_valid(in_vec[38:38]),
    .s0_sdo_data(in_vec[37:30]),
    .s0_sdi_ready(in_vec[29:29]),
    .s0_sync_ready(in_vec[28:28]),
    .s1_cmd_valid(in_vec[27:27]),
    .s1_cmd_data(in_vec[26:11]),
    .s1_sdo_valid(in_vec[10:10]),
    .s1_sdo_data(in_vec[9:2]),
    .s1_sdi_ready(in_vec[1:1]),
    .s1_sync_ready(in_vec[0:0]),
    .m_cmd_valid(out_vec[67:67]),
    .m_cmd_data(out_vec[66:51]),
    .m_sdo_valid(out_vec[50:50]),
    .m_sdo_data(out_vec[49:42]),
    .m_sdi_ready(out_vec[41:41]),
    .m_sync_ready(out_vec[40:40]),
    .s0_cmd_ready(out_vec[39:39]),
    .s0_sdo_ready(out_vec[38:38]),
    .s0_sdi_valid(out_vec[37:37]),
    .s0_sdi_data(out_vec[36:29]),
    .s0_sync_valid(out_vec[28:28]),
    .s0_sync(out_vec[27:20]),
    .s1_cmd_ready(out_vec[19:19]),
    .s1_sdo_ready(out_vec[18:18]),
    .s1_sdi_valid(out_vec[17:17]),
    .s1_sdi_data(out_vec[16:9]),
    .s1_sync_valid(out_vec[8:8]),
    .s1_sync(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 78'h0d8ae0fc72b9c1d06c8a;
    stim[1] = 78'h186f087499c197759bef;
    stim[2] = 78'h2b961ec50384fdee9449;
    stim[3] = 78'h3fd6bde52edf148c8f37;
    stim[4] = 78'h28e4fce071deb4bc4538;
    stim[5] = 78'h34d46611c03d46298c86;
    stim[6] = 78'h2acbb225c1b96b79a9d7;
    stim[7] = 78'h2315a8c27995527e8faf;
    stim[8] = 78'h3ec53fe865889253d269;
    stim[9] = 78'h2ffb4e30ab72146e1d36;
    stim[10] = 78'h3e94005adadb26e3cd13;
    stim[11] = 78'h32553a33391fd1e5346e;
    stim[12] = 78'h3b592cecbd0ead0342eb;
    stim[13] = 78'h2180e62631d90cc28d66;
    stim[14] = 78'h24d7f06917e2df9b4992;
    stim[15] = 78'h3a4b5e03c47056379571;
    stim[16] = 78'h34008b0db481f886c421;
    stim[17] = 78'h2567970172d24431caaf;
    stim[18] = 78'h3be2829585a279eb6f91;
    stim[19] = 78'h34275cdbd5c36220c610;
    stim[20] = 78'h3f7e34a690ad8a08f90b;
    stim[21] = 78'h23f8aaf676cc30dace4a;
    stim[22] = 78'h2599240c7fd25fb219f4;
    stim[23] = 78'h25315c2d87f056dac705;
    stim[24] = 78'h3ddca9be14c3aff7da37;
    stim[25] = 78'h355462c6fec21a14338e;
    stim[26] = 78'h3f7919f97e76bca79f37;
    stim[27] = 78'h272f7c987d5332c7e981;
    stim[28] = 78'h2ed9dcee9e4c2d1cf339;
    stim[29] = 78'h370ca0e14f6b711cb544;
    stim[30] = 78'h218da4005dfbd5aec84d;
    stim[31] = 78'h2b3c9532b80a5157cbd6;
    stim[32] = 78'h2629b163d94632e04869;
    stim[33] = 78'h210e43f5ea4193358572;
    stim[34] = 78'h286fea3d5f6230ca1609;
    stim[35] = 78'h37e97bd096d7d57406e3;
    stim[36] = 78'h335d373261c4ec85f2e5;
    stim[37] = 78'h2b4961de2c8b7ef18608;
    stim[38] = 78'h2b04b318c52081f24beb;
    stim[39] = 78'h22d9709a5644798ffb90;
    stim[40] = 78'h35076c0b8c2c7035bff1;
    stim[41] = 78'h3095355df86a6b47afe6;
    stim[42] = 78'h3633da4f275b726d3002;
    stim[43] = 78'h3b8e49deaae58a6e8158;
    stim[44] = 78'h30f23304d857c4d2522c;
    stim[45] = 78'h32f2934d715c311f3f13;
    stim[46] = 78'h3349a5b9e0569a457124;
    stim[47] = 78'h2894bb4d878046cf4b61;
    stim[48] = 78'h2c2ac682c984b52a70d7;
    stim[49] = 78'h23bbca21504528a2d978;
    stim[50] = 78'h2e0d0aacd0373435e089;
    stim[51] = 78'h310232d2d93aaab9f6e5;
    stim[52] = 78'h25ca36716e09f6a4f10e;
    stim[53] = 78'h356af5d9dd80d3d83cfe;
    stim[54] = 78'h27b664f2e9d1f524f103;
    stim[55] = 78'h23b417a9d2283426d4c0;
    stim[56] = 78'h2069d402114015ad1c1d;
    stim[57] = 78'h25c581d4fe30fb47a9c4;
    stim[58] = 78'h368560dffbe3061e034a;
    stim[59] = 78'h3571464a437e4fe2f6cd;
    stim[60] = 78'h23b429d97842815421d8;
    stim[61] = 78'h2fe72a70651ac68bc0ca;
    stim[62] = 78'h3c4af032b73f7f20be49;
    stim[63] = 78'h3fc3bab4c8e082190d28;
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
      expv[0] = 68'h1d06c8a18ae0d8ae0;
      expv[1] = 68'h7499c1986f0806e08;
      expv[2] = 68'hdee94491961eb961e;
      expv[3] = 68'he52edf1fd6bd1d6bd;
      expv[4] = 68'h4bc45380e4fc8e4fc;
      expv[5] = 68'h11c03d44d4660d466;
      expv[6] = 68'hb79a9d70cab2acbb2;
      expv[7] = 68'h27e8faf114a8315a8;
      expv[8] = 68'he865889ec53f0c43f;
      expv[9] = 68'h46e1d361fa4effb4e;
      expv[10] = 68'h5adadb2e940009400;
      expv[11] = 68'h33391fd2553a0543a;
      expv[12] = 68'hecbd0eab592c1582c;
      expv[13] = 68'hcc28d66180e6180e6;
      expv[14] = 68'hf9b49920d6f04d7f0;
      expv[15] = 68'h03c4705a4b5e04a5e;
      expv[16] = 68'h0db481f4008b0008b;
      expv[17] = 68'h431caaf1669756797;
      expv[18] = 68'h9585a27be2821e282;
      expv[19] = 68'hdbd5c364275c0265c;
      expv[20] = 68'ha690ad8f7e3417e34;
      expv[21] = 68'h0dace4a1f8aa3f8aa;
      expv[22] = 68'hfb219f41982459924;
      expv[23] = 68'h6dac7051305c5315c;
      expv[24] = 68'hbe14c3addca91dca9;
      expv[25] = 68'hc6fec215546215462;
      expv[26] = 68'hf97e76bf791917819;
      expv[27] = 68'h2c7e98112e7c72f7c;
      expv[28] = 68'hd1cf3390d8dced9dc;
      expv[29] = 68'he14f6b770ca010ca0;
      expv[30] = 68'h5aec84d18ca418da4;
      expv[31] = 68'h157cbd613c95b3c95;
      expv[32] = 68'h2e04869028b1629b1;
      expv[33] = 68'h335857210e4310e43;
      expv[34] = 68'h0ca160906eea86fea;
      expv[35] = 68'hd096d7d7e97b1e87b;
      expv[36] = 68'h3261c4e35d3715c37;
      expv[37] = 68'hef1860814861b4961;
      expv[38] = 68'h1f24beb104b3b04b3;
      expv[39] = 68'h98ffb900d8702d970;
      expv[40] = 68'h0b8c2c75076c1066c;
      expv[41] = 68'h5df86a60953509435;
      expv[42] = 68'h4f275b7633da032da;
      expv[43] = 68'hdeaae58b8e4918e49;
      expv[44] = 68'h04d857c0f2330f233;
      expv[45] = 68'h4d715c32f2930f293;
      expv[46] = 68'hb9e0569349a5148a5;
      expv[47] = 68'h6cf4b61094bb894bb;
      expv[48] = 68'h52a70d702ac6c2ac6;
      expv[49] = 68'h8a2d9781baca3bbca;
      expv[50] = 68'h435e08900c0ae0d0a;
      expv[51] = 68'hd2d93aa1023210232;
      expv[52] = 68'h6a4f10e1ca365ca36;
      expv[53] = 68'hd9dd80d56af516af5;
      expv[54] = 68'h524f1031b6647b664;
      expv[55] = 68'h426d4c01b4173b417;
      expv[56] = 68'h5ad1c1d068d4069d4;
      expv[57] = 68'hb47a9c41c4815c581;
      expv[58] = 68'hdffbe306856008460;
      expv[59] = 68'h4a437e45714617046;
      expv[60] = 68'h15421d81b4293b429;
      expv[61] = 68'h68bc0ca1e62afe72a;
      expv[62] = 68'h32b73f7c4af004af0;
      expv[63] = 68'hb4c8e08fc3ba1c2ba;
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
