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

  rtlpp_00462 dut (
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
    stim[0] = 97'h1751a6a024a72fc4935227cb5;
    stim[1] = 97'h06502e2854c04f20135f8309b;
    stim[2] = 97'h018dc66b746a587d4de948f92;
    stim[3] = 97'h1512720527664531312959282;
    stim[4] = 97'h035f1c2be122d353a06e5dfff;
    stim[5] = 97'h1100542485f116b01af4ecdb5;
    stim[6] = 97'h016ad9a9443bd540a405f8dba;
    stim[7] = 97'h198081129f5e40a4dddac555b;
    stim[8] = 97'h01671a5391187f93a8d19d18e;
    stim[9] = 97'h13594d83b079c1ef43cf15563;
    stim[10] = 97'h07502e81a5e22944935e0c872;
    stim[11] = 97'h1daa1ef973fed064525e782c3;
    stim[12] = 97'h0d122af093cec856b89578f4f;
    stim[13] = 97'h1ae35ab1947228c995a680c29;
    stim[14] = 97'h16c79d5a8e282704acb0359a8;
    stim[15] = 97'h172e8029c2d87fe452c0e9caf;
    stim[16] = 97'h07d8db047ebb53309c8ea01a3;
    stim[17] = 97'h087008097c7252657b4e2090c;
    stim[18] = 97'h16af6512d01d55f3f5d889152;
    stim[19] = 97'h0005f4a44eeac7ef9ca7102da;
    stim[20] = 97'h0c78423141662d014571c4748;
    stim[21] = 97'h0c2b567e2eeebb99962b1020d;
    stim[22] = 97'h15e809185249076429f598b45;
    stim[23] = 97'h1d349ae4736e3959c2cf58c26;
    stim[24] = 97'h19fa6d3feb17706a6eadb1ea0;
    stim[25] = 97'h0eb0810e756274aa795f49629;
    stim[26] = 97'h1fa6205f55ccd8a2b0d1b101d;
    stim[27] = 97'h0934d966d95fed80cbf5d9ac3;
    stim[28] = 97'h109d7bd7b946b7ed043f2d8e6;
    stim[29] = 97'h04a0d95321bb8fb9d03d8dda4;
    stim[30] = 97'h194e121e20d73b88a13eead1c;
    stim[31] = 97'h04594f143a009c678872108c1;
    stim[32] = 97'h13d44d8d4479241d53a9b94de;
    stim[33] = 97'h094eb1e28ad923666a19e9a57;
    stim[34] = 97'h0aa32bcab951aa773625b5032;
    stim[35] = 97'h09597469b2b269476d8511f27;
    stim[36] = 97'h0fc19fa9bbdefdaa481cb48cb;
    stim[37] = 97'h1ae0790f829a4f8db4356db13;
    stim[38] = 97'h0ca541d7d8a61c2fdbc7f4d48;
    stim[39] = 97'h1af20b5d3349d753a9f9f8626;
    stim[40] = 97'h09e424119fa0d20c752845e90;
    stim[41] = 97'h14eb6a9bf991e887ac0c109fc;
    stim[42] = 97'h033489a5c3bb36c32e03011c3;
    stim[43] = 97'h0f7dc33c9d43110d270c41451;
    stim[44] = 97'h1d74d9f21e9461e8a96b707b9;
    stim[45] = 97'h1c1e857e186cd7e94acf1cd42;
    stim[46] = 97'h0c4e558b95ac47c9e9c5e5cac;
    stim[47] = 97'h0723f918763c9549ef32e0322;
    stim[48] = 97'h12a9155ba5e9a51e0be755d00;
    stim[49] = 97'h1d33c0d782414b5ace4fb1192;
    stim[50] = 97'h110a843b865c7c680e79d950e;
    stim[51] = 97'h0b1c081e3272305c070c3727b;
    stim[52] = 97'h0d840ca4c58af4364d99512e2;
    stim[53] = 97'h0937256863e4aa5a4796d1fc5;
    stim[54] = 97'h0f8b0c41cb63b5b8baee7860b;
    stim[55] = 97'h1450ff4eeffdaa8e711a990d8;
    stim[56] = 97'h1ff15220e42e87de17f94ddef;
    stim[57] = 97'h1dae90429f2b8c787c091da46;
    stim[58] = 97'h0d72ec564bda110d663c31c78;
    stim[59] = 97'h03593a23c596070856f160097;
    stim[60] = 97'h093a228df99e369752e195fa3;
    stim[61] = 97'h0454648878b8b6a05367b08ad;
    stim[62] = 97'h0c1a43991e619287f5cbdce9b;
    stim[63] = 97'h0281500014eadf94a2da28781;
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
      expv[0] = 88'h0000000000000000000002;
      expv[1] = 88'h0000000000000000000002;
      expv[2] = 88'h0000000000000000000002;
      expv[3] = 88'h00000003e4000000000013;
      expv[4] = 88'h00000004e4000000000003;
      expv[5] = 88'h00000007e400000000001d;
      expv[6] = 88'h8000000364000000000255;
      expv[7] = 88'h000000036400000000021b;
      expv[8] = 88'h000000030000000000021b;
      expv[9] = 88'h000000030000000000020d;
      expv[10] = 88'h0000000564000000000203;
      expv[11] = 88'h80000002640000000006d3;
      expv[12] = 88'h80000000e40000000005c3;
      expv[13] = 88'h800000008000000000024d;
      expv[14] = 88'h000000036400000000020b;
      expv[15] = 88'h000000066400000000020b;
      expv[16] = 88'h800000060000000000074d;
      expv[17] = 88'h80000000640000000001c3;
      expv[18] = 88'h000000026400000000018d;
      expv[19] = 88'h0000000200000000000193;
      expv[20] = 88'h80000000e400000000015b;
      expv[21] = 88'h00000001e400000000010b;
      expv[22] = 88'h80000000e40000000000cd;
      expv[23] = 88'h0000000080000000000085;
      expv[24] = 88'h0000000364000000000085;
      expv[25] = 88'h0000000300000000000083;
      expv[26] = 88'h00000005e400000000008b;
      expv[27] = 88'h800000058000000000055d;
      expv[28] = 88'h0000000580000000000503;
      expv[29] = 88'h0000000580000000000505;
      expv[30] = 88'h0000000000000000000002;
      expv[31] = 88'h0000000000000000000002;
      expv[32] = 88'h0000000000000000000003;
      expv[33] = 88'h000000056400000000001d;
      expv[34] = 88'h8000000500000000000255;
      expv[35] = 88'h0000000500000000000213;
      expv[36] = 88'h80000007e40000000006c5;
      expv[37] = 88'h80000007800000000006cb;
      expv[38] = 88'h8000000780000000000653;
      expv[39] = 88'h800000036400000000074b;
      expv[40] = 88'h0000000300000000000705;
      expv[41] = 88'h80000007e4000000000653;
      expv[42] = 88'h80000007800000000007dd;
      expv[43] = 88'h8000000464000000000743;
      expv[44] = 88'h0000000400000000000713;
      expv[45] = 88'h800000040000000000005b;
      expv[46] = 88'h0000000364000000000003;
      expv[47] = 88'h800000076400000000064d;
      expv[48] = 88'h00000000e4000000000603;
      expv[49] = 88'h80000007640000000006c3;
      expv[50] = 88'h0000000700000000000693;
      expv[51] = 88'h0000000000000000000002;
      expv[52] = 88'h0000000000000000000002;
      expv[53] = 88'h8000000000000000000343;
      expv[54] = 88'h80000007e40000000001c5;
      expv[55] = 88'h00000001e400000000018b;
      expv[56] = 88'h80000004640000000003db;
      expv[57] = 88'h000000076400000000038d;
      expv[58] = 88'h00000006e4000000000385;
      expv[59] = 88'h800000068000000000015b;
      expv[60] = 88'h8000000680000000000755;
      expv[61] = 88'h80000006800000000007c3;
      expv[62] = 88'h80000002640000000001cd;
      expv[63] = 88'h00000003e400000000019b;
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
