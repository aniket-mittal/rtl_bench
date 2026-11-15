// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 97;
  localparam OW = 88;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00463 dut (
    .clk(clk),
    .ff_tx_data(in_vec[96:65]),
    .ff_tx_eop(in_vec[64:64]),
    .ff_tx_err(in_vec[63:63]),
    .ff_tx_mod(in_vec[62:61]),
    .ff_tx_sop(in_vec[60:60]),
    .ff_tx_wren(in_vec[59:59]),
    .ff_tx_clk(in_vec[58:58]),
    .ff_rx_rdy(in_vec[57:57]),
    .ff_rx_clk(in_vec[56:56]),
    .address(in_vec[55:48]),
    .read(in_vec[47:47]),
    .writedata(in_vec[46:15]),
    .write(in_vec[14:14]),
    .reset(in_vec[13:13]),
    .m_rx_d(in_vec[12:9]),
    .m_rx_en(in_vec[8:8]),
    .m_rx_err(in_vec[7:7]),
    .tx_clk(in_vec[6:6]),
    .rx_clk(in_vec[5:5]),
    .set_10(in_vec[4:4]),
    .set_1000(in_vec[3:3]),
    .mdio_in(in_vec[2:2]),
    .m_rx_col(in_vec[1:1]),
    .m_rx_crs(in_vec[0:0]),
    .ff_tx_rdy(out_vec[87:87]),
    .ff_rx_data(out_vec[86:55]),
    .ff_rx_dval(out_vec[54:54]),
    .ff_rx_eop(out_vec[53:53]),
    .ff_rx_mod(out_vec[52:51]),
    .ff_rx_sop(out_vec[50:50]),
    .rx_err(out_vec[49:44]),
    .readdata(out_vec[43:12]),
    .waitrequest(out_vec[11:11]),
    .m_tx_d(out_vec[10:7]),
    .m_tx_en(out_vec[6:6]),
    .m_tx_err(out_vec[5:5]),
    .ena_10(out_vec[4:4]),
    .eth_mode(out_vec[3:3]),
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
    stim[0] = 97'h0340a8fa5f43a2e83a628371a;
    stim[1] = 97'h0925c4b7f1e49599a4ad9a512;
    stim[2] = 97'h083dd78dae6fadd8a714c09c4;
    stim[3] = 97'h0eff62bef63b233c9d77c4715;
    stim[4] = 97'h0448130cdd44e2dfbdea412c9;
    stim[5] = 97'h069d8513d8fa3265cd69ddb61;
    stim[6] = 97'h13479ee9a7b8630a302c8d130;
    stim[7] = 97'h0536e52248537a0c6b8399deb;
    stim[8] = 97'h145152d62413c0bf3785799b7;
    stim[9] = 97'h0c416be65aa053c5d216a80b0;
    stim[10] = 97'h1e9c282c307af6b18fec28a1e;
    stim[11] = 97'h14bcb82fd2a960815e9ab5bad;
    stim[12] = 97'h0bdf862020c89ea75d52c98af;
    stim[13] = 97'h1130b077e1cdb63f301b797dd;
    stim[14] = 97'h1069310ed47a266c0e7d54985;
    stim[15] = 97'h0210ff789b4400d8f850754ee;
    stim[16] = 97'h00b490ffccffbd7613349935a;
    stim[17] = 97'h1d4aa1aaaf61abf3d5a89989b;
    stim[18] = 97'h02d9c612fa54c1fbfa5d5e56b;
    stim[19] = 97'h16a49825780c636f7825a8a03;
    stim[20] = 97'h082e90aff409c741ca8e3c09d;
    stim[21] = 97'h12844b8e6ab183b2a03e51338;
    stim[22] = 97'h1ad474590f131e66817ec4d2a;
    stim[23] = 97'h0437eb163815d59bff877039d;
    stim[24] = 97'h03fb3240830a0d1d24bfec100;
    stim[25] = 97'h014b2e6569d67928d99e04d45;
    stim[26] = 97'h0af04f69878393a55ca6189dc;
    stim[27] = 97'h04a903a0338ad681cec480112;
    stim[28] = 97'h156167f82e4275b4d35758cfc;
    stim[29] = 97'h0938b20b938c2ba947e0e5425;
    stim[30] = 97'h0a2f8257044e47730072c1007;
    stim[31] = 97'h032c5b80d5dfa654314a18089;
    stim[32] = 97'h1d9486ae0b7378e535876cf59;
    stim[33] = 97'h19e0542d1dbe51fb3aa5cc587;
    stim[34] = 97'h17f8ff8329c8fc7d394b711e4;
    stim[35] = 97'h0d7467ae0dadea81d55dc88bb;
    stim[36] = 97'h1ef4dbde7fcd60cd984f21d70;
    stim[37] = 97'h11a91992f61cb850de1731ac6;
    stim[38] = 97'h17f128efe30ff1b7e6cb41f38;
    stim[39] = 97'h1ef8bd5d9f9a6ce179f53990a;
    stim[40] = 97'h1af9ab94338389ff330364e8e;
    stim[41] = 97'h09915fa638bbef0df0ae9dacf;
    stim[42] = 97'h105f3409b3d1e37ccd195c4b7;
    stim[43] = 97'h1a28167a1d3b0046032e156a1;
    stim[44] = 97'h142ccf14456fc79decfcb1a1d;
    stim[45] = 97'h0d348f71200bcb1587962569d;
    stim[46] = 97'h019f5fe8433aa187c567f9ad4;
    stim[47] = 97'h1c7fb46d690fc8f95f932d722;
    stim[48] = 97'h19211c1ee88261b28591756b3;
    stim[49] = 97'h05f1d76fa370ec3c1411a1205;
    stim[50] = 97'h09ac8b21fc5f0942bacc84a36;
    stim[51] = 97'h0f8a10852060be5e9d47646d1;
    stim[52] = 97'h03688a4fc0d85e9d496aaddf6;
    stim[53] = 97'h0cb19cf90f7428540e0a797ed;
    stim[54] = 97'h0a25861384d93659a320bde1d;
    stim[55] = 97'h13314a40d1cd76444b38fde35;
    stim[56] = 97'h1d04f206f703b1e0c2f4f1421;
    stim[57] = 97'h1ecffea3e311168a302739bde;
    stim[58] = 97'h080fc26eebeeb33d30a640608;
    stim[59] = 97'h08687dbfaec602258981ecd5b;
    stim[60] = 97'h1fd1771e120f5cb446ba245a3;
    stim[61] = 97'h09ecfc6eab93e7a81e911ded7;
    stim[62] = 97'h1c4e66ef8acaf302ad1b286ce;
    stim[63] = 97'h121e49b5f24773cc664c6d663;
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
      expv[0] = 88'h0000000000000000000000;
      expv[1] = 88'h0000000000000000000000;
      expv[2] = 88'h0000000000000000000000;
      expv[3] = 88'h8000000000000000000000;
      expv[4] = 88'h8000000000000000000000;
      expv[5] = 88'h8000000000000000000000;
      expv[6] = 88'h8000000000000000000000;
      expv[7] = 88'h8000000000000000000000;
      expv[8] = 88'h8000000000000000000000;
      expv[9] = 88'h8000000000000000000000;
      expv[10] = 88'h8000000000000000000000;
      expv[11] = 88'h8000000000000000000000;
      expv[12] = 88'h8000000000000000000000;
      expv[13] = 88'h8000000000000000000000;
      expv[14] = 88'h8000000000000000000000;
      expv[15] = 88'h8000000000000000000000;
      expv[16] = 88'h8000000000000000000000;
      expv[17] = 88'h8000000000000000000000;
      expv[18] = 88'h0000000000000000000000;
      expv[19] = 88'h0000000000000000000000;
      expv[20] = 88'h8000000000000000000000;
      expv[21] = 88'h8000000000000000000000;
      expv[22] = 88'h8000000000000000000000;
      expv[23] = 88'h8000000000000000000000;
      expv[24] = 88'h8000000000000000000000;
      expv[25] = 88'h8000000000000000000000;
      expv[26] = 88'h8000000000000000000000;
      expv[27] = 88'h8000000000000000000000;
      expv[28] = 88'h8000000000000000000000;
      expv[29] = 88'h8000000000000000000000;
      expv[30] = 88'h8000000000000000000000;
      expv[31] = 88'h8000000000000000000000;
      expv[32] = 88'h8000000000000000000000;
      expv[33] = 88'h8000000000000000000000;
      expv[34] = 88'h8000000000000000000000;
      expv[35] = 88'h8000000000000000000000;
      expv[36] = 88'h8000000000000000000000;
      expv[37] = 88'h8000000000000000000000;
      expv[38] = 88'h8000000000000000000000;
      expv[39] = 88'h8000000000000000000000;
      expv[40] = 88'h8000000000000000000000;
      expv[41] = 88'h8000000000000000000000;
      expv[42] = 88'h8000000000000000000000;
      expv[43] = 88'h8000000000000000000000;
      expv[44] = 88'h8000000000000000000000;
      expv[45] = 88'h8000000000000000000000;
      expv[46] = 88'h8000000000000000000000;
      expv[47] = 88'h8000000000000000000000;
      expv[48] = 88'h8000000000000000000000;
      expv[49] = 88'h8000000000000000000000;
      expv[50] = 88'h8000000000000000000000;
      expv[51] = 88'h8000000000000000000000;
      expv[52] = 88'h8000000000000000000000;
      expv[53] = 88'h8000000000000000000000;
      expv[54] = 88'h8000000000000000000000;
      expv[55] = 88'h8000000000000000000000;
      expv[56] = 88'h8000000000000000000000;
      expv[57] = 88'h8000000000000000000000;
      expv[58] = 88'h8000000000000000000000;
      expv[59] = 88'h8000000000000000000000;
      expv[60] = 88'h8000000000000000000000;
      expv[61] = 88'h8000000000000000000000;
      expv[62] = 88'h8000000000000000000000;
      expv[63] = 88'h8000000000000000000000;
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
