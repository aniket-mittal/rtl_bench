// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 90;
  localparam OW = 105;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_068394 dut (
    .rx_clk(clk),
    .sys_rst(in_vec[89:89]),
    .rx_axis_mac_tdata(in_vec[88:25]),
    .rx_axis_mac_tkeep(in_vec[24:17]),
    .rx_axis_mac_tlast(in_vec[16:16]),
    .rx_axis_mac_tuser(in_vec[15:15]),
    .rx_axis_mac_tvalid(in_vec[14:14]),
    .data_fifo_afull(in_vec[13:13]),
    .wr_data_count(in_vec[12:1]),
    .info_fifo_wfull(in_vec[0:0]),
    .rx_axis_mac_tready(out_vec[104:104]),
    .data_fifo_wdata(out_vec[103:31]),
    .data_fifo_wren(out_vec[30:30]),
    .pause_req(out_vec[29:29]),
    .pause_val(out_vec[28:13]),
    .info_fifo_wdata(out_vec[12:5]),
    .info_fifo_wren(out_vec[4:4]),
    .ifm_in_fsm_dbg(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 90'h273e4a88cb386ee1fd71ce0;
    stim[1] = 90'h29ee7616f41b56478aaf3c9;
    stim[2] = 90'h097d8299de4d34d22a736ff;
    stim[3] = 90'h111d8e2e394411d3b010678;
    stim[4] = 90'h0d13b69f2ab8f444cf3d600;
    stim[5] = 90'h0f158a71e16f89f2b6862af;
    stim[6] = 90'h13f3df55d0cbed6225076fd;
    stim[7] = 90'h05882c8874067c5f503b516;
    stim[8] = 90'h1e611e4675e080e0c739566;
    stim[9] = 90'h1affa5332935cb94791eb35;
    stim[10] = 90'h063f1c5207b4f6495706227;
    stim[11] = 90'h0306babf994e0645d1c2907;
    stim[12] = 90'h1860282ce121e131ac330b4;
    stim[13] = 90'h03207fc5ae1ffb7f8cc9cee;
    stim[14] = 90'h0f857e097be9d50402044ec;
    stim[15] = 90'h18303a29b824a1860a12541;
    stim[16] = 90'h1135099b4d662d78c3d9edc;
    stim[17] = 90'h1de6c8a93145308e436a0b6;
    stim[18] = 90'h16126a5a81c6ddb143df505;
    stim[19] = 90'h0e29808db912cafabe55520;
    stim[20] = 90'h0d67e5b8fd99805cc72a6eb;
    stim[21] = 90'h0dc1ed665948597f3f7de85;
    stim[22] = 90'h07d1c5402a7050d150f454f;
    stim[23] = 90'h0578f72fa6a14ea64eb42e3;
    stim[24] = 90'h1bb64e1b950bc237eac8bf3;
    stim[25] = 90'h0bc296ba014d996e7fc7204;
    stim[26] = 90'h1c536e3bf08b87f32f905aa;
    stim[27] = 90'h14899fec2154b95e3c761de;
    stim[28] = 90'h075ec4945b71a0ac0b7ca30;
    stim[29] = 90'h155fc57e4cb361a31101851;
    stim[30] = 90'h1b915f0bd387c2428d6ba66;
    stim[31] = 90'h1c81168e1cd0a82d5cf5cf7;
    stim[32] = 90'h0591681c1dae5db36a23ed9;
    stim[33] = 90'h0a5a1a8c2f405c09c4b8a08;
    stim[34] = 90'h03e880b14f0789251d6dd01;
    stim[35] = 90'h0663015ef1fe621841e172a;
    stim[36] = 90'h1ee92eb8c28eb25d6113875;
    stim[37] = 90'h2c2575c6b925123da08399b;
    stim[38] = 90'h019263da3ab27a117dbff41;
    stim[39] = 90'h1090eb31af574226af389fd;
    stim[40] = 90'h19c08bb8bc86a012c1e8086;
    stim[41] = 90'h0a0d4cda8f6b9baa0009d11;
    stim[42] = 90'h080257be30c030d0c820da7;
    stim[43] = 90'h11b6911bce097e758d2aa48;
    stim[44] = 90'h0802c720ce8323effdac101;
    stim[45] = 90'h10927cf0cfdb3462ac925c2;
    stim[46] = 90'h16a84379aba3c60c91e24f1;
    stim[47] = 90'h3f5b2bf866b0c48a4b7b4f1;
    stim[48] = 90'h04abd517c2f266769f036e0;
    stim[49] = 90'h0122508cf3500dff97bcb65;
    stim[50] = 90'h24658983b2a782cbd2d609b;
    stim[51] = 90'h190420a0cac7b4982390c4e;
    stim[52] = 90'h174129cea2a476cf9415004;
    stim[53] = 90'h1fb306e134045e47a11c73d;
    stim[54] = 90'h14736b23883e4e4095ac3c3;
    stim[55] = 90'h1170c8f6a98347f94e8d380;
    stim[56] = 90'h176b2152ed76d960445e254;
    stim[57] = 90'h1ae277fc0ea054f9d3609b4;
    stim[58] = 90'h134c997193afb6021a4b8c9;
    stim[59] = 90'h08b08721d3f1f7e366a9252;
    stim[60] = 90'h0da58a2d049905a1050c765;
    stim[61] = 90'h1b395946b83191ef78e62b6;
    stim[62] = 90'h0783e1b929754ed91cf35ab;
    stim[63] = 90'h0cc5d9d5a29ab3d8250edb3;
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
      expv[0] = 105'h1xxxxxxxxxxxxxxxxxxxxxxxxx0;
      expv[1] = 105'h1f59cf92a232ce1bb87a0100000;
      expv[2] = 105'h12aa7b9d85bd06d591e20100020;
      expv[3] = 105'h1a9a5f60a677934d348a0100000;
      expv[4] = 105'h1c0447638b8e510474e80100000;
      expv[5] = 105'h1bcb44eda7caae3d11360100021;
      expv[6] = 105'h15a3c5629c785be27cac0100001;
      expv[7] = 105'h1144fcf7d57432fb588e0100001;
      expv[8] = 105'h1c09620b221d019f17d20100021;
      expv[9] = 105'h19cf9847919d782038320100021;
      expv[10] = 105'h1e46bfe94cca4d72e51e0100030;
      expv[11] = 105'h15c18fc71481ed3d92500100002;
      expv[12] = 105'h1470c1aeafe6538191720100002;
      expv[13] = 105'h1b0e180a0b3848784c6a0100002;
      expv[14] = 105'h1330c81ff16b87fedfe20100022;
      expv[15] = 105'h1083e15f825efa7541000100002;
      expv[16] = 105'h1a860c0e8a6e092861800100002;
      expv[17] = 105'h18f44d4266d3598b5e320100022;
      expv[18] = 105'h10df79b22a4c514c23900100022;
      expv[19] = 105'h18f5849a96a071b76c520100020;
      expv[20] = 105'h1f938a60236e44b2beae0100001;
      expv[21] = 105'h11cb59f96e3f666017300100021;
      expv[22] = 105'h1fdb707b599652165fce0100030;
      expv[23] = 105'h1c39f471500a9c1434540100002;
      expv[24] = 105'h1ba95e3dcbe9a853a9900100000;
      expv[25] = 105'h12b6ed9386e542f08dfa0100020;
      expv[26] = 105'h17f2f0a5ae8053665b9a0100002;
      expv[27] = 105'h1be714db8efc22e1fcc80100002;
      expv[28] = 105'h1f1d2267fb08552e57880100000;
      expv[29] = 105'h1ad9d7b12516dc682b060100021;
      expv[30] = 105'h144557f15f932cd868c20100001;
      expv[31] = 105'h135ee457c2f4e1f090a20100021;
      expv[32] = 105'h1f3f2045a387342a0b560100010;
      expv[33] = 105'h1289645a07076b976cda0100000;
      expv[34] = 105'h192a9686a30bd01702720100020;
      expv[35] = 105'h1758fa202c53c1e249460100022;
      expv[36] = 105'h107998c057bc7f9886120100002;
      expv[37] = 105'h1847ba4bae30a3ac975a0100000;
      expv[38] = 105'h1023095d71ae49448f6a0100000;
      expv[39] = 105'h1f686498f68eac9e845a0100022;
      expv[40] = 105'h1bcc243acc6bd5d089aa0100022;
      expv[41] = 105'h107e7022ee2f21a804b00100022;
      expv[42] = 105'h1002835336a3dae6ea820100022;
      expv[43] = 105'h120a0095ef8c300c34320100002;
      expv[44] = 105'h134c6da446f3825f9d620100022;
      expv[45] = 105'h176a00b1c833a0c8fbf80100022;
      expv[46] = 105'h1b24249f3c33f6cd18a80100002;
      expv[47] = 105'h147daa10de6ae8f183200100000;
      expv[48] = 105'h1adfd6cafe19ac3122920100020;
      expv[49] = 105'h17c12af545f0bc999da20100000;
      expv[50] = 105'h1de84894233cd4037fe20100020;
      expv[51] = 105'h1cb1196260eca9e0b2f00100000;
      expv[52] = 105'h18e641082832b1ed260a0100000;
      expv[53] = 105'h1d05d04a73a8a91db3e60100001;
      expv[54] = 105'h1847ecc1b84d011791ec0100030;
      expv[55] = 105'h156d1cdac8e20f9390240100022;
      expv[56] = 105'h13a45c323daa60d1fe520100022;
      expv[57] = 105'h1915dac854bb5db658100100020;
      expv[58] = 105'h14deb89dff03a8153e720100000;
      expv[59] = 105'h1694d3265c64ebed80820100020;
      expv[60] = 105'h11aa2c21c874fc7df8da0100020;
      expv[61] = 105'h114369628b41264168440100022;
      expv[62] = 105'h163ece5651ae0c647bd80100002;
      expv[63] = 105'h1f39e0f86e4a5d53b6420100002;
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
