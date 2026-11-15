// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 108;
  localparam OW = 127;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_03301 dut (
    .clk(clk),
    .ff_tx_crc_fwd(in_vec[107:107]),
    .ff_tx_data(in_vec[106:75]),
    .ff_tx_eop(in_vec[74:74]),
    .ff_tx_err(in_vec[73:73]),
    .ff_tx_mod(in_vec[72:71]),
    .ff_tx_sop(in_vec[70:70]),
    .ff_tx_wren(in_vec[69:69]),
    .ff_tx_clk(in_vec[68:68]),
    .ff_rx_rdy(in_vec[67:67]),
    .ff_rx_clk(in_vec[66:66]),
    .address(in_vec[65:58]),
    .read(in_vec[57:57]),
    .writedata(in_vec[56:25]),
    .write(in_vec[24:24]),
    .reset(in_vec[23:23]),
    .gm_rx_d(in_vec[22:15]),
    .gm_rx_dv(in_vec[14:14]),
    .gm_rx_err(in_vec[13:13]),
    .m_rx_d(in_vec[12:9]),
    .m_rx_en(in_vec[8:8]),
    .m_rx_err(in_vec[7:7]),
    .m_rx_col(in_vec[6:6]),
    .m_rx_crs(in_vec[5:5]),
    .tx_clk(in_vec[4:4]),
    .rx_clk(in_vec[3:3]),
    .set_10(in_vec[2:2]),
    .set_1000(in_vec[1:1]),
    .mdio_in(in_vec[0:0]),
    .ff_tx_rdy(out_vec[126:126]),
    .ff_rx_data(out_vec[125:94]),
    .ff_rx_dval(out_vec[93:93]),
    .ff_rx_eop(out_vec[92:92]),
    .ff_rx_mod(out_vec[91:90]),
    .ff_rx_sop(out_vec[89:89]),
    .rx_err(out_vec[88:83]),
    .rx_err_stat(out_vec[82:65]),
    .rx_frm_type(out_vec[64:61]),
    .ff_rx_dsav(out_vec[60:60]),
    .readdata(out_vec[59:28]),
    .waitrequest(out_vec[27:27]),
    .gm_tx_d(out_vec[26:19]),
    .gm_tx_en(out_vec[18:18]),
    .gm_tx_err(out_vec[17:17]),
    .m_tx_d(out_vec[16:13]),
    .m_tx_en(out_vec[12:12]),
    .m_tx_err(out_vec[11:11]),
    .ena_10(out_vec[10:10]),
    .eth_mode(out_vec[9:9]),
    .ff_tx_septy(out_vec[8:8]),
    .tx_ff_uflow(out_vec[7:7]),
    .ff_rx_a_full(out_vec[6:6]),
    .ff_rx_a_empty(out_vec[5:5]),
    .ff_tx_a_full(out_vec[4:4]),
    .ff_tx_a_empty(out_vec[3:3]),
    .mdio_out(out_vec[2:2]),
    .mdio_oen(out_vec[1:1]),
    .mdc(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 108'h9c4c18c3cbe60459f4a0bb1c7c0;
    stim[1] = 108'h3018f35dc15c93f5716fda26a6f;
    stim[2] = 108'hd289afd804e148d15f5921269f5;
    stim[3] = 108'h911757afd30bcdaf5427a688f36;
    stim[4] = 108'h7d2fbc31b6dab42fb0b522c6cd2;
    stim[5] = 108'h9b87926e189112faaee1e55badb;
    stim[6] = 108'ha09302c42db4889fa20b45733e8;
    stim[7] = 108'he316a52fa9b4400629f950eacdd;
    stim[8] = 108'h0650972635c76583d43df555339;
    stim[9] = 108'hd7747e8e0b9f09dedeb1f20ee39;
    stim[10] = 108'h0d10625c043d9f7953576566db5;
    stim[11] = 108'h5ef899dc48a73577e90c214444f;
    stim[12] = 108'h60634c6d6d674a2aecc6f7682fa;
    stim[13] = 108'h1bb8b5cc44e1ce5e037770f24fc;
    stim[14] = 108'h958ad6079fd82e92e16cb371112;
    stim[15] = 108'h085b26f84d4e089a56a1c0f3234;
    stim[16] = 108'h6a3b8e0fd3f60d29fe9c10a798d;
    stim[17] = 108'hb3cb2b0e95f5a9e7a2f134bb8aa;
    stim[18] = 108'hd7761c2581cb6b46ebec02a03fd;
    stim[19] = 108'h632f8506e52892d265dff11ebec;
    stim[20] = 108'hed18375324462a721774e486625;
    stim[21] = 108'h0c676bc54866bca58cfa1645f48;
    stim[22] = 108'h1e0c0c7187a0fa784fefa16f033;
    stim[23] = 108'h99765e6696fafe718b6ef22b8b3;
    stim[24] = 108'h5fe07f07f143e5bcd6efa314858;
    stim[25] = 108'h34e598ce8b3d4df12b02324a797;
    stim[26] = 108'h018182897c6f1a96bd2e25e0474;
    stim[27] = 108'h364583e837d24e25caa707f710d;
    stim[28] = 108'h74598b8ced47d46ed99a0751941;
    stim[29] = 108'h9ce39d8f9f25b15743c50430ce9;
    stim[30] = 108'h74263bee495b4cfdc4b14686ad2;
    stim[31] = 108'hb48f7d3ca7ca7a827edde064e58;
    stim[32] = 108'hfcdfc1f1e1e4e9d53ba4a0c85d4;
    stim[33] = 108'hd4d3c63061123c6c04c5f28cb5d;
    stim[34] = 108'h0bb6cb6562c1373021bfb7451b9;
    stim[35] = 108'h7bd1aab5e1686987b5b78245043;
    stim[36] = 108'h5ab8f770db83cb3ed4d392f9d03;
    stim[37] = 108'hd06d3a98ce822246248e9460569;
    stim[38] = 108'h4c643663092c9cb81483d76b89b;
    stim[39] = 108'h4afb645a516e2e88c601e6a0f57;
    stim[40] = 108'h53ba0848958d35fbe5e2964a7b3;
    stim[41] = 108'h32dd8d39bdfbfb63ab5a1346c35;
    stim[42] = 108'h06be31a3916c46f820d1902374f;
    stim[43] = 108'hc20dc8cbc8a4f21be62b463cf52;
    stim[44] = 108'he16d2886fe1e6acf617da10646f;
    stim[45] = 108'h1850003d7f402355d5c3f563d73;
    stim[46] = 108'hb63e154016f22b28ee93b2026b8;
    stim[47] = 108'h19bff7eccbe01a45b299f326ccf;
    stim[48] = 108'hb8f256f3c0d2bf8727ff43fb0c1;
    stim[49] = 108'h33ed9d7bffb6ec13348af17558c;
    stim[50] = 108'h7833016787f33a2dea5f07cda2b;
    stim[51] = 108'h2f5b23649fc01fcf54ef670dde3;
    stim[52] = 108'h69a374ea12d6025335e4110f774;
    stim[53] = 108'h76856a10223885ac892054a91ea;
    stim[54] = 108'h8d7fad30a15b3574df746515892;
    stim[55] = 108'h9a629995b9f24803e5c1761b2e2;
    stim[56] = 108'h88d18c8d6dfece14c6d051526d1;
    stim[57] = 108'h1af2b3221512c9d3b726174aa76;
    stim[58] = 108'hacd4018a09a79c5613300761dd0;
    stim[59] = 108'ha4e0f989dff1f08d637105c75da;
    stim[60] = 108'h970e12ec9ceb3552a3afe35d511;
    stim[61] = 108'hcd181fbc5c700d120d6a451d2a6;
    stim[62] = 108'he8140fb59dcfc263a246f0aeac3;
    stim[63] = 108'hdb450d9fa1abf34931dca1e97a7;
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
      expv[0] = 127'h00000000000000000000000000000000;
      expv[1] = 127'h00000000000000000000000000000000;
      expv[2] = 127'h00000000000000000000000000000000;
      expv[3] = 127'h00000000000000000000000000000000;
      expv[4] = 127'h00000000000000000000000000000000;
      expv[5] = 127'h00000000000000000000000000000000;
      expv[6] = 127'h00000000000000000000000000000000;
      expv[7] = 127'h00000000000000000000000000000000;
      expv[8] = 127'h00000000000000000000000000000000;
      expv[9] = 127'h00000000000000000000000000000000;
      expv[10] = 127'h00000000000000000000000000000000;
      expv[11] = 127'h00000000000000000000000000000000;
      expv[12] = 127'h00000000000000000000000000000000;
      expv[13] = 127'h00000000000000000000000000000000;
      expv[14] = 127'h00000000000000000000000000000000;
      expv[15] = 127'h00000000000000000000000000000000;
      expv[16] = 127'h00000000000000000000000000000000;
      expv[17] = 127'h00000000000000000000000000000000;
      expv[18] = 127'h00000000000000000000000000000000;
      expv[19] = 127'h00000000000000000000000000000000;
      expv[20] = 127'h00000000000000000000000000000000;
      expv[21] = 127'h00000000000000000000000000000000;
      expv[22] = 127'h00000000000000000000000000000000;
      expv[23] = 127'h00000000000000000000000000000000;
      expv[24] = 127'h00000000000000000000000000000000;
      expv[25] = 127'h00000000000000000000000000000000;
      expv[26] = 127'h00000000000000000000000000000000;
      expv[27] = 127'h00000000000000000000000000000000;
      expv[28] = 127'h00000000000000000000000000000000;
      expv[29] = 127'h00000000000000000000000000000000;
      expv[30] = 127'h00000000000000000000000000000000;
      expv[31] = 127'h00000000000000000000000000000000;
      expv[32] = 127'h00000000000000000000000000000000;
      expv[33] = 127'h00000000000000000000000000000000;
      expv[34] = 127'h00000000000000000000000000000000;
      expv[35] = 127'h00000000000000000000000000000000;
      expv[36] = 127'h00000000000000000000000000000000;
      expv[37] = 127'h00000000000000000000000000000000;
      expv[38] = 127'h00000000000000000000000000000000;
      expv[39] = 127'h00000000000000000000000000000000;
      expv[40] = 127'h00000000000000000000000000000000;
      expv[41] = 127'h00000000000000000000000000000000;
      expv[42] = 127'h00000000000000000000000000000000;
      expv[43] = 127'h00000000000000000000000000000000;
      expv[44] = 127'h00000000000000000000000000000000;
      expv[45] = 127'h00000000000000000000000000000000;
      expv[46] = 127'h00000000000000000000000000000000;
      expv[47] = 127'h00000000000000000000000000000000;
      expv[48] = 127'h00000000000000000000000000000000;
      expv[49] = 127'h00000000000000000000000000000000;
      expv[50] = 127'h00000000000000000000000000000000;
      expv[51] = 127'h00000000000000000000000000000000;
      expv[52] = 127'h00000000000000000000000000000000;
      expv[53] = 127'h00000000000000000000000000000000;
      expv[54] = 127'h00000000000000000000000000000000;
      expv[55] = 127'h00000000000000000000000000000000;
      expv[56] = 127'h00000000000000000000000000000000;
      expv[57] = 127'h00000000000000000000000000000000;
      expv[58] = 127'h00000000000000000000000000000000;
      expv[59] = 127'h00000000000000000000000000000000;
      expv[60] = 127'h00000000000000000000000000000000;
      expv[61] = 127'h00000000000000000000000000000000;
      expv[62] = 127'h00000000000000000000000000000000;
      expv[63] = 127'h00000000000000000000000000000000;
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
